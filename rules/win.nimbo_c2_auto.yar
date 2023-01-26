rule win_nimbo_c2_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.nimbo_c2."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nimbo_c2"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 4c89c9 e8???????? eb82 e8???????? 488b05???????? 488b8d68feffff ff10 }
            // n = 7, score = 300
            //   4c89c9               | mov                 dword ptr [esp + 0xb4], 0x11
            //   e8????????           |                     
            //   eb82                 | inc                 esp
            //   e8????????           |                     
            //   488b05????????       |                     
            //   488b8d68feffff       | mov                 ebx, ecx
            //   ff10                 | dec                 eax

        $sequence_1 = { 4889d9 e8???????? 4a8d1427 4889d9 4989c0 e8???????? 4885c0 }
            // n = 7, score = 300
            //   4889d9               | dec                 esp
            //   e8????????           |                     
            //   4a8d1427             | mov                 ecx, esp
            //   4889d9               | dec                 esp
            //   4989c0               | mov                 ecx, edi
            //   e8????????           |                     
            //   4885c0               | dec                 eax

        $sequence_2 = { 488b4330 4883c420 5b c3 4154 4883ec30 80794c00 }
            // n = 7, score = 300
            //   488b4330             | dec                 eax
            //   4883c420             | mov                 eax, edi
            //   5b                   | dec                 eax
            //   c3                   | add                 esp, 0x28
            //   4154                 | pop                 ebx
            //   4883ec30             | jmp                 0x253
            //   80794c00             | dec                 eax

        $sequence_3 = { eb36 4889da 48c1fa06 83cac0 eb4c 4881fbffff1000 }
            // n = 6, score = 300
            //   eb36                 | dec                 eax
            //   4889da               | mov                 dword ptr [esp + 0x28], 0
            //   48c1fa06             | dec                 esp
            //   83cac0               | mov                 dword ptr [ebp - 0x148], eax
            //   eb4c                 | dec                 esp
            //   4881fbffff1000       | mov                 dword ptr [ebp - 0x140], ecx

        $sequence_4 = { e8???????? 4c89e9 4889c2 e8???????? 4c8b542428 4981feff7f0000 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   4c89e9               | dec                 ecx
            //   4889c2               | mov                 eax, dword ptr [ebp]
            //   e8????????           |                     
            //   4c8b542428           | dec                 eax
            //   4981feff7f0000       | add                 ecx, eax

        $sequence_5 = { eb1c e8???????? c685effeffff00 48c785f8feffff00000000 e8???????? 8a85effeffff 4881c450010000 }
            // n = 7, score = 300
            //   eb1c                 | lea                 eax, [0x63809]
            //   e8????????           |                     
            //   c685effeffff00       | dec                 eax
            //   48c785f8feffff00000000     | lea    eax, [0xffffcc49]
            //   e8????????           |                     
            //   8a85effeffff         | dec                 eax
            //   4881c450010000       | lea                 eax, [0x63649]

        $sequence_6 = { 4c89e7 4c89ee f3a4 4883c448 5b 5e 5f }
            // n = 7, score = 300
            //   4c89e7               | inc                 esp
            //   4c89ee               | jmp                 0x3c1
            //   f3a4                 | inc                 ebp
            //   4883c448             | xor                 esi, esi
            //   5b                   | dec                 eax
            //   5e                   | lea                 edx, [eax - 1]
            //   5f                   | dec                 eax

        $sequence_7 = { ff9090000000 8905???????? 85c0 0f85fd010000 488d8dd0fcffff e8???????? 488d8de0fcffff }
            // n = 7, score = 300
            //   ff9090000000         | dec                 eax
            //   8905????????         |                     
            //   85c0                 | lea                 ecx, [0x2c4ee]
            //   0f85fd010000         | dec                 eax
            //   488d8dd0fcffff       | lea                 ecx, [0x2c4c2]
            //   e8????????           |                     
            //   488d8de0fcffff       | dec                 eax

        $sequence_8 = { 7d0d 458a0c10 44880c11 48ffc2 ebee 4883c438 5b }
            // n = 7, score = 300
            //   7d0d                 | or                  esp, 0xffffffff
            //   458a0c10             | dec                 eax
            //   44880c11             | test                edi, edi
            //   48ffc2               | je                  0x56c
            //   ebee                 | dec                 eax
            //   4883c438             | mov                 esi, dword ptr [edi]
            //   5b                   | dec                 eax

        $sequence_9 = { e8???????? 84c0 7527 4c89e1 e8???????? 48894308 48ffc0 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   84c0                 | inc                 esp
            //   7527                 | mov                 eax, dword ptr [ebx + 0x10]
            //   4c89e1               | call                dword ptr [eax]
            //   e8????????           |                     
            //   48894308             | test                eax, eax
            //   48ffc0               | je                  0xf7

    condition:
        7 of them and filesize < 1076224
}