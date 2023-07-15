rule win_atmii_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.atmii."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmii"
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
        $sequence_0 = { 51 ffd6 83c420 8d9d00feffff }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   83c420               | add                 esp, 0x20
            //   8d9d00feffff         | lea                 ebx, [ebp - 0x200]

        $sequence_1 = { 55 8bec 81ec04040000 53 56 6a04 }
            // n = 6, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec04040000         | sub                 esp, 0x404
            //   53                   | push                ebx
            //   56                   | push                esi
            //   6a04                 | push                4

        $sequence_2 = { eb0d b8???????? 2bc7 83e805 8945ed }
            // n = 5, score = 100
            //   eb0d                 | jmp                 0xf
            //   b8????????           |                     
            //   2bc7                 | sub                 eax, edi
            //   83e805               | sub                 eax, 5
            //   8945ed               | mov                 dword ptr [ebp - 0x13], eax

        $sequence_3 = { e8???????? 5f 8bc6 5e c605????????01 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   c605????????01       |                     

        $sequence_4 = { 8b5604 68???????? 52 ffd7 85c0 }
            // n = 5, score = 100
            //   8b5604               | mov                 edx, dword ptr [esi + 4]
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax

        $sequence_5 = { c3 68???????? 680b010000 8d9500fcffff 68???????? 52 ff15???????? }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   68????????           |                     
            //   680b010000           | push                0x10b
            //   8d9500fcffff         | lea                 edx, [ebp - 0x400]
            //   68????????           |                     
            //   52                   | push                edx
            //   ff15????????         |                     

        $sequence_6 = { 83c414 8b55f8 52 68???????? 68a0000000 8d85dcfbffff 68???????? }
            // n = 7, score = 100
            //   83c414               | add                 esp, 0x14
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx
            //   68????????           |                     
            //   68a0000000           | push                0xa0
            //   8d85dcfbffff         | lea                 eax, [ebp - 0x424]
            //   68????????           |                     

        $sequence_7 = { 0f8456010000 68???????? 68cb000000 8d95fcf7ffff }
            // n = 4, score = 100
            //   0f8456010000         | je                  0x15c
            //   68????????           |                     
            //   68cb000000           | push                0xcb
            //   8d95fcf7ffff         | lea                 edx, [ebp - 0x804]

        $sequence_8 = { 83c414 8b4df8 51 68???????? 68b0000000 8d95dcfbffff 68???????? }
            // n = 7, score = 100
            //   83c414               | add                 esp, 0x14
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   68????????           |                     
            //   68b0000000           | push                0xb0
            //   8d95dcfbffff         | lea                 edx, [ebp - 0x424]
            //   68????????           |                     

        $sequence_9 = { 2bd1 83ea05 8955ed 53 57 }
            // n = 5, score = 100
            //   2bd1                 | sub                 edx, ecx
            //   83ea05               | sub                 edx, 5
            //   8955ed               | mov                 dword ptr [ebp - 0x13], edx
            //   53                   | push                ebx
            //   57                   | push                edi

        $sequence_10 = { 8d95dcfbffff 52 e8???????? 83c414 56 }
            // n = 5, score = 100
            //   8d95dcfbffff         | lea                 edx, [ebp - 0x424]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   56                   | push                esi

        $sequence_11 = { 50 68???????? 68???????? ffd7 8b4e10 68???????? 51 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]
            //   68????????           |                     
            //   51                   | push                ecx

        $sequence_12 = { 7738 ff2485401d0010 68???????? 8d8d38ffffff 51 }
            // n = 5, score = 100
            //   7738                 | ja                  0x3a
            //   ff2485401d0010       | jmp                 dword ptr [eax*4 + 0x10001d40]
            //   68????????           |                     
            //   8d8d38ffffff         | lea                 ecx, [ebp - 0xc8]
            //   51                   | push                ecx

        $sequence_13 = { 8d8500fcffff 68???????? 50 ffd3 8d8d00fcffff }
            // n = 5, score = 100
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8d8d00fcffff         | lea                 ecx, [ebp - 0x400]

        $sequence_14 = { 57 8d45f4 50 6810270000 33db }
            // n = 5, score = 100
            //   57                   | push                edi
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   50                   | push                eax
            //   6810270000           | push                0x2710
            //   33db                 | xor                 ebx, ebx

    condition:
        7 of them and filesize < 49152
}