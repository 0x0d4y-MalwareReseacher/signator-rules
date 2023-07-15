rule win_socelars_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.socelars."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.socelars"
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
        $sequence_0 = { eb4e 8b4dec e8???????? 8b00 8b4d08 8d14c8 8955d4 }
            // n = 7, score = 100
            //   eb4e                 | jmp                 0x50
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8d14c8               | lea                 edx, [eax + ecx*8]
            //   8955d4               | mov                 dword ptr [ebp - 0x2c], edx

        $sequence_1 = { f7df c744243401000000 83d300 f7db 895c2428 eb14 8b4508 }
            // n = 7, score = 100
            //   f7df                 | neg                 edi
            //   c744243401000000     | mov                 dword ptr [esp + 0x34], 1
            //   83d300               | adc                 ebx, 0
            //   f7db                 | neg                 ebx
            //   895c2428             | mov                 dword ptr [esp + 0x28], ebx
            //   eb14                 | jmp                 0x16
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_2 = { 8d0cc1 8b472c 8901 8b471c 894104 0fbf4720 894108 }
            // n = 7, score = 100
            //   8d0cc1               | lea                 ecx, [ecx + eax*8]
            //   8b472c               | mov                 eax, dword ptr [edi + 0x2c]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b471c               | mov                 eax, dword ptr [edi + 0x1c]
            //   894104               | mov                 dword ptr [ecx + 4], eax
            //   0fbf4720             | movsx               eax, word ptr [edi + 0x20]
            //   894108               | mov                 dword ptr [ecx + 8], eax

        $sequence_3 = { c7471000000000 83bed400000000 741d 8bcf e8???????? 8bd8 85db }
            // n = 7, score = 100
            //   c7471000000000       | mov                 dword ptr [edi + 0x10], 0
            //   83bed400000000       | cmp                 dword ptr [esi + 0xd4], 0
            //   741d                 | je                  0x1f
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx

        $sequence_4 = { ff15???????? 8b450c 85c0 750f 80fb01 720a 8bce }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   80fb01               | cmp                 bl, 1
            //   720a                 | jb                  0xc
            //   8bce                 | mov                 ecx, esi

        $sequence_5 = { e8???????? 8bc8 8b9514feffff b808000000 66894108 8b8514feffff 8b4010 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   8b9514feffff         | mov                 edx, dword ptr [ebp - 0x1ec]
            //   b808000000           | mov                 eax, 8
            //   66894108             | mov                 word ptr [ecx + 8], ax
            //   8b8514feffff         | mov                 eax, dword ptr [ebp - 0x1ec]
            //   8b4010               | mov                 eax, dword ptr [eax + 0x10]

        $sequence_6 = { c645f701 8b4df8 894de8 8d55f7 52 8d45ef 50 }
            // n = 7, score = 100
            //   c645f701             | mov                 byte ptr [ebp - 9], 1
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   894de8               | mov                 dword ptr [ebp - 0x18], ecx
            //   8d55f7               | lea                 edx, [ebp - 9]
            //   52                   | push                edx
            //   8d45ef               | lea                 eax, [ebp - 0x11]
            //   50                   | push                eax

        $sequence_7 = { 8b9514feffff 8b8d04feffff 8b8508feffff 83c214 e9???????? 8b4928 e8???????? }
            // n = 7, score = 100
            //   8b9514feffff         | mov                 edx, dword ptr [ebp - 0x1ec]
            //   8b8d04feffff         | mov                 ecx, dword ptr [ebp - 0x1fc]
            //   8b8508feffff         | mov                 eax, dword ptr [ebp - 0x1f8]
            //   83c214               | add                 edx, 0x14
            //   e9????????           |                     
            //   8b4928               | mov                 ecx, dword ptr [ecx + 0x28]
            //   e8????????           |                     

        $sequence_8 = { f30fe6c0 f20f5cc8 f20f59cd 8806 46 8b442428 83e801 }
            // n = 7, score = 100
            //   f30fe6c0             | cvtdq2pd            xmm0, xmm0
            //   f20f5cc8             | subsd               xmm1, xmm0
            //   f20f59cd             | mulsd               xmm1, xmm5
            //   8806                 | mov                 byte ptr [esi], al
            //   46                   | inc                 esi
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   83e801               | sub                 eax, 1

        $sequence_9 = { c744881000000000 895714 834f0820 8b442430 8d4c244c 51 8b4c241c }
            // n = 7, score = 100
            //   c744881000000000     | mov                 dword ptr [eax + ecx*4 + 0x10], 0
            //   895714               | mov                 dword ptr [edi + 0x14], edx
            //   834f0820             | or                  dword ptr [edi + 8], 0x20
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   8d4c244c             | lea                 ecx, [esp + 0x4c]
            //   51                   | push                ecx
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]

    condition:
        7 of them and filesize < 2151424
}