rule win_pss_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.pss."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pss"
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
        $sequence_0 = { 8d48fe e8???????? e9???????? 83f811 }
            // n = 4, score = 300
            //   8d48fe               | lea                 ecx, [eax - 2]
            //   e8????????           |                     
            //   e9????????           |                     
            //   83f811               | cmp                 eax, 0x11

        $sequence_1 = { ff15???????? 83ceff 3bc6 7504 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   83ceff               | or                  esi, 0xffffffff
            //   3bc6                 | cmp                 eax, esi
            //   7504                 | jne                 6

        $sequence_2 = { 7437 ff15???????? 3de5030000 752a }
            // n = 4, score = 300
            //   7437                 | je                  0x39
            //   ff15????????         |                     
            //   3de5030000           | cmp                 eax, 0x3e5
            //   752a                 | jne                 0x2c

        $sequence_3 = { 85c0 745f 6a00 6a00 6a01 57 ff15???????? }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   745f                 | je                  0x61
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_4 = { 6a00 6a01 8d4dd8 c645fc03 e8???????? 8bb574ffffff 3bdf }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   e8????????           |                     
            //   8bb574ffffff         | mov                 esi, dword ptr [ebp - 0x8c]
            //   3bdf                 | cmp                 ebx, edi

        $sequence_5 = { 8d4dc4 c74518a4750110 e8???????? 68???????? 8d45c4 50 c745c49c750110 }
            // n = 7, score = 200
            //   8d4dc4               | lea                 ecx, [ebp - 0x3c]
            //   c74518a4750110       | mov                 dword ptr [ebp + 0x18], 0x100175a4
            //   e8????????           |                     
            //   68????????           |                     
            //   8d45c4               | lea                 eax, [ebp - 0x3c]
            //   50                   | push                eax
            //   c745c49c750110       | mov                 dword ptr [ebp - 0x3c], 0x1001759c

        $sequence_6 = { 57 7409 51 ff15???????? eb0a }
            // n = 5, score = 200
            //   57                   | push                edi
            //   7409                 | je                  0xb
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   eb0a                 | jmp                 0xc

        $sequence_7 = { 85c0 7507 50 ff15???????? e8???????? 8d542410 }
            // n = 6, score = 200
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   e8????????           |                     
            //   8d542410             | lea                 edx, [esp + 0x10]

        $sequence_8 = { 8d58ef 4032ff ff15???????? 488d1c9b 498d34de }
            // n = 5, score = 100
            //   8d58ef               | add                 edx, eax
            //   4032ff               | dec                 eax
            //   ff15????????         |                     
            //   488d1c9b             | mov                 dword ptr [ebp + 0xbb0], edx
            //   498d34de             | dec                 eax

        $sequence_9 = { 488d0db0ef0000 e8???????? 90 8bcb }
            // n = 4, score = 100
            //   488d0db0ef0000       | dec                 eax
            //   e8????????           |                     
            //   90                   | lea                 ebx, [ebx + ebx*4]
            //   8bcb                 | dec                 ecx

        $sequence_10 = { 4863d1 488d0de87d0100 488bc2 83e21f }
            // n = 4, score = 100
            //   4863d1               | dec                 eax
            //   488d0de87d0100       | arpl                cx, dx
            //   488bc2               | dec                 eax
            //   83e21f               | lea                 ecx, [0x17de8]

        $sequence_11 = { 4803d0 488995b00b0000 488d9570050000 488bc2 }
            // n = 4, score = 100
            //   4803d0               | dec                 eax
            //   488995b00b0000       | mov                 eax, edx
            //   488d9570050000       | and                 edx, 0x1f
            //   488bc2               | dec                 eax

        $sequence_12 = { 57 4883ec20 488d1d4f550100 488d3d48550100 eb0e 488b03 }
            // n = 6, score = 100
            //   57                   | lea                 edx, [ebp + 0x570]
            //   4883ec20             | dec                 eax
            //   488d1d4f550100       | mov                 eax, edx
            //   488d3d48550100       | lea                 ebx, [eax - 0x11]
            //   eb0e                 | inc                 eax
            //   488b03               | xor                 bh, bh

    condition:
        7 of them and filesize < 421888
}