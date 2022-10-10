rule win_taleret_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.taleret."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taleret"
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
        $sequence_0 = { 6a03 68???????? 68???????? 50 51 52 }
            // n = 6, score = 100
            //   6a03                 | push                3
            //   68????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_1 = { 8b4500 8bca 83e103 50 }
            // n = 4, score = 100
            //   8b4500               | mov                 eax, dword ptr [ebp]
            //   8bca                 | mov                 ecx, edx
            //   83e103               | and                 ecx, 3
            //   50                   | push                eax

        $sequence_2 = { 83c305 68???????? 53 ffd6 83c408 85c0 }
            // n = 6, score = 100
            //   83c305               | add                 ebx, 5
            //   68????????           |                     
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_3 = { 8bca 83e103 50 f3a4 8d8c2484000000 53 8d9424ec000000 }
            // n = 7, score = 100
            //   8bca                 | mov                 ecx, edx
            //   83e103               | and                 ecx, 3
            //   50                   | push                eax
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d8c2484000000       | lea                 ecx, [esp + 0x84]
            //   53                   | push                ebx
            //   8d9424ec000000       | lea                 edx, [esp + 0xec]

        $sequence_4 = { 33c0 892a 8d7204 f2ae f7d1 }
            // n = 5, score = 100
            //   33c0                 | xor                 eax, eax
            //   892a                 | mov                 dword ptr [edx], ebp
            //   8d7204               | lea                 esi, [edx + 4]
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_5 = { a4 7c0b 83f840 7d06 8a440444 eb02 }
            // n = 6, score = 100
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   7c0b                 | jl                  0xd
            //   83f840               | cmp                 eax, 0x40
            //   7d06                 | jge                 8
            //   8a440444             | mov                 al, byte ptr [esp + eax + 0x44]
            //   eb02                 | jmp                 4

        $sequence_6 = { 6801000080 ff15???????? 85c0 7416 55 e8???????? 83c404 }
            // n = 7, score = 100
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   55                   | push                ebp
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_7 = { c68424b403000007 e8???????? 68???????? 50 8d442420 c68424b003000008 }
            // n = 6, score = 100
            //   c68424b403000007     | mov                 byte ptr [esp + 0x3b4], 7
            //   e8????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   c68424b003000008     | mov                 byte ptr [esp + 0x3b0], 8

        $sequence_8 = { 68???????? 50 c78424b40300000b000000 e8???????? 68???????? 8d4c2434 50 }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   c78424b40300000b000000     | mov    dword ptr [esp + 0x3b4], 0xb
            //   e8????????           |                     
            //   68????????           |                     
            //   8d4c2434             | lea                 ecx, [esp + 0x34]
            //   50                   | push                eax

        $sequence_9 = { 51 6805000020 57 ff15???????? 85c0 0f85b6000000 6801280000 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   6805000020           | push                0x20000005
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f85b6000000         | jne                 0xbc
            //   6801280000           | push                0x2801

    condition:
        7 of them and filesize < 73728
}