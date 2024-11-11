rule win_ghost_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.ghost_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ghost_rat"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 6a01 56 ff15???????? 5e c20800 }
            // n = 5, score = 500
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   c20800               | ret                 8

        $sequence_1 = { 8bd9 e8???????? 8b4d08 3bc8 }
            // n = 4, score = 500
            //   8bd9                 | mov                 ebx, ecx
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   3bc8                 | cmp                 ecx, eax

        $sequence_2 = { 8b400c 85c0 7505 a1???????? 50 8bce }
            // n = 6, score = 500
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   a1????????           |                     
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi

        $sequence_3 = { 6a6b 8bce e8???????? 5f }
            // n = 4, score = 400
            //   6a6b                 | push                0x6b
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   5f                   | pop                 edi

        $sequence_4 = { 5d c20400 894df4 c745f800000000 df6df4 }
            // n = 5, score = 400
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   df6df4               | fild                qword ptr [ebp - 0xc]

        $sequence_5 = { df6df4 83ec08 dc0d???????? dd1c24 ff15???????? }
            // n = 5, score = 400
            //   df6df4               | fild                qword ptr [ebp - 0xc]
            //   83ec08               | sub                 esp, 8
            //   dc0d????????         |                     
            //   dd1c24               | fstp                qword ptr [esp]
            //   ff15????????         |                     

        $sequence_6 = { e9???????? 8d45dc 50 681f000200 }
            // n = 4, score = 300
            //   e9????????           |                     
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   681f000200           | push                0x2001f

        $sequence_7 = { ffd3 8bd8 85db 750d 5f 5e 5d }
            // n = 7, score = 300
            //   ffd3                 | call                ebx
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   750d                 | jne                 0xf
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_8 = { 83c454 c20400 8d7901 57 ff15???????? 8bcf 8bd8 }
            // n = 7, score = 300
            //   83c454               | add                 esp, 0x54
            //   c20400               | ret                 4
            //   8d7901               | lea                 edi, [ecx + 1]
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bcf                 | mov                 ecx, edi
            //   8bd8                 | mov                 ebx, eax

        $sequence_9 = { 68???????? 68???????? 6a00 6a00 c705????????20010000 e8???????? 8b35???????? }
            // n = 7, score = 300
            //   68????????           |                     
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   c705????????20010000     |     
            //   e8????????           |                     
            //   8b35????????         |                     

        $sequence_10 = { 8365fc00 ff7508 ff15???????? 40 50 ff15???????? 59 }
            // n = 7, score = 300
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   ff15????????         |                     
            //   59                   | pop                 ecx

        $sequence_11 = { ff7510 ff75dc ff15???????? 85c0 7507 c745e401000000 }
            // n = 6, score = 300
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   c745e401000000       | mov                 dword ptr [ebp - 0x1c], 1

        $sequence_12 = { 50 8d442434 894c2438 50 6a00 c744243c01000000 }
            // n = 6, score = 300
            //   50                   | push                eax
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   894c2438             | mov                 dword ptr [esp + 0x38], ecx
            //   50                   | push                eax
            //   6a00                 | push                0
            //   c744243c01000000     | mov                 dword ptr [esp + 0x3c], 1

        $sequence_13 = { 8dbd85feffff f3ab 66ab aa }
            // n = 4, score = 300
            //   8dbd85feffff         | lea                 edi, [ebp - 0x17b]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al

        $sequence_14 = { 8d85c0feffff 50 57 ff15???????? 8bf8 }
            // n = 5, score = 300
            //   8d85c0feffff         | lea                 eax, [ebp - 0x140]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_15 = { ff15???????? 8b4e04 e8???????? 33c0 5e }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi

        $sequence_16 = { 6a00 ff7628 ff15???????? 6a01 ff7620 ff15???????? 8b4e04 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   ff7628               | push                dword ptr [esi + 0x28]
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   ff7620               | push                dword ptr [esi + 0x20]
            //   ff15????????         |                     
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]

        $sequence_17 = { ffb6a8000000 ff15???????? ffb6ac000000 ff15???????? }
            // n = 4, score = 300
            //   ffb6a8000000         | push                dword ptr [esi + 0xa8]
            //   ff15????????         |                     
            //   ffb6ac000000         | push                dword ptr [esi + 0xac]
            //   ff15????????         |                     

        $sequence_18 = { 6a00 50 e8???????? 83c40c ff7508 6a40 ff15???????? }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6a40                 | push                0x40
            //   ff15????????         |                     

        $sequence_19 = { 56 ff15???????? 6a71 8bcf e8???????? 5f 5e }
            // n = 7, score = 300
            //   56                   | push                esi
            //   ff15????????         |                     
            //   6a71                 | push                0x71
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_20 = { 5f 5e 5b 83c454 c20400 }
            // n = 5, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   83c454               | add                 esp, 0x54
            //   c20400               | ret                 4

        $sequence_21 = { c744242400000000 c644241c05 885c241d c644241e00 885c241f }
            // n = 5, score = 300
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c644241c05           | mov                 byte ptr [esp + 0x1c], 5
            //   885c241d             | mov                 byte ptr [esp + 0x1d], bl
            //   c644241e00           | mov                 byte ptr [esp + 0x1e], 0
            //   885c241f             | mov                 byte ptr [esp + 0x1f], bl

        $sequence_22 = { 68???????? 50 6802000080 e8???????? 83c41c 5f 5e }
            // n = 7, score = 300
            //   68????????           |                     
            //   50                   | push                eax
            //   6802000080           | push                0x80000002
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_23 = { 8bfe f2ae f7d1 49 7509 5f }
            // n = 6, score = 300
            //   8bfe                 | mov                 edi, esi
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   7509                 | jne                 0xb
            //   5f                   | pop                 edi

        $sequence_24 = { 6a00 6838040000 6a00 6a00 }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   6838040000           | push                0x438
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_25 = { 8b7e20 8b36 813f6b006500 7406 813f4b004500 }
            // n = 5, score = 200
            //   8b7e20               | mov                 edi, dword ptr [esi + 0x20]
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   813f6b006500         | cmp                 dword ptr [edi], 0x65006b
            //   7406                 | je                  8
            //   813f4b004500         | cmp                 dword ptr [edi], 0x45004b

        $sequence_26 = { 83e9fc c70161727941 83e9fc c70100000000 }
            // n = 4, score = 200
            //   83e9fc               | sub                 ecx, -4
            //   c70161727941         | mov                 dword ptr [ecx], 0x41797261
            //   83e9fc               | sub                 ecx, -4
            //   c70100000000         | mov                 dword ptr [ecx], 0

        $sequence_27 = { c7014c6f6164 83e9fc c7014c696272 83e9fc }
            // n = 4, score = 200
            //   c7014c6f6164         | mov                 dword ptr [ecx], 0x64616f4c
            //   83e9fc               | sub                 ecx, -4
            //   c7014c696272         | mov                 dword ptr [ecx], 0x7262694c
            //   83e9fc               | sub                 ecx, -4

        $sequence_28 = { 89855cffffff 8b8d5cffffff 66c7014242 8b955cffffff 8b423c 8945ec }
            // n = 6, score = 100
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   8b8d5cffffff         | mov                 ecx, dword ptr [ebp - 0xa4]
            //   66c7014242           | mov                 word ptr [ecx], 0x4242
            //   8b955cffffff         | mov                 edx, dword ptr [ebp - 0xa4]
            //   8b423c               | mov                 eax, dword ptr [edx + 0x3c]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax

        $sequence_29 = { 8945e4 8b4ddc 81c1f8000000 894dd8 8b55e4 8b4220 }
            // n = 6, score = 100
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   81c1f8000000         | add                 ecx, 0xf8
            //   894dd8               | mov                 dword ptr [ebp - 0x28], ecx
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   8b4220               | mov                 eax, dword ptr [edx + 0x20]

        $sequence_30 = { 83c002 8945f0 eb9e 8b4df0 894dfc e9???????? 8be5 }
            // n = 7, score = 100
            //   83c002               | add                 eax, 2
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   eb9e                 | jmp                 0xffffffa0
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   e9????????           |                     
            //   8be5                 | mov                 esp, ebp

        $sequence_31 = { 8945ec 8b45ec 8b08 034df8 8b55ec 890a 8b45f0 }
            // n = 7, score = 100
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   034df8               | add                 ecx, dword ptr [ebp - 8]
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_32 = { 898570ffffff e8???????? 6a40 6800100000 8b45d0 }
            // n = 5, score = 100
            //   898570ffffff         | mov                 dword ptr [ebp - 0x90], eax
            //   e8????????           |                     
            //   6a40                 | push                0x40
            //   6800100000           | push                0x1000
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]

    condition:
        7 of them and filesize < 357376
}