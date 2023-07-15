rule win_olympic_destroyer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.olympic_destroyer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.olympic_destroyer"
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
        $sequence_0 = { 56 33c0 89542414 57 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   33c0                 | xor                 eax, eax
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   57                   | push                edi

        $sequence_1 = { ff75e4 ff15???????? 68???????? bb???????? e8???????? bb???????? }
            // n = 6, score = 100
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff15????????         |                     
            //   68????????           |                     
            //   bb????????           |                     
            //   e8????????           |                     
            //   bb????????           |                     

        $sequence_2 = { 85c0 740e 50 e8???????? 83a660ee550000 59 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   50                   | push                eax
            //   e8????????           |                     
            //   83a660ee550000       | and                 dword ptr [esi + 0x55ee60], 0
            //   59                   | pop                 ecx

        $sequence_3 = { 50 8975f8 ffd3 ff75f8 6a08 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   ffd3                 | call                ebx
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   6a08                 | push                8

        $sequence_4 = { b8???????? c744242400000000 c744241400000000 c7442418d0f25500 c744243800000000 3910 }
            // n = 6, score = 100
            //   b8????????           |                     
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0
            //   c7442418d0f25500     | mov                 dword ptr [esp + 0x18], 0x55f2d0
            //   c744243800000000     | mov                 dword ptr [esp + 0x38], 0
            //   3910                 | cmp                 dword ptr [eax], edx

        $sequence_5 = { 742e 50 6a40 ff15???????? 89442408 85c0 741d }
            // n = 7, score = 100
            //   742e                 | je                  0x30
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   85c0                 | test                eax, eax
            //   741d                 | je                  0x1f

        $sequence_6 = { ff75ec ffd3 85c0 740c 8b45f0 ff700c ff15???????? }
            // n = 7, score = 100
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   740c                 | je                  0xe
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   ff700c               | push                dword ptr [eax + 0xc]
            //   ff15????????         |                     

        $sequence_7 = { 50 68???????? 6a01 56 e8???????? 83c424 ba58000000 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   6a01                 | push                1
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c424               | add                 esp, 0x24
            //   ba58000000           | mov                 edx, 0x58

        $sequence_8 = { 7412 f7c300000040 7506 89742410 eb04 8974240c 8b15???????? }
            // n = 7, score = 100
            //   7412                 | je                  0x14
            //   f7c300000040         | test                ebx, 0x40000000
            //   7506                 | jne                 8
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   eb04                 | jmp                 6
            //   8974240c             | mov                 dword ptr [esp + 0xc], esi
            //   8b15????????         |                     

        $sequence_9 = { 8b85ecefffff 8b8de8efffff 3bc6 7d0c }
            // n = 4, score = 100
            //   8b85ecefffff         | mov                 eax, dword ptr [ebp - 0x1014]
            //   8b8de8efffff         | mov                 ecx, dword ptr [ebp - 0x1018]
            //   3bc6                 | cmp                 eax, esi
            //   7d0c                 | jge                 0xe

        $sequence_10 = { 50 6880000000 e8???????? 83c40c eb5d }
            // n = 5, score = 100
            //   50                   | push                eax
            //   6880000000           | push                0x80
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb5d                 | jmp                 0x5f

        $sequence_11 = { 8d1c2f 3bda 7765 8b442414 8bf7 }
            // n = 5, score = 100
            //   8d1c2f               | lea                 ebx, [edi + ebp]
            //   3bda                 | cmp                 ebx, edx
            //   7765                 | ja                  0x67
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8bf7                 | mov                 esi, edi

        $sequence_12 = { e8???????? 8904bd60ee5500 85c0 7514 6a0c 5e 8975e4 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8904bd60ee5500       | mov                 dword ptr [edi*4 + 0x55ee60], eax
            //   85c0                 | test                eax, eax
            //   7514                 | jne                 0x16
            //   6a0c                 | push                0xc
            //   5e                   | pop                 esi
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi

        $sequence_13 = { 50 6880000000 ff7310 ff15???????? }
            // n = 4, score = 100
            //   50                   | push                eax
            //   6880000000           | push                0x80
            //   ff7310               | push                dword ptr [ebx + 0x10]
            //   ff15????????         |                     

        $sequence_14 = { 89442424 8d54241c 8b842490000000 8d4c2424 8944241c 0fb744242e }
            // n = 6, score = 100
            //   89442424             | mov                 dword ptr [esp + 0x24], eax
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   8b842490000000       | mov                 eax, dword ptr [esp + 0x90]
            //   8d4c2424             | lea                 ecx, [esp + 0x24]
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   0fb744242e           | movzx               eax, word ptr [esp + 0x2e]

        $sequence_15 = { 50 68???????? 8901 ff770c }
            // n = 4, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   8901                 | mov                 dword ptr [ecx], eax
            //   ff770c               | push                dword ptr [edi + 0xc]

        $sequence_16 = { 8975fc 8975f4 8975dc ffd3 ff75fc 8b3d???????? 6a08 }
            // n = 7, score = 100
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   ffd3                 | call                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   8b3d????????         |                     
            //   6a08                 | push                8

        $sequence_17 = { 50 68???????? 6a17 6a00 68???????? 8bf9 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   6a17                 | push                0x17
            //   6a00                 | push                0
            //   68????????           |                     
            //   8bf9                 | mov                 edi, ecx

        $sequence_18 = { 8d5eec 53 ff15???????? 85c0 }
            // n = 4, score = 100
            //   8d5eec               | lea                 ebx, [esi - 0x14]
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_19 = { 53 ff15???????? 53 ff15???????? 33c0 8b4dfc 5f }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   5f                   | pop                 edi

        $sequence_20 = { 50 68???????? 8bd7 8bcb e8???????? 8bd8 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   8bd7                 | mov                 edx, edi
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_21 = { 50 68???????? 6a1b e8???????? 83c410 83fbff 0f8514010000 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   6a1b                 | push                0x1b
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   83fbff               | cmp                 ebx, -1
            //   0f8514010000         | jne                 0x11a

        $sequence_22 = { 50 56 ff15???????? 85c0 742e 6aff }
            // n = 6, score = 100
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   742e                 | je                  0x30
            //   6aff                 | push                -1

    condition:
        7 of them and filesize < 1392640
}