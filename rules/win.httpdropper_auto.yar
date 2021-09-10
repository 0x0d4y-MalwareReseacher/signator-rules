rule win_httpdropper_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.httpdropper."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.httpdropper"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 014b18 c7437c00000000 897b70 85c0 0f85b4010000 }
            // n = 5, score = 200
            //   014b18               | add                 dword ptr [ebx + 0x18], ecx
            //   c7437c00000000       | mov                 dword ptr [ebx + 0x7c], 0
            //   897b70               | mov                 dword ptr [ebx + 0x70], edi
            //   85c0                 | test                eax, eax
            //   0f85b4010000         | jne                 0x1ba

        $sequence_1 = { 018614400000 8b8614400000 c68430142000000d ff8614400000 }
            // n = 4, score = 200
            //   018614400000         | add                 dword ptr [esi + 0x4014], eax
            //   8b8614400000         | mov                 eax, dword ptr [esi + 0x4014]
            //   c68430142000000d     | mov                 byte ptr [eax + esi + 0x2014], 0xd
            //   ff8614400000         | inc                 dword ptr [esi + 0x4014]

        $sequence_2 = { 018610200000 8d5e10 8d9b00000000 8b9610200000 }
            // n = 4, score = 200
            //   018610200000         | add                 dword ptr [esi + 0x2010], eax
            //   8d5e10               | lea                 ebx, dword ptr [esi + 0x10]
            //   8d9b00000000         | lea                 ebx, dword ptr [ebx]
            //   8b9610200000         | mov                 edx, dword ptr [esi + 0x2010]

        $sequence_3 = { 014614 bb40000000 2bd9 3bfb }
            // n = 4, score = 200
            //   014614               | add                 dword ptr [esi + 0x14], eax
            //   bb40000000           | mov                 ebx, 0x40
            //   2bd9                 | sub                 ebx, ecx
            //   3bfb                 | cmp                 edi, ebx

        $sequence_4 = { 017df8 83f93d 7471 83f920 7505 b92b000000 0fbf0c4d20a80310 }
            // n = 7, score = 200
            //   017df8               | add                 dword ptr [ebp - 8], edi
            //   83f93d               | cmp                 ecx, 0x3d
            //   7471                 | je                  0x73
            //   83f920               | cmp                 ecx, 0x20
            //   7505                 | jne                 7
            //   b92b000000           | mov                 ecx, 0x2b
            //   0fbf0c4d20a80310     | movsx               ecx, word ptr [ecx*2 + 0x1003a820]

        $sequence_5 = { 894608 88941ca0030000 8bd3 0fb69c14a1030000 885c240c }
            // n = 5, score = 200
            //   894608               | mov                 dword ptr [esi + 8], eax
            //   88941ca0030000       | mov                 byte ptr [esp + ebx + 0x3a0], dl
            //   8bd3                 | mov                 edx, ebx
            //   0fb69c14a1030000     | movzx               ebx, byte ptr [esp + edx + 0x3a1]
            //   885c240c             | mov                 byte ptr [esp + 0xc], bl

        $sequence_6 = { 0110 80aa0110a4aa01 1023 d18a0688078a 46 }
            // n = 5, score = 200
            //   0110                 | add                 dword ptr [eax], edx
            //   80aa0110a4aa01       | sub                 byte ptr [edx - 0x555befff], 1
            //   1023                 | adc                 byte ptr [ebx], ah
            //   d18a0688078a         | ror                 dword ptr [edx - 0x75f877fa], 1
            //   46                   | inc                 esi

        $sequence_7 = { 015dfc 83c204 81fa???????? 7cb7 3d00010000 740a c786a4af060078420310 }
            // n = 7, score = 200
            //   015dfc               | add                 dword ptr [ebp - 4], ebx
            //   83c204               | add                 edx, 4
            //   81fa????????         |                     
            //   7cb7                 | jl                  0xffffffb9
            //   3d00010000           | cmp                 eax, 0x100
            //   740a                 | je                  0xc
            //   c786a4af060078420310     | mov    dword ptr [esi + 0x6afa4], 0x10034278

        $sequence_8 = { 03c9 2bd9 81ff94010000 7519 }
            // n = 4, score = 100
            //   03c9                 | xor                 ecx, ecx
            //   2bd9                 | dec                 eax
            //   81ff94010000         | mov                 dword ptr [esp + 0x28], eax
            //   7519                 | inc                 ebp

        $sequence_9 = { 014e28 48c786a800000000000000 899698000000 85c0 }
            // n = 4, score = 100
            //   014e28               | add                 dword ptr [esi + 0x28], ecx
            //   48c786a800000000000000     | dec    eax
            //   899698000000         | mov                 dword ptr [esi + 0xa8], 0
            //   85c0                 | mov                 dword ptr [esi + 0x98], edx

        $sequence_10 = { 03742478 488d442478 4533c9 4533c0 }
            // n = 4, score = 100
            //   03742478             | add                 dword ptr [ebx + 0x1af70], ecx
            //   488d442478           | mov                 edx, dword ptr [ebx + 0x1af70]
            //   4533c9               | dec                 eax
            //   4533c0               | lea                 ecx, dword ptr [0x16f8e]

        $sequence_11 = { 03c2 4189410c 488b4c2450 4833cc e8???????? 4c8d5c2460 498b5b38 }
            // n = 7, score = 100
            //   03c2                 | xor                 ecx, ecx
            //   4189410c             | inc                 ebp
            //   488b4c2450           | xor                 eax, eax
            //   4833cc               | dec                 eax
            //   e8????????           |                     
            //   4c8d5c2460           | mov                 dword ptr [esp + 0x28], eax
            //   498b5b38             | xor                 edx, edx

        $sequence_12 = { 018b70af0100 8b9370af0100 488d0d8e6f0100 e8???????? }
            // n = 4, score = 100
            //   018b70af0100         | add                 dword ptr [ebx + 0x4018], ecx
            //   8b9370af0100         | mov                 eax, dword ptr [ebx + 0x4018]
            //   488d0d8e6f0100       | dec                 eax
            //   e8????????           |                     

        $sequence_13 = { 039c2488000000 488d842488000000 c744243080000000 4533c9 }
            // n = 4, score = 100
            //   039c2488000000       | dec                 eax
            //   488d842488000000     | lea                 eax, dword ptr [esp + 0x78]
            //   c744243080000000     | inc                 ebp
            //   4533c9               | xor                 ecx, ecx

        $sequence_14 = { 018b18400000 8b8318400000 488d8b20400000 c68418182000000d }
            // n = 4, score = 100
            //   018b18400000         | test                eax, eax
            //   8b8318400000         | jne                 0x16b
            //   488d8b20400000       | test                edi, edi
            //   c68418182000000d     | jne                 0xfffffc74

        $sequence_15 = { 03c8 85db 740e 3bd9 }
            // n = 4, score = 100
            //   03c8                 | dec                 eax
            //   85db                 | mov                 dword ptr [esp + 0x20], ebx
            //   740e                 | add                 ebx, dword ptr [esp + 0x88]
            //   3bd9                 | dec                 eax

    condition:
        7 of them and filesize < 524288
}