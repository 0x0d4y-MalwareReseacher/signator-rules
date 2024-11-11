rule win_penco_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.penco."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.penco"
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
        $sequence_0 = { ff15???????? 8d8da0fdffff 51 ff15???????? 50 6a16 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8d8da0fdffff         | lea                 ecx, [ebp - 0x260]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   50                   | push                eax
            //   6a16                 | push                0x16

        $sequence_1 = { ff15???????? 8bf0 8975d8 3bf3 7e39 8d8d00010000 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8975d8               | mov                 dword ptr [ebp - 0x28], esi
            //   3bf3                 | cmp                 esi, ebx
            //   7e39                 | jle                 0x3b
            //   8d8d00010000         | lea                 ecx, [ebp + 0x100]

        $sequence_2 = { 3b05???????? 731a 8bc8 83e01f c1f905 8b0c8d00263500 }
            // n = 6, score = 100
            //   3b05????????         |                     
            //   731a                 | jae                 0x1c
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d00263500       | mov                 ecx, dword ptr [ecx*4 + 0x352600]

        $sequence_3 = { 330cb500d03400 8b701c 330f 334810 33d1 894820 8b4818 }
            // n = 7, score = 100
            //   330cb500d03400       | xor                 ecx, dword ptr [esi*4 + 0x34d000]
            //   8b701c               | mov                 esi, dword ptr [eax + 0x1c]
            //   330f                 | xor                 ecx, dword ptr [edi]
            //   334810               | xor                 ecx, dword ptr [eax + 0x10]
            //   33d1                 | xor                 edx, ecx
            //   894820               | mov                 dword ptr [eax + 0x20], ecx
            //   8b4818               | mov                 ecx, dword ptr [eax + 0x18]

        $sequence_4 = { 50 6802020000 ff15???????? 85c0 7408 83c8ff e9???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   83c8ff               | or                  eax, 0xffffffff
            //   e9????????           |                     

        $sequence_5 = { 8b1d???????? ffd3 3bc7 0f8413010000 8b4d08 898148030000 89b94c030000 }
            // n = 7, score = 100
            //   8b1d????????         |                     
            //   ffd3                 | call                ebx
            //   3bc7                 | cmp                 eax, edi
            //   0f8413010000         | je                  0x119
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   898148030000         | mov                 dword ptr [ecx + 0x348], eax
            //   89b94c030000         | mov                 dword ptr [ecx + 0x34c], edi

        $sequence_6 = { 337004 c1eb10 89742414 0fb6f3 8b34b528f83400 }
            // n = 5, score = 100
            //   337004               | xor                 esi, dword ptr [eax + 4]
            //   c1eb10               | shr                 ebx, 0x10
            //   89742414             | mov                 dword ptr [esp + 0x14], esi
            //   0fb6f3               | movzx               esi, bl
            //   8b34b528f83400       | mov                 esi, dword ptr [esi*4 + 0x34f828]

        $sequence_7 = { 8985bcfdffff 8b5508 81c280000000 52 8d85d8fdffff 50 ff15???????? }
            // n = 7, score = 100
            //   8985bcfdffff         | mov                 dword ptr [ebp - 0x244], eax
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   81c280000000         | add                 edx, 0x80
            //   52                   | push                edx
            //   8d85d8fdffff         | lea                 eax, [ebp - 0x228]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_8 = { 8975e4 8d8d0c020000 51 ffd7 3bf0 }
            // n = 5, score = 100
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   8d8d0c020000         | lea                 ecx, [ebp + 0x20c]
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   3bf0                 | cmp                 esi, eax

        $sequence_9 = { 83c40c 8b8554beffff 69c0c4020000 c784059c96ffff4d000000 e9???????? c7851c94ffff00000000 b901000000 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8b8554beffff         | mov                 eax, dword ptr [ebp - 0x41ac]
            //   69c0c4020000         | imul                eax, eax, 0x2c4
            //   c784059c96ffff4d000000     | mov    dword ptr [ebp + eax - 0x6964], 0x4d
            //   e9????????           |                     
            //   c7851c94ffff00000000     | mov    dword ptr [ebp - 0x6be4], 0
            //   b901000000           | mov                 ecx, 1

    condition:
        7 of them and filesize < 319488
}