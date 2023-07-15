rule win_yakuza_ransomware_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.yakuza_ransomware."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.yakuza_ransomware"
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
        $sequence_0 = { e8???????? 8d45b0 50 8d4be0 e8???????? 8b4dbc 394db8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d45b0               | lea                 eax, [ebp - 0x50]
            //   50                   | push                eax
            //   8d4be0               | lea                 ecx, [ebx - 0x20]
            //   e8????????           |                     
            //   8b4dbc               | mov                 ecx, dword ptr [ebp - 0x44]
            //   394db8               | cmp                 dword ptr [ebp - 0x48], ecx

        $sequence_1 = { e9???????? 8d8dd0fbffff e9???????? 8b8de0fbffff 83c104 e9???????? 8d8dc8feffff }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8d8dd0fbffff         | lea                 ecx, [ebp - 0x430]
            //   e9????????           |                     
            //   8b8de0fbffff         | mov                 ecx, dword ptr [ebp - 0x420]
            //   83c104               | add                 ecx, 4
            //   e9????????           |                     
            //   8d8dc8feffff         | lea                 ecx, [ebp - 0x138]

        $sequence_2 = { eb05 e8???????? 50 8d8d98feffff e8???????? 8d8598feffff c645fc22 }
            // n = 7, score = 100
            //   eb05                 | jmp                 7
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d8d98feffff         | lea                 ecx, [ebp - 0x168]
            //   e8????????           |                     
            //   8d8598feffff         | lea                 eax, [ebp - 0x168]
            //   c645fc22             | mov                 byte ptr [ebp - 4], 0x22

        $sequence_3 = { e8???????? 83c40c 8945e4 85c0 0f84f2000000 8bc6 8d7008 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   85c0                 | test                eax, eax
            //   0f84f2000000         | je                  0xf8
            //   8bc6                 | mov                 eax, esi
            //   8d7008               | lea                 esi, [eax + 8]

        $sequence_4 = { e8???????? 6a00 6a00 56 68???????? 6800000200 6a00 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   68????????           |                     
            //   6800000200           | push                0x20000
            //   6a00                 | push                0

        $sequence_5 = { e8???????? 83c618 83c404 3bf3 75ee 8b37 8b4708 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c618               | add                 esi, 0x18
            //   83c404               | add                 esp, 4
            //   3bf3                 | cmp                 esi, ebx
            //   75ee                 | jne                 0xfffffff0
            //   8b37                 | mov                 esi, dword ptr [edi]
            //   8b4708               | mov                 eax, dword ptr [edi + 8]

        $sequence_6 = { eb05 1bc0 83c801 85c0 0f85ee000000 f6460801 0f848a000000 }
            // n = 7, score = 100
            //   eb05                 | jmp                 7
            //   1bc0                 | sbb                 eax, eax
            //   83c801               | or                  eax, 1
            //   85c0                 | test                eax, eax
            //   0f85ee000000         | jne                 0xf4
            //   f6460801             | test                byte ptr [esi + 8], 1
            //   0f848a000000         | je                  0x90

        $sequence_7 = { e8???????? 6a30 56 8d4dbc e8???????? c745bc18424d00 c745c0d0424d00 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a30                 | push                0x30
            //   56                   | push                esi
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   e8????????           |                     
            //   c745bc18424d00       | mov                 dword ptr [ebp - 0x44], 0x4d4218
            //   c745c0d0424d00       | mov                 dword ptr [ebp - 0x40], 0x4d42d0

        $sequence_8 = { 8d8d1cffffff e9???????? 8d4ddc e9???????? 8d8d7cffffff e9???????? 8d8d00ffffff }
            // n = 7, score = 100
            //   8d8d1cffffff         | lea                 ecx, [ebp - 0xe4]
            //   e9????????           |                     
            //   8d4ddc               | lea                 ecx, [ebp - 0x24]
            //   e9????????           |                     
            //   8d8d7cffffff         | lea                 ecx, [ebp - 0x84]
            //   e9????????           |                     
            //   8d8d00ffffff         | lea                 ecx, [ebp - 0x100]

        $sequence_9 = { 0fb6c8 8b470c f6044848 7509 c745fcffffffff eb36 8b06 }
            // n = 7, score = 100
            //   0fb6c8               | movzx               ecx, al
            //   8b470c               | mov                 eax, dword ptr [edi + 0xc]
            //   f6044848             | test                byte ptr [eax + ecx*2], 0x48
            //   7509                 | jne                 0xb
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   eb36                 | jmp                 0x38
            //   8b06                 | mov                 eax, dword ptr [esi]

    condition:
        7 of them and filesize < 2811904
}