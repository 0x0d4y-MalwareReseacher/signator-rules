rule win_sage_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.sage_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sage_ransom"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 6a02 e8???????? 8b35???????? 83c404 68e0930400 ffd6 }
            // n = 6, score = 300
            //   6a02                 | push                2
            //   e8????????           |                     
            //   8b35????????         |                     
            //   83c404               | add                 esp, 4
            //   68e0930400           | push                0x493e0
            //   ffd6                 | call                esi

        $sequence_1 = { 5f 33c0 5e 59 c3 56 ff15???????? }
            // n = 7, score = 300
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_2 = { 8d542410 6a03 52 e8???????? 8d442418 }
            // n = 5, score = 300
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   6a03                 | push                3
            //   52                   | push                edx
            //   e8????????           |                     
            //   8d442418             | lea                 eax, [esp + 0x18]

        $sequence_3 = { 6800000200 50 8d442414 50 8d4c241c 51 }
            // n = 6, score = 300
            //   6800000200           | push                0x20000
            //   50                   | push                eax
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   50                   | push                eax
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]
            //   51                   | push                ecx

        $sequence_4 = { 5b 83c408 c3 57 e8???????? 8bf0 56 }
            // n = 7, score = 300
            //   5b                   | pop                 ebx
            //   83c408               | add                 esp, 8
            //   c3                   | ret                 
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi

        $sequence_5 = { 734b 3d00000040 733c 3d0000800c }
            // n = 4, score = 300
            //   734b                 | jae                 0x4d
            //   3d00000040           | cmp                 eax, 0x40000000
            //   733c                 | jae                 0x3e
            //   3d0000800c           | cmp                 eax, 0xc800000

        $sequence_6 = { 8b4c2414 51 8d542408 52 e8???????? }
            // n = 5, score = 300
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   51                   | push                ecx
            //   8d542408             | lea                 edx, [esp + 8]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_7 = { 7c34 8b5004 66833a67 752b e8???????? 85c0 7422 }
            // n = 7, score = 300
            //   7c34                 | jl                  0x36
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   66833a67             | cmp                 word ptr [edx], 0x67
            //   752b                 | jne                 0x2d
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24

        $sequence_8 = { 014110 8b4314 014114 8b4318 }
            // n = 4, score = 200
            //   014110               | add                 dword ptr [ecx + 0x10], eax
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]
            //   014114               | add                 dword ptr [ecx + 0x14], eax
            //   8b4318               | mov                 eax, dword ptr [ebx + 0x18]

        $sequence_9 = { 891424 ff9630020000 85c0 57 57 }
            // n = 5, score = 200
            //   891424               | mov                 dword ptr [esp], edx
            //   ff9630020000         | call                dword ptr [esi + 0x230]
            //   85c0                 | test                eax, eax
            //   57                   | push                edi
            //   57                   | push                edi

        $sequence_10 = { 0119 117104 83c110 83c210 }
            // n = 4, score = 200
            //   0119                 | add                 dword ptr [ecx], ebx
            //   117104               | adc                 dword ptr [ecx + 4], esi
            //   83c110               | add                 ecx, 0x10
            //   83c210               | add                 edx, 0x10

        $sequence_11 = { 014108 8b430c 01410c 8b4310 }
            // n = 4, score = 200
            //   014108               | add                 dword ptr [ecx + 8], eax
            //   8b430c               | mov                 eax, dword ptr [ebx + 0xc]
            //   01410c               | add                 dword ptr [ecx + 0xc], eax
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]

        $sequence_12 = { 01410c 8b4310 014110 8b4314 }
            // n = 4, score = 200
            //   01410c               | add                 dword ptr [ecx + 0xc], eax
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   014110               | add                 dword ptr [ecx + 0x10], eax
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]

        $sequence_13 = { 014114 8b4318 014118 8b431c }
            // n = 4, score = 200
            //   014114               | add                 dword ptr [ecx + 0x14], eax
            //   8b4318               | mov                 eax, dword ptr [ebx + 0x18]
            //   014118               | add                 dword ptr [ecx + 0x18], eax
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]

        $sequence_14 = { 013c13 83c102 46 ebd3 }
            // n = 4, score = 200
            //   013c13               | add                 dword ptr [ebx + edx], edi
            //   83c102               | add                 ecx, 2
            //   46                   | inc                 esi
            //   ebd3                 | jmp                 0xffffffd5

        $sequence_15 = { 0101 8b4304 014104 8b4308 014108 }
            // n = 5, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   014104               | add                 dword ptr [ecx + 4], eax
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   014108               | add                 dword ptr [ecx + 8], eax

    condition:
        7 of them and filesize < 335872
}