rule win_blackcoffee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.blackcoffee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackcoffee"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8d5e14 50 6800000100 53 ff35???????? ff15???????? }
            // n = 6, score = 200
            //   8d5e14               | lea                 ebx, [esi + 0x14]
            //   50                   | push                eax
            //   6800000100           | push                0x10000
            //   53                   | push                ebx
            //   ff35????????         |                     
            //   ff15????????         |                     

        $sequence_1 = { e9???????? 6a01 6800000804 68???????? 53 68???????? }
            // n = 6, score = 200
            //   e9????????           |                     
            //   6a01                 | push                1
            //   6800000804           | push                0x4080000
            //   68????????           |                     
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_2 = { 6a40 57 57 6a00 ff15???????? }
            // n = 5, score = 200
            //   6a40                 | push                0x40
            //   57                   | push                edi
            //   57                   | push                edi
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_3 = { 80661100 80661200 80661300 80661400 56 89460c }
            // n = 6, score = 200
            //   80661100             | and                 byte ptr [esi + 0x11], 0
            //   80661200             | and                 byte ptr [esi + 0x12], 0
            //   80661300             | and                 byte ptr [esi + 0x13], 0
            //   80661400             | and                 byte ptr [esi + 0x14], 0
            //   56                   | push                esi
            //   89460c               | mov                 dword ptr [esi + 0xc], eax

        $sequence_4 = { 85c0 753c 8b45fc ff740308 e8???????? }
            // n = 5, score = 200
            //   85c0                 | test                eax, eax
            //   753c                 | jne                 0x3e
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   ff740308             | push                dword ptr [ebx + eax + 8]
            //   e8????????           |                     

        $sequence_5 = { 8d4724 50 e8???????? 85c0 753c 8b45fc ff740308 }
            // n = 7, score = 200
            //   8d4724               | lea                 eax, [edi + 0x24]
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   753c                 | jne                 0x3e
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   ff740308             | push                dword ptr [ebx + eax + 8]

        $sequence_6 = { 6800800000 57 53 ff15???????? 8b4610 }
            // n = 5, score = 200
            //   6800800000           | push                0x8000
            //   57                   | push                edi
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]

        $sequence_7 = { 50 6a40 832700 ff15???????? 6a08 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   832700               | and                 dword ptr [edi], 0
            //   ff15????????         |                     
            //   6a08                 | push                8

        $sequence_8 = { ff36 e8???????? ff750c 83c00c 0107 8b37 }
            // n = 6, score = 200
            //   ff36                 | push                dword ptr [esi]
            //   e8????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   83c00c               | add                 eax, 0xc
            //   0107                 | add                 dword ptr [edi], eax
            //   8b37                 | mov                 esi, dword ptr [edi]

        $sequence_9 = { 8365fc00 83c010 6a04 50 8d45fc 50 }
            // n = 6, score = 200
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   83c010               | add                 eax, 0x10
            //   6a04                 | push                4
            //   50                   | push                eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 118784
}