rule win_darkpulsar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.darkpulsar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkpulsar"
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
        $sequence_0 = { c21000 ff25???????? ff25???????? ff25???????? 33c0 }
            // n = 5, score = 600
            //   c21000               | ret                 0x10
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { ff25???????? 33c0 40 c20c00 68???????? 64ff3500000000 8b442410 }
            // n = 7, score = 600
            //   ff25????????         |                     
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   c20c00               | ret                 0xc
            //   68????????           |                     
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]

        $sequence_2 = { 3a01 1bc0 83e0fe 40 }
            // n = 4, score = 400
            //   3a01                 | cmp                 al, byte ptr [ecx]
            //   1bc0                 | sbb                 eax, eax
            //   83e0fe               | and                 eax, 0xfffffffe
            //   40                   | inc                 eax

        $sequence_3 = { 56 8b35???????? 57 8b7d08 eb09 803f00 742e }
            // n = 7, score = 300
            //   56                   | push                esi
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   eb09                 | jmp                 0xb
            //   803f00               | cmp                 byte ptr [edi], 0
            //   742e                 | je                  0x30

        $sequence_4 = { 0fbe07 50 ffd6 8bd8 8b450c 0fbe00 }
            // n = 6, score = 300
            //   0fbe07               | movsx               eax, byte ptr [edi]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8bd8                 | mov                 ebx, eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   0fbe00               | movsx               eax, byte ptr [eax]

        $sequence_5 = { 74e0 0fb607 8b4d0c 3a01 }
            // n = 4, score = 300
            //   74e0                 | je                  0xffffffe2
            //   0fb607               | movzx               eax, byte ptr [edi]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   3a01                 | cmp                 al, byte ptr [ecx]

        $sequence_6 = { 742e 47 ff450c 0fbe07 }
            // n = 4, score = 300
            //   742e                 | je                  0x30
            //   47                   | inc                 edi
            //   ff450c               | inc                 dword ptr [ebp + 0xc]
            //   0fbe07               | movsx               eax, byte ptr [edi]

        $sequence_7 = { 8b450c 0fbe00 50 ffd6 }
            // n = 4, score = 300
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_8 = { eb03 83c8ff 5f 5e c3 56 }
            // n = 6, score = 200
            //   eb03                 | jmp                 5
            //   83c8ff               | or                  eax, 0xffffffff
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   56                   | push                esi

        $sequence_9 = { f7d8 59 1bc0 59 40 c3 e9???????? }
            // n = 7, score = 200
            //   f7d8                 | neg                 eax
            //   59                   | pop                 ecx
            //   1bc0                 | sbb                 eax, eax
            //   59                   | pop                 ecx
            //   40                   | inc                 eax
            //   c3                   | ret                 
            //   e9????????           |                     

        $sequence_10 = { 6a01 ff15???????? 8bf0 59 59 3bf7 }
            // n = 6, score = 200
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   3bf7                 | cmp                 esi, edi

        $sequence_11 = { 8bc1 c3 8b442404 85c0 7501 c3 }
            // n = 6, score = 200
            //   8bc1                 | mov                 eax, ecx
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85c0                 | test                eax, eax
            //   7501                 | jne                 3
            //   c3                   | ret                 

        $sequence_12 = { c9 c3 56 8b742408 85f6 7412 }
            // n = 6, score = 200
            //   c9                   | leave               
            //   c3                   | ret                 
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   85f6                 | test                esi, esi
            //   7412                 | je                  0x14

        $sequence_13 = { 8bf0 46 56 ff15???????? 59 59 }
            // n = 6, score = 200
            //   8bf0                 | mov                 esi, eax
            //   46                   | inc                 esi
            //   56                   | push                esi
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_14 = { ff7608 ff36 e8???????? 8bf8 }
            // n = 4, score = 200
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff36                 | push                dword ptr [esi]
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_15 = { e8???????? ff7514 89460c e8???????? }
            // n = 4, score = 200
            //   e8????????           |                     
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   e8????????           |                     

        $sequence_16 = { 8d4601 6a01 50 ff15???????? 8bf8 }
            // n = 5, score = 200
            //   8d4601               | lea                 eax, [esi + 1]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_17 = { 56 e8???????? ff742414 50 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   50                   | push                eax

        $sequence_18 = { 53 33d2 56 57 33c0 }
            // n = 5, score = 200
            //   53                   | push                ebx
            //   33d2                 | xor                 edx, edx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax

        $sequence_19 = { 33c0 33d2 c3 8bff 55 8bec b863736de0 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   33d2                 | xor                 edx, edx
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b863736de0           | mov                 eax, 0xe06d7363

        $sequence_20 = { 8d45cc 50 57 e8???????? 83c410 85c0 }
            // n = 6, score = 200
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   50                   | push                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax

        $sequence_21 = { 8b5d10 56 8b7508 33d2 }
            // n = 4, score = 200
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33d2                 | xor                 edx, edx

        $sequence_22 = { 8bd8 53 e8???????? 83c410 85c0 750c }
            // n = 6, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe

        $sequence_23 = { 33c9 83c410 83f8ff 0f95c1 49 }
            // n = 5, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   83c410               | add                 esp, 0x10
            //   83f8ff               | cmp                 eax, -1
            //   0f95c1               | setne               cl
            //   49                   | dec                 ecx

        $sequence_24 = { ffd6 59 59 8945f8 85c0 }
            // n = 5, score = 200
            //   ffd6                 | call                esi
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   85c0                 | test                eax, eax

        $sequence_25 = { e8???????? 59 5e 83f8ff }
            // n = 4, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   5e                   | pop                 esi
            //   83f8ff               | cmp                 eax, -1

        $sequence_26 = { ff75fc ff75f4 e8???????? 59 59 83f8ff }
            // n = 6, score = 200
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   83f8ff               | cmp                 eax, -1

        $sequence_27 = { ffd7 59 5f 5e c3 8b4c2404 85c9 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   85c9                 | test                ecx, ecx

        $sequence_28 = { 00db 7313 752f 3b742404 0f830b010000 }
            // n = 5, score = 100
            //   00db                 | add                 bl, bl
            //   7313                 | jae                 0x15
            //   752f                 | jne                 0x31
            //   3b742404             | cmp                 esi, dword ptr [esp + 4]
            //   0f830b010000         | jae                 0x111

        $sequence_29 = { 8d45e0 50 8d45ec 50 ff7508 c745e010000000 ff15???????? }
            // n = 7, score = 100
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   c745e010000000       | mov                 dword ptr [ebp - 0x20], 0x10
            //   ff15????????         |                     

        $sequence_30 = { 00db 73e1 7511 3b742404 }
            // n = 4, score = 100
            //   00db                 | add                 bl, bl
            //   73e1                 | jae                 0xffffffe3
            //   7511                 | jne                 0x13
            //   3b742404             | cmp                 esi, dword ptr [esp + 4]

        $sequence_31 = { 741c 837d0c07 7416 ff7518 57 56 }
            // n = 6, score = 100
            //   741c                 | je                  0x1e
            //   837d0c07             | cmp                 dword ptr [ebp + 0xc], 7
            //   7416                 | je                  0x18
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_32 = { 8945fc 6a00 6874010000 8d8588feffff 50 ff7508 ff15???????? }
            // n = 7, score = 100
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   6a00                 | push                0
            //   6874010000           | push                0x174
            //   8d8588feffff         | lea                 eax, [ebp - 0x178]
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     

        $sequence_33 = { 68???????? 68???????? ebd7 55 }
            // n = 4, score = 100
            //   68????????           |                     
            //   68????????           |                     
            //   ebd7                 | jmp                 0xffffffd9
            //   55                   | push                ebp

        $sequence_34 = { 00db 7313 75e1 3b742404 0f8318010000 }
            // n = 5, score = 100
            //   00db                 | add                 bl, bl
            //   7313                 | jae                 0x15
            //   75e1                 | jne                 0xffffffe3
            //   3b742404             | cmp                 esi, dword ptr [esp + 4]
            //   0f8318010000         | jae                 0x11e

        $sequence_35 = { 33ed 33f6 33ff 8b442414 }
            // n = 4, score = 100
            //   33ed                 | xor                 ebp, ebp
            //   33f6                 | xor                 esi, esi
            //   33ff                 | xor                 edi, edi
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]

        $sequence_36 = { 8b550c 8bc1 8b4d08 c780a010000001000000 c700???????? 8988a8100000 }
            // n = 6, score = 100
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8bc1                 | mov                 eax, ecx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c780a010000001000000     | mov    dword ptr [eax + 0x10a0], 1
            //   c700????????         |                     
            //   8988a8100000         | mov                 dword ptr [eax + 0x10a8], ecx

        $sequence_37 = { 8bec d94508 d95d08 8b4508 5d }
            // n = 5, score = 100
            //   8bec                 | mov                 ebp, esp
            //   d94508               | fld                 dword ptr [ebp + 8]
            //   d95d08               | fstp                dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   5d                   | pop                 ebp

        $sequence_38 = { 83f83c 0f8252010000 8b868c000000 8b503c }
            // n = 4, score = 100
            //   83f83c               | cmp                 eax, 0x3c
            //   0f8252010000         | jb                  0x158
            //   8b868c000000         | mov                 eax, dword ptr [esi + 0x8c]
            //   8b503c               | mov                 edx, dword ptr [eax + 0x3c]

        $sequence_39 = { 83c8ff eb76 56 6a02 58 }
            // n = 5, score = 100
            //   83c8ff               | or                  eax, 0xffffffff
            //   eb76                 | jmp                 0x78
            //   56                   | push                esi
            //   6a02                 | push                2
            //   58                   | pop                 eax

        $sequence_40 = { e8???????? 83c404 8b852cf4ffff 5f 5e 5b }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b852cf4ffff         | mov                 eax, dword ptr [ebp - 0xbd4]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_41 = { e8???????? e9???????? 8b4664 8b4e34 50 51 83c658 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b4664               | mov                 eax, dword ptr [esi + 0x64]
            //   8b4e34               | mov                 ecx, dword ptr [esi + 0x34]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   83c658               | add                 esi, 0x58

        $sequence_42 = { 83ffff 744a 8d45dc 50 57 }
            // n = 5, score = 100
            //   83ffff               | cmp                 edi, -1
            //   744a                 | je                  0x4c
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_43 = { 8b7d08 33db 6803010000 898d64eeffff 898548eeffff 33c0 8d8df9feffff }
            // n = 7, score = 100
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   33db                 | xor                 ebx, ebx
            //   6803010000           | push                0x103
            //   898d64eeffff         | mov                 dword ptr [ebp - 0x119c], ecx
            //   898548eeffff         | mov                 dword ptr [ebp - 0x11b8], eax
            //   33c0                 | xor                 eax, eax
            //   8d8df9feffff         | lea                 ecx, [ebp - 0x107]

        $sequence_44 = { 8a45fb 884dfa 8a4dfc 8845fc 8b55fc 884dfb 8b45f8 }
            // n = 7, score = 100
            //   8a45fb               | mov                 al, byte ptr [ebp - 5]
            //   884dfa               | mov                 byte ptr [ebp - 6], cl
            //   8a4dfc               | mov                 cl, byte ptr [ebp - 4]
            //   8845fc               | mov                 byte ptr [ebp - 4], al
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   884dfb               | mov                 byte ptr [ebp - 5], cl
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_45 = { 56 ff15???????? 56 ff15???????? 83c410 5e c3 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   5e                   | pop                 esi
            //   c3                   | ret                 

        $sequence_46 = { ff7510 53 ffd6 53 ffd7 83c410 837d0800 }
            // n = 7, score = 100
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   83c410               | add                 esp, 0x10
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0

        $sequence_47 = { 33c0 c3 668b442404 66c1c008 c3 e9???????? 8b4c2404 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   668b442404           | mov                 ax, word ptr [esp + 4]
            //   66c1c008             | rol                 ax, 8
            //   c3                   | ret                 
            //   e9????????           |                     
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]

        $sequence_48 = { 8945e8 e8???????? 8bf0 83c404 85f6 }
            // n = 5, score = 100
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c404               | add                 esp, 4
            //   85f6                 | test                esi, esi

        $sequence_49 = { e9???????? 8b4c2408 8b442404 8bd1 c1ea08 885001 }
            // n = 6, score = 100
            //   e9????????           |                     
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   8bd1                 | mov                 edx, ecx
            //   c1ea08               | shr                 edx, 8
            //   885001               | mov                 byte ptr [eax + 1], dl

        $sequence_50 = { 00db 7309 75f4 8a1e 46 10db }
            // n = 6, score = 100
            //   00db                 | add                 bl, bl
            //   7309                 | jae                 0xb
            //   75f4                 | jne                 0xfffffff6
            //   8a1e                 | mov                 bl, byte ptr [esi]
            //   46                   | inc                 esi
            //   10db                 | adc                 bl, bl

    condition:
        7 of them and filesize < 491520
}