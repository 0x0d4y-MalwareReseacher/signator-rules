rule win_xtunnel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.xtunnel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xtunnel"
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
        $sequence_0 = { 0f850a030000 c744241001000000 e9???????? 83fb0b 0f859a000000 813ffffe0000 0f845b020000 }
            // n = 7, score = 1200
            //   0f850a030000         | jne                 0x310
            //   c744241001000000     | mov                 dword ptr [esp + 0x10], 1
            //   e9????????           |                     
            //   83fb0b               | cmp                 ebx, 0xb
            //   0f859a000000         | jne                 0xa0
            //   813ffffe0000         | cmp                 dword ptr [edi], 0xfeff
            //   0f845b020000         | je                  0x261

        $sequence_1 = { e8???????? 99 b960000000 f7f9 }
            // n = 4, score = 1200
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b960000000           | mov                 ecx, 0x60
            //   f7f9                 | idiv                ecx

        $sequence_2 = { 8bcf 2bcb 2bc8 83e905 0f8876060000 c60000 }
            // n = 6, score = 1200
            //   8bcf                 | mov                 ecx, edi
            //   2bcb                 | sub                 ecx, ebx
            //   2bc8                 | sub                 ecx, eax
            //   83e905               | sub                 ecx, 5
            //   0f8876060000         | js                  0x67c
            //   c60000               | mov                 byte ptr [eax], 0

        $sequence_3 = { 0f85d1000000 50 8b442414 50 e8???????? 83c408 85c0 }
            // n = 7, score = 1200
            //   0f85d1000000         | jne                 0xd7
            //   50                   | push                eax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_4 = { 0f8588000000 3d03030000 0f8c7d000000 0fb61e }
            // n = 4, score = 1200
            //   0f8588000000         | jne                 0x8e
            //   3d03030000           | cmp                 eax, 0x303
            //   0f8c7d000000         | jl                  0x83
            //   0fb61e               | movzx               ebx, byte ptr [esi]

        $sequence_5 = { 0f849b010000 8b4f58 8b9140030000 83fa14 750f c7815403000001000000 8d42ed }
            // n = 7, score = 1200
            //   0f849b010000         | je                  0x1a1
            //   8b4f58               | mov                 ecx, dword ptr [edi + 0x58]
            //   8b9140030000         | mov                 edx, dword ptr [ecx + 0x340]
            //   83fa14               | cmp                 edx, 0x14
            //   750f                 | jne                 0x11
            //   c7815403000001000000     | mov    dword ptr [ecx + 0x354], 1
            //   8d42ed               | lea                 eax, [edx - 0x13]

        $sequence_6 = { 0be8 83c602 8d4502 bb28000000 896c2410 89442420 81fd80000000 }
            // n = 7, score = 1200
            //   0be8                 | or                  ebp, eax
            //   83c602               | add                 esi, 2
            //   8d4502               | lea                 eax, [ebp + 2]
            //   bb28000000           | mov                 ebx, 0x28
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   81fd80000000         | cmp                 ebp, 0x80

        $sequence_7 = { 8b11 83c202 52 e8???????? }
            // n = 4, score = 1200
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   83c202               | add                 edx, 2
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_8 = { 03d6 3b542414 7439 6a32 }
            // n = 4, score = 1200
            //   03d6                 | add                 edx, esi
            //   3b542414             | cmp                 edx, dword ptr [esp + 0x14]
            //   7439                 | je                  0x3b
            //   6a32                 | push                0x32

        $sequence_9 = { eb67 8b7740 0fb60e 8b97c0000000 c1e118 }
            // n = 5, score = 1200
            //   eb67                 | jmp                 0x69
            //   8b7740               | mov                 esi, dword ptr [edi + 0x40]
            //   0fb60e               | movzx               ecx, byte ptr [esi]
            //   8b97c0000000         | mov                 edx, dword ptr [edi + 0xc0]
            //   c1e118               | shl                 ecx, 0x18

        $sequence_10 = { c7010c000000 5e 5d c3 6a00 }
            // n = 5, score = 1100
            //   c7010c000000         | mov                 dword ptr [ecx], 0xc
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a00                 | push                0

        $sequence_11 = { 8b4310 8b4b14 2bc8 47 }
            // n = 4, score = 1000
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   8b4b14               | mov                 ecx, dword ptr [ebx + 0x14]
            //   2bc8                 | sub                 ecx, eax
            //   47                   | inc                 edi

        $sequence_12 = { 8bf8 83c404 897dec 33db 895dfc 3bfb }
            // n = 6, score = 1000
            //   8bf8                 | mov                 edi, eax
            //   83c404               | add                 esp, 4
            //   897dec               | mov                 dword ptr [ebp - 0x14], edi
            //   33db                 | xor                 ebx, ebx
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   3bfb                 | cmp                 edi, ebx

        $sequence_13 = { 8b4e18 894818 8b16 8910 8b4e14 }
            // n = 5, score = 1000
            //   8b4e18               | mov                 ecx, dword ptr [esi + 0x18]
            //   894818               | mov                 dword ptr [eax + 0x18], ecx
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8910                 | mov                 dword ptr [eax], edx
            //   8b4e14               | mov                 ecx, dword ptr [esi + 0x14]

        $sequence_14 = { eb02 33ff 897e60 8bc6 8b4df4 }
            // n = 5, score = 1000
            //   eb02                 | jmp                 4
            //   33ff                 | xor                 edi, edi
            //   897e60               | mov                 dword ptr [esi + 0x60], edi
            //   8bc6                 | mov                 eax, esi
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_15 = { 0fb7510a 6689500a 8b510c 89500c 8b5120 895020 8b4910 }
            // n = 7, score = 1000
            //   0fb7510a             | movzx               edx, word ptr [ecx + 0xa]
            //   6689500a             | mov                 word ptr [eax + 0xa], dx
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]
            //   89500c               | mov                 dword ptr [eax + 0xc], edx
            //   8b5120               | mov                 edx, dword ptr [ecx + 0x20]
            //   895020               | mov                 dword ptr [eax + 0x20], edx
            //   8b4910               | mov                 ecx, dword ptr [ecx + 0x10]

        $sequence_16 = { 895f08 895f0c 895f10 c645fc06 }
            // n = 4, score = 1000
            //   895f08               | mov                 dword ptr [edi + 8], ebx
            //   895f0c               | mov                 dword ptr [edi + 0xc], ebx
            //   895f10               | mov                 dword ptr [edi + 0x10], ebx
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6

        $sequence_17 = { 57 50 ff15???????? 8b4310 8b4b14 33ff 2bc8 }
            // n = 7, score = 1000
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   8b4b14               | mov                 ecx, dword ptr [ebx + 0x14]
            //   33ff                 | xor                 edi, edi
            //   2bc8                 | sub                 ecx, eax

        $sequence_18 = { c6421501 c645fc03 6a18 895e48 e8???????? 83c404 3bc3 }
            // n = 7, score = 1000
            //   c6421501             | mov                 byte ptr [edx + 0x15], 1
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   6a18                 | push                0x18
            //   895e48               | mov                 dword ptr [esi + 0x48], ebx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   3bc3                 | cmp                 eax, ebx

        $sequence_19 = { 83c404 8945b0 8b45b4 50 }
            // n = 4, score = 500
            //   83c404               | add                 esp, 4
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   50                   | push                eax

        $sequence_20 = { c685c5f4ffff15 c685c6f4ffff14 c685c7f4ffff39 c685c8f4ffff54 }
            // n = 4, score = 300
            //   c685c5f4ffff15       | mov                 byte ptr [ebp - 0xb3b], 0x15
            //   c685c6f4ffff14       | mov                 byte ptr [ebp - 0xb3a], 0x14
            //   c685c7f4ffff39       | mov                 byte ptr [ebp - 0xb39], 0x39
            //   c685c8f4ffff54       | mov                 byte ptr [ebp - 0xb38], 0x54

        $sequence_21 = { c685c5f6fffffc c685c6f6ffffd5 c685c7f6ffff45 c685c8f6ffffb1 }
            // n = 4, score = 300
            //   c685c5f6fffffc       | mov                 byte ptr [ebp - 0x93b], 0xfc
            //   c685c6f6ffffd5       | mov                 byte ptr [ebp - 0x93a], 0xd5
            //   c685c7f6ffff45       | mov                 byte ptr [ebp - 0x939], 0x45
            //   c685c8f6ffffb1       | mov                 byte ptr [ebp - 0x938], 0xb1

        $sequence_22 = { c685c5f3ffff49 c685c6f3ffff2d c685c7f3ffffd1 c685c8f3ffff24 c685c9f3ffff58 c685caf3ffff11 c685cbf3ffffc7 }
            // n = 7, score = 300
            //   c685c5f3ffff49       | mov                 byte ptr [ebp - 0xc3b], 0x49
            //   c685c6f3ffff2d       | mov                 byte ptr [ebp - 0xc3a], 0x2d
            //   c685c7f3ffffd1       | mov                 byte ptr [ebp - 0xc39], 0xd1
            //   c685c8f3ffff24       | mov                 byte ptr [ebp - 0xc38], 0x24
            //   c685c9f3ffff58       | mov                 byte ptr [ebp - 0xc37], 0x58
            //   c685caf3ffff11       | mov                 byte ptr [ebp - 0xc36], 0x11
            //   c685cbf3ffffc7       | mov                 byte ptr [ebp - 0xc35], 0xc7

        $sequence_23 = { c685c5f5ffff7d c685c6f5ffff6e c685c7f5ffff61 c685c8f5ffff27 }
            // n = 4, score = 300
            //   c685c5f5ffff7d       | mov                 byte ptr [ebp - 0xa3b], 0x7d
            //   c685c6f5ffff6e       | mov                 byte ptr [ebp - 0xa3a], 0x6e
            //   c685c7f5ffff61       | mov                 byte ptr [ebp - 0xa39], 0x61
            //   c685c8f5ffff27       | mov                 byte ptr [ebp - 0xa38], 0x27

    condition:
        7 of them and filesize < 4634440
}