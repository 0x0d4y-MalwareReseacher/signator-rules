rule win_op_blockbuster_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.op_blockbuster."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.op_blockbuster"
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
        $sequence_0 = { 8a08 80f920 7505 83c021 }
            // n = 4, score = 800
            //   8a08                 | inc                 ebx
            //   80f920               | mov                 byte ptr [edx + ebx - 1], al
            //   7505                 | test                al, al
            //   83c021               | jne                 8

        $sequence_1 = { 56 57 683c400000 6a40 ff15???????? }
            // n = 5, score = 800
            //   56                   | mov                 ecx, dword ptr [esp + 0x3f0]
            //   57                   | dec                 eax
            //   683c400000           | xor                 ecx, esp
            //   6a40                 | dec                 eax
            //   ff15????????         |                     

        $sequence_2 = { f3ab 66ab aa 5f 85f6 }
            // n = 5, score = 800
            //   f3ab                 | mov                 dword ptr [esp + 0x64], esp
            //   66ab                 | dec                 eax
            //   aa                   | mov                 ebx, eax
            //   5f                   | inc                 esp
            //   85f6                 | mov                 dword ptr [esp + 0x68], esp

        $sequence_3 = { ff15???????? 6808400000 6a40 ff15???????? }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   6808400000           | mov                 ebx, dword ptr [esp + 0x420]
            //   6a40                 | dec                 eax
            //   ff15????????         |                     

        $sequence_4 = { 56 e8???????? 68???????? 56 a3???????? e8???????? 83c440 }
            // n = 7, score = 800
            //   56                   | lea                 edi, [esp + 0x380]
            //   e8????????           |                     
            //   68????????           |                     
            //   56                   | dec                 eax
            //   a3????????           |                     
            //   e8????????           |                     
            //   83c440               | lea                 edx, [esp + 0x30]

        $sequence_5 = { e8???????? 85c0 7407 83f802 }
            // n = 4, score = 800
            //   e8????????           |                     
            //   85c0                 | dec                 ebp
            //   7407                 | mov                 ecx, ebp
            //   83f802               | repne scasb         al, byte ptr es:[edi]

        $sequence_6 = { 8b497c 85c9 7407 51 }
            // n = 4, score = 800
            //   8b497c               | add                 edx, eax
            //   85c9                 | imul                eax, eax, 0x3c
            //   7407                 | cmp                 eax, edx
            //   51                   | jg                  0x23

        $sequence_7 = { 56 50 8d45fc 6a04 50 }
            // n = 5, score = 700
            //   56                   | cmp                 al, 0x69
            //   50                   | jl                  0xc
            //   8d45fc               | cmp                 al, 0x70
            //   6a04                 | jg                  0xc
            //   50                   | add                 al, 9

        $sequence_8 = { 85c0 7412 68???????? 50 e8???????? 59 a3???????? }
            // n = 7, score = 700
            //   85c0                 | jmp                 0xc
            //   7412                 | cmp                 al, 0x69
            //   68????????           |                     
            //   50                   | jl                  0xa
            //   e8????????           |                     
            //   59                   | cmp                 al, 0x70
            //   a3????????           |                     

        $sequence_9 = { 3c69 7c08 3c70 7f04 0409 eb06 3c72 }
            // n = 7, score = 500
            //   3c69                 | cmp                 al, 0x69
            //   7c08                 | jl                  0xa
            //   3c70                 | cmp                 al, 0x70
            //   7f04                 | jg                  6
            //   0409                 | add                 al, 9
            //   eb06                 | jmp                 8
            //   3c72                 | cmp                 al, 0x72

        $sequence_10 = { 57 ff15???????? 8bc6 5f 5e c3 33c0 }
            // n = 7, score = 300
            //   57                   | stosw               word ptr es:[edi], ax
            //   ff15????????         |                     
            //   8bc6                 | stosb               byte ptr es:[edi], al
            //   5f                   | pop                 edi
            //   5e                   | test                esi, esi
            //   c3                   | pop                 esi
            //   33c0                 | test                eax, eax

        $sequence_11 = { 85c0 748d ff15???????? 488b5c2460 33c0 4883c450 }
            // n = 6, score = 300
            //   85c0                 | dec                 eax
            //   748d                 | mov                 dword ptr [edi], eax
            //   ff15????????         |                     
            //   488b5c2460           | or                  eax, 0xffffffff
            //   33c0                 | dec                 eax
            //   4883c450             | mov                 ecx, dword ptr [esp + 0x3f0]

        $sequence_12 = { 4885c0 0f8480010000 4c89b424e8030000 4c89bc24e0030000 448bf3 b800400000 }
            // n = 6, score = 300
            //   4885c0               | pop                 ebx
            //   0f8480010000         | pop                 ebp
            //   4c89b424e8030000     | dec                 eax
            //   4c89bc24e0030000     | test                eax, eax
            //   448bf3               | je                  0x186
            //   b800400000           | dec                 esp

        $sequence_13 = { e8???????? 4881c4c0040000 415f 5f 5e 5b 5d }
            // n = 7, score = 300
            //   e8????????           |                     
            //   4881c4c0040000       | dec                 eax
            //   415f                 | add                 esp, 0x4c0
            //   5f                   | inc                 ecx
            //   5e                   | pop                 edi
            //   5b                   | pop                 edi
            //   5d                   | pop                 esi

        $sequence_14 = { 56 6a00 ff15???????? 8bf8 85ff 7504 }
            // n = 6, score = 300
            //   56                   | pop                 edi
            //   6a00                 | pop                 esi
            //   ff15????????         |                     
            //   8bf8                 | ret                 
            //   85ff                 | xor                 eax, eax
            //   7504                 | xor                 eax, eax

        $sequence_15 = { 5e c3 68???????? ff15???????? 85c0 7412 }
            // n = 6, score = 300
            //   5e                   | push                esi
            //   c3                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   85c0                 | lea                 eax, [ebp - 4]
            //   7412                 | push                4

        $sequence_16 = { 8bf0 ff15???????? 85f6 7404 85c0 }
            // n = 5, score = 300
            //   8bf0                 | ret                 
            //   ff15????????         |                     
            //   85f6                 | xor                 eax, eax
            //   7404                 | push                0
            //   85c0                 | mov                 eax, esi

        $sequence_17 = { 57 e8???????? 56 e8???????? 83c414 b801000000 }
            // n = 6, score = 300
            //   57                   | mov                 eax, esi
            //   e8????????           |                     
            //   56                   | pop                 edi
            //   e8????????           |                     
            //   83c414               | pop                 esi
            //   b801000000           | ret                 

        $sequence_18 = { 0f1f840000000000 0fb603 48ffc3 88441aff 84c0 75f2 488d542450 }
            // n = 7, score = 300
            //   0f1f840000000000     | dec                 eax
            //   0fb603               | xor                 ecx, esp
            //   48ffc3               | dec                 eax
            //   88441aff             | mov                 ebx, dword ptr [esp + 0x420]
            //   84c0                 | dec                 eax
            //   75f2                 | add                 esp, 0x400
            //   488d542450           | imul                edx, edx, 0x3c

        $sequence_19 = { 488907 83c8ff 488b8c24f0030000 4833cc e8???????? 488b9c2420040000 4881c400040000 }
            // n = 7, score = 300
            //   488907               | mov                 eax, 0x4000
            //   83c8ff               | dec                 eax
            //   488b8c24f0030000     | mov                 ecx, eax
            //   4833cc               | dec                 eax
            //   e8????????           |                     
            //   488b9c2420040000     | lea                 ecx, [ebp]
            //   4881c400040000       | inc                 esp

        $sequence_20 = { c3 56 53 6a01 57 e8???????? 56 }
            // n = 7, score = 300
            //   c3                   | mov                 eax, esi
            //   56                   | pop                 edi
            //   53                   | pop                 esi
            //   6a01                 | ret                 
            //   57                   | xor                 eax, eax
            //   e8????????           |                     
            //   56                   | push                0

        $sequence_21 = { 6bd23c 03d0 8b05???????? 6bc03c 0305???????? 3bc2 7f17 }
            // n = 7, score = 300
            //   6bd23c               | mov                 dword ptr [esp + 0x64], esp
            //   03d0                 | dec                 eax
            //   8b05????????         |                     
            //   6bc03c               | mov                 ebx, eax
            //   0305????????         |                     
            //   3bc2                 | inc                 esp
            //   7f17                 | mov                 dword ptr [esp + 0x68], esp

        $sequence_22 = { 68???????? 56 e8???????? 56 e8???????? 83c438 }
            // n = 6, score = 300
            //   68????????           |                     
            //   56                   | xor                 ebx, ebx
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c438               | push                edi

        $sequence_23 = { ebf8 53 33db 391d???????? 56 }
            // n = 5, score = 300
            //   ebf8                 | je                  0xb
            //   53                   | cmp                 eax, 2
            //   33db                 | rep stosd           dword ptr es:[edi], eax
            //   391d????????         |                     
            //   56                   | stosw               word ptr es:[edi], ax

        $sequence_24 = { 488bc8 ff15???????? 488d4d00 4489642464 488bd8 4489642468 }
            // n = 6, score = 300
            //   488bc8               | mov                 dword ptr [esp + 0x3e8], esi
            //   ff15????????         |                     
            //   488d4d00             | dec                 esp
            //   4489642464           | mov                 dword ptr [esp + 0x3e0], edi
            //   488bd8               | inc                 esp
            //   4489642468           | mov                 esi, ebx

        $sequence_25 = { 7edd 83c8ff 85c0 7831 8b1cc5ac324400 6a55 }
            // n = 6, score = 200
            //   7edd                 | add                 esp, 0x14
            //   83c8ff               | mov                 eax, 1
            //   85c0                 | push                esi
            //   7831                 | push                0
            //   8b1cc5ac324400       | mov                 edi, eax
            //   6a55                 | test                edi, edi

        $sequence_26 = { 8b461c 83f808 0f8499000000 83f807 0f87a0000000 ff2485d2164100 }
            // n = 6, score = 200
            //   8b461c               | ret                 
            //   83f808               | push                esi
            //   0f8499000000         | push                ebx
            //   83f807               | push                1
            //   0f87a0000000         | push                edi
            //   ff2485d2164100       | ret                 

        $sequence_27 = { 741c 81f900000400 7542 0c80 88441628 8b04bdd8974400 c644102901 }
            // n = 7, score = 200
            //   741c                 | jne                 0xc
            //   81f900000400         | pop                 edi
            //   7542                 | push                esi
            //   0c80                 | push                0
            //   88441628             | mov                 edi, eax
            //   8b04bdd8974400       | test                edi, edi
            //   c644102901           | jne                 0xd

        $sequence_28 = { e8???????? 8d8c2414040000 51 6a66 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8d8c2414040000       | push                1
            //   51                   | push                edi
            //   6a66                 | push                esi

        $sequence_29 = { 8975d8 8b08 52 57 50 }
            // n = 5, score = 100
            //   8975d8               | push                eax
            //   8b08                 | lea                 eax, [ebp - 4]
            //   52                   | push                4
            //   57                   | push                eax
            //   50                   | push                edi

        $sequence_30 = { ebda 8bb5dcfdffff eb02 33f6 57 ff15???????? }
            // n = 6, score = 100
            //   ebda                 | je                  0x14
            //   8bb5dcfdffff         | push                eax
            //   eb02                 | pop                 ecx
            //   33f6                 | pop                 ecx
            //   57                   | push                esi
            //   ff15????????         |                     

        $sequence_31 = { 668b45f8 66894610 668b45fa 66894612 668b85f8feffff }
            // n = 5, score = 100
            //   668b45f8             | ret                 
            //   66894610             | push                eax
            //   668b45fa             | lea                 eax, [ebp - 4]
            //   66894612             | push                4
            //   668b85f8feffff       | push                eax

        $sequence_32 = { 50 68???????? 68???????? 8d8514f2ffff 68???????? 50 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   68????????           |                     
            //   8d8514f2ffff         | lea                 eax, [ebp - 4]
            //   68????????           |                     
            //   50                   | push                4

        $sequence_33 = { 897dec e8???????? 59 8945f4 }
            // n = 4, score = 100
            //   897dec               | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945f4               | pop                 ecx

    condition:
        7 of them and filesize < 74309632
}