rule win_skyplex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.skyplex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.skyplex"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 83c408 85c0 0f85d0000000 68???????? 8d85b0f9ffff }
            // n = 5, score = 100
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f85d0000000         | jne                 0xd6
            //   68????????           |                     
            //   8d85b0f9ffff         | lea                 eax, dword ptr [ebp - 0x650]

        $sequence_1 = { 752b e8???????? 0fb6d0 85d2 751f e8???????? }
            // n = 6, score = 100
            //   752b                 | jne                 0x2d
            //   e8????????           |                     
            //   0fb6d0               | movzx               edx, al
            //   85d2                 | test                edx, edx
            //   751f                 | jne                 0x21
            //   e8????????           |                     

        $sequence_2 = { 50 e8???????? 6a00 8b4df8 51 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a00                 | push                0
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx

        $sequence_3 = { 83c408 85c0 7448 68???????? 8d8d38f7ffff }
            // n = 5, score = 100
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7448                 | je                  0x4a
            //   68????????           |                     
            //   8d8d38f7ffff         | lea                 ecx, dword ptr [ebp - 0x8c8]

        $sequence_4 = { 33f6 33c0 0fbe84c158564100 6a07 c1f804 59 898594fdffff }
            // n = 7, score = 100
            //   33f6                 | xor                 esi, esi
            //   33c0                 | xor                 eax, eax
            //   0fbe84c158564100     | movsx               eax, byte ptr [ecx + eax*8 + 0x415658]
            //   6a07                 | push                7
            //   c1f804               | sar                 eax, 4
            //   59                   | pop                 ecx
            //   898594fdffff         | mov                 dword ptr [ebp - 0x26c], eax

        $sequence_5 = { 6a01 ff15???????? c78544f6ffff01000000 eb0f 8b8d44f6ffff }
            // n = 5, score = 100
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   c78544f6ffff01000000     | mov    dword ptr [ebp - 0x9bc], 1
            //   eb0f                 | jmp                 0x11
            //   8b8d44f6ffff         | mov                 ecx, dword ptr [ebp - 0x9bc]

        $sequence_6 = { 52 ff15???????? 83c410 c78560f6ffff00000000 }
            // n = 4, score = 100
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   c78560f6ffff00000000     | mov    dword ptr [ebp - 0x9a0], 0

        $sequence_7 = { 8d9530ffffff 52 ff15???????? c7852cffffff00000000 eb0f }
            // n = 5, score = 100
            //   8d9530ffffff         | lea                 edx, dword ptr [ebp - 0xd0]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   c7852cffffff00000000     | mov    dword ptr [ebp - 0xd4], 0
            //   eb0f                 | jmp                 0x11

        $sequence_8 = { 7430 68???????? 8d9538f7ffff 52 e8???????? 83c408 85c0 }
            // n = 7, score = 100
            //   7430                 | je                  0x32
            //   68????????           |                     
            //   8d9538f7ffff         | lea                 edx, dword ptr [ebp - 0x8c8]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_9 = { 83c408 8945fc 837dfc00 0f8491000000 6880000000 8d85e8fdffff }
            // n = 6, score = 100
            //   83c408               | add                 esp, 8
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   0f8491000000         | je                  0x97
            //   6880000000           | push                0x80
            //   8d85e8fdffff         | lea                 eax, dword ptr [ebp - 0x218]

    condition:
        7 of them and filesize < 262144
}