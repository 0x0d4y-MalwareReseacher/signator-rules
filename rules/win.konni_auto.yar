rule win_konni_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.konni."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.konni"
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
        $sequence_0 = { 52 8d45dc 50 6a00 68???????? 51 ff15???????? }
            // n = 7, score = 800
            //   52                   | push                edx
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   68????????           |                     
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_1 = { 53 56 57 8b7d10 8985f4feffff 33f6 }
            // n = 6, score = 800
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   8985f4feffff         | mov                 dword ptr [ebp - 0x10c], eax
            //   33f6                 | xor                 esi, esi

        $sequence_2 = { 7908 4e 81ce00ffffff 46 8a9435f8feffff 88940df8feffff }
            // n = 6, score = 800
            //   7908                 | jns                 0xa
            //   4e                   | dec                 esi
            //   81ce00ffffff         | or                  esi, 0xffffff00
            //   46                   | inc                 esi
            //   8a9435f8feffff       | mov                 dl, byte ptr [ebp + esi - 0x108]
            //   88940df8feffff       | mov                 byte ptr [ebp + ecx - 0x108], dl

        $sequence_3 = { d0f9 0fbef1 83e601 8970f4 }
            // n = 4, score = 800
            //   d0f9                 | sar                 cl, 1
            //   0fbef1               | movsx               esi, cl
            //   83e601               | and                 esi, 1
            //   8970f4               | mov                 dword ptr [eax - 0xc], esi

        $sequence_4 = { 8bec 83ec24 a1???????? 33c5 8945fc 8b0d???????? 8a15???????? }
            // n = 7, score = 800
            //   8bec                 | mov                 ebp, esp
            //   83ec24               | sub                 esp, 0x24
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b0d????????         |                     
            //   8a15????????         |                     

        $sequence_5 = { 884c15f4 8970e8 42 83c020 83fa03 }
            // n = 5, score = 800
            //   884c15f4             | mov                 byte ptr [ebp + edx - 0xc], cl
            //   8970e8               | mov                 dword ptr [eax - 0x18], esi
            //   42                   | inc                 edx
            //   83c020               | add                 eax, 0x20
            //   83fa03               | cmp                 edx, 3

        $sequence_6 = { 8a4c15f4 0fbef1 83e601 897004 }
            // n = 4, score = 800
            //   8a4c15f4             | mov                 cl, byte ptr [ebp + edx - 0xc]
            //   0fbef1               | movsx               esi, cl
            //   83e601               | and                 esi, 1
            //   897004               | mov                 dword ptr [eax + 4], esi

        $sequence_7 = { 6a3d 68???????? 53 e8???????? }
            // n = 4, score = 800
            //   6a3d                 | push                0x3d
            //   68????????           |                     
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_8 = { 6a01 ff15???????? 50 a3???????? e8???????? }
            // n = 5, score = 500
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   50                   | push                eax
            //   a3????????           |                     
            //   e8????????           |                     

        $sequence_9 = { 68b6030000 6a0d 50 ff15???????? }
            // n = 4, score = 500
            //   68b6030000           | push                0x3b6
            //   6a0d                 | push                0xd
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_10 = { 56 e8???????? 8a9435dec44600 5e 84c0 8bfa }
            // n = 6, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a9435dec44600       | mov                 dl, byte ptr [ebp + esi + 0x46c4de]
            //   5e                   | pop                 esi
            //   84c0                 | test                al, al
            //   8bfa                 | mov                 edi, edx

        $sequence_11 = { e8???????? 8a8c30a6c44600 5e 8b442414 03ca 03c1 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8a8c30a6c44600       | mov                 cl, byte ptr [eax + esi + 0x46c4a6]
            //   5e                   | pop                 esi
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   03ca                 | add                 ecx, edx
            //   03c1                 | add                 eax, ecx

        $sequence_12 = { 50 ff15???????? 8d85f8feffff 50 ff15???????? 68???????? 8d8df8feffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   68????????           |                     
            //   8d8df8feffff         | lea                 ecx, [ebp - 0x108]

        $sequence_13 = { e8???????? 8a9c30c2c44600 5e 83f908 7232 8b4e04 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8a9c30c2c44600       | mov                 bl, byte ptr [eax + esi + 0x46c4c2]
            //   5e                   | pop                 esi
            //   83f908               | cmp                 ecx, 8
            //   7232                 | jb                  0x34
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]

        $sequence_14 = { 57 56 ff95b10f0000 ab b000 }
            // n = 5, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   ff95b10f0000         | call                dword ptr [ebp + 0xfb1]
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   b000                 | mov                 al, 0

        $sequence_15 = { 8b35???????? 8d95f0faffff 52 8d85f8feffff }
            // n = 4, score = 200
            //   8b35????????         |                     
            //   8d95f0faffff         | lea                 edx, [ebp - 0x510]
            //   52                   | push                edx
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]

        $sequence_16 = { 8d8df0faffff 51 ffd6 8b35???????? 8d95f0faffff }
            // n = 5, score = 200
            //   8d8df0faffff         | lea                 ecx, [ebp - 0x510]
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   8b35????????         |                     
            //   8d95f0faffff         | lea                 edx, [ebp - 0x510]

        $sequence_17 = { c1e902 83e203 83f908 7229 f3a5 ff2495f0444000 8bc7 }
            // n = 7, score = 200
            //   c1e902               | shr                 ecx, 2
            //   83e203               | and                 edx, 3
            //   83f908               | cmp                 ecx, 8
            //   7229                 | jb                  0x2b
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff2495f0444000       | jmp                 dword ptr [edx*4 + 0x4044f0]
            //   8bc7                 | mov                 eax, edi

        $sequence_18 = { 4c89742420 ff15???????? 488bd8 4885c0 744f }
            // n = 5, score = 200
            //   4c89742420           | dec                 esp
            //   ff15????????         |                     
            //   488bd8               | mov                 dword ptr [esp + 0x20], esi
            //   4885c0               | dec                 eax
            //   744f                 | mov                 ebx, eax

        $sequence_19 = { 33c9 56 e8???????? 8a8c30a6c44600 }
            // n = 4, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a8c30a6c44600       | mov                 cl, byte ptr [eax + esi + 0x46c4a6]

        $sequence_20 = { 51 ff15???????? 85c0 755b 57 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   755b                 | jne                 0x5d
            //   57                   | push                edi

        $sequence_21 = { 56 e8???????? 8a8c30dec44600 5e }
            // n = 4, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a8c30dec44600       | mov                 cl, byte ptr [eax + esi + 0x46c4de]
            //   5e                   | pop                 esi

        $sequence_22 = { 6a00 6a00 ff15???????? 68d0070000 ff15???????? 8b4dfc }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   68d0070000           | push                0x7d0
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_23 = { ffd6 6804010000 8d85f0fcffff 50 68???????? ff15???????? }
            // n = 6, score = 200
            //   ffd6                 | call                esi
            //   6804010000           | push                0x104
            //   8d85f0fcffff         | lea                 eax, [ebp - 0x310]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_24 = { 50 ff95b50f0000 898598040000 8bf0 8d7d51 57 56 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ff95b50f0000         | call                dword ptr [ebp + 0xfb5]
            //   898598040000         | mov                 dword ptr [ebp + 0x498], eax
            //   8bf0                 | mov                 esi, eax
            //   8d7d51               | lea                 edi, [ebp + 0x51]
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_25 = { 68???????? 8d85f8feffff 50 ffd6 68???????? 8d8df0faffff 51 }
            // n = 7, score = 200
            //   68????????           |                     
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   8d8df0faffff         | lea                 ecx, [ebp - 0x510]
            //   51                   | push                ecx

        $sequence_26 = { 50 038594040000 59 0bc9 89851a040000 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   038594040000         | add                 eax, dword ptr [ebp + 0x494]
            //   59                   | pop                 ecx
            //   0bc9                 | or                  ecx, ecx
            //   89851a040000         | mov                 dword ptr [ebp + 0x41a], eax

        $sequence_27 = { 48895c2450 4889442458 4889442460 4585e4 7456 }
            // n = 5, score = 100
            //   48895c2450           | dec                 ecx
            //   4889442458           | mov                 ecx, dword ptr [edi]
            //   4889442460           | dec                 eax
            //   4585e4               | mov                 dword ptr [esp + 0x68], eax
            //   7456                 | movzx               eax, byte ptr [ebp + 0x540]

        $sequence_28 = { 488b5618 4883cbff 4885d2 0f847e010000 }
            // n = 4, score = 100
            //   488b5618             | dec                 eax
            //   4883cbff             | lea                 edx, [esp + 0x30]
            //   4885d2               | inc                 ebp
            //   0f847e010000         | xor                 ecx, ecx

        $sequence_29 = { 4d03e5 3918 0f4c18 3bcb 0f8d87000000 488d3d53e40000 ba58000000 }
            // n = 7, score = 100
            //   4d03e5               | xor                 ebx, ebx
            //   3918                 | dec                 eax
            //   0f4c18               | lea                 esi, [0x14db4]
            //   3bcb                 | nop                 dword ptr [eax]
            //   0f8d87000000         | dec                 eax
            //   488d3d53e40000       | mov                 eax, dword ptr [ebx + 0x50]
            //   ba58000000           | dec                 eax

        $sequence_30 = { 44884304 41f7e9 c1fa02 8bc2 c1e81f 03d0 }
            // n = 6, score = 100
            //   44884304             | cmp                 ecx, eax
            //   41f7e9               | je                  0x1f
            //   c1fa02               | cmp                 dword ptr [ecx + 0x160], 0
            //   8bc2                 | jne                 0x13
            //   c1e81f               | dec                 eax
            //   03d0                 | mov                 ecx, dword ptr [ebx + 0x158]

        $sequence_31 = { 488d05581a0100 483bc8 741a 83b96001000000 7511 e8???????? 488b8b58010000 }
            // n = 7, score = 100
            //   488d05581a0100       | dec                 eax
            //   483bc8               | test                eax, eax
            //   741a                 | je                  0x51
            //   83b96001000000       | dec                 eax
            //   7511                 | lea                 eax, [0x11a58]
            //   e8????????           |                     
            //   488b8b58010000       | dec                 eax

        $sequence_32 = { 488b742460 4885f6 0f8458010000 4c89642470 }
            // n = 4, score = 100
            //   488b742460           | dec                 esp
            //   4885f6               | lea                 ebx, [0x51a7]
            //   0f8458010000         | je                  0x8f
            //   4c89642470           | inc                 ebp

        $sequence_33 = { eb1f 8bce 83e61f c1f905 8bc6 8b0c8de0a30010 8d04c0 }
            // n = 7, score = 100
            //   eb1f                 | jmp                 0x21
            //   8bce                 | mov                 ecx, esi
            //   83e61f               | and                 esi, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8bc6                 | mov                 eax, esi
            //   8b0c8de0a30010       | mov                 ecx, dword ptr [ecx*4 + 0x1000a3e0]
            //   8d04c0               | lea                 eax, [eax + eax*8]

        $sequence_34 = { 83c42c 5f eb26 8d4508 8db644830010 6a00 }
            // n = 6, score = 100
            //   83c42c               | add                 esp, 0x2c
            //   5f                   | pop                 edi
            //   eb26                 | jmp                 0x28
            //   8d4508               | lea                 eax, [ebp + 8]
            //   8db644830010         | lea                 esi, [esi + 0x10008344]
            //   6a00                 | push                0

        $sequence_35 = { 48895c2408 4889742410 48897c2418 4154 4883ec20 4c8d2578c80000 33f6 }
            // n = 7, score = 100
            //   48895c2408           | inc                 esp
            //   4889742410           | mov                 byte ptr [ebx + 4], al
            //   48897c2418           | inc                 ecx
            //   4154                 | imul                ecx
            //   4883ec20             | sar                 edx, 2
            //   4c8d2578c80000       | mov                 eax, edx
            //   33f6                 | shr                 eax, 0x1f

        $sequence_36 = { 8bf1 c1e603 3b9640830010 0f851c010000 }
            // n = 4, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   c1e603               | shl                 esi, 3
            //   3b9640830010         | cmp                 edx, dword ptr [esi + 0x10008340]
            //   0f851c010000         | jne                 0x122

        $sequence_37 = { 0fb645c1 8845bd 0fb645c5 884dc5 0fb64dba 8845c1 }
            // n = 6, score = 100
            //   0fb645c1             | dec                 ecx
            //   8845bd               | mov                 ecx, esp
            //   0fb645c5             | dec                 eax
            //   884dc5               | mov                 ebx, eax
            //   0fb64dba             | dec                 esp
            //   8845c1               | mov                 dword ptr [esp + 0x20], esi

        $sequence_38 = { 83f908 7229 f3a5 ff2495585a0010 8bc7 ba03000000 83e904 }
            // n = 7, score = 100
            //   83f908               | cmp                 ecx, 8
            //   7229                 | jb                  0x2b
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff2495585a0010       | jmp                 dword ptr [edx*4 + 0x10005a58]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3
            //   83e904               | sub                 ecx, 4

        $sequence_39 = { b800000004 e9???????? 488d1528e7ffff 488d4c2440 }
            // n = 4, score = 100
            //   b800000004           | dec                 eax
            //   e9????????           |                     
            //   488d1528e7ffff       | mov                 dword ptr [esp + 0x18], edi
            //   488d4c2440           | inc                 ecx

        $sequence_40 = { 83c40c 837dfc0d 7476 837dfc08 7470 }
            // n = 5, score = 100
            //   83c40c               | add                 esp, 0xc
            //   837dfc0d             | cmp                 dword ptr [ebp - 4], 0xd
            //   7476                 | je                  0x78
            //   837dfc08             | cmp                 dword ptr [ebp - 4], 8
            //   7470                 | je                  0x72

        $sequence_41 = { 488d8180030000 483918 75f1 4889b980030000 33c0 }
            // n = 5, score = 100
            //   488d8180030000       | add                 edx, eax
            //   483918               | dec                 eax
            //   75f1                 | mov                 dword ptr [esp + 8], ebx
            //   4889b980030000       | dec                 eax
            //   33c0                 | mov                 dword ptr [esp + 0x10], esi

        $sequence_42 = { 6a03 ff15???????? c3 56 be???????? }
            // n = 5, score = 100
            //   6a03                 | push                3
            //   ff15????????         |                     
            //   c3                   | ret                 
            //   56                   | push                esi
            //   be????????           |                     

        $sequence_43 = { e8???????? cc 488b5210 488bcb ff15???????? 488905???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   cc                   | mov                 dword ptr [esp + 0x2a0], edi
            //   488b5210             | dec                 esp
            //   488bcb               | lea                 eax, [esp + 0x180]
            //   ff15????????         |                     
            //   488905????????       |                     

        $sequence_44 = { 0f8489000000 4533db 488d35b44d0100 0f1f4000 488b4350 }
            // n = 5, score = 100
            //   0f8489000000         | lea                 esp, [0xc878]
            //   4533db               | xor                 esi, esi
            //   488d35b44d0100       | dec                 eax
            //   0f1f4000             | lea                 eax, [ecx + 0x380]
            //   488b4350             | dec                 eax

        $sequence_45 = { 0f1f8000000000 b9e8030000 ff15???????? 4533c9 48895c2430 488d4de0 }
            // n = 6, score = 100
            //   0f1f8000000000       | dec                 eax
            //   b9e8030000           | mov                 ebx, eax
            //   ff15????????         |                     
            //   4533c9               | dec                 eax
            //   48895c2430           | test                eax, eax
            //   488d4de0             | je                  0x57

        $sequence_46 = { 498b0f 4889442468 0fb68540050000 4c8d1da7510000 }
            // n = 4, score = 100
            //   498b0f               | push                esp
            //   4889442468           | dec                 eax
            //   0fb68540050000       | sub                 esp, 0x20
            //   4c8d1da7510000       | dec                 esp

    condition:
        7 of them and filesize < 330752
}