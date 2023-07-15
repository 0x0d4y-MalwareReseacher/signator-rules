rule win_zumanek_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.zumanek."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zumanek"
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
        $sequence_0 = { 7c8b e45f 22f9 17 c8914c74 8bc4 5f }
            // n = 7, score = 100
            //   7c8b                 | jl                  0xffffff8d
            //   e45f                 | in                  al, 0x5f
            //   22f9                 | and                 bh, cl
            //   17                   | pop                 ss
            //   c8914c74             | enter               0x4c91, 0x74
            //   8bc4                 | mov                 eax, esp
            //   5f                   | pop                 edi

        $sequence_1 = { 96 44 b6d9 89fe }
            // n = 4, score = 100
            //   96                   | xchg                eax, esi
            //   44                   | inc                 esp
            //   b6d9                 | mov                 dh, 0xd9
            //   89fe                 | mov                 esi, edi

        $sequence_2 = { ef 5a c0eb87 a805 }
            // n = 4, score = 100
            //   ef                   | out                 dx, eax
            //   5a                   | pop                 edx
            //   c0eb87               | shr                 bl, 0x87
            //   a805                 | test                al, 5

        $sequence_3 = { 52 d34045 58 894d2c 3d5bf2aba3 48 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   d34045               | rol                 dword ptr [eax + 0x45], cl
            //   58                   | pop                 eax
            //   894d2c               | mov                 dword ptr [ebp + 0x2c], ecx
            //   3d5bf2aba3           | cmp                 eax, 0xa3abf25b
            //   48                   | dec                 eax

        $sequence_4 = { 94 1298249c48a0 91 a4 22a844acb089 b412 b824c048c8 }
            // n = 7, score = 100
            //   94                   | xchg                eax, esp
            //   1298249c48a0         | adc                 bl, byte ptr [eax - 0x5fb763dc]
            //   91                   | xchg                eax, ecx
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   22a844acb089         | and                 ch, byte ptr [eax - 0x764f53bc]
            //   b412                 | mov                 ah, 0x12
            //   b824c048c8           | mov                 eax, 0xc848c024

        $sequence_5 = { 324613 03aa6a75464a a1???????? 1cd2 3133 }
            // n = 5, score = 100
            //   324613               | xor                 al, byte ptr [esi + 0x13]
            //   03aa6a75464a         | add                 ebp, dword ptr [edx + 0x4a46756a]
            //   a1????????           |                     
            //   1cd2                 | sbb                 al, 0xd2
            //   3133                 | xor                 dword ptr [ebx], esi

        $sequence_6 = { d3b9193b75fb 105945 9c 22dc b004 ae }
            // n = 6, score = 100
            //   d3b9193b75fb         | sar                 dword ptr [ecx - 0x48ac4e7], cl
            //   105945               | adc                 byte ptr [ecx + 0x45], bl
            //   9c                   | pushfd              
            //   22dc                 | and                 bl, ah
            //   b004                 | mov                 al, 4
            //   ae                   | scasb               al, byte ptr es:[edi]

        $sequence_7 = { c8be45f2 2f 91 7c89 4a 17 48 }
            // n = 7, score = 100
            //   c8be45f2             | enter               0x45be, -0xe
            //   2f                   | das                 
            //   91                   | xchg                eax, ecx
            //   7c89                 | jl                  0xffffff8b
            //   4a                   | dec                 edx
            //   17                   | pop                 ss
            //   48                   | dec                 eax

        $sequence_8 = { 0e 3d83b538a4 f77306 9abb1d94786f4f 08cd }
            // n = 5, score = 100
            //   0e                   | push                cs
            //   3d83b538a4           | cmp                 eax, 0xa438b583
            //   f77306               | div                 dword ptr [ebx + 6]
            //   9abb1d94786f4f       | lcall               0x4f6f:0x78941dbb
            //   08cd                 | or                  ch, cl

        $sequence_9 = { 01e9 b052 ac dd09 40 fc 42 }
            // n = 7, score = 100
            //   01e9                 | add                 ecx, ebp
            //   b052                 | mov                 al, 0x52
            //   ac                   | lodsb               al, byte ptr [esi]
            //   dd09                 | fisttp              qword ptr [ecx]
            //   40                   | inc                 eax
            //   fc                   | cld                 
            //   42                   | inc                 edx

    condition:
        7 of them and filesize < 58867712
}