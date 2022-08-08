rule win_winsloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.winsloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.winsloader"
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
        $sequence_0 = { 6890000000 57 e8???????? 83c40c }
            // n = 4, score = 200
            //   6890000000           | push                0x90
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_1 = { 8dbbdf000000 b911000000 be???????? f3a5 83c40c a4 ffd0 }
            // n = 7, score = 200
            //   8dbbdf000000         | lea                 edi, [ebx + 0xdf]
            //   b911000000           | mov                 ecx, 0x11
            //   be????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   83c40c               | add                 esp, 0xc
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   ffd0                 | call                eax

        $sequence_2 = { 50 53 56 57 c745d800000000 ff15???????? }
            // n = 6, score = 200
            //   50                   | push                eax
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   c745d800000000       | mov                 dword ptr [ebp - 0x28], 0
            //   ff15????????         |                     

        $sequence_3 = { 89841d06fcffff b8???????? 898c1d0afcffff 83c410 66c7841d0efcffff4501 8d7001 }
            // n = 6, score = 200
            //   89841d06fcffff       | mov                 dword ptr [ebp + ebx - 0x3fa], eax
            //   b8????????           |                     
            //   898c1d0afcffff       | mov                 dword ptr [ebp + ebx - 0x3f6], ecx
            //   83c410               | add                 esp, 0x10
            //   66c7841d0efcffff4501     | mov    word ptr [ebp + ebx - 0x3f2], 0x145
            //   8d7001               | lea                 esi, [eax + 1]

        $sequence_4 = { 6a00 6a00 57 8bd8 ff15???????? 53 e8???????? }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   57                   | push                edi
            //   8bd8                 | mov                 ebx, eax
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_5 = { 83c40c 6800040000 8d8dfcf7ffff 51 }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   6800040000           | push                0x400
            //   8d8dfcf7ffff         | lea                 ecx, [ebp - 0x804]
            //   51                   | push                ecx

        $sequence_6 = { b937000000 be???????? 8bfb f3a5 66a5 a4 8dbbdf000000 }
            // n = 7, score = 200
            //   b937000000           | mov                 ecx, 0x37
            //   be????????           |                     
            //   8bfb                 | mov                 edi, ebx
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   8dbbdf000000         | lea                 edi, [ebx + 0xdf]

        $sequence_7 = { 83c408 33c0 e9???????? 57 8d45dc 50 }
            // n = 6, score = 200
            //   83c408               | add                 esp, 8
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   57                   | push                edi
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax

        $sequence_8 = { 03de 8d8bb4130000 6a40 0fb7f1 6800100000 }
            // n = 5, score = 200
            //   03de                 | add                 ebx, esi
            //   8d8bb4130000         | lea                 ecx, [ebx + 0x13b4]
            //   6a40                 | push                0x40
            //   0fb7f1               | movzx               esi, cx
            //   6800100000           | push                0x1000

        $sequence_9 = { 8945c8 85c0 7510 56 e8???????? 83c404 }
            // n = 6, score = 100
            //   8945c8               | mov                 dword ptr [ebp - 0x38], eax
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_10 = { 84c9 746c 53 8a9f10800000 0fb6c1 56 8bb70c800000 }
            // n = 7, score = 100
            //   84c9                 | test                cl, cl
            //   746c                 | je                  0x6e
            //   53                   | push                ebx
            //   8a9f10800000         | mov                 bl, byte ptr [edi + 0x8010]
            //   0fb6c1               | movzx               eax, cl
            //   56                   | push                esi
            //   8bb70c800000         | mov                 esi, dword ptr [edi + 0x800c]

        $sequence_11 = { 1bc0 23c1 eb57 53 8b1c8538540110 56 }
            // n = 6, score = 100
            //   1bc0                 | sbb                 eax, eax
            //   23c1                 | and                 eax, ecx
            //   eb57                 | jmp                 0x59
            //   53                   | push                ebx
            //   8b1c8538540110       | mov                 ebx, dword ptr [eax*4 + 0x10015438]
            //   56                   | push                esi

        $sequence_12 = { 85db 7426 0f1f840000000000 8b8e1c800000 8b7510 8a043a 42 }
            // n = 7, score = 100
            //   85db                 | test                ebx, ebx
            //   7426                 | je                  0x28
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]
            //   8b8e1c800000         | mov                 ecx, dword ptr [esi + 0x801c]
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   8a043a               | mov                 al, byte ptr [edx + edi]
            //   42                   | inc                 edx

        $sequence_13 = { 894de4 399810a20110 0f84ea000000 41 }
            // n = 4, score = 100
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   399810a20110         | cmp                 dword ptr [eax + 0x1001a210], ebx
            //   0f84ea000000         | je                  0xf0
            //   41                   | inc                 ecx

        $sequence_14 = { 83bde4f3ffff00 7507 33c0 e9???????? 0fb795f0f3ffff }
            // n = 5, score = 100
            //   83bde4f3ffff00       | cmp                 dword ptr [ebp - 0xc1c], 0
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   0fb795f0f3ffff       | movzx               edx, word ptr [ebp - 0xc10]

        $sequence_15 = { 8bc7 8bcf 83e03f c1f906 6bf030 03348dc0c00110 }
            // n = 6, score = 100
            //   8bc7                 | mov                 eax, edi
            //   8bcf                 | mov                 ecx, edi
            //   83e03f               | and                 eax, 0x3f
            //   c1f906               | sar                 ecx, 6
            //   6bf030               | imul                esi, eax, 0x30
            //   03348dc0c00110       | add                 esi, dword ptr [ecx*4 + 0x1001c0c0]

    condition:
        7 of them and filesize < 270336
}