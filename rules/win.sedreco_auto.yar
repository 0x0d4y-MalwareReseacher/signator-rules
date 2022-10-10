rule win_sedreco_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.sedreco."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sedreco"
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
        $sequence_0 = { 8b750c 56 e8???????? 6a08 }
            // n = 4, score = 2600
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     
            //   6a08                 | push                8

        $sequence_1 = { e8???????? 89450c 56 85c0 }
            // n = 4, score = 2600
            //   e8????????           |                     
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   56                   | push                esi
            //   85c0                 | test                eax, eax

        $sequence_2 = { c645ff30 e8???????? 85c0 7505 }
            // n = 4, score = 2600
            //   c645ff30             | mov                 byte ptr [ebp - 1], 0x30
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7

        $sequence_3 = { 55 8bec 51 836d0804 53 56 8b750c }
            // n = 7, score = 2600
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   836d0804             | sub                 dword ptr [ebp + 8], 4
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]

        $sequence_4 = { 50 68???????? 6a0d 68???????? }
            // n = 4, score = 2500
            //   50                   | push                eax
            //   68????????           |                     
            //   6a0d                 | push                0xd
            //   68????????           |                     

        $sequence_5 = { 7ce0 a1???????? 5e 85c0 }
            // n = 4, score = 2400
            //   7ce0                 | jl                  0xffffffe2
            //   a1????????           |                     
            //   5e                   | pop                 esi
            //   85c0                 | test                eax, eax

        $sequence_6 = { 7411 6a04 68???????? 68???????? e8???????? }
            // n = 5, score = 2400
            //   7411                 | je                  0x13
            //   6a04                 | push                4
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_7 = { 51 6802020000 68???????? 50 }
            // n = 4, score = 2400
            //   51                   | push                ecx
            //   6802020000           | push                0x202
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_8 = { ffd6 8b0d???????? 894124 85c0 }
            // n = 4, score = 2200
            //   ffd6                 | call                esi
            //   8b0d????????         |                     
            //   894124               | mov                 dword ptr [ecx + 0x24], eax
            //   85c0                 | test                eax, eax

        $sequence_9 = { ffd6 8b0d???????? 894148 85c0 }
            // n = 4, score = 2200
            //   ffd6                 | call                esi
            //   8b0d????????         |                     
            //   894148               | mov                 dword ptr [ecx + 0x48], eax
            //   85c0                 | test                eax, eax

        $sequence_10 = { ffd6 8b0d???????? 898198000000 85c0 }
            // n = 4, score = 2200
            //   ffd6                 | call                esi
            //   8b0d????????         |                     
            //   898198000000         | mov                 dword ptr [ecx + 0x98], eax
            //   85c0                 | test                eax, eax

        $sequence_11 = { 8bf0 33c0 56 50 }
            // n = 4, score = 2200
            //   8bf0                 | mov                 esi, eax
            //   33c0                 | xor                 eax, eax
            //   56                   | push                esi
            //   50                   | push                eax

        $sequence_12 = { be???????? 8b06 85c0 740f 50 }
            // n = 5, score = 2200
            //   be????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11
            //   50                   | push                eax

        $sequence_13 = { 83c604 81fe???????? 7ce0 a1???????? }
            // n = 4, score = 2200
            //   83c604               | add                 esi, 4
            //   81fe????????         |                     
            //   7ce0                 | jl                  0xffffffe2
            //   a1????????           |                     

        $sequence_14 = { 6a01 68???????? ff35???????? ff15???????? ffd0 }
            // n = 5, score = 1100
            //   6a01                 | push                1
            //   68????????           |                     
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   ffd0                 | call                eax

        $sequence_15 = { 6800010000 6a00 68???????? e8???????? 6800020000 6a00 68???????? }
            // n = 7, score = 500
            //   6800010000           | push                eax
            //   6a00                 | jl                  0xffffffe2
            //   68????????           |                     
            //   e8????????           |                     
            //   6800020000           | pop                 esi
            //   6a00                 | test                eax, eax
            //   68????????           |                     

        $sequence_16 = { 488b0d???????? 488b05???????? ff90e8000000 ba10270000 488b0d???????? 488b05???????? ff5010 }
            // n = 7, score = 500
            //   488b0d????????       |                     
            //   488b05????????       |                     
            //   ff90e8000000         | call                dword ptr [eax + 0x28]
            //   ba10270000           | call                dword ptr [eax + 0xe8]
            //   488b0d????????       |                     
            //   488b05????????       |                     
            //   ff5010               | nop                 

        $sequence_17 = { ff9018010000 e8???????? 48833d????????00 7405 e8???????? }
            // n = 5, score = 500
            //   ff9018010000         | xor                 eax, eax
            //   e8????????           |                     
            //   48833d????????00     |                     
            //   7405                 | call                dword ptr [eax + 0xe8]
            //   e8????????           |                     

        $sequence_18 = { 68???????? e8???????? 8b35???????? 83c404 6a00 68???????? 6aff }
            // n = 7, score = 500
            //   68????????           |                     
            //   e8????????           |                     
            //   8b35????????         |                     
            //   83c404               | mov                 dword ptr [ecx + 0x24], eax
            //   6a00                 | test                eax, eax
            //   68????????           |                     
            //   6aff                 | test                esi, esi

        $sequence_19 = { 89442428 488b442450 4889442420 41b903000000 4533c0 488b15???????? }
            // n = 6, score = 500
            //   89442428             | xor                 eax, eax
            //   488b442450           | mov                 edx, 0xc0000000
            //   4889442420           | mov                 dword ptr [esp + 0x28], eax
            //   41b903000000         | dec                 eax
            //   4533c0               | mov                 eax, dword ptr [esp + 0x50]
            //   488b15????????       |                     

        $sequence_20 = { 4883c428 c3 48890d???????? c3 48895c2410 4889742418 }
            // n = 6, score = 500
            //   4883c428             | call                dword ptr [eax + 0x118]
            //   c3                   | je                  7
            //   48890d????????       |                     
            //   c3                   | call                dword ptr [eax + 0xe8]
            //   48895c2410           | mov                 edx, 0x2710
            //   4889742418           | call                dword ptr [eax + 0x10]

        $sequence_21 = { 4533c9 4533c0 ba000000c0 488b0d???????? 488b05???????? }
            // n = 5, score = 500
            //   4533c9               | inc                 ebp
            //   4533c0               | xor                 ecx, ecx
            //   ba000000c0           | inc                 ebp
            //   488b0d????????       |                     
            //   488b05????????       |                     

        $sequence_22 = { ba00000080 488b0d???????? 488b05???????? ff5040 }
            // n = 4, score = 500
            //   ba00000080           | dec                 eax
            //   488b0d????????       |                     
            //   488b05????????       |                     
            //   ff5040               | add                 esp, 0x20

        $sequence_23 = { 488b05???????? ff90e8000000 488b0d???????? 488b05???????? ff5028 48c705????????00000000 }
            // n = 6, score = 500
            //   488b05????????       |                     
            //   ff90e8000000         | dec                 eax
            //   488b0d????????       |                     
            //   488b05????????       |                     
            //   ff5028               | mov                 dword ptr [esp + 0x20], eax
            //   48c705????????00000000     |     

        $sequence_24 = { 488b05???????? ff90e8000000 90 4883c420 }
            // n = 4, score = 500
            //   488b05????????       |                     
            //   ff90e8000000         | inc                 ecx
            //   90                   | mov                 ecx, 3
            //   4883c420             | inc                 ebp

        $sequence_25 = { 6a00 68???????? 6aff 68???????? 6a00 6a00 ffd6 }
            // n = 7, score = 500
            //   6a00                 | pop                 esi
            //   68????????           |                     
            //   6aff                 | push                esi
            //   68????????           |                     
            //   6a00                 | mov                 eax, dword ptr [esi]
            //   6a00                 | test                eax, eax
            //   ffd6                 | je                  0x15

        $sequence_26 = { ffd6 50 68???????? 6aff }
            // n = 4, score = 500
            //   ffd6                 | add                 esi, 4
            //   50                   | jl                  0xffffffe2
            //   68????????           |                     
            //   6aff                 | add                 esi, 4

        $sequence_27 = { 7cd5 68???????? e8???????? 8b4dfc }
            // n = 4, score = 400
            //   7cd5                 | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   8b4dfc               | push                -1

        $sequence_28 = { 8b4dfc 5f 5e 33cd b8???????? }
            // n = 5, score = 400
            //   8b4dfc               | push                0
            //   5f                   | push                -1
            //   5e                   | push                0
            //   33cd                 | push                0
            //   b8????????           |                     

        $sequence_29 = { 53 68???????? ff35???????? ffd6 ffd0 85c0 }
            // n = 6, score = 400
            //   53                   | push                ebx
            //   68????????           |                     
            //   ff35????????         |                     
            //   ffd6                 | call                esi
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax

        $sequence_30 = { 8d55f8 52 50 8b08 ff5124 }
            // n = 5, score = 300
            //   8d55f8               | lea                 edx, [ebp - 8]
            //   52                   | push                edx
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5124               | call                dword ptr [ecx + 0x24]

        $sequence_31 = { c20c00 6a02 ff74240c ff74240c e8???????? c20800 ff74240c }
            // n = 7, score = 300
            //   c20c00               | ret                 0xc
            //   6a02                 | push                2
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   e8????????           |                     
            //   c20800               | ret                 8
            //   ff74240c             | push                dword ptr [esp + 0xc]

        $sequence_32 = { ff15???????? eb12 6a00 56 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   eb12                 | call                esi
            //   6a00                 | mov                 ecx, dword ptr [ebp - 4]
            //   56                   | pop                 edi

        $sequence_33 = { 6a00 68???????? e8???????? 8d4df4 83c40c 8d5101 }
            // n = 6, score = 300
            //   6a00                 | mov                 ecx, dword ptr [ebp - 4]
            //   68????????           |                     
            //   e8????????           |                     
            //   8d4df4               | add                 esp, 4
            //   83c40c               | call                esi
            //   8d5101               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_34 = { 52 50 ff91f0000000 8bf0 }
            // n = 4, score = 300
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff91f0000000         | call                dword ptr [ecx + 0xf0]
            //   8bf0                 | mov                 esi, eax

        $sequence_35 = { 83fefd 742b 8a4a01 3a4801 751a 83fefe }
            // n = 6, score = 300
            //   83fefd               | call                esi
            //   742b                 | mov                 ecx, dword ptr [ebp - 4]
            //   8a4a01               | pop                 edi
            //   3a4801               | pop                 esi
            //   751a                 | push                0
            //   83fefe               | call                esi

        $sequence_36 = { 6a01 68???????? 68???????? 8d45f8 50 }
            // n = 5, score = 300
            //   6a01                 | xor                 ecx, ebp
            //   68????????           |                     
            //   68????????           |                     
            //   8d45f8               | pop                 ebx
            //   50                   | jl                  0xffffffd7

        $sequence_37 = { 8945fc 8b45f0 8945f4 8b45f4 }
            // n = 4, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_38 = { 741f 6a07 68???????? e8???????? 85c0 7402 eb0d }
            // n = 7, score = 200
            //   741f                 | je                  0x21
            //   6a07                 | push                7
            //   68????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7402                 | je                  4
            //   eb0d                 | jmp                 0xf

        $sequence_39 = { 53 56 57 c785ecfeffff01000000 c785e8feffffe197af54 0f6e85e8feffff }
            // n = 6, score = 200
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   c785ecfeffff01000000     | mov    dword ptr [ebp - 0x114], 1
            //   c785e8feffffe197af54     | mov    dword ptr [ebp - 0x118], 0x54af97e1
            //   0f6e85e8feffff       | movd                mm0, dword ptr [ebp - 0x118]

        $sequence_40 = { 8bce 8bd8 e8???????? 57 ff15???????? 5f 8bc3 }
            // n = 7, score = 200
            //   8bce                 | mov                 ecx, esi
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   8bc3                 | mov                 eax, ebx

        $sequence_41 = { 8d443001 6a00 51 50 56 }
            // n = 5, score = 200
            //   8d443001             | lea                 eax, [eax + esi + 1]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_42 = { 57 894df0 ff15???????? 8945fc }
            // n = 4, score = 200
            //   57                   | push                edi
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_43 = { 8b08 ff9180000000 8b06 85c0 }
            // n = 4, score = 200
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff9180000000         | call                dword ptr [ecx + 0x80]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax

        $sequence_44 = { 50 ff512c 8bf0 f7de 1bf6 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   ff512c               | call                dword ptr [ecx + 0x2c]
            //   8bf0                 | mov                 esi, eax
            //   f7de                 | neg                 esi
            //   1bf6                 | sbb                 esi, esi

        $sequence_45 = { c0e902 88442415 8a442412 884c2414 }
            // n = 4, score = 100
            //   c0e902               | xor                 eax, eax
            //   88442415             | mov                 edx, 0xc0000000
            //   8a442412             | call                dword ptr [eax + 0x40]
            //   884c2414             | dec                 eax

        $sequence_46 = { 33c0 3bfd 7623 8db4243c040000 8a4c043c 80f90a }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   3bfd                 | dec                 eax
            //   7623                 | mov                 ecx, 0x80000001
            //   8db4243c040000       | jmp                 6
            //   8a4c043c             | dec                 eax
            //   80f90a               | add                 eax, 0x10

        $sequence_47 = { 8d44242c 8d4c240c 50 33db 68???????? 51 895c2430 }
            // n = 7, score = 100
            //   8d44242c             | mov                 dword ptr [esp + 0x10], ebx
            //   8d4c240c             | call                dword ptr [eax + 0xe8]
            //   50                   | mov                 edx, 0x2710
            //   33db                 | call                dword ptr [eax + 0xe8]
            //   68????????           |                     
            //   51                   | mov                 edx, 0x2710
            //   895c2430             | call                dword ptr [eax + 0xe8]

        $sequence_48 = { 895908 89590c a1???????? 8b10 8d44241c }
            // n = 5, score = 100
            //   895908               | mov                 edx, 0xc0000000
            //   89590c               | call                dword ptr [eax + 0x40]
            //   a1????????           |                     
            //   8b10                 | mov                 dword ptr [esp + 0x20], 4
            //   8d44241c             | inc                 ebp

        $sequence_49 = { 896c2428 8be9 6a01 55 8d4c2424 ff15???????? }
            // n = 6, score = 100
            //   896c2428             | dec                 eax
            //   8be9                 | add                 esp, 0x28
            //   6a01                 | ret                 
            //   55                   | ret                 
            //   8d4c2424             | dec                 eax
            //   ff15????????         |                     

        $sequence_50 = { 7d1f b903000000 8d7c3410 2bce }
            // n = 4, score = 100
            //   7d1f                 | mov                 dword ptr [esp + 0x20], eax
            //   b903000000           | inc                 ecx
            //   8d7c3410             | mov                 ecx, 0x20006
            //   2bce                 | inc                 ebp

        $sequence_51 = { 895c2430 e8???????? 8a542418 51 8bcc }
            // n = 5, score = 100
            //   895c2430             | call                dword ptr [eax + 0x28]
            //   e8????????           |                     
            //   8a542418             | call                dword ptr [eax + 0x1a8]
            //   51                   | test                eax, eax
            //   8bcc                 | je                  7

        $sequence_52 = { 8d4c2434 ff15???????? 8d542430 68???????? }
            // n = 4, score = 100
            //   8d4c2434             | xor                 ecx, ecx
            //   ff15????????         |                     
            //   8d542430             | inc                 ebp
            //   68????????           |                     

    condition:
        7 of them and filesize < 1586176
}