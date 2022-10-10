rule win_chewbacca_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.chewbacca."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chewbacca"
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
        $sequence_0 = { e9???????? 89ee b000 ba02000000 88c1 89f0 e8???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   89ee                 | mov                 esi, ebp
            //   b000                 | mov                 al, 0
            //   ba02000000           | mov                 edx, 2
            //   88c1                 | mov                 cl, al
            //   89f0                 | mov                 eax, esi
            //   e8????????           |                     

        $sequence_1 = { e8???????? 89c6 e9???????? c7042410000000 e8???????? 89c6 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   89c6                 | mov                 esi, eax
            //   e9????????           |                     
            //   c7042410000000       | mov                 dword ptr [esp], 0x10
            //   e8????????           |                     
            //   89c6                 | mov                 esi, eax
            //   85c0                 | test                eax, eax

        $sequence_2 = { e8???????? 8b9560ffffff 8b4508 e8???????? e8???????? a1???????? e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b9560ffffff         | mov                 edx, dword ptr [ebp - 0xa0]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   e8????????           |                     
            //   a1????????           |                     
            //   e8????????           |                     

        $sequence_3 = { e8???????? 8b55c4 8b45f4 83c014 e8???????? e8???????? 8d45c4 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b55c4               | mov                 edx, dword ptr [ebp - 0x3c]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c014               | add                 eax, 0x14
            //   e8????????           |                     
            //   e8????????           |                     
            //   8d45c4               | lea                 eax, [ebp - 0x3c]

        $sequence_4 = { e8???????? c70424???????? e8???????? c744241425fb6400 c744241049036500 c744240ca1050000 89442408 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c70424????????       |                     
            //   e8????????           |                     
            //   c744241425fb6400     | mov                 dword ptr [esp + 0x14], 0x64fb25
            //   c744241049036500     | mov                 dword ptr [esp + 0x10], 0x650349
            //   c744240ca1050000     | mov                 dword ptr [esp + 0xc], 0x5a1
            //   89442408             | mov                 dword ptr [esp + 8], eax

        $sequence_5 = { e8???????? e8???????? 890424 e8???????? 83f801 747b 83f802 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e8????????           |                     
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83f801               | cmp                 eax, 1
            //   747b                 | je                  0x7d
            //   83f802               | cmp                 eax, 2

        $sequence_6 = { eb0c be00000000 eb05 be00000000 89f0 83c410 5b }
            // n = 7, score = 100
            //   eb0c                 | jmp                 0xe
            //   be00000000           | mov                 esi, 0
            //   eb05                 | jmp                 7
            //   be00000000           | mov                 esi, 0
            //   89f0                 | mov                 eax, esi
            //   83c410               | add                 esp, 0x10
            //   5b                   | pop                 ebx

        $sequence_7 = { e8???????? c745d400000000 c745d000000000 c7459c00000000 c745a000000000 c745a400000000 b801000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c745d400000000       | mov                 dword ptr [ebp - 0x2c], 0
            //   c745d000000000       | mov                 dword ptr [ebp - 0x30], 0
            //   c7459c00000000       | mov                 dword ptr [ebp - 0x64], 0
            //   c745a000000000       | mov                 dword ptr [ebp - 0x60], 0
            //   c745a400000000       | mov                 dword ptr [ebp - 0x5c], 0
            //   b801000000           | mov                 eax, 1

        $sequence_8 = { 8b4dfc 8b09 ff5164 eb00 8b45f8 5f 5e }
            // n = 7, score = 100
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   ff5164               | call                dword ptr [ecx + 0x64]
            //   eb00                 | jmp                 2
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_9 = { ff7004 ff30 68ff000000 8d8dd0feffff b800000000 e8???????? 8d8dc4feffff }
            // n = 7, score = 100
            //   ff7004               | push                dword ptr [eax + 4]
            //   ff30                 | push                dword ptr [eax]
            //   68ff000000           | push                0xff
            //   8d8dd0feffff         | lea                 ecx, [ebp - 0x130]
            //   b800000000           | mov                 eax, 0
            //   e8????????           |                     
            //   8d8dc4feffff         | lea                 ecx, [ebp - 0x13c]

    condition:
        7 of them and filesize < 9764864
}