rule win_hardrain_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.hardrain."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hardrain"
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
        $sequence_0 = { 66a1???????? 53 56 57 50 e8???????? }
            // n = 6, score = 200
            //   66a1????????         |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_1 = { 50 56 ff15???????? 85c0 7e1e 8b54240c }
            // n = 6, score = 200
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7e1e                 | jle                 0x20
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]

        $sequence_2 = { 6689442409 52 ff15???????? 8b4c2418 668944240b }
            // n = 5, score = 200
            //   6689442409           | mov                 word ptr [esp + 9], ax
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   668944240b           | mov                 word ptr [esp + 0xb], ax

        $sequence_3 = { 8b842414010000 6a01 8d542408 680c010000 52 }
            // n = 5, score = 200
            //   8b842414010000       | mov                 eax, dword ptr [esp + 0x114]
            //   6a01                 | push                1
            //   8d542408             | lea                 edx, [esp + 8]
            //   680c010000           | push                0x10c
            //   52                   | push                edx

        $sequence_4 = { 6a00 51 53 89742430 c744242c01000000 c744242400000000 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   89742430             | mov                 dword ptr [esp + 0x30], esi
            //   c744242c01000000     | mov                 dword ptr [esp + 0x2c], 1
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0

        $sequence_5 = { 8d4c2404 8d542414 89442410 51 }
            // n = 4, score = 200
            //   8d4c2404             | lea                 ecx, [esp + 4]
            //   8d542414             | lea                 edx, [esp + 0x14]
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   51                   | push                ecx

        $sequence_6 = { 51 53 89742430 c744242c01000000 c744242400000000 c744242810270000 ff15???????? }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   89742430             | mov                 dword ptr [esp + 0x30], esi
            //   c744242c01000000     | mov                 dword ptr [esp + 0x2c], 1
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c744242810270000     | mov                 dword ptr [esp + 0x28], 0x2710
            //   ff15????????         |                     

        $sequence_7 = { 8b44240c 85c0 765f 2bc3 }
            // n = 4, score = 200
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   85c0                 | test                eax, eax
            //   765f                 | jbe                 0x61
            //   2bc3                 | sub                 eax, ebx

        $sequence_8 = { 894c242c e8???????? 83c414 85c0 740a b802000000 5e }
            // n = 7, score = 200
            //   894c242c             | mov                 dword ptr [esp + 0x2c], ecx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   b802000000           | mov                 eax, 2
            //   5e                   | pop                 esi

        $sequence_9 = { 0f84c0000000 55 8bce e8???????? 85c0 0f84b0000000 55 }
            // n = 7, score = 200
            //   0f84c0000000         | je                  0xc6
            //   55                   | push                ebp
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84b0000000         | je                  0xb6
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 368640
}