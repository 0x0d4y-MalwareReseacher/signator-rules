rule win_godzilla_loader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.godzilla_loader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.godzilla_loader"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 6a00 8bf8 8d45fc 50 57 6a01 }
            // n = 6, score = 1500
            //   6a00                 | push                0
            //   8bf8                 | mov                 edi, eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a01                 | push                1

        $sequence_1 = { 6a00 6a00 8bf8 8d45fc 50 57 }
            // n = 6, score = 1500
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8bf8                 | mov                 edi, eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_2 = { 8bf8 8d45fc 50 57 6a01 56 }
            // n = 6, score = 1500
            //   8bf8                 | mov                 edi, eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a01                 | push                1
            //   56                   | push                esi

        $sequence_3 = { a5 a5 50 a5 ff512c 85c0 756c }
            // n = 7, score = 1500
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   50                   | push                eax
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   ff512c               | call                dword ptr [ecx + 0x2c]
            //   85c0                 | test                eax, eax
            //   756c                 | jne                 0x6e

        $sequence_4 = { 6a01 56 ff7508 8975fc }
            // n = 4, score = 1500
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8975fc               | mov                 dword ptr [ebp - 4], esi

        $sequence_5 = { 50 a5 ff512c 85c0 756c }
            // n = 5, score = 1500
            //   50                   | push                eax
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   ff512c               | call                dword ptr [ecx + 0x2c]
            //   85c0                 | test                eax, eax
            //   756c                 | jne                 0x6e

        $sequence_6 = { 57 6a01 56 ff7508 8975fc ff15???????? }
            // n = 6, score = 1500
            //   57                   | push                edi
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   ff15????????         |                     

        $sequence_7 = { 57 ff7508 ff15???????? 8bf0 56 }
            // n = 5, score = 1500
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi

        $sequence_8 = { 51 56 57 ff7508 ff15???????? 8bf0 56 }
            // n = 7, score = 1500
            //   51                   | push                ecx
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi

        $sequence_9 = { 8bec 51 56 57 ff7508 ff15???????? 8bf0 }
            // n = 7, score = 1500
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 155648
}