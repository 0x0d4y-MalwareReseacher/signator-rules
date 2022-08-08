rule win_coreshell_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.coreshell."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.coreshell"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 56 ff15???????? 83c40c 3bc6 }
            // n = 4, score = 1000
            //   56                   | push                esi
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   3bc6                 | cmp                 eax, esi

        $sequence_1 = { be06000000 e8???????? 85c0 7401 4e }
            // n = 5, score = 1000
            //   be06000000           | mov                 esi, 6
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7401                 | je                  3
            //   4e                   | dec                 esi

        $sequence_2 = { 56 6810270000 ff15???????? be06000000 e8???????? }
            // n = 5, score = 1000
            //   56                   | push                esi
            //   6810270000           | push                0x2710
            //   ff15????????         |                     
            //   be06000000           | mov                 esi, 6
            //   e8????????           |                     

        $sequence_3 = { 68???????? 52 ffd7 ffd0 }
            // n = 4, score = 1000
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   ffd0                 | call                eax

        $sequence_4 = { c20400 50 a1???????? 6a00 }
            // n = 4, score = 800
            //   c20400               | ret                 4
            //   50                   | push                eax
            //   a1????????           |                     
            //   6a00                 | push                0

        $sequence_5 = { 8b0d???????? 8b15???????? 6a01 51 68???????? }
            // n = 5, score = 800
            //   8b0d????????         |                     
            //   8b15????????         |                     
            //   6a01                 | push                1
            //   51                   | push                ecx
            //   68????????           |                     

        $sequence_6 = { 50 ff15???????? 83c404 32db }
            // n = 4, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4
            //   32db                 | xor                 bl, bl

        $sequence_7 = { 6a00 ff15???????? 8bf0 ff15???????? 50 68???????? }
            // n = 6, score = 800
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_8 = { 6804010000 6a08 8b15???????? 52 }
            // n = 4, score = 800
            //   6804010000           | push                0x104
            //   6a08                 | push                8
            //   8b15????????         |                     
            //   52                   | push                edx

        $sequence_9 = { 50 57 6a08 51 ff15???????? 8bf8 85ff }
            // n = 7, score = 800
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a08                 | push                8
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi

        $sequence_10 = { 56 6a00 6a00 681c800000 }
            // n = 4, score = 800
            //   56                   | push                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   681c800000           | push                0x801c

        $sequence_11 = { ff15???????? ffd0 85c0 7508 ff15???????? }
            // n = 5, score = 700
            //   ff15????????         |                     
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0xa
            //   ff15????????         |                     

        $sequence_12 = { 68???????? 50 a3???????? ffd6 a3???????? a1???????? 68???????? }
            // n = 7, score = 700
            //   68????????           |                     
            //   50                   | push                eax
            //   a3????????           |                     
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   a1????????           |                     
            //   68????????           |                     

        $sequence_13 = { 8bf1 8b4604 85c0 7407 50 ff15???????? 8b36 }
            // n = 7, score = 700
            //   8bf1                 | mov                 esi, ecx
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b36                 | mov                 esi, dword ptr [esi]

        $sequence_14 = { 7402 eb14 c745f000000000 68e0930400 }
            // n = 4, score = 700
            //   7402                 | je                  4
            //   eb14                 | jmp                 0x16
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   68e0930400           | push                0x493e0

        $sequence_15 = { 8d4c2400 56 51 6a00 }
            // n = 4, score = 700
            //   8d4c2400             | lea                 ecx, [esp]
            //   56                   | push                esi
            //   51                   | push                ecx
            //   6a00                 | push                0

        $sequence_16 = { a3???????? a1???????? 68???????? 50 ffd6 6a00 }
            // n = 6, score = 600
            //   a3????????           |                     
            //   a1????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   6a00                 | push                0

        $sequence_17 = { 8b0d???????? 52 50 57 68???????? 51 }
            // n = 6, score = 600
            //   8b0d????????         |                     
            //   52                   | push                edx
            //   50                   | push                eax
            //   57                   | push                edi
            //   68????????           |                     
            //   51                   | push                ecx

        $sequence_18 = { 50 ffd6 6a00 6a00 6a00 68???????? 6a00 }
            // n = 7, score = 600
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   6a00                 | push                0

        $sequence_19 = { 68???????? 6800080000 8d85fcefffff 50 }
            // n = 4, score = 600
            //   68????????           |                     
            //   6800080000           | push                0x800
            //   8d85fcefffff         | lea                 eax, [ebp - 0x1004]
            //   50                   | push                eax

        $sequence_20 = { 8b5c241c 8d041e 50 57 }
            // n = 4, score = 500
            //   8b5c241c             | mov                 ebx, dword ptr [esp + 0x1c]
            //   8d041e               | lea                 eax, [esi + ebx]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_21 = { 52 e8???????? 83c408 33c0 8b4df0 }
            // n = 5, score = 500
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   33c0                 | xor                 eax, eax
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]

        $sequence_22 = { 81e1ffff0000 81e1ffff0000 81e1ff000000 81e1ff000000 }
            // n = 4, score = 500
            //   81e1ffff0000         | and                 ecx, 0xffff
            //   81e1ffff0000         | and                 ecx, 0xffff
            //   81e1ff000000         | and                 ecx, 0xff
            //   81e1ff000000         | and                 ecx, 0xff

        $sequence_23 = { ff15???????? 03c0 50 8d95f4fdffff }
            // n = 4, score = 500
            //   ff15????????         |                     
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax
            //   8d95f4fdffff         | lea                 edx, [ebp - 0x20c]

        $sequence_24 = { 8d85fcefffff 6800080000 50 ff15???????? }
            // n = 4, score = 500
            //   8d85fcefffff         | lea                 eax, [ebp - 0x1004]
            //   6800080000           | push                0x800
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_25 = { c1e908 81e1ff000000 0fb6d1 52 }
            // n = 4, score = 400
            //   c1e908               | shr                 ecx, 8
            //   81e1ff000000         | and                 ecx, 0xff
            //   0fb6d1               | movzx               edx, cl
            //   52                   | push                edx

        $sequence_26 = { 52 ff15???????? 0305???????? 50 }
            // n = 4, score = 400
            //   52                   | push                edx
            //   ff15????????         |                     
            //   0305????????         |                     
            //   50                   | push                eax

        $sequence_27 = { ff15???????? ba00080000 2bd0 52 8d85fcefffff 50 ff15???????? }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   ba00080000           | mov                 edx, 0x800
            //   2bd0                 | sub                 edx, eax
            //   52                   | push                edx
            //   8d85fcefffff         | lea                 eax, [ebp - 0x1004]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_28 = { 81e2ffff0000 81e2ffff0000 c1ea08 81e2ff000000 }
            // n = 4, score = 400
            //   81e2ffff0000         | and                 edx, 0xffff
            //   81e2ffff0000         | and                 edx, 0xffff
            //   c1ea08               | shr                 edx, 8
            //   81e2ff000000         | and                 edx, 0xff

        $sequence_29 = { 50 68???????? 8b0d???????? 51 ff15???????? ffd0 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   68????????           |                     
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   ffd0                 | call                eax

        $sequence_30 = { 56 51 56 6a01 }
            // n = 4, score = 400
            //   56                   | push                esi
            //   51                   | push                ecx
            //   56                   | push                esi
            //   6a01                 | push                1

        $sequence_31 = { 6888130000 ff15???????? c745f000000000 c745f400000000 }
            // n = 4, score = 400
            //   6888130000           | push                0x1388
            //   ff15????????         |                     
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0

        $sequence_32 = { 51 ff15???????? 83c414 8d95f4fdffff 52 }
            // n = 5, score = 400
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   8d95f4fdffff         | lea                 edx, [ebp - 0x20c]
            //   52                   | push                edx

        $sequence_33 = { e8???????? 8be8 8b442410 50 e8???????? }
            // n = 5, score = 400
            //   e8????????           |                     
            //   8be8                 | mov                 ebp, eax
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_34 = { 0305???????? 50 ff15???????? a1???????? }
            // n = 4, score = 300
            //   0305????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a1????????           |                     

        $sequence_35 = { ffd6 ffd0 68???????? a3???????? }
            // n = 4, score = 300
            //   ffd6                 | call                esi
            //   ffd0                 | call                eax
            //   68????????           |                     
            //   a3????????           |                     

        $sequence_36 = { 8908 813800000000 0f94c2 8b35???????? 8b3d???????? 0faff6 81c601000000 }
            // n = 7, score = 200
            //   8908                 | mov                 dword ptr [eax], ecx
            //   813800000000         | cmp                 dword ptr [eax], 0
            //   0f94c2               | sete                dl
            //   8b35????????         |                     
            //   8b3d????????         |                     
            //   0faff6               | imul                esi, esi
            //   81c601000000         | add                 esi, 1

        $sequence_37 = { 8908 813800000000 0f95c2 8b35???????? }
            // n = 4, score = 200
            //   8908                 | mov                 dword ptr [eax], ecx
            //   813800000000         | cmp                 dword ptr [eax], 0
            //   0f95c2               | setne               dl
            //   8b35????????         |                     

        $sequence_38 = { 57 8b3d???????? 68???????? ffd7 8b35???????? 68???????? }
            // n = 6, score = 200
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   8b35????????         |                     
            //   68????????           |                     

        $sequence_39 = { 8908 8b15???????? 89d6 81c609000000 }
            // n = 4, score = 200
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b15????????         |                     
            //   89d6                 | mov                 esi, edx
            //   81c609000000         | add                 esi, 9

        $sequence_40 = { 29d6 01f0 a3???????? e9???????? }
            // n = 4, score = 200
            //   29d6                 | sub                 esi, edx
            //   01f0                 | add                 eax, esi
            //   a3????????           |                     
            //   e9????????           |                     

        $sequence_41 = { 5f 5b 5d c3 b81c000000 }
            // n = 5, score = 200
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   b81c000000           | mov                 eax, 0x1c

        $sequence_42 = { 29d6 0faff0 31d2 f7f6 }
            // n = 4, score = 200
            //   29d6                 | sub                 esi, edx
            //   0faff0               | imul                esi, eax
            //   31d2                 | xor                 edx, edx
            //   f7f6                 | div                 esi

        $sequence_43 = { 68???????? 53 a3???????? ffd6 68???????? a3???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   53                   | push                ebx
            //   a3????????           |                     
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   a3????????           |                     

        $sequence_44 = { bf04010000 57 6a08 ff35???????? ff15???????? }
            // n = 5, score = 200
            //   bf04010000           | mov                 edi, 0x104
            //   57                   | push                edi
            //   6a08                 | push                8
            //   ff35????????         |                     
            //   ff15????????         |                     

        $sequence_45 = { 5f 5d c3 89e0 c70010270000 }
            // n = 5, score = 200
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   89e0                 | mov                 eax, esp
            //   c70010270000         | mov                 dword ptr [eax], 0x2710

        $sequence_46 = { a3???????? ffd7 8bd8 68???????? }
            // n = 4, score = 200
            //   a3????????           |                     
            //   ffd7                 | call                edi
            //   8bd8                 | mov                 ebx, eax
            //   68????????           |                     

        $sequence_47 = { 8908 8b00 8b5004 8b35???????? }
            // n = 4, score = 200
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   8b35????????         |                     

    condition:
        7 of them and filesize < 303100
}