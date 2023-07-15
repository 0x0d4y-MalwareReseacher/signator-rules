rule win_fatal_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.fatal_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fatal_rat"
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
        $sequence_0 = { c685a0fdffff76 c685a1fdffff63 c685a2fdffff2e c685a3fdffff65 c685a4fdffff78 }
            // n = 5, score = 100
            //   c685a0fdffff76       | mov                 byte ptr [ebp - 0x260], 0x76
            //   c685a1fdffff63       | mov                 byte ptr [ebp - 0x25f], 0x63
            //   c685a2fdffff2e       | mov                 byte ptr [ebp - 0x25e], 0x2e
            //   c685a3fdffff65       | mov                 byte ptr [ebp - 0x25d], 0x65
            //   c685a4fdffff78       | mov                 byte ptr [ebp - 0x25c], 0x78

        $sequence_1 = { 50 53 ff15???????? 8d85f0feffff 50 ff15???????? 85c0 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_2 = { c3 55 8bec b8???????? 56 85c0 57 }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b8????????           |                     
            //   56                   | push                esi
            //   85c0                 | test                eax, eax
            //   57                   | push                edi

        $sequence_3 = { eb34 8b4e44 6a00 03c8 51 }
            // n = 5, score = 100
            //   eb34                 | jmp                 0x36
            //   8b4e44               | mov                 ecx, dword ptr [esi + 0x44]
            //   6a00                 | push                0
            //   03c8                 | add                 ecx, eax
            //   51                   | push                ecx

        $sequence_4 = { 8955fc f3a5 8d88e00e0000 8db8b40f0000 894de4 8bcb 8d75e4 }
            // n = 7, score = 100
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8d88e00e0000         | lea                 ecx, [eax + 0xee0]
            //   8db8b40f0000         | lea                 edi, [eax + 0xfb4]
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   8bcb                 | mov                 ecx, ebx
            //   8d75e4               | lea                 esi, [ebp - 0x1c]

        $sequence_5 = { 56 56 685c400700 57 ff15???????? 57 ff15???????? }
            // n = 7, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   685c400700           | push                0x7405c
            //   57                   | push                edi
            //   ff15????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_6 = { 8bd0 8b0c8db0e10110 25ff000000 c1ea18 33cb 83c604 8b1c95b0dd0110 }
            // n = 7, score = 100
            //   8bd0                 | mov                 edx, eax
            //   8b0c8db0e10110       | mov                 ecx, dword ptr [ecx*4 + 0x1001e1b0]
            //   25ff000000           | and                 eax, 0xff
            //   c1ea18               | shr                 edx, 0x18
            //   33cb                 | xor                 ecx, ebx
            //   83c604               | add                 esi, 4
            //   8b1c95b0dd0110       | mov                 ebx, dword ptr [edx*4 + 0x1001ddb0]

        $sequence_7 = { 7447 56 53 50 ff15???????? }
            // n = 5, score = 100
            //   7447                 | je                  0x49
            //   56                   | push                esi
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_8 = { 50 56 e8???????? 83c40c be???????? 57 56 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   be????????           |                     
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_9 = { 89472c 8b450c 6a00 56 57 894738 e8???????? }
            // n = 7, score = 100
            //   89472c               | mov                 dword ptr [edi + 0x2c], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   6a00                 | push                0
            //   56                   | push                esi
            //   57                   | push                edi
            //   894738               | mov                 dword ptr [edi + 0x38], eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 344064
}