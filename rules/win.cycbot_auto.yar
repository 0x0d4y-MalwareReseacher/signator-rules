rule win_cycbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.cycbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cycbot"
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
        $sequence_0 = { e9???????? be04010000 56 8d85e8feffff 50 68???????? ff15???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   be04010000           | mov                 esi, 0x104
            //   56                   | push                esi
            //   8d85e8feffff         | lea                 eax, [ebp - 0x118]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_1 = { e8???????? 59 8945f0 3bc3 7415 ffb60c010000 8b4d0c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   3bc3                 | cmp                 eax, ebx
            //   7415                 | je                  0x17
            //   ffb60c010000         | push                dword ptr [esi + 0x10c]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_2 = { 899c2454020000 ff15???????? 399c2450020000 7423 6aff ffb42454020000 ffd6 }
            // n = 7, score = 100
            //   899c2454020000       | mov                 dword ptr [esp + 0x254], ebx
            //   ff15????????         |                     
            //   399c2450020000       | cmp                 dword ptr [esp + 0x250], ebx
            //   7423                 | je                  0x25
            //   6aff                 | push                -1
            //   ffb42454020000       | push                dword ptr [esp + 0x254]
            //   ffd6                 | call                esi

        $sequence_3 = { 740f 8b0b 8b16 51 52 50 e8???????? }
            // n = 7, score = 100
            //   740f                 | je                  0x11
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_4 = { eb30 8d51ff 3bc2 7322 8d9b00000000 8b8c85ccfaffff 898c85c8faffff }
            // n = 7, score = 100
            //   eb30                 | jmp                 0x32
            //   8d51ff               | lea                 edx, [ecx - 1]
            //   3bc2                 | cmp                 eax, edx
            //   7322                 | jae                 0x24
            //   8d9b00000000         | lea                 ebx, [ebx]
            //   8b8c85ccfaffff       | mov                 ecx, dword ptr [ebp + eax*4 - 0x534]
            //   898c85c8faffff       | mov                 dword ptr [ebp + eax*4 - 0x538], ecx

        $sequence_5 = { 89b5e8feffff e8???????? 83c40c 53 6a1a 8d85f0feffff 50 }
            // n = 7, score = 100
            //   89b5e8feffff         | mov                 dword ptr [ebp - 0x118], esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   53                   | push                ebx
            //   6a1a                 | push                0x1a
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   50                   | push                eax

        $sequence_6 = { 832000 eb26 ffb5d4eeffff e8???????? 59 ffb5cceeffff ff15???????? }
            // n = 7, score = 100
            //   832000               | and                 dword ptr [eax], 0
            //   eb26                 | jmp                 0x28
            //   ffb5d4eeffff         | push                dword ptr [ebp - 0x112c]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   ffb5cceeffff         | push                dword ptr [ebp - 0x1134]
            //   ff15????????         |                     

        $sequence_7 = { 8b8d7cffffff 83c404 51 33f6 e8???????? 83c404 8bc6 }
            // n = 7, score = 100
            //   8b8d7cffffff         | mov                 ecx, dword ptr [ebp - 0x84]
            //   83c404               | add                 esp, 4
            //   51                   | push                ecx
            //   33f6                 | xor                 esi, esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8bc6                 | mov                 eax, esi

        $sequence_8 = { 8d45e8 50 56 e8???????? 83c408 85c0 750a }
            // n = 7, score = 100
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   750a                 | jne                 0xc

        $sequence_9 = { e8???????? ffb57cdeffff 8bf0 e8???????? 59 89b57cdeffff 8b9584deffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ffb57cdeffff         | push                dword ptr [ebp - 0x2184]
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   89b57cdeffff         | mov                 dword ptr [ebp - 0x2184], esi
            //   8b9584deffff         | mov                 edx, dword ptr [ebp - 0x217c]

    condition:
        7 of them and filesize < 1163264
}