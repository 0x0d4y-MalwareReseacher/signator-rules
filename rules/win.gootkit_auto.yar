rule win_gootkit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.gootkit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gootkit"
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
        $sequence_0 = { 833b00 7406 837b0400 7502 32c0 }
            // n = 5, score = 1700
            //   833b00               | cmp                 dword ptr [ebx], 0
            //   7406                 | je                  8
            //   837b0400             | cmp                 dword ptr [ebx + 4], 0
            //   7502                 | jne                 4
            //   32c0                 | xor                 al, al

        $sequence_1 = { ffd6 ff75ec 6a00 ff15???????? 50 ffd6 }
            // n = 6, score = 1700
            //   ffd6                 | call                esi
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_2 = { 33ff 33c9 85d2 740e 0fbe0431 c1cf0d 03f8 }
            // n = 7, score = 1700
            //   33ff                 | xor                 edi, edi
            //   33c9                 | xor                 ecx, ecx
            //   85d2                 | test                edx, edx
            //   740e                 | je                  0x10
            //   0fbe0431             | movsx               eax, byte ptr [ecx + esi]
            //   c1cf0d               | ror                 edi, 0xd
            //   03f8                 | add                 edi, eax

        $sequence_3 = { ff15???????? 8bd8 85db 7431 3bfb 752d 56 }
            // n = 7, score = 1700
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   7431                 | je                  0x33
            //   3bfb                 | cmp                 edi, ebx
            //   752d                 | jne                 0x2f
            //   56                   | push                esi

        $sequence_4 = { 8d45c4 8975f8 50 ff75fc ffd7 33c9 }
            // n = 6, score = 1700
            //   8d45c4               | lea                 eax, [ebp - 0x3c]
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd7                 | call                edi
            //   33c9                 | xor                 ecx, ecx

        $sequence_5 = { 894df8 897df4 c745fc04010000 ff15???????? 50 ff15???????? }
            // n = 6, score = 1700
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi
            //   c745fc04010000       | mov                 dword ptr [ebp - 4], 0x104
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_6 = { 6a04 6800300000 57 6a00 897df8 ff15???????? 8bf0 }
            // n = 7, score = 1700
            //   6a04                 | push                4
            //   6800300000           | push                0x3000
            //   57                   | push                edi
            //   6a00                 | push                0
            //   897df8               | mov                 dword ptr [ebp - 8], edi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_7 = { eb06 8b7dd8 8b75d4 8bd7 8bc6 }
            // n = 5, score = 1700
            //   eb06                 | jmp                 8
            //   8b7dd8               | mov                 edi, dword ptr [ebp - 0x28]
            //   8b75d4               | mov                 esi, dword ptr [ebp - 0x2c]
            //   8bd7                 | mov                 edx, edi
            //   8bc6                 | mov                 eax, esi

        $sequence_8 = { f3aa 68???????? ff15???????? 50 }
            // n = 4, score = 1200
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_9 = { 8b7df4 32c0 8b4de4 f3aa }
            // n = 4, score = 1200
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   32c0                 | xor                 al, al
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_10 = { 50 e8???????? 83c40c 68fd000000 }
            // n = 4, score = 1100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68fd000000           | push                0xfd

        $sequence_11 = { 50 68???????? ff15???????? 85c0 7505 e8???????? }
            // n = 6, score = 1100
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   e8????????           |                     

        $sequence_12 = { 8b4508 8b00 99 52 }
            // n = 4, score = 1000
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   99                   | cdq                 
            //   52                   | push                edx

        $sequence_13 = { c705????????01000000 c705????????02000000 8be5 5d c3 55 8bec }
            // n = 7, score = 900
            //   c705????????01000000     |     
            //   c705????????02000000     |     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_14 = { 833d????????00 750a 6a32 ff15???????? }
            // n = 4, score = 800
            //   833d????????00       |                     
            //   750a                 | jne                 0xc
            //   6a32                 | push                0x32
            //   ff15????????         |                     

        $sequence_15 = { e8???????? 6a0c 6a08 ff15???????? 50 ff15???????? }
            // n = 6, score = 800
            //   e8????????           |                     
            //   6a0c                 | push                0xc
            //   6a08                 | push                8
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_16 = { 50 6a02 ff15???????? 6888130000 ff15???????? }
            // n = 5, score = 700
            //   50                   | push                eax
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   6888130000           | push                0x1388
            //   ff15????????         |                     

        $sequence_17 = { e8???????? 8d45fc 50 6a01 6a01 6a00 }
            // n = 6, score = 600
            //   e8????????           |                     
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_18 = { 83c00c 99 52 50 }
            // n = 4, score = 600
            //   83c00c               | add                 eax, 0xc
            //   99                   | cdq                 
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_19 = { e8???????? 85c0 750c c705????????03000000 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe
            //   c705????????03000000     |     

        $sequence_20 = { e8???????? 85c0 740d 6810270000 ff15???????? }
            // n = 5, score = 400
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   740d                 | je                  0xf
            //   6810270000           | push                0x2710
            //   ff15????????         |                     

        $sequence_21 = { 724b 8d4204 3bc8 7344 2bca }
            // n = 5, score = 300
            //   724b                 | jb                  0x4d
            //   8d4204               | lea                 eax, [edx + 4]
            //   3bc8                 | cmp                 ecx, eax
            //   7344                 | jae                 0x46
            //   2bca                 | sub                 ecx, edx

        $sequence_22 = { 03d1 813a50450000 7541 8b82d8000000 03c1 3bd8 7235 }
            // n = 7, score = 300
            //   03d1                 | add                 edx, ecx
            //   813a50450000         | cmp                 dword ptr [edx], 0x4550
            //   7541                 | jne                 0x43
            //   8b82d8000000         | mov                 eax, dword ptr [edx + 0xd8]
            //   03c1                 | add                 eax, ecx
            //   3bd8                 | cmp                 ebx, eax
            //   7235                 | jb                  0x37

        $sequence_23 = { 0f104850 0f114f50 0f104060 0f114760 8b4070 894770 be01000000 }
            // n = 7, score = 300
            //   0f104850             | movups              xmm1, xmmword ptr [eax + 0x50]
            //   0f114f50             | movups              xmmword ptr [edi + 0x50], xmm1
            //   0f104060             | movups              xmm0, xmmword ptr [eax + 0x60]
            //   0f114760             | movups              xmmword ptr [edi + 0x60], xmm0
            //   8b4070               | mov                 eax, dword ptr [eax + 0x70]
            //   894770               | mov                 dword ptr [edi + 0x70], eax
            //   be01000000           | mov                 esi, 1

        $sequence_24 = { 6a01 6a0b 56 ff15???????? 83c420 5e }
            // n = 6, score = 300
            //   6a01                 | push                1
            //   6a0b                 | push                0xb
            //   56                   | push                esi
            //   ff15????????         |                     
            //   83c420               | add                 esp, 0x20
            //   5e                   | pop                 esi

        $sequence_25 = { 0f114710 0f104030 0f114f20 0f104840 0f114730 }
            // n = 5, score = 300
            //   0f114710             | movups              xmmword ptr [edi + 0x10], xmm0
            //   0f104030             | movups              xmm0, xmmword ptr [eax + 0x30]
            //   0f114f20             | movups              xmmword ptr [edi + 0x20], xmm1
            //   0f104840             | movups              xmm1, xmmword ptr [eax + 0x40]
            //   0f114730             | movups              xmmword ptr [edi + 0x30], xmm0

        $sequence_26 = { 0f104840 0f114730 0f104050 0f114f40 }
            // n = 4, score = 300
            //   0f104840             | movups              xmm1, xmmword ptr [eax + 0x40]
            //   0f114730             | movups              xmmword ptr [edi + 0x30], xmm0
            //   0f104050             | movups              xmm0, xmmword ptr [eax + 0x50]
            //   0f114f40             | movups              xmmword ptr [edi + 0x40], xmm1

        $sequence_27 = { 7550 ff15???????? 8bf8 893d???????? }
            // n = 4, score = 300
            //   7550                 | jne                 0x52
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   893d????????         |                     

        $sequence_28 = { 50 6a10 8d45e8 50 68060000c8 56 ff15???????? }
            // n = 7, score = 300
            //   50                   | push                eax
            //   6a10                 | push                0x10
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   68060000c8           | push                0xc8000006
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_29 = { ff15???????? 85c0 7510 8d4864 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12
            //   8d4864               | lea                 ecx, [eax + 0x64]

        $sequence_30 = { 7412 83ec0c ba???????? b9???????? e8???????? e8???????? }
            // n = 6, score = 300
            //   7412                 | je                  0x14
            //   83ec0c               | sub                 esp, 0xc
            //   ba????????           |                     
            //   b9????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_31 = { 55 8bec 83ec1c 56 8bf1 85f6 }
            // n = 6, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec1c               | sub                 esp, 0x1c
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   85f6                 | test                esi, esi

        $sequence_32 = { 56 ff15???????? 8b4de8 b84d5a0000 663901 754e 8b513c }
            // n = 7, score = 300
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   b84d5a0000           | mov                 eax, 0x5a4d
            //   663901               | cmp                 word ptr [ecx], ax
            //   754e                 | jne                 0x50
            //   8b513c               | mov                 edx, dword ptr [ecx + 0x3c]

        $sequence_33 = { 8bf7 57 81e60000ffff e8???????? 8b4608 83c40c 894738 }
            // n = 7, score = 300
            //   8bf7                 | mov                 esi, edi
            //   57                   | push                edi
            //   81e60000ffff         | and                 esi, 0xffff0000
            //   e8????????           |                     
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   83c40c               | add                 esp, 0xc
            //   894738               | mov                 dword ptr [edi + 0x38], eax

        $sequence_34 = { 8b4c2434 ff15???????? 0fb74c2432 ff15???????? }
            // n = 4, score = 300
            //   8b4c2434             | mov                 ecx, dword ptr [esp + 0x34]
            //   ff15????????         |                     
            //   0fb74c2432           | movzx               ecx, word ptr [esp + 0x32]
            //   ff15????????         |                     

        $sequence_35 = { 0f104860 0f114750 0f114f60 b801000000 }
            // n = 4, score = 300
            //   0f104860             | movups              xmm1, xmmword ptr [eax + 0x60]
            //   0f114750             | movups              xmmword ptr [edi + 0x50], xmm0
            //   0f114f60             | movups              xmmword ptr [edi + 0x60], xmm1
            //   b801000000           | mov                 eax, 1

        $sequence_36 = { ffc3 83fb0a 7cd5 33c0 }
            // n = 4, score = 300
            //   ffc3                 | inc                 ebx
            //   83fb0a               | cmp                 ebx, 0xa
            //   7cd5                 | jl                  0xffffffd7
            //   33c0                 | xor                 eax, eax

    condition:
        7 of them and filesize < 516096
}