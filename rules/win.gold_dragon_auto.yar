rule win_gold_dragon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.gold_dragon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gold_dragon"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { a3???????? 0f84c4020000 8b15???????? 68???????? 52 ffd6 85c0 }
            // n = 7, score = 100
            //   a3????????           |                     
            //   0f84c4020000         | je                  0x2ca
            //   8b15????????         |                     
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax

        $sequence_1 = { 0fb601 0fb6fa 3bc7 7714 8b55fc 8a9200844000 }
            // n = 6, score = 100
            //   0fb601               | movzx               eax, byte ptr [ecx]
            //   0fb6fa               | movzx               edi, dl
            //   3bc7                 | cmp                 eax, edi
            //   7714                 | ja                  0x16
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8a9200844000         | mov                 dl, byte ptr [edx + 0x408400]

        $sequence_2 = { 0f8412010000 68???????? 50 ffd6 85c0 a3???????? 0f84fd000000 }
            // n = 7, score = 100
            //   0f8412010000         | je                  0x118
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   a3????????           |                     
            //   0f84fd000000         | je                  0x103

        $sequence_3 = { 0f84c7000000 68???????? ffd7 85c0 }
            // n = 4, score = 100
            //   0f84c7000000         | je                  0xcd
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax

        $sequence_4 = { 56 e8???????? 8bc6 83e61f c1f805 59 8b048500954000 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi
            //   83e61f               | and                 esi, 0x1f
            //   c1f805               | sar                 eax, 5
            //   59                   | pop                 ecx
            //   8b048500954000       | mov                 eax, dword ptr [eax*4 + 0x409500]

        $sequence_5 = { 8b0d???????? 68???????? 51 ffd6 85c0 a3???????? 0f845b010000 }
            // n = 7, score = 100
            //   8b0d????????         |                     
            //   68????????           |                     
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   a3????????           |                     
            //   0f845b010000         | je                  0x161

        $sequence_6 = { 8b750c 8b7d08 8d054c914000 83780800 }
            // n = 4, score = 100
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8d054c914000         | lea                 eax, [0x40914c]
            //   83780800             | cmp                 dword ptr [eax + 8], 0

        $sequence_7 = { a3???????? 0f84a2050000 a1???????? 68???????? 50 ffd6 }
            // n = 6, score = 100
            //   a3????????           |                     
            //   0f84a2050000         | je                  0x5a8
            //   a1????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_8 = { a3???????? 0f8490010000 a1???????? 68???????? 50 }
            // n = 5, score = 100
            //   a3????????           |                     
            //   0f8490010000         | je                  0x196
            //   a1????????           |                     
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_9 = { eb26 8d4508 8db64c834000 6a00 50 ff36 }
            // n = 6, score = 100
            //   eb26                 | jmp                 0x28
            //   8d4508               | lea                 eax, [ebp + 8]
            //   8db64c834000         | lea                 esi, [esi + 0x40834c]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff36                 | push                dword ptr [esi]

    condition:
        7 of them and filesize < 90112
}