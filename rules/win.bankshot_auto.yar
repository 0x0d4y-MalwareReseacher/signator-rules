rule win_bankshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.bankshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bankshot"
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
        $sequence_0 = { 8bf8 8d5101 8a01 41 84c0 75f9 57 }
            // n = 7, score = 300
            //   8bf8                 | nop                 word ptr [eax + eax]
            //   8d5101               | jne                 0xcd
            //   8a01                 | cmp                 dword ptr [eax], 0
            //   41                   | sub                 esp, 0x448
            //   84c0                 | xor                 eax, ebp
            //   75f9                 | mov                 dword ptr [ebp - 8], eax
            //   57                   | push                ebx

        $sequence_1 = { 81ec48040000 a1???????? 33c5 8945f8 53 }
            // n = 5, score = 300
            //   81ec48040000         | sub                 esp, 0x20
            //   a1????????           |                     
            //   33c5                 | dec                 eax
            //   8945f8               | lea                 ebx, [0x2233]
            //   53                   | dec                 eax

        $sequence_2 = { 83c40c e8???????? 99 b907000000 }
            // n = 4, score = 200
            //   83c40c               | call                dword ptr [ebp - 0xc3c]
            //   e8????????           |                     
            //   99                   | test                eax, eax
            //   b907000000           | je                  0x20

        $sequence_3 = { 680c400000 8d8528beffff 6a00 50 e8???????? 0f280d???????? }
            // n = 6, score = 200
            //   680c400000           | jne                 5
            //   8d8528beffff         | push                edi
            //   6a00                 | push                ebp
            //   50                   | mov                 ebp, esp
            //   e8????????           |                     
            //   0f280d????????       |                     

        $sequence_4 = { c74048b8e40110 8b4508 6689486c 8b4508 66898872010000 8b4508 83a04c03000000 }
            // n = 7, score = 200
            //   c74048b8e40110       | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   8b4508               | mov                 dword ptr [ebp - 0x20], eax
            //   6689486c             | lea                 eax, [eax + 0x1001e1d0]
            //   8b4508               | mov                 dword ptr [ebp - 0x1c], eax
            //   66898872010000       | cmp                 byte ptr [eax], 0
            //   8b4508               | lea                 eax, [eax + 0x1001e1d0]
            //   83a04c03000000       | mov                 dword ptr [ebp - 0x1c], eax

        $sequence_5 = { 3bf7 7cc8 eb04 3bf7 7c99 8d8de4fdffff }
            // n = 6, score = 200
            //   3bf7                 | sub                 esp, 0x448
            //   7cc8                 | xor                 eax, ebp
            //   eb04                 | mov                 dword ptr [ebp - 8], eax
            //   3bf7                 | push                ebx
            //   7c99                 | mov                 edx, eax
            //   8d8de4fdffff         | add                 esp, 8

        $sequence_6 = { 8bd0 83c408 83faff 7474 33c0 85d2 }
            // n = 6, score = 200
            //   8bd0                 | mov                 ebp, esp
            //   83c408               | sub                 esp, 0x448
            //   83faff               | xor                 eax, ebp
            //   7474                 | mov                 dword ptr [ebp - 8], eax
            //   33c0                 | push                ebx
            //   85d2                 | mov                 edi, eax

        $sequence_7 = { e9???????? 6915????????04010000 8d8dbc3affff 68???????? 81c2???????? e8???????? }
            // n = 6, score = 200
            //   e9????????           |                     
            //   6915????????04010000     |     
            //   8d8dbc3affff         | je                  0x909
            //   68????????           |                     
            //   81c2????????         |                     
            //   e8????????           |                     

        $sequence_8 = { c700???????? 8b4508 898850030000 8b4508 59 c74048b8e40110 }
            // n = 6, score = 200
            //   c700????????         |                     
            //   8b4508               | mov                 ecx, eax
            //   898850030000         | je                  0x48
            //   8b4508               | add                 esp, 0xc
            //   59                   | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   c74048b8e40110       | mov                 dword ptr [ebp - 0x20], eax

        $sequence_9 = { 83c404 85c0 0f84fe080000 680c400000 }
            // n = 4, score = 200
            //   83c404               | lea                 edx, [ecx + 1]
            //   85c0                 | mov                 al, byte ptr [ecx]
            //   0f84fe080000         | inc                 ecx
            //   680c400000           | test                al, al

        $sequence_10 = { e8???????? 83c404 89861c020000 8b45e0 8d4e0c 6a06 8d90c4e10110 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | mov                 dword ptr [eax + 0x48], 0x1001e4b8
            //   89861c020000         | mov                 eax, dword ptr [ebp + 8]
            //   8b45e0               | mov                 dword ptr [ebp - 0x1c], ecx
            //   8d4e0c               | cmp                 dword ptr [eax + 0x1001e1c0], ebx
            //   6a06                 | je                  0xf6
            //   8d90c4e10110         | inc                 ecx

        $sequence_11 = { 8d856438ffff 2bf1 50 ff15???????? 89854038ffff 8b4308 0f10853838ffff }
            // n = 7, score = 200
            //   8d856438ffff         | cmp                 edx, -1
            //   2bf1                 | je                  0x7e
            //   50                   | xor                 eax, eax
            //   ff15????????         |                     
            //   89854038ffff         | test                edx, edx
            //   8b4308               | add                 esp, 4
            //   0f10853838ffff       | test                eax, eax

        $sequence_12 = { 50 e8???????? 83c40c 6b45e430 8945e0 8d80d0e10110 }
            // n = 6, score = 200
            //   50                   | inc                 ecx
            //   e8????????           |                     
            //   83c40c               | dec                 ebx
            //   6b45e430             | jne                 0x18
            //   8945e0               | mov                 eax, dword ptr [ebp - 4]
            //   8d80d0e10110         | cmp                 dword ptr [eax + 0x48], 0x1001e4b8

        $sequence_13 = { e9???????? 57 33ff 8bcf 8bc7 894de4 3998c0e10110 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   57                   | dec                 ebx
            //   33ff                 | jne                 0x17
            //   8bcf                 | mov                 eax, dword ptr [ebp - 4]
            //   8bc7                 | cmp                 dword ptr [eax + 0x48], 0x1001e4b8
            //   894de4               | je                  0x17
            //   3998c0e10110         | mov                 eax, dword ptr [ebp + 8]

        $sequence_14 = { 4b 7515 8b45fc 817848b8e40110 7409 ff7048 e8???????? }
            // n = 7, score = 200
            //   4b                   | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   7515                 | mov                 dword ptr [ebp - 0x20], eax
            //   8b45fc               | lea                 eax, [eax + 0x1001e1d0]
            //   817848b8e40110       | mov                 dword ptr [ebp - 0x1c], eax
            //   7409                 | cmp                 byte ptr [eax], 0
            //   ff7048               | mov                 ecx, eax
            //   e8????????           |                     

        $sequence_15 = { 83f869 7c27 8b8df8fbffff 0fbe11 83fa70 }
            // n = 5, score = 100
            //   83f869               | mov                 ecx, 7
            //   7c27                 | idiv                ecx
            //   8b8df8fbffff         | jb                  0xffffffde
            //   0fbe11               | mov                 eax, dword ptr [ebp - 4]
            //   83fa70               | cmp                 eax, dword ptr [ebp - 8]

        $sequence_16 = { 3bf3 0f8244ffffff 33c0 85db 0f841b010000 }
            // n = 5, score = 100
            //   3bf3                 | dec                 eax
            //   0f8244ffffff         | lea                 ecx, [0x8572]
            //   33c0                 | inc                 esp
            //   85db                 | movzx               eax, word ptr [edx + eax*4 + 2]
            //   0f841b010000         | movzx               edx, word ptr [edx + eax*4]

        $sequence_17 = { 8b442418 8d0c00 51 6a40 ff15???????? }
            // n = 5, score = 100
            //   8b442418             | cdq                 
            //   8d0c00               | mov                 ecx, 7
            //   51                   | idiv                ecx
            //   6a40                 | add                 esp, 0xc
            //   ff15????????         |                     

        $sequence_18 = { 4883c420 415c c3 4053 56 4154 4883ec20 }
            // n = 7, score = 100
            //   4883c420             | mov                 eax, 1
            //   415c                 | dec                 eax
            //   c3                   | add                 esp, 0x38
            //   4053                 | ret                 
            //   56                   | dec                 eax
            //   4154                 | add                 esp, 0x20
            //   4883ec20             | inc                 ecx

        $sequence_19 = { 85c0 741b 488d510c 448bc0 833a00 418bc7 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   488d510c             | dec                 eax
            //   448bc0               | lea                 edx, [ecx + 0xc]
            //   833a00               | inc                 esp
            //   418bc7               | mov                 eax, eax

        $sequence_20 = { 8bc6 83e03f 6bc830 8b0495c87f0110 f644082801 }
            // n = 5, score = 100
            //   8bc6                 | mov                 eax, dword ptr [ebp + 8]
            //   83e03f               | push                edi
            //   6bc830               | lea                 edi, [eax*4 + 0x10017eb8]
            //   8b0495c87f0110       | push                ebx
            //   f644082801           | call                dword ptr [ebp - 0x434]

        $sequence_21 = { 8b10 8b8dc0fbffff 8b02 ffd0 8985a4fbffff }
            // n = 5, score = 100
            //   8b10                 | ja                  0xffffffdc
            //   8b8dc0fbffff         | mov                 eax, dword ptr [ebp - 4]
            //   8b02                 | add                 eax, dword ptr [ebp - 0x10]
            //   ffd0                 | xor                 ecx, ecx
            //   8985a4fbffff         | mov                 dword ptr [ebp - 0x1b], ecx

        $sequence_22 = { 72dc 8b45fc 3b45f8 77d4 8b45fc 0345f0 }
            // n = 6, score = 100
            //   72dc                 | mov                 eax, dword ptr [ebp - 0xc]
            //   8b45fc               | cmp                 eax, dword ptr [ebp - 0x10]
            //   3b45f8               | jb                  0x5d
            //   77d4                 | push                ebx
            //   8b45fc               | add                 esp, 0xc
            //   0345f0               | cdq                 

        $sequence_23 = { 52 8b8568f8ffff 50 ff15???????? 8d8d78f8ffff 51 }
            // n = 6, score = 100
            //   52                   | mov                 dword ptr [ebp - 0x17], ecx
            //   8b8568f8ffff         | mov                 dword ptr [ebp - 0x13], ecx
            //   50                   | mov                 word ptr [ebp - 0xf], cx
            //   ff15????????         |                     
            //   8d8d78f8ffff         | mov                 eax, dword ptr [eax*4 + 0x7188c8]
            //   51                   | mov                 byte ptr [eax + ecx + 0x29], 0

        $sequence_24 = { 33c0 8dbe70af0400 89ae6caf0600 f3ab 668b04dd62734100 33c9 }
            // n = 6, score = 100
            //   33c0                 | cdq                 
            //   8dbe70af0400         | mov                 ecx, 7
            //   89ae6caf0600         | idiv                ecx
            //   f3ab                 | add                 esp, 0xc
            //   668b04dd62734100     | cdq                 
            //   33c9                 | mov                 ecx, 7

        $sequence_25 = { ff15???????? 8b7c2478 8bf0 eb1b 8b7c2478 57 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8b7c2478             | and                 dword ptr [ebp - 0x38], 0
            //   8bf0                 | mov                 dword ptr [ebp - 0x34], 0x10009a7d
            //   eb1b                 | lea                 ecx, [ebp - 0x38]
            //   8b7c2478             | xor                 eax, ecx
            //   57                   | add                 esp, 0xc

        $sequence_26 = { 50 e8???????? 83c418 8985acfbffff e9???????? 8b0d???????? }
            // n = 6, score = 100
            //   50                   | je                  0x15
            //   e8????????           |                     
            //   83c418               | push                dword ptr [ebx]
            //   8985acfbffff         | mov                 esi, eax
            //   e9????????           |                     
            //   8b0d????????         |                     

        $sequence_27 = { 8b0485c8887100 c644082900 740e ff33 e8???????? 8bf0 }
            // n = 6, score = 100
            //   8b0485c8887100       | add                 esp, 0xc
            //   c644082900           | cdq                 
            //   740e                 | mov                 ecx, 7
            //   ff33                 | add                 esp, 0xc
            //   e8????????           |                     
            //   8bf0                 | cdq                 

        $sequence_28 = { 68e9fd0000 ff95f4f3ffff 33c0 8d8df8f7ffff 83bf1004000000 }
            // n = 5, score = 100
            //   68e9fd0000           | mov                 dword ptr [ebp - 8], eax
            //   ff95f4f3ffff         | push                ebx
            //   33c0                 | mov                 edi, eax
            //   8d8df8f7ffff         | lea                 edx, [ecx + 1]
            //   83bf1004000000       | mov                 al, byte ptr [ecx]

        $sequence_29 = { 89442420 ff15???????? b801000000 4883c438 c3 ff25???????? }
            // n = 6, score = 100
            //   89442420             | cmp                 dword ptr [edx], 0
            //   ff15????????         |                     
            //   b801000000           | inc                 ecx
            //   4883c438             | mov                 eax, edi
            //   c3                   | mov                 dword ptr [esp + 0x20], eax
            //   ff25????????         |                     

        $sequence_30 = { 440fb7448202 0fb71482 e8???????? 488d058653ffff }
            // n = 4, score = 100
            //   440fb7448202         | dec                 eax
            //   0fb71482             | sub                 esp, 0x20
            //   e8????????           |                     
            //   488d058653ffff       | cmp                 ebx, edi

        $sequence_31 = { 8bec 8b4508 57 8d3c85b87e0110 }
            // n = 4, score = 100
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | sub                 esp, 0x448
            //   57                   | xor                 eax, ebp
            //   8d3c85b87e0110       | mov                 dword ptr [ebp - 8], eax

        $sequence_32 = { c744242001000000 e8???????? 85c0 7449 488d0d72850000 }
            // n = 5, score = 100
            //   c744242001000000     | push                ebx
            //   e8????????           |                     
            //   85c0                 | push                esi
            //   7449                 | inc                 ecx
            //   488d0d72850000       | push                esp

        $sequence_33 = { e8???????? 83c40c eb12 8d542404 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   83c40c               | jmp                 0x1f
            //   eb12                 | mov                 edi, dword ptr [esp + 0x78]
            //   8d542404             | push                edi

        $sequence_34 = { 53 ff95ccfbffff 6800040000 8d85e4fbffff 6a00 }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   ff95ccfbffff         | push                ebp
            //   6800040000           | mov                 ebp, esp
            //   8d85e4fbffff         | sub                 esp, 0x448
            //   6a00                 | xor                 eax, ebp

        $sequence_35 = { 3bdf 7325 660f1f440000 ff15???????? }
            // n = 4, score = 100
            //   3bdf                 | pop                 esp
            //   7325                 | ret                 
            //   660f1f440000         | inc                 eax
            //   ff15????????         |                     

        $sequence_36 = { 85c0 7508 8d7001 e9???????? 8d8424b8100000 }
            // n = 5, score = 100
            //   85c0                 | push                0x400
            //   7508                 | lea                 eax, [ebp - 0x41c]
            //   8d7001               | push                0
            //   e9????????           |                     
            //   8d8424b8100000       | push                0xfde9

        $sequence_37 = { ff15???????? 8b0d???????? 6a01 8d542414 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   6a01                 | add                 esp, 0xc
            //   8d542414             | cdq                 

        $sequence_38 = { 7531 e8???????? 8904bd80f10110 85c0 7514 6a0c }
            // n = 6, score = 100
            //   7531                 | je                  0x1d
            //   e8????????           |                     
            //   8904bd80f10110       | mov                 al, byte ptr [esi]
            //   85c0                 | mov                 ecx, eax
            //   7514                 | sar                 ecx, 1
            //   6a0c                 | push                0x41

        $sequence_39 = { 52 56 68???????? 68???????? 68???????? 53 }
            // n = 6, score = 100
            //   52                   | mov                 ecx, 7
            //   56                   | mov                 edi, dword ptr [esp + 0x78]
            //   68????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   53                   | mov                 esi, eax

        $sequence_40 = { 51 53 ff15???????? 85c0 7548 b903000000 8bfd }
            // n = 7, score = 100
            //   51                   | mov                 eax, dword ptr [esp + 0x18]
            //   53                   | lea                 ecx, [eax + eax]
            //   ff15????????         |                     
            //   85c0                 | push                ecx
            //   7548                 | push                0x40
            //   b903000000           | xor                 eax, eax
            //   8bfd                 | lea                 edi, [esi + 0x4af70]

        $sequence_41 = { 8b049580f10110 804c182d04 ff4604 eb08 ff15???????? }
            // n = 5, score = 100
            //   8b049580f10110       | and                 dword ptr [ebp - 4], 0
            //   804c182d04           | mov                 eax, dword ptr [ebx*4 + 0x1001f180]
            //   ff4604               | mov                 ecx, dword ptr [ebp - 0x20]
            //   eb08                 | test                byte ptr [eax + ecx + 0x28], 1
            //   ff15????????         |                     

        $sequence_42 = { 33c9 894de5 894de9 894ded 66894df1 }
            // n = 5, score = 100
            //   33c9                 | mov                 ecx, 7
            //   894de5               | add                 esp, 0xc
            //   894de9               | cdq                 
            //   894ded               | mov                 ecx, 7
            //   66894df1             | idiv                ecx

        $sequence_43 = { 48895c2408 57 4883ec20 488d1d33220000 488d3d2c220000 }
            // n = 5, score = 100
            //   48895c2408           | jae                 0x27
            //   57                   | nop                 word ptr [eax + eax]
            //   4883ec20             | mov                 dword ptr [esp + 0x20], 1
            //   488d1d33220000       | test                eax, eax
            //   488d3d2c220000       | je                  0x4d

        $sequence_44 = { 50 ff95c4f3ffff 85c0 7416 b801000000 }
            // n = 5, score = 100
            //   50                   | inc                 ecx
            //   ff95c4f3ffff         | test                al, al
            //   85c0                 | jne                 3
            //   7416                 | push                edi
            //   b801000000           | mov                 ebp, esp

    condition:
        7 of them and filesize < 860160
}