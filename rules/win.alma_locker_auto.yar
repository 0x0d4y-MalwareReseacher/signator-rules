rule win_alma_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.alma_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.alma_locker"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 0f845dffffff 68???????? 8d4d08 e8???????? 68???????? 8bcb e8???????? }
            // n = 7, score = 100
            //   0f845dffffff         | je                  0xffffff63
            //   68????????           |                     
            //   8d4d08               | lea                 ecx, [ebp + 8]
            //   e8????????           |                     
            //   68????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     

        $sequence_1 = { 6a00 52 50 ff510c 8d4db0 c645fc01 8bf8 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff510c               | call                dword ptr [ecx + 0xc]
            //   8d4db0               | lea                 ecx, [ebp - 0x50]
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8bf8                 | mov                 edi, eax

        $sequence_2 = { b9???????? 68???????? e8???????? 68???????? b9???????? c645fc35 e8???????? }
            // n = 7, score = 100
            //   b9????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   68????????           |                     
            //   b9????????           |                     
            //   c645fc35             | mov                 byte ptr [ebp - 4], 0x35
            //   e8????????           |                     

        $sequence_3 = { 837db810 8d8d68feffff 6a00 51 ff75b4 8d45a4 }
            // n = 6, score = 100
            //   837db810             | cmp                 dword ptr [ebp - 0x48], 0x10
            //   8d8d68feffff         | lea                 ecx, [ebp - 0x198]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   ff75b4               | push                dword ptr [ebp - 0x4c]
            //   8d45a4               | lea                 eax, [ebp - 0x5c]

        $sequence_4 = { 6a00 6a00 8d45e4 c745e63a005c00 50 }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   c745e63a005c00       | mov                 dword ptr [ebp - 0x1a], 0x5c003a
            //   50                   | push                eax

        $sequence_5 = { c745fc00000000 8d4508 8b4d1c 83f908 8b5d08 0f43c3 33ff }
            // n = 7, score = 100
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8d4508               | lea                 eax, [ebp + 8]
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   83f908               | cmp                 ecx, 8
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   0f43c3               | cmovae              eax, ebx
            //   33ff                 | xor                 edi, edi

        $sequence_6 = { 83c10c 8b0485e86a0210 03c1 50 ff15???????? }
            // n = 5, score = 100
            //   83c10c               | add                 ecx, 0xc
            //   8b0485e86a0210       | mov                 eax, dword ptr [eax*4 + 0x10026ae8]
            //   03c1                 | add                 eax, ecx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_7 = { 8d8dd0faffff e9???????? 8b542408 8d420c 8b8a2cf9ffff 33c8 e8???????? }
            // n = 7, score = 100
            //   8d8dd0faffff         | lea                 ecx, [ebp - 0x530]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   8b8a2cf9ffff         | mov                 ecx, dword ptr [edx - 0x6d4]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     

        $sequence_8 = { c745e4586e0210 a1???????? eb1a c745e4546e0210 a1???????? eb0c }
            // n = 6, score = 100
            //   c745e4586e0210       | mov                 dword ptr [ebp - 0x1c], 0x10026e58
            //   a1????????           |                     
            //   eb1a                 | jmp                 0x1c
            //   c745e4546e0210       | mov                 dword ptr [ebp - 0x1c], 0x10026e54
            //   a1????????           |                     
            //   eb0c                 | jmp                 0xe

        $sequence_9 = { 50 68???????? b9???????? e8???????? 33c0 c645fc14 33c9 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   b9????????           |                     
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   c645fc14             | mov                 byte ptr [ebp - 4], 0x14
            //   33c9                 | xor                 ecx, ecx

    condition:
        7 of them and filesize < 335872
}