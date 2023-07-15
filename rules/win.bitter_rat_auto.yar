rule win_bitter_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.bitter_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bitter_rat"
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
        $sequence_0 = { 33c5 8945fc 8d85e8d8ffff 8985dcd8ffff c785d8d8ffff10270000 c785ccd8ffff00000000 c785c0d8ffff00000000 }
            // n = 7, score = 200
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d85e8d8ffff         | lea                 eax, [ebp - 0x2718]
            //   8985dcd8ffff         | mov                 dword ptr [ebp - 0x2724], eax
            //   c785d8d8ffff10270000     | mov    dword ptr [ebp - 0x2728], 0x2710
            //   c785ccd8ffff00000000     | mov    dword ptr [ebp - 0x2734], 0
            //   c785c0d8ffff00000000     | mov    dword ptr [ebp - 0x2740], 0

        $sequence_1 = { 8d8564f0ffff 50 6a00 8b8d40f0ffff }
            // n = 4, score = 200
            //   8d8564f0ffff         | lea                 eax, [ebp - 0xf9c]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   8b8d40f0ffff         | mov                 ecx, dword ptr [ebp - 0xfc0]

        $sequence_2 = { e8???????? 8985d0feffff 52 8bcd 50 8d1524c64100 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8985d0feffff         | mov                 dword ptr [ebp - 0x130], eax
            //   52                   | push                edx
            //   8bcd                 | mov                 ecx, ebp
            //   50                   | push                eax
            //   8d1524c64100         | lea                 edx, [0x41c624]
            //   e8????????           |                     

        $sequence_3 = { b9da0a0000 b8cccccccc f3ab a1???????? 33c5 8945fc }
            // n = 6, score = 200
            //   b9da0a0000           | mov                 ecx, 0xada
            //   b8cccccccc           | mov                 eax, 0xcccccccc
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_4 = { 50 8b8de0fdffff 51 68???????? e8???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8b8de0fdffff         | mov                 ecx, dword ptr [ebp - 0x220]
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_5 = { 8d857cdcffff 50 68d4070000 e8???????? 83c414 687c230000 e8???????? }
            // n = 7, score = 200
            //   8d857cdcffff         | lea                 eax, [ebp - 0x2384]
            //   50                   | push                eax
            //   68d4070000           | push                0x7d4
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   687c230000           | push                0x237c
            //   e8????????           |                     

        $sequence_6 = { ff3485840e4500 8d4de8 e8???????? a1???????? }
            // n = 4, score = 200
            //   ff3485840e4500       | push                dword ptr [eax*4 + 0x450e84]
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   e8????????           |                     
            //   a1????????           |                     

        $sequence_7 = { 50 ff15???????? 3bf4 e8???????? 8945f4 c745dc1c000000 6a00 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   3bf4                 | cmp                 esi, esp
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   c745dc1c000000       | mov                 dword ptr [ebp - 0x24], 0x1c
            //   6a00                 | push                0

        $sequence_8 = { 6bc00c 8b4de8 8b540104 899574fcffff 8bf4 8b8574fcffff }
            // n = 6, score = 200
            //   6bc00c               | imul                eax, eax, 0xc
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   8b540104             | mov                 edx, dword ptr [ecx + eax + 4]
            //   899574fcffff         | mov                 dword ptr [ebp - 0x38c], edx
            //   8bf4                 | mov                 esi, esp
            //   8b8574fcffff         | mov                 eax, dword ptr [ebp - 0x38c]

        $sequence_9 = { 3bf4 e8???????? 89855cfeffff 83bd5cfeffff00 7408 8b855cfeffff eb02 }
            // n = 7, score = 200
            //   3bf4                 | cmp                 esi, esp
            //   e8????????           |                     
            //   89855cfeffff         | mov                 dword ptr [ebp - 0x1a4], eax
            //   83bd5cfeffff00       | cmp                 dword ptr [ebp - 0x1a4], 0
            //   7408                 | je                  0xa
            //   8b855cfeffff         | mov                 eax, dword ptr [ebp - 0x1a4]
            //   eb02                 | jmp                 4

    condition:
        7 of them and filesize < 1130496
}