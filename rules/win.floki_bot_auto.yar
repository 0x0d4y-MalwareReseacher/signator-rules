rule win_floki_bot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.floki_bot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.floki_bot"
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
        $sequence_0 = { e8???????? ff7508 830eff 8d7dec e8???????? 84c0 743e }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   830eff               | or                  dword ptr [esi], 0xffffffff
            //   8d7dec               | lea                 edi, [ebp - 0x14]
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   743e                 | je                  0x40

        $sequence_1 = { 7473 837df405 756d 8b4610 3345ec 83c705 115de4 }
            // n = 7, score = 1100
            //   7473                 | je                  0x75
            //   837df405             | cmp                 dword ptr [ebp - 0xc], 5
            //   756d                 | jne                 0x6f
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   3345ec               | xor                 eax, dword ptr [ebp - 0x14]
            //   83c705               | add                 edi, 5
            //   115de4               | adc                 dword ptr [ebp - 0x1c], ebx

        $sequence_2 = { 83c302 3bda 72f4 3bda 7504 836dfc02 8bf3 }
            // n = 7, score = 1100
            //   83c302               | add                 ebx, 2
            //   3bda                 | cmp                 ebx, edx
            //   72f4                 | jb                  0xfffffff6
            //   3bda                 | cmp                 ebx, edx
            //   7504                 | jne                 6
            //   836dfc02             | sub                 dword ptr [ebp - 4], 2
            //   8bf3                 | mov                 esi, ebx

        $sequence_3 = { 0f8598000000 32db e8???????? 8bf0 bf???????? 85f6 7417 }
            // n = 7, score = 1100
            //   0f8598000000         | jne                 0x9e
            //   32db                 | xor                 bl, bl
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   bf????????           |                     
            //   85f6                 | test                esi, esi
            //   7417                 | je                  0x19

        $sequence_4 = { 8b45e0 8b4d14 8b5d08 8b4004 8b7028 }
            // n = 5, score = 1100
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   8b7028               | mov                 esi, dword ptr [eax + 0x28]

        $sequence_5 = { e8???????? 84c0 0f8450020000 8b742410 6bdb38 031d???????? 85f6 }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f8450020000         | je                  0x256
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]
            //   6bdb38               | imul                ebx, ebx, 0x38
            //   031d????????         |                     
            //   85f6                 | test                esi, esi

        $sequence_6 = { 7474 ff7508 ff15???????? 3b05???????? 7563 33ff 397d10 }
            // n = 7, score = 1100
            //   7474                 | je                  0x76
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   3b05????????         |                     
            //   7563                 | jne                 0x65
            //   33ff                 | xor                 edi, edi
            //   397d10               | cmp                 dword ptr [ebp + 0x10], edi

        $sequence_7 = { 837dfc00 0f868e010000 33ff 47 8365f800 8b45f0 8b4df8 }
            // n = 7, score = 1100
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   0f868e010000         | jbe                 0x194
            //   33ff                 | xor                 edi, edi
            //   47                   | inc                 edi
            //   8365f800             | and                 dword ptr [ebp - 8], 0
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_8 = { 897df4 3bf7 0f83a0000000 8b450c 83e002 8945f0 eb03 }
            // n = 7, score = 1100
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi
            //   3bf7                 | cmp                 esi, edi
            //   0f83a0000000         | jae                 0xa6
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83e002               | and                 eax, 2
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   eb03                 | jmp                 5

        $sequence_9 = { ff760c 68???????? 50 e8???????? 83c418 eb14 ff7604 }
            // n = 7, score = 1100
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   eb14                 | jmp                 0x16
            //   ff7604               | push                dword ptr [esi + 4]

    condition:
        7 of them and filesize < 286720
}