rule win_scarabey_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.scarabey."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.scarabey"
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
        $sequence_0 = { 75d0 8d8df4fcffff c645fc00 c785f4fcffffa42d5300 e8???????? 834dfcff }
            // n = 6, score = 100
            //   75d0                 | jne                 0xffffffd2
            //   8d8df4fcffff         | lea                 ecx, [ebp - 0x30c]
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   c785f4fcffffa42d5300     | mov    dword ptr [ebp - 0x30c], 0x532da4
            //   e8????????           |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff

        $sequence_1 = { 83f808 0f876e010000 53 ff248516094f00 33db eb10 33db }
            // n = 7, score = 100
            //   83f808               | cmp                 eax, 8
            //   0f876e010000         | ja                  0x174
            //   53                   | push                ebx
            //   ff248516094f00       | jmp                 dword ptr [eax*4 + 0x4f0916]
            //   33db                 | xor                 ebx, ebx
            //   eb10                 | jmp                 0x12
            //   33db                 | xor                 ebx, ebx

        $sequence_2 = { 8b03 3b70f8 7fbd 8970f4 8b03 5d 5f }
            // n = 7, score = 100
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   3b70f8               | cmp                 esi, dword ptr [eax - 8]
            //   7fbd                 | jg                  0xffffffbf
            //   8970f4               | mov                 dword ptr [eax - 0xc], esi
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   5d                   | pop                 ebp
            //   5f                   | pop                 edi

        $sequence_3 = { c745d878025300 e8???????? e8???????? c22000 6a10 }
            // n = 5, score = 100
            //   c745d878025300       | mov                 dword ptr [ebp - 0x28], 0x530278
            //   e8????????           |                     
            //   e8????????           |                     
            //   c22000               | ret                 0x20
            //   6a10                 | push                0x10

        $sequence_4 = { 85c0 7906 d805???????? 83ec08 dd1c24 e8???????? 8b0d???????? }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7906                 | jns                 8
            //   d805????????         |                     
            //   83ec08               | sub                 esp, 8
            //   dd1c24               | fstp                qword ptr [esp]
            //   e8????????           |                     
            //   8b0d????????         |                     

        $sequence_5 = { 6a10 e8???????? 83c404 85c0 742a 8b4e04 8904b9 }
            // n = 7, score = 100
            //   6a10                 | push                0x10
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   742a                 | je                  0x2c
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8904b9               | mov                 dword ptr [ecx + edi*4], eax

        $sequence_6 = { ffd7 56 ffd7 8b85f4d6ffff 50 }
            // n = 5, score = 100
            //   ffd7                 | call                edi
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   8b85f4d6ffff         | mov                 eax, dword ptr [ebp - 0x290c]
            //   50                   | push                eax

        $sequence_7 = { 898524d7ffff ffd3 8b9524d7ffff 682000cc00 6807080000 6a00 6a00 }
            // n = 7, score = 100
            //   898524d7ffff         | mov                 dword ptr [ebp - 0x28dc], eax
            //   ffd3                 | call                ebx
            //   8b9524d7ffff         | mov                 edx, dword ptr [ebp - 0x28dc]
            //   682000cc00           | push                0xcc0020
            //   6807080000           | push                0x807
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_8 = { c745ec60e05300 e8???????? 8bd8 895df0 893d???????? 8b8e200e0000 ff7508 }
            // n = 7, score = 100
            //   c745ec60e05300       | mov                 dword ptr [ebp - 0x14], 0x53e060
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx
            //   893d????????         |                     
            //   8b8e200e0000         | mov                 ecx, dword ptr [esi + 0xe20]
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_9 = { 8985d8d6ffff db85d8d6ffff 7906 dc05???????? dd9d38d6ffff }
            // n = 5, score = 100
            //   8985d8d6ffff         | mov                 dword ptr [ebp - 0x2928], eax
            //   db85d8d6ffff         | fild                dword ptr [ebp - 0x2928]
            //   7906                 | jns                 8
            //   dc05????????         |                     
            //   dd9d38d6ffff         | fstp                qword ptr [ebp - 0x29c8]

    condition:
        7 of them and filesize < 3580928
}