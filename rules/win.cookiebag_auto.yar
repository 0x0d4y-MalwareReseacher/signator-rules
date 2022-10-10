rule win_cookiebag_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.cookiebag."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cookiebag"
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
        $sequence_0 = { ff15???????? 8b742420 894308 8b44241c 85c0 7618 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8b742420             | mov                 esi, dword ptr [esp + 0x20]
            //   894308               | mov                 dword ptr [ebx + 8], eax
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   85c0                 | test                eax, eax
            //   7618                 | jbe                 0x1a

        $sequence_1 = { 50 e8???????? 8b4c243c 83c410 03c8 51 8b4c2414 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4c243c             | mov                 ecx, dword ptr [esp + 0x3c]
            //   83c410               | add                 esp, 0x10
            //   03c8                 | add                 ecx, eax
            //   51                   | push                ecx
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]

        $sequence_2 = { b910270000 f7f9 52 8d54242c 68???????? 52 e8???????? }
            // n = 7, score = 100
            //   b910270000           | mov                 ecx, 0x2710
            //   f7f9                 | idiv                ecx
            //   52                   | push                edx
            //   8d54242c             | lea                 edx, [esp + 0x2c]
            //   68????????           |                     
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_3 = { b9???????? 8bc2 8bf2 c1f805 83e61f 8b048500484200 8b04f0 }
            // n = 7, score = 100
            //   b9????????           |                     
            //   8bc2                 | mov                 eax, edx
            //   8bf2                 | mov                 esi, edx
            //   c1f805               | sar                 eax, 5
            //   83e61f               | and                 esi, 0x1f
            //   8b048500484200       | mov                 eax, dword ptr [eax*4 + 0x424800]
            //   8b04f0               | mov                 eax, dword ptr [eax + esi*8]

        $sequence_4 = { e8???????? 57 8d4c243c 889c24ac000000 e8???????? 8bc6 e9???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   57                   | push                edi
            //   8d4c243c             | lea                 ecx, [esp + 0x3c]
            //   889c24ac000000       | mov                 byte ptr [esp + 0xac], bl
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   e9????????           |                     

        $sequence_5 = { 7302 8be8 8b74242c 8bca 2bce 3bcd 770b }
            // n = 7, score = 100
            //   7302                 | jae                 4
            //   8be8                 | mov                 ebp, eax
            //   8b74242c             | mov                 esi, dword ptr [esp + 0x2c]
            //   8bca                 | mov                 ecx, edx
            //   2bce                 | sub                 ecx, esi
            //   3bcd                 | cmp                 ecx, ebp
            //   770b                 | ja                  0xd

        $sequence_6 = { 8b15???????? 8d44241c 52 6a00 50 8bce e8???????? }
            // n = 7, score = 100
            //   8b15????????         |                     
            //   8d44241c             | lea                 eax, [esp + 0x1c]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_7 = { 41 006031 41 0023 d18a0688078a 46 018847018a46 }
            // n = 7, score = 100
            //   41                   | inc                 ecx
            //   006031               | add                 byte ptr [eax + 0x31], ah
            //   41                   | inc                 ecx
            //   0023                 | add                 byte ptr [ebx], ah
            //   d18a0688078a         | ror                 dword ptr [edx - 0x75f877fa], 1
            //   46                   | inc                 esi
            //   018847018a46         | add                 dword ptr [eax + 0x468a0147], ecx

        $sequence_8 = { 50 64892500000000 81ec30010000 33c0 55 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   81ec30010000         | sub                 esp, 0x130
            //   33c0                 | xor                 eax, eax
            //   55                   | push                ebp

        $sequence_9 = { e8???????? 8d4c2400 c78424a400000000000000 e8???????? 68???????? e8???????? 83c404 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d4c2400             | lea                 ecx, [esp]
            //   c78424a400000000000000     | mov    dword ptr [esp + 0xa4], 0
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

    condition:
        7 of them and filesize < 311296
}