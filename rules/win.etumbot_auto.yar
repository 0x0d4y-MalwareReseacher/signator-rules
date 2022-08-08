rule win_etumbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.etumbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.etumbot"
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
        $sequence_0 = { 0fb6c0 8a8405fcfeffff 320437 8806 46 }
            // n = 5, score = 400
            //   0fb6c0               | movzx               eax, al
            //   8a8405fcfeffff       | mov                 al, byte ptr [ebp + eax - 0x104]
            //   320437               | xor                 al, byte ptr [edi + esi]
            //   8806                 | mov                 byte ptr [esi], al
            //   46                   | inc                 esi

        $sequence_1 = { 8818 8811 8a00 02c2 0fb6c0 8a8405fcfeffff }
            // n = 6, score = 400
            //   8818                 | mov                 byte ptr [eax], bl
            //   8811                 | mov                 byte ptr [ecx], dl
            //   8a00                 | mov                 al, byte ptr [eax]
            //   02c2                 | add                 al, dl
            //   0fb6c0               | movzx               eax, al
            //   8a8405fcfeffff       | mov                 al, byte ptr [ebp + eax - 0x104]

        $sequence_2 = { 8d45a4 50 6801000080 c745a4536f6674 }
            // n = 4, score = 300
            //   8d45a4               | lea                 eax, [ebp - 0x5c]
            //   50                   | push                eax
            //   6801000080           | push                0x80000001
            //   c745a4536f6674       | mov                 dword ptr [ebp - 0x5c], 0x74666f53

        $sequence_3 = { 33c7 f7d1 23c1 42 4e 75df 5f }
            // n = 7, score = 300
            //   33c7                 | xor                 eax, edi
            //   f7d1                 | not                 ecx
            //   23c1                 | and                 eax, ecx
            //   42                   | inc                 edx
            //   4e                   | dec                 esi
            //   75df                 | jne                 0xffffffe1
            //   5f                   | pop                 edi

        $sequence_4 = { 68d0070000 ff15???????? ffd7 2bc3 3bc6 72ed }
            // n = 6, score = 300
            //   68d0070000           | push                0x7d0
            //   ff15????????         |                     
            //   ffd7                 | call                edi
            //   2bc3                 | sub                 eax, ebx
            //   3bc6                 | cmp                 eax, esi
            //   72ed                 | jb                  0xffffffef

        $sequence_5 = { c745a877617265 c745ac5c5c4d69 c745b063726f73 c745b46f66745c }
            // n = 4, score = 300
            //   c745a877617265       | mov                 dword ptr [ebp - 0x58], 0x65726177
            //   c745ac5c5c4d69       | mov                 dword ptr [ebp - 0x54], 0x694d5c5c
            //   c745b063726f73       | mov                 dword ptr [ebp - 0x50], 0x736f7263
            //   c745b46f66745c       | mov                 dword ptr [ebp - 0x4c], 0x5c74666f

        $sequence_6 = { 7407 8bf9 c1ef18 33c7 f7d1 }
            // n = 5, score = 300
            //   7407                 | je                  9
            //   8bf9                 | mov                 edi, ecx
            //   c1ef18               | shr                 edi, 0x18
            //   33c7                 | xor                 eax, edi
            //   f7d1                 | not                 ecx

        $sequence_7 = { 56 57 0fbe38 33f6 }
            // n = 4, score = 300
            //   56                   | push                esi
            //   57                   | push                edi
            //   0fbe38               | movsx               edi, byte ptr [eax]
            //   33f6                 | xor                 esi, esi

        $sequence_8 = { c745c47272656e c745c874566572 c745cc73696f6e c745d05c5c496e }
            // n = 4, score = 300
            //   c745c47272656e       | mov                 dword ptr [ebp - 0x3c], 0x6e657272
            //   c745c874566572       | mov                 dword ptr [ebp - 0x38], 0x72655674
            //   c745cc73696f6e       | mov                 dword ptr [ebp - 0x34], 0x6e6f6973
            //   c745d05c5c496e       | mov                 dword ptr [ebp - 0x30], 0x6e495c5c

        $sequence_9 = { 8d45f4 6820a10700 50 68???????? }
            // n = 4, score = 300
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   6820a10700           | push                0x7a120
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_10 = { c745b85c57696e c745bc646f7773 c745c05c5c4375 c745c47272656e }
            // n = 4, score = 300
            //   c745b85c57696e       | mov                 dword ptr [ebp - 0x48], 0x6e69575c
            //   c745bc646f7773       | mov                 dword ptr [ebp - 0x44], 0x73776f64
            //   c745c05c5c4375       | mov                 dword ptr [ebp - 0x40], 0x75435c5c
            //   c745c47272656e       | mov                 dword ptr [ebp - 0x3c], 0x6e657272

        $sequence_11 = { c745cc73696f6e c745d05c5c496e c745d47465726e c745d865742053 c745dc65747469 }
            // n = 5, score = 300
            //   c745cc73696f6e       | mov                 dword ptr [ebp - 0x34], 0x6e6f6973
            //   c745d05c5c496e       | mov                 dword ptr [ebp - 0x30], 0x6e495c5c
            //   c745d47465726e       | mov                 dword ptr [ebp - 0x2c], 0x6e726574
            //   c745d865742053       | mov                 dword ptr [ebp - 0x28], 0x53207465
            //   c745dc65747469       | mov                 dword ptr [ebp - 0x24], 0x69747465

        $sequence_12 = { 03c1 8bc8 81e1000000f0 7407 8bf9 }
            // n = 5, score = 300
            //   03c1                 | add                 eax, ecx
            //   8bc8                 | mov                 ecx, eax
            //   81e1000000f0         | and                 ecx, 0xf0000000
            //   7407                 | je                  9
            //   8bf9                 | mov                 edi, ecx

        $sequence_13 = { 83c101 894d08 8b550c 83ea03 }
            // n = 4, score = 200
            //   83c101               | add                 ecx, 1
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   83ea03               | sub                 edx, 3

        $sequence_14 = { 33c0 a3???????? 8d0c80 8d0c89 8d3c8b }
            // n = 5, score = 200
            //   33c0                 | xor                 eax, eax
            //   a3????????           |                     
            //   8d0c80               | lea                 ecx, [eax + eax*4]
            //   8d0c89               | lea                 ecx, [ecx + ecx*4]
            //   8d3c8b               | lea                 edi, [ebx + ecx*4]

        $sequence_15 = { c645f477 c645f569 c645f66e c645f769 c645f86e }
            // n = 5, score = 200
            //   c645f477             | mov                 byte ptr [ebp - 0xc], 0x77
            //   c645f569             | mov                 byte ptr [ebp - 0xb], 0x69
            //   c645f66e             | mov                 byte ptr [ebp - 0xa], 0x6e
            //   c645f769             | mov                 byte ptr [ebp - 9], 0x69
            //   c645f86e             | mov                 byte ptr [ebp - 8], 0x6e

        $sequence_16 = { 83c204 3b5514 7608 83c8ff }
            // n = 4, score = 200
            //   83c204               | add                 edx, 4
            //   3b5514               | cmp                 edx, dword ptr [ebp + 0x14]
            //   7608                 | jbe                 0xa
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_17 = { 0345f0 8b4d08 034dec 8a11 }
            // n = 4, score = 200
            //   0345f0               | add                 eax, dword ptr [ebp - 0x10]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   034dec               | add                 ecx, dword ptr [ebp - 0x14]
            //   8a11                 | mov                 dl, byte ptr [ecx]

        $sequence_18 = { 6a00 68???????? 6a00 6a00 6a00 51 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_19 = { 034dec 8a11 8810 8b45f0 83c001 }
            // n = 5, score = 200
            //   034dec               | add                 ecx, dword ptr [ebp - 0x14]
            //   8a11                 | mov                 dl, byte ptr [ecx]
            //   8810                 | mov                 byte ptr [eax], dl
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83c001               | add                 eax, 1

        $sequence_20 = { ff75b8 ff15???????? ff75c0 e8???????? 59 }
            // n = 5, score = 200
            //   ff75b8               | push                dword ptr [ebp - 0x48]
            //   ff15????????         |                     
            //   ff75c0               | push                dword ptr [ebp - 0x40]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_21 = { 83c104 3b4d14 7608 83c8ff }
            // n = 4, score = 200
            //   83c104               | add                 ecx, 4
            //   3b4d14               | cmp                 ecx, dword ptr [ebp + 0x14]
            //   7608                 | jbe                 0xa
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_22 = { 85ed 7418 3b74245c 0f83ce000000 8d442410 }
            // n = 5, score = 200
            //   85ed                 | test                ebp, ebp
            //   7418                 | je                  0x1a
            //   3b74245c             | cmp                 esi, dword ptr [esp + 0x5c]
            //   0f83ce000000         | jae                 0xd4
            //   8d442410             | lea                 eax, [esp + 0x10]

        $sequence_23 = { c68562ffffff7a c68563ffffff69 c68564ffffff6c c68565ffffff6c c68566ffffff61 }
            // n = 5, score = 200
            //   c68562ffffff7a       | mov                 byte ptr [ebp - 0x9e], 0x7a
            //   c68563ffffff69       | mov                 byte ptr [ebp - 0x9d], 0x69
            //   c68564ffffff6c       | mov                 byte ptr [ebp - 0x9c], 0x6c
            //   c68565ffffff6c       | mov                 byte ptr [ebp - 0x9b], 0x6c
            //   c68566ffffff61       | mov                 byte ptr [ebp - 0x9a], 0x61

        $sequence_24 = { c645ef68 885df0 89759c ff15???????? 85c0 0f85b5000000 8d45a4 }
            // n = 7, score = 200
            //   c645ef68             | mov                 byte ptr [ebp - 0x11], 0x68
            //   885df0               | mov                 byte ptr [ebp - 0x10], bl
            //   89759c               | mov                 dword ptr [ebp - 0x64], esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f85b5000000         | jne                 0xbb
            //   8d45a4               | lea                 eax, [ebp - 0x5c]

        $sequence_25 = { 8b4df4 034df0 8b5508 0355ec 8a02 }
            // n = 5, score = 200
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   034df0               | add                 ecx, dword ptr [ebp - 0x10]
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0355ec               | add                 edx, dword ptr [ebp - 0x14]
            //   8a02                 | mov                 al, byte ptr [edx]

        $sequence_26 = { 80e10f c0e102 c0eb06 02cb }
            // n = 4, score = 200
            //   80e10f               | and                 cl, 0xf
            //   c0e102               | shl                 cl, 2
            //   c0eb06               | shr                 bl, 6
            //   02cb                 | add                 cl, bl

        $sequence_27 = { 8d4a01 83c404 8bd1 c1e902 f3ab }
            // n = 5, score = 200
            //   8d4a01               | lea                 ecx, [edx + 1]
            //   83c404               | add                 esp, 4
            //   8bd1                 | mov                 edx, ecx
            //   c1e902               | shr                 ecx, 2
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_28 = { c645c33b c645c420 c645c54d c645c653 c645c749 }
            // n = 5, score = 200
            //   c645c33b             | mov                 byte ptr [ebp - 0x3d], 0x3b
            //   c645c420             | mov                 byte ptr [ebp - 0x3c], 0x20
            //   c645c54d             | mov                 byte ptr [ebp - 0x3b], 0x4d
            //   c645c653             | mov                 byte ptr [ebp - 0x3a], 0x53
            //   c645c749             | mov                 byte ptr [ebp - 0x39], 0x49

        $sequence_29 = { c645d057 c645d169 c645d26e c645d364 }
            // n = 4, score = 200
            //   c645d057             | mov                 byte ptr [ebp - 0x30], 0x57
            //   c645d169             | mov                 byte ptr [ebp - 0x2f], 0x69
            //   c645d26e             | mov                 byte ptr [ebp - 0x2e], 0x6e
            //   c645d364             | mov                 byte ptr [ebp - 0x2d], 0x64

        $sequence_30 = { c645c653 c645c749 c645c845 c645c920 }
            // n = 4, score = 200
            //   c645c653             | mov                 byte ptr [ebp - 0x3a], 0x53
            //   c645c749             | mov                 byte ptr [ebp - 0x39], 0x49
            //   c645c845             | mov                 byte ptr [ebp - 0x38], 0x45
            //   c645c920             | mov                 byte ptr [ebp - 0x37], 0x20

        $sequence_31 = { 0f842c010000 8d442410 57 50 ff15???????? 8bc8 83c408 }
            // n = 7, score = 200
            //   0f842c010000         | je                  0x132
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bc8                 | mov                 ecx, eax
            //   83c408               | add                 esp, 8

        $sequence_32 = { c645fa74 c645fb2e c645fc64 c645fd6c c645fe6c }
            // n = 5, score = 200
            //   c645fa74             | mov                 byte ptr [ebp - 6], 0x74
            //   c645fb2e             | mov                 byte ptr [ebp - 5], 0x2e
            //   c645fc64             | mov                 byte ptr [ebp - 4], 0x64
            //   c645fd6c             | mov                 byte ptr [ebp - 3], 0x6c
            //   c645fe6c             | mov                 byte ptr [ebp - 2], 0x6c

        $sequence_33 = { c645bf69 c645c062 c645c16c c645c265 c645c33b c645c420 }
            // n = 6, score = 200
            //   c645bf69             | mov                 byte ptr [ebp - 0x41], 0x69
            //   c645c062             | mov                 byte ptr [ebp - 0x40], 0x62
            //   c645c16c             | mov                 byte ptr [ebp - 0x3f], 0x6c
            //   c645c265             | mov                 byte ptr [ebp - 0x3e], 0x65
            //   c645c33b             | mov                 byte ptr [ebp - 0x3d], 0x3b
            //   c645c420             | mov                 byte ptr [ebp - 0x3c], 0x20

        $sequence_34 = { 895dfc c645ec2f c645ed74 56 }
            // n = 4, score = 200
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   c645ec2f             | mov                 byte ptr [ebp - 0x14], 0x2f
            //   c645ed74             | mov                 byte ptr [ebp - 0x13], 0x74
            //   56                   | push                esi

        $sequence_35 = { 8d540964 52 e8???????? 83c404 }
            // n = 4, score = 200
            //   8d540964             | lea                 edx, [ecx + ecx + 0x64]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_36 = { c645d673 c645d720 c645d84e c645d954 c645da20 }
            // n = 5, score = 200
            //   c645d673             | mov                 byte ptr [ebp - 0x2a], 0x73
            //   c645d720             | mov                 byte ptr [ebp - 0x29], 0x20
            //   c645d84e             | mov                 byte ptr [ebp - 0x28], 0x4e
            //   c645d954             | mov                 byte ptr [ebp - 0x27], 0x54
            //   c645da20             | mov                 byte ptr [ebp - 0x26], 0x20

        $sequence_37 = { c645cd31 c645ce3b c645cf20 c645d057 c645d169 }
            // n = 5, score = 200
            //   c645cd31             | mov                 byte ptr [ebp - 0x33], 0x31
            //   c645ce3b             | mov                 byte ptr [ebp - 0x32], 0x3b
            //   c645cf20             | mov                 byte ptr [ebp - 0x31], 0x20
            //   c645d057             | mov                 byte ptr [ebp - 0x30], 0x57
            //   c645d169             | mov                 byte ptr [ebp - 0x2f], 0x69

        $sequence_38 = { e8???????? 8d85f0deffff 50 8d85f0feffff 50 e8???????? 8d45f4 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8d85f0deffff         | lea                 eax, [ebp - 0x2110]
            //   50                   | push                eax
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_39 = { c68577faffff4d c68578faffffc7 c68579faffffd6 c6857afaffff72 }
            // n = 4, score = 100
            //   c68577faffff4d       | mov                 byte ptr [ebp - 0x589], 0x4d
            //   c68578faffffc7       | mov                 byte ptr [ebp - 0x588], 0xc7
            //   c68579faffffd6       | mov                 byte ptr [ebp - 0x587], 0xd6
            //   c6857afaffff72       | mov                 byte ptr [ebp - 0x586], 0x72

    condition:
        7 of them and filesize < 450560
}