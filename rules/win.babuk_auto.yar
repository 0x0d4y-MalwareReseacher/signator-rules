rule win_babuk_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.babuk."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.babuk"
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
        $sequence_0 = { 50 ff15???????? 83f803 7502 }
            // n = 4, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f803               | cmp                 eax, 3
            //   7502                 | jne                 4

        $sequence_1 = { ff15???????? 6800000100 e8???????? 83c404 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   6800000100           | push                0x10000
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_2 = { c744010400000000 ba08000000 6bc200 8b4d08 8b540104 }
            // n = 5, score = 600
            //   c744010400000000     | mov                 dword ptr [ecx + eax + 4], 0
            //   ba08000000           | mov                 edx, 8
            //   6bc200               | imul                eax, edx, 0
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b540104             | mov                 edx, dword ptr [ecx + eax + 4]

        $sequence_3 = { 8b4d08 c7040100000000 c744010400000000 ba08000000 }
            // n = 4, score = 600
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c7040100000000       | mov                 dword ptr [ecx + eax], 0
            //   c744010400000000     | mov                 dword ptr [ecx + eax + 4], 0
            //   ba08000000           | mov                 edx, 8

        $sequence_4 = { 0f854d010000 6a00 6a00 6a00 6a00 }
            // n = 5, score = 600
            //   0f854d010000         | jne                 0x153
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_5 = { 83c002 8945fc 837dfc0a 0f83dc000000 8b4dfc 8b5508 8b44ca04 }
            // n = 7, score = 600
            //   83c002               | add                 eax, 2
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc0a             | cmp                 dword ptr [ebp - 4], 0xa
            //   0f83dc000000         | jae                 0xe2
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b44ca04             | mov                 eax, dword ptr [edx + ecx*8 + 4]

        $sequence_6 = { 8b5508 8b44ca04 50 8b0cca 51 e8???????? 83c408 }
            // n = 7, score = 600
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b44ca04             | mov                 eax, dword ptr [edx + ecx*8 + 4]
            //   50                   | push                eax
            //   8b0cca               | mov                 ecx, dword ptr [edx + ecx*8]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_7 = { ba08000000 6bc20a 8b4d08 c7040100000000 }
            // n = 4, score = 600
            //   ba08000000           | mov                 edx, 8
            //   6bc20a               | imul                eax, edx, 0xa
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c7040100000000       | mov                 dword ptr [ecx + eax], 0

        $sequence_8 = { 8b948d70fdffff 89948508fdffff 8b85ecfdffff 83c001 8985ecfdffff eba4 }
            // n = 6, score = 600
            //   8b948d70fdffff       | mov                 edx, dword ptr [ebp + ecx*4 - 0x290]
            //   89948508fdffff       | mov                 dword ptr [ebp + eax*4 - 0x2f8], edx
            //   8b85ecfdffff         | mov                 eax, dword ptr [ebp - 0x214]
            //   83c001               | add                 eax, 1
            //   8985ecfdffff         | mov                 dword ptr [ebp - 0x214], eax
            //   eba4                 | jmp                 0xffffffa6

        $sequence_9 = { 898c057cffffff 8b8d74ffffff 898d78ffffff eb0f 8b9578ffffff 83c201 899578ffffff }
            // n = 7, score = 600
            //   898c057cffffff       | mov                 dword ptr [ebp + eax - 0x84], ecx
            //   8b8d74ffffff         | mov                 ecx, dword ptr [ebp - 0x8c]
            //   898d78ffffff         | mov                 dword ptr [ebp - 0x88], ecx
            //   eb0f                 | jmp                 0x11
            //   8b9578ffffff         | mov                 edx, dword ptr [ebp - 0x88]
            //   83c201               | add                 edx, 1
            //   899578ffffff         | mov                 dword ptr [ebp - 0x88], edx

        $sequence_10 = { 6bf100 8b45ec 8b55f0 b11a e8???????? 8b4d08 }
            // n = 6, score = 600
            //   6bf100               | imul                esi, ecx, 0
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   b11a                 | mov                 cl, 0x1a
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_11 = { 8b4d0c 51 8b5508 52 8d857cffffff }
            // n = 5, score = 600
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   8d857cffffff         | lea                 eax, [ebp - 0x84]

        $sequence_12 = { 6bc80a 8b5508 c7040a00000000 c7440a0400000000 c745fc00000000 eb09 8b45fc }
            // n = 7, score = 600
            //   6bc80a               | imul                ecx, eax, 0xa
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   c7040a00000000       | mov                 dword ptr [edx + ecx], 0
            //   c7440a0400000000     | mov                 dword ptr [edx + ecx + 4], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   eb09                 | jmp                 0xb
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_13 = { 83c414 6a0d 6a08 6a07 6a02 8d4dbc 51 }
            // n = 7, score = 600
            //   83c414               | add                 esp, 0x14
            //   6a0d                 | push                0xd
            //   6a08                 | push                8
            //   6a07                 | push                7
            //   6a02                 | push                2
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   51                   | push                ecx

        $sequence_14 = { 8b55fc 8b4d08 89449110 ebd3 ba04000000 }
            // n = 5, score = 600
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   89449110             | mov                 dword ptr [ecx + edx*4 + 0x10], eax
            //   ebd3                 | jmp                 0xffffffd5
            //   ba04000000           | mov                 edx, 4

        $sequence_15 = { 8b4d08 8b540104 52 8b0401 50 e8???????? 83c408 }
            // n = 7, score = 600
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b540104             | mov                 edx, dword ptr [ecx + eax + 4]
            //   52                   | push                edx
            //   8b0401               | mov                 eax, dword ptr [ecx + eax]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

    condition:
        7 of them and filesize < 183296
}