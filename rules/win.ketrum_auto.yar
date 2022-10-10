rule win_ketrum_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ketrum."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ketrum"
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
        $sequence_0 = { 68???????? 50 ffd7 8d85fce3ffff 50 8d85fcebffff }
            // n = 6, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8d85fce3ffff         | lea                 eax, [ebp - 0x1c04]
            //   50                   | push                eax
            //   8d85fcebffff         | lea                 eax, [ebp - 0x1404]

        $sequence_1 = { c1f805 8d0485a0bc6200 83e31f 8985e4efffff 8b00 c1e306 }
            // n = 6, score = 200
            //   c1f805               | sar                 eax, 5
            //   8d0485a0bc6200       | lea                 eax, [eax*4 + 0x62bca0]
            //   83e31f               | and                 ebx, 0x1f
            //   8985e4efffff         | mov                 dword ptr [ebp - 0x101c], eax
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   c1e306               | shl                 ebx, 6

        $sequence_2 = { ffb5f4cbffff ffb5f0cbffff ff15???????? ffb5f0cbffff ff15???????? }
            // n = 5, score = 200
            //   ffb5f4cbffff         | push                dword ptr [ebp - 0x340c]
            //   ffb5f0cbffff         | push                dword ptr [ebp - 0x3410]
            //   ff15????????         |                     
            //   ffb5f0cbffff         | push                dword ptr [ebp - 0x3410]
            //   ff15????????         |                     

        $sequence_3 = { ff75fc ffd6 33c0 e9???????? }
            // n = 4, score = 200
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd6                 | call                esi
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_4 = { ff7508 ff5024 3b45e4 7504 3bd3 }
            // n = 5, score = 200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff5024               | call                dword ptr [eax + 0x24]
            //   3b45e4               | cmp                 eax, dword ptr [ebp - 0x1c]
            //   7504                 | jne                 6
            //   3bd3                 | cmp                 edx, ebx

        $sequence_5 = { 8b45f8 889878bb5200 0f85aa000000 bf???????? 57 56 e8???????? }
            // n = 7, score = 200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   889878bb5200         | mov                 byte ptr [eax + 0x52bb78], bl
            //   0f85aa000000         | jne                 0xb0
            //   bf????????           |                     
            //   57                   | push                edi
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_6 = { 8985ecbfffff 8d85e4bfffff 50 57 }
            // n = 4, score = 200
            //   8985ecbfffff         | mov                 dword ptr [ebp - 0x4014], eax
            //   8d85e4bfffff         | lea                 eax, [ebp - 0x401c]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_7 = { 53 8d855cfbffff 50 53 68???????? }
            // n = 5, score = 200
            //   53                   | push                ebx
            //   8d855cfbffff         | lea                 eax, [ebp - 0x4a4]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_8 = { 77e8 ff2485f1724000 43 ebde 8b4d08 }
            // n = 5, score = 100
            //   77e8                 | ja                  0xffffffea
            //   ff2485f1724000       | jmp                 dword ptr [eax*4 + 0x4072f1]
            //   43                   | inc                 ebx
            //   ebde                 | jmp                 0xffffffe0
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_9 = { 50 6a26 ffb538efffff ff15???????? 85c0 750c }
            // n = 6, score = 100
            //   50                   | push                eax
            //   6a26                 | push                0x26
            //   ffb538efffff         | push                dword ptr [ebp - 0x10c8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe

        $sequence_10 = { 50 895dfc ffb570feffff 8b35???????? ffb568feffff }
            // n = 5, score = 100
            //   50                   | push                eax
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   ffb570feffff         | push                dword ptr [ebp - 0x190]
            //   8b35????????         |                     
            //   ffb568feffff         | push                dword ptr [ebp - 0x198]

        $sequence_11 = { 68???????? 8d742414 e8???????? 53 68???????? 83c8ff }
            // n = 6, score = 100
            //   68????????           |                     
            //   8d742414             | lea                 esi, [esp + 0x14]
            //   e8????????           |                     
            //   53                   | push                ebx
            //   68????????           |                     
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_12 = { 33ff 8d75d4 e8???????? 8b45c8 e8???????? }
            // n = 5, score = 100
            //   33ff                 | xor                 edi, edi
            //   8d75d4               | lea                 esi, [ebp - 0x2c]
            //   e8????????           |                     
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   e8????????           |                     

        $sequence_13 = { ffb524efffff 8d7b58 57 e8???????? 33c0 }
            // n = 5, score = 100
            //   ffb524efffff         | push                dword ptr [ebp - 0x10dc]
            //   8d7b58               | lea                 edi, [ebx + 0x58]
            //   57                   | push                edi
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax

        $sequence_14 = { e8???????? 6a01 8d7528 e8???????? 8b8560e7ffff }
            // n = 5, score = 100
            //   e8????????           |                     
            //   6a01                 | push                1
            //   8d7528               | lea                 esi, [ebp + 0x28]
            //   e8????????           |                     
            //   8b8560e7ffff         | mov                 eax, dword ptr [ebp - 0x18a0]

        $sequence_15 = { e8???????? 8975fc 83bd88efffff08 8b8574efffff }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   83bd88efffff08       | cmp                 dword ptr [ebp - 0x1078], 8
            //   8b8574efffff         | mov                 eax, dword ptr [ebp - 0x108c]

    condition:
        7 of them and filesize < 4599808
}