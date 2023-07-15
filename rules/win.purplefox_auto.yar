rule win_purplefox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.purplefox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.purplefox"
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
        $sequence_0 = { 7471 33c0 89442418 8944241c 52 }
            // n = 5, score = 100
            //   7471                 | je                  0x73
            //   33c0                 | xor                 eax, eax
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   52                   | push                edx

        $sequence_1 = { 488d6c24b9 4881ecd0000000 33d2 488bd9 }
            // n = 4, score = 100
            //   488d6c24b9           | mov                 ebx, eax
            //   4881ecd0000000       | test                eax, eax
            //   33d2                 | jns                 0x1c
            //   488bd9               | dec                 eax

        $sequence_2 = { 85c0 7507 b802000000 eb1a 8b4704 68???????? 50 }
            // n = 7, score = 100
            //   85c0                 | dec                 eax
            //   7507                 | test                eax, eax
            //   b802000000           | je                  0x19f
            //   eb1a                 | xor                 ecx, ecx
            //   8b4704               | dec                 eax
            //   68????????           |                     
            //   50                   | lea                 ecx, [0x863f]

        $sequence_3 = { 488d545c20 0f1f00 0fb702 4883c102 4883c202 668941fe }
            // n = 6, score = 100
            //   488d545c20           | jmp                 9
            //   0f1f00               | dec                 eax
            //   0fb702               | lea                 ecx, [0xf7a]
            //   4883c102             | dec                 eax
            //   4883c202             | lea                 edx, [esp + ebx*2 + 0x20]
            //   668941fe             | nop                 dword ptr [eax]

        $sequence_4 = { 33c9 ff15???????? 488d0d3f860000 ff15???????? 833d????????00 }
            // n = 5, score = 100
            //   33c9                 | test                eax, 0xc7f91f0f
            //   ff15????????         |                     
            //   488d0d3f860000       | xchg                eax, esi
            //   ff15????????         |                     
            //   833d????????00       |                     

        $sequence_5 = { 50 ff15???????? 8bf0 85f6 7918 56 68???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7918                 | jns                 0x1a
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_6 = { a977e11230 32df a7 bb3dcebff7 }
            // n = 4, score = 100
            //   a977e11230           | dec                 eax
            //   32df                 | mov                 dword ptr [ebx + 8], eax
            //   a7                   | dec                 eax
            //   bb3dcebff7           | mov                 dword ptr [esp + 0x30], eax

        $sequence_7 = { 0f8594000000 488d5114 48897c2458 e8???????? 894310 85c0 }
            // n = 6, score = 100
            //   0f8594000000         | dec                 eax
            //   488d5114             | lea                 ecx, [0xb127]
            //   48897c2458           | inc                 ebp
            //   e8????????           |                     
            //   894310               | xor                 ecx, ecx
            //   85c0                 | inc                 ebp

        $sequence_8 = { 8bff 8b38 8b87b0000000 83c018 }
            // n = 4, score = 100
            //   8bff                 | mov                 edi, edi
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   8b87b0000000         | mov                 eax, dword ptr [edi + 0xb0]
            //   83c018               | add                 eax, 0x18

        $sequence_9 = { 53 7973 52 6541 6c 6c 6f }
            // n = 7, score = 100
            //   53                   | mov                 byte ptr [esp + 0x28], 0
            //   7973                 | dec                 eax
            //   52                   | mov                 ecx, dword ptr [eax]
            //   6541                 | mov                 edx, 0x200
            //   6c                   | dec                 eax
            //   6c                   | mov                 dword ptr [esp + 0x20], ecx
            //   6f                   | dec                 eax

        $sequence_10 = { 488d4158 41b806000000 488d15da8f0000 483950f0 740c 488b10 }
            // n = 6, score = 100
            //   488d4158             | leave               
            //   41b806000000         | mov                 al, 0x79
            //   488d15da8f0000       | push                edi
            //   483950f0             | dec                 eax
            //   740c                 | sub                 esp, 0x20
            //   488b10               | dec                 eax

        $sequence_11 = { 8b0485000c4100 8d44380c 50 ff15???????? }
            // n = 4, score = 100
            //   8b0485000c4100       | dec                 eax
            //   8d44380c             | cmp                 dword ptr [eax - 0x10], edx
            //   50                   | je                  0x1f
            //   ff15????????         |                     

        $sequence_12 = { 8d442418 50 8d4c2410 51 ffd7 8b3d???????? }
            // n = 6, score = 100
            //   8d442418             | lea                 eax, [esp + 0x18]
            //   50                   | push                eax
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   8b3d????????         |                     

        $sequence_13 = { 827357ab a90f1ff9c7 96 bb2a3086e8 0867ee }
            // n = 5, score = 100
            //   827357ab             | xor                 bl, bh
            //   a90f1ff9c7           | cmpsd               dword ptr [esi], dword ptr es:[edi]
            //   96                   | mov                 ebx, 0xf7bfce3d
            //   bb2a3086e8           | push                ebx
            //   0867ee               | jns                 0x75

        $sequence_14 = { 4c89442448 4889442430 4889542440 448d4b10 4c8d442440 ba04202200 895c2428 }
            // n = 7, score = 100
            //   4c89442448           | lea                 ecx, [0xadfd]
            //   4889442430           | dec                 eax
            //   4889542440           | mov                 esi, edx
            //   448d4b10             | dec                 eax
            //   4c8d442440           | mov                 ebx, ecx
            //   ba04202200           | dec                 eax
            //   895c2428             | mov                 dword ptr [esp + 0x30], 0

        $sequence_15 = { f8 28c3 66f7c46baa 68c9efaa5a }
            // n = 4, score = 100
            //   f8                   | js                  0x18d
            //   28c3                 | pushfd              
            //   66f7c46baa           | movsx               ebx, bl
            //   68c9efaa5a           | mov                 ebx, dword ptr [esp + 4]

        $sequence_16 = { c6042439 ff3424 8d642440 e9???????? }
            // n = 4, score = 100
            //   c6042439             | mov                 ecx, dword ptr [ebp + 0x190]
            //   ff3424               | mov                 ecx, ebx
            //   8d642440             | test                eax, eax
            //   e9????????           |                     

        $sequence_17 = { 488d0dfb460000 ff15???????? 488bf0 4885c0 0f8493010000 }
            // n = 5, score = 100
            //   488d0dfb460000       | inc                 esi
            //   ff15????????         |                     
            //   488bf0               | push                esi
            //   4885c0               | add                 dword ptr [ebx + 0x561e94ec], esp
            //   0f8493010000         | xor                 byte ptr [ebx + 0x57], 0xab

        $sequence_18 = { 8945f0 8945f8 8b450c 897dfc }
            // n = 4, score = 100
            //   8945f0               | lea                 eax, [esp + 0x40]
            //   8945f8               | mov                 edx, 0x222004
            //   8b450c               | mov                 dword ptr [esp + 0x28], ebx
            //   897dfc               | jne                 0x9a

        $sequence_19 = { 9c 0fbedb 8b5c2404 9c }
            // n = 4, score = 100
            //   9c                   | sub                 esp, 0xd0
            //   0fbedb               | xor                 edx, edx
            //   8b5c2404             | dec                 eax
            //   9c                   | mov                 ebx, ecx

        $sequence_20 = { bf01000000 56 ff15???????? 53 ff15???????? }
            // n = 5, score = 100
            //   bf01000000           | dec                 eax
            //   56                   | mov                 ecx, esi
            //   ff15????????         |                     
            //   53                   | dec                 eax
            //   ff15????????         |                     

        $sequence_21 = { 895608 ff15???????? 894704 5b 85c0 }
            // n = 5, score = 100
            //   895608               | mov                 dword ptr [esp + 0x40], edx
            //   ff15????????         |                     
            //   894704               | inc                 esp
            //   5b                   | lea                 ecx, [ebx + 0x10]
            //   85c0                 | dec                 esp

        $sequence_22 = { 488bce e8???????? 488bcb e8???????? 8bc7 eb0a }
            // n = 6, score = 100
            //   488bce               | mov                 ebx, 0xe886302a
            //   e8????????           |                     
            //   488bcb               | or                  byte ptr [edi - 0x12], ah
            //   e8????????           |                     
            //   8bc7                 | neg                 byte ptr [edx]
            //   eb0a                 | cld                 

        $sequence_23 = { 8955f8 8d55fc 52 50 }
            // n = 4, score = 100
            //   8955f8               | inc                 ecx
            //   8d55fc               | mov                 eax, 6
            //   52                   | dec                 eax
            //   50                   | lea                 edx, [0x8fda]

        $sequence_24 = { 5e 5b 8be5 5d c3 8b0d???????? 8b11 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     
            //   8b11                 | mov                 edx, dword ptr [ecx]

        $sequence_25 = { 8d642430 0f847cfdffff 660fb3e1 f8 }
            // n = 4, score = 100
            //   8d642430             | dec                 eax
            //   0f847cfdffff         | mov                 ecx, ebp
            //   660fb3e1             | dec                 eax
            //   f8                   | mov                 dword ptr [esp + 0x20], 0

        $sequence_26 = { ff15???????? 488b4c2460 ff15???????? 488d0d730f0000 eb07 488d0d7a0f0000 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   488b4c2460           | dec                 eax
            //   ff15????????         |                     
            //   488d0d730f0000       | mov                 ecx, dword ptr [esp + 0x60]
            //   eb07                 | dec                 eax
            //   488d0d7a0f0000       | lea                 ecx, [0xf73]

        $sequence_27 = { 8d442448 50 e8???????? 8b1d???????? 83c40c }
            // n = 5, score = 100
            //   8d442448             | lea                 eax, [esp + 0x48]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b1d????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_28 = { 4889752f 48897537 ff15???????? 8bd8 85c0 791a }
            // n = 6, score = 100
            //   4889752f             | movzx               eax, word ptr [edx]
            //   48897537             | dec                 eax
            //   ff15????????         |                     
            //   8bd8                 | add                 ecx, 2
            //   85c0                 | dec                 eax
            //   791a                 | add                 edx, 2

        $sequence_29 = { 03c6 6d a4 46 56 01a3ec941e56 a0???????? }
            // n = 7, score = 100
            //   03c6                 | pushfd              
            //   6d                   | lea                 esp, [esp + 0x30]
            //   a4                   | je                  0xfffffd86
            //   46                   | btr                 cx, sp
            //   56                   | clc                 
            //   01a3ec941e56         | test                eax, 0x3012e177
            //   a0????????           |                     

        $sequence_30 = { 51 8d542410 52 ffd7 }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   52                   | push                edx
            //   ffd7                 | call                edi

        $sequence_31 = { c1f805 8bf7 83e61f c1e606 033485000c4100 c745e401000000 33db }
            // n = 7, score = 100
            //   c1f805               | dec                 eax
            //   8bf7                 | mov                 edx, dword ptr [eax]
            //   83e61f               | dec                 esp
            //   c1e606               | mov                 dword ptr [esp + 0x48], eax
            //   033485000c4100       | dec                 eax
            //   c745e401000000       | mov                 dword ptr [esp + 0x30], eax
            //   33db                 | dec                 eax

        $sequence_32 = { 6a00 010e 8b45f0 50 6a04 }
            // n = 5, score = 100
            //   6a00                 | mov                 ecx, ebx
            //   010e                 | mov                 eax, edi
            //   8b45f0               | jmp                 0x11
            //   50                   | dec                 eax
            //   6a04                 | lea                 eax, [ecx + 0x58]

        $sequence_33 = { 488bcd 48c744242000000000 ff15???????? 48894308 }
            // n = 4, score = 100
            //   488bcd               | lea                 ecx, [0x2014]
            //   48c744242000000000     | dec    eax
            //   ff15????????         |                     
            //   48894308             | lea                 ecx, [esp + 0x30]

        $sequence_34 = { 4889442430 488b05???????? c644242800 488b08 ba00020000 48894c2420 488b8d90010000 }
            // n = 7, score = 100
            //   4889442430           | dec                 eax
            //   488b05????????       |                     
            //   c644242800           | lea                 edx, [0x208f]
            //   488b08               | dec                 eax
            //   ba00020000           | lea                 ecx, [esp + 0x40]
            //   48894c2420           | dec                 eax
            //   488b8d90010000       | mov                 edx, dword ptr [ebx]

        $sequence_35 = { 488d158f200000 488d4c2440 ff15???????? 488b13 }
            // n = 4, score = 100
            //   488d158f200000       | mov                 dword ptr [ebp + 0x2f], esi
            //   488d4c2440           | dec                 eax
            //   ff15????????         |                     
            //   488b13               | mov                 dword ptr [ebp + 0x37], esi

        $sequence_36 = { 57 4883ec20 488d0dfdad0000 488bf2 }
            // n = 4, score = 100
            //   57                   | outsd               dx, dword ptr [esi]
            //   4883ec20             | mov                 byte ptr [esp], 0x39
            //   488d0dfdad0000       | push                dword ptr [esp]
            //   488bf2               | lea                 esp, [esp + 0x40]

        $sequence_37 = { 488d0d14200000 ff15???????? 488d4c2430 e8???????? e9???????? }
            // n = 5, score = 100
            //   488d0d14200000       | mov                 word ptr [ecx - 2], ax
            //   ff15????????         |                     
            //   488d4c2430           | dec                 eax
            //   e8????????           |                     
            //   e9????????           |                     

        $sequence_38 = { 488bd9 48c744243000000000 488d0d27b10000 4533c9 4533c0 ba000000c0 c744242880000000 }
            // n = 7, score = 100
            //   488bd9               | clc                 
            //   48c744243000000000     | sub    bl, al
            //   488d0d27b10000       | test                sp, 0xaa6b
            //   4533c9               | push                0x5aaaefc9
            //   4533c0               | add                 eax, esi
            //   ba000000c0           | insd                dword ptr es:[edi], dx
            //   c744242880000000     | movsb               byte ptr es:[edi], byte ptr [esi]

        $sequence_39 = { 895dc4 897dcc 895dd0 895dd4 ffd6 8bf0 3bf3 }
            // n = 7, score = 100
            //   895dc4               | mov                 dword ptr [ebp - 0x3c], ebx
            //   897dcc               | mov                 dword ptr [ebp - 0x34], edi
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   895dd4               | mov                 dword ptr [ebp - 0x2c], ebx
            //   ffd6                 | call                esi
            //   8bf0                 | mov                 esi, eax
            //   3bf3                 | cmp                 esi, ebx

    condition:
        7 of them and filesize < 1983488
}