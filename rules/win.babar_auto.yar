rule win_babar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.babar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.babar"
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
        $sequence_0 = { 3bc6 740e 8d4e04 3bc1 }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   740e                 | je                  0x10
            //   8d4e04               | lea                 ecx, [esi + 4]
            //   3bc1                 | cmp                 eax, ecx

        $sequence_1 = { 3bc6 7416 8d4df0 51 }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   7416                 | je                  0x18
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   51                   | push                ecx

        $sequence_2 = { 3bc6 740c 56 56 6a15 8d4844 }
            // n = 6, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   740c                 | je                  0xe
            //   56                   | push                esi
            //   56                   | push                esi
            //   6a15                 | push                0x15
            //   8d4844               | lea                 ecx, [eax + 0x44]

        $sequence_3 = { 3bc6 7458 ff7714 50 }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   7458                 | je                  0x5a
            //   ff7714               | push                dword ptr [edi + 0x14]
            //   50                   | push                eax

        $sequence_4 = { 3bc6 740f 6a08 8d4dec }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   740f                 | je                  0x11
            //   6a08                 | push                8
            //   8d4dec               | lea                 ecx, [ebp - 0x14]

        $sequence_5 = { 40 ebe5 8b45ec 40 8945ec }
            // n = 5, score = 400
            //   40                   | inc                 eax
            //   ebe5                 | jmp                 0xffffffe7
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   40                   | inc                 eax
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax

        $sequence_6 = { 3bc6 7412 8b0c91 3bce }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   7412                 | je                  0x14
            //   8b0c91               | mov                 ecx, dword ptr [ecx + edx*4]
            //   3bce                 | cmp                 ecx, esi

        $sequence_7 = { 3bc6 7415 56 ff75f0 }
            // n = 4, score = 400
            //   3bc6                 | cmp                 eax, esi
            //   7415                 | je                  0x17
            //   56                   | push                esi
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_8 = { 8d4c242c 51 53 68???????? 6801000080 }
            // n = 5, score = 200
            //   8d4c242c             | lea                 ecx, [esp + 0x2c]
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   68????????           |                     
            //   6801000080           | push                0x80000001

        $sequence_9 = { 23f9 33fe 037c2418 8d9417db702024 }
            // n = 4, score = 200
            //   23f9                 | and                 edi, ecx
            //   33fe                 | xor                 edi, esi
            //   037c2418             | add                 edi, dword ptr [esp + 0x18]
            //   8d9417db702024       | lea                 edx, [edi + edx + 0x242070db]

        $sequence_10 = { 68???????? 68???????? ff15???????? 8b0d???????? 51 e8???????? 83c404 }
            // n = 7, score = 200
            //   68????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_11 = { 6a03 6a00 6a01 6800000080 50 c70700000000 ff15???????? }
            // n = 7, score = 200
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6800000080           | push                0x80000000
            //   50                   | push                eax
            //   c70700000000         | mov                 dword ptr [edi], 0
            //   ff15????????         |                     

        $sequence_12 = { 8b1d???????? 83c408 8d8c2438010000 51 }
            // n = 4, score = 200
            //   8b1d????????         |                     
            //   83c408               | add                 esp, 8
            //   8d8c2438010000       | lea                 ecx, [esp + 0x138]
            //   51                   | push                ecx

        $sequence_13 = { e8???????? 83c404 85c0 8906 7504 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   8906                 | mov                 dword ptr [esi], eax
            //   7504                 | jne                 6

        $sequence_14 = { 89480c 8b15???????? 895010 8b0d???????? 8d542408 52 }
            // n = 6, score = 200
            //   89480c               | mov                 dword ptr [eax + 0xc], ecx
            //   8b15????????         |                     
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   8b0d????????         |                     
            //   8d542408             | lea                 edx, [esp + 8]
            //   52                   | push                edx

        $sequence_15 = { 89442428 89442444 8d442414 50 6a00 }
            // n = 5, score = 200
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   89442444             | mov                 dword ptr [esp + 0x44], eax
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   50                   | push                eax
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 1294336
}