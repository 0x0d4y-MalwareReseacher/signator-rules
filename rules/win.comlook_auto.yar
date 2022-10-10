rule win_comlook_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.comlook."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.comlook"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8b45bc 8b88c0030000 8b55d8 8b01 8902 837dc000 7448 }
            // n = 7, score = 100
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]
            //   8b88c0030000         | mov                 ecx, dword ptr [eax + 0x3c0]
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8902                 | mov                 dword ptr [edx], eax
            //   837dc000             | cmp                 dword ptr [ebp - 0x40], 0
            //   7448                 | je                  0x4a

        $sequence_1 = { ebd8 8b4df8 51 8b5510 52 e8???????? 83c408 }
            // n = 7, score = 100
            //   ebd8                 | jmp                 0xffffffda
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_2 = { e8???????? 8b4afc 33c8 e8???????? b8???????? e9???????? 8b8dd0fbffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4afc               | mov                 ecx, dword ptr [edx - 4]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     
            //   b8????????           |                     
            //   e9????????           |                     
            //   8b8dd0fbffff         | mov                 ecx, dword ptr [ebp - 0x430]

        $sequence_3 = { e9???????? 8b5508 8b8248030000 8b4840 83e103 0f84af000000 837dc004 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b8248030000         | mov                 eax, dword ptr [edx + 0x348]
            //   8b4840               | mov                 ecx, dword ptr [eax + 0x40]
            //   83e103               | and                 ecx, 3
            //   0f84af000000         | je                  0xb5
            //   837dc004             | cmp                 dword ptr [ebp - 0x40], 4

        $sequence_4 = { e9???????? e9???????? 83bd54fdffff00 752a 0fb695a1fdffff 83fa01 751e }
            // n = 7, score = 100
            //   e9????????           |                     
            //   e9????????           |                     
            //   83bd54fdffff00       | cmp                 dword ptr [ebp - 0x2ac], 0
            //   752a                 | jne                 0x2c
            //   0fb695a1fdffff       | movzx               edx, byte ptr [ebp - 0x25f]
            //   83fa01               | cmp                 edx, 1
            //   751e                 | jne                 0x20

        $sequence_5 = { e8???????? 85c0 7504 33c0 eb05 b801000000 52 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb05                 | jmp                 7
            //   b801000000           | mov                 eax, 1
            //   52                   | push                edx

        $sequence_6 = { e8???????? 85c0 751d 8b450c 50 8b4d0c 51 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx

        $sequence_7 = { e8???????? 8bf0 8d55cc 52 8d854cffffff 68???????? 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8d55cc               | lea                 edx, [ebp - 0x34]
            //   52                   | push                edx
            //   8d854cffffff         | lea                 eax, [ebp - 0xb4]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_8 = { 8b4df8 c7815801000001000000 eb1b 68???????? 8b55f8 52 e8???????? }
            // n = 7, score = 100
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   c7815801000001000000     | mov    dword ptr [ecx + 0x158], 1
            //   eb1b                 | jmp                 0x1d
            //   68????????           |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_9 = { e9???????? 837dcc00 7402 eb6b 837d8c00 751a 68???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   837dcc00             | cmp                 dword ptr [ebp - 0x34], 0
            //   7402                 | je                  4
            //   eb6b                 | jmp                 0x6d
            //   837d8c00             | cmp                 dword ptr [ebp - 0x74], 0
            //   751a                 | jne                 0x1c
            //   68????????           |                     

    condition:
        7 of them and filesize < 4553728
}