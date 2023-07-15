rule win_ghostemperor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.ghostemperor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ghostemperor"
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
        $sequence_0 = { 31d2 41b801000000 4531c9 ff15???????? }
            // n = 4, score = 200
            //   31d2                 | mov                 esi, ebx
            //   41b801000000         | dec                 eax
            //   4531c9               | add                 esp, 0x10
            //   ff15????????         |                     

        $sequence_1 = { 41304901 4183f802 743b 8a4802 }
            // n = 4, score = 200
            //   41304901             | call                esi
            //   4183f802             | dec                 eax
            //   743b                 | add                 esp, 0x20
            //   8a4802               | add                 ecx, edx

        $sequence_2 = { b801000000 4883c428 5b 5d 5f 5e }
            // n = 6, score = 200
            //   b801000000           | jmp                 0x11
            //   4883c428             | test                ecx, ecx
            //   5b                   | jne                 0x11
            //   5d                   | dec                 eax
            //   5f                   | mov                 ebx, dword ptr [edi + 0x18]
            //   5e                   | dec                 eax

        $sequence_3 = { 49313cf1 488b7cf008 49317cf108 488b7cf010 }
            // n = 4, score = 200
            //   49313cf1             | dec                 eax
            //   488b7cf008           | add                 esp, 0x20
            //   49317cf108           | mov                 dword ptr [ebp + 0x2dc], 0xb261e44e
            //   488b7cf010           | add                 ebx, ecx

        $sequence_4 = { 4885c9 7418 e8???????? 48c7471000000000 eb09 c7471800000000 }
            // n = 6, score = 200
            //   4885c9               | add                 ebx, eax
            //   7418                 | imul                ecx, ebx, 0x3e8
            //   e8????????           |                     
            //   48c7471000000000     | add                 ecx, 0x7530
            //   eb09                 | dec                 eax
            //   c7471800000000       | sub                 esp, 0x20

        $sequence_5 = { 0fb744242e 660f6ed8 660f60d8 660f61d8 }
            // n = 4, score = 200
            //   0fb744242e           | add                 ecx, 0x7530
            //   660f6ed8             | dec                 eax
            //   660f60d8             | sub                 esp, 0x20
            //   660f61d8             | inc                 ecx

        $sequence_6 = { c7471800000000 89d9 e8???????? 48894710 4885c0 }
            // n = 5, score = 200
            //   c7471800000000       | dec                 eax
            //   89d9                 | sub                 esp, 0x20
            //   e8????????           |                     
            //   48894710             | inc                 ecx
            //   4885c0               | call                esi

        $sequence_7 = { 41304904 4183f805 7414 8a4805 41304905 4183f806 7407 }
            // n = 7, score = 200
            //   41304904             | add                 ebx, ecx
            //   4183f805             | add                 ebx, eax
            //   7414                 | imul                ecx, ebx, 0x3e8
            //   8a4805               | add                 ecx, 0x7530
            //   41304905             | dec                 eax
            //   4183f806             | sub                 esp, 0x20
            //   7407                 | inc                 ecx

        $sequence_8 = { 31d2 31f6 488b3cf0 49313cf1 4883c601 4883c2f8 }
            // n = 6, score = 200
            //   31d2                 | call                esi
            //   31f6                 | dec                 eax
            //   488b3cf0             | add                 esp, 0x20
            //   49313cf1             | add                 ebx, eax
            //   4883c601             | imul                ecx, ebx, 0x3e8
            //   4883c2f8             | add                 ecx, 0x7530

        $sequence_9 = { 4883c410 c3 ff25???????? ff25???????? ff25???????? ff25???????? ff25???????? }
            // n = 7, score = 200
            //   4883c410             | mov                 dword ptr [esp + 0x70], 0xffb3b4c0
            //   c3                   | xor                 edx, edx
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     

        $sequence_10 = { c745f489005e00 c745f86400f900 0f1045ec c745fcc4003900 c74500ab00c900 0f118510020000 c74504bf009e00 }
            // n = 7, score = 100
            //   c745f489005e00       | mov                 eax, dword ptr [ecx + 0x10]
            //   c745f86400f900       | xor                 edx, edx
            //   0f1045ec             | dec                 eax
            //   c745fcc4003900       | mov                 ecx, eax
            //   c74500ab00c900       | mov                 dword ptr [ebp - 0xc], 0x5e0089
            //   0f118510020000       | mov                 dword ptr [ebp - 8], 0xf90064
            //   c74504bf009e00       | movups              xmm0, xmmword ptr [ebp - 0x14]

        $sequence_11 = { c7442448d600e400 8d720c c744244c3e00cc00 f20f104c2448 0f1145b8 6689542450 f20f114dc8 }
            // n = 7, score = 100
            //   c7442448d600e400     | mov                 dword ptr [ebp - 4], 0x3900c4
            //   8d720c               | mov                 dword ptr [ebp], 0xc900ab
            //   c744244c3e00cc00     | movups              xmmword ptr [ebp + 0x210], xmm0
            //   f20f104c2448         | mov                 dword ptr [ebp + 4], 0x9e00bf
            //   0f1145b8             | mov                 dword ptr [esp + 0x48], 0xe400d6
            //   6689542450           | lea                 esi, [edx + 0xc]
            //   f20f114dc8           | mov                 dword ptr [esp + 0x4c], 0xcc003e

        $sequence_12 = { 0f88e2010000 488b1d???????? 488d4b10 ff15???????? 488d35a95f0000 884308 33c0 }
            // n = 7, score = 100
            //   0f88e2010000         | cmp                 dword ptr [esi], ebx
            //   488b1d????????       |                     
            //   488d4b10             | je                  0x4f
            //   ff15????????         |                     
            //   488d35a95f0000       | inc                 ecx
            //   884308               | mov                 eax, dword ptr [esi]
            //   33c0                 | test                eax, eax

        $sequence_13 = { 00c2 488b8568020000 8854080c 488b85b0020000 }
            // n = 4, score = 100
            //   00c2                 | mov                 edx, dword ptr [ebp + 0x2b0]
            //   488b8568020000       | mov                 byte ptr [eax + edx + 0xc], cl
            //   8854080c             | dec                 eax
            //   488b85b0020000       | mov                 eax, dword ptr [ebp + 0x2b0]

        $sequence_14 = { 01c3 69cbe8030000 81c130750000 4883ec20 }
            // n = 4, score = 100
            //   01c3                 | dec                 eax
            //   69cbe8030000         | mov                 eax, dword ptr [ebp + 0x268]
            //   81c130750000         | mov                 byte ptr [eax + ecx + 0xc], dl
            //   4883ec20             | dec                 eax

        $sequence_15 = { 01c1 89ca c1ea1f c1f904 }
            // n = 4, score = 100
            //   01c1                 | mov                 byte ptr [eax + ecx + 0xc], dl
            //   89ca                 | dec                 eax
            //   c1ea1f               | mov                 eax, dword ptr [ebp + 0x2b0]
            //   c1f904               | add                 dl, al

        $sequence_16 = { 4c8d442470 48c7442470c0b4b3ff 33d2 33c9 ff15???????? }
            // n = 5, score = 100
            //   4c8d442470           | je                  0x5e
            //   48c7442470c0b4b3ff     | js    0x1e8
            //   33d2                 | dec                 eax
            //   33c9                 | lea                 ecx, [ebx + 0x10]
            //   ff15????????         |                     

        $sequence_17 = { 7505 41391e 744a 418b06 85c0 745c }
            // n = 6, score = 100
            //   7505                 | movsd               xmm1, qword ptr [esp + 0x48]
            //   41391e               | movups              xmmword ptr [ebp - 0x48], xmm0
            //   744a                 | mov                 word ptr [esp + 0x50], dx
            //   418b06               | movsd               qword ptr [ebp - 0x38], xmm1
            //   85c0                 | jne                 7
            //   745c                 | inc                 ecx

        $sequence_18 = { c785d20000008300bd00 0f1085c6000000 c785d600000025009f00 c785da0000002a00f800 0f118568010000 }
            // n = 5, score = 100
            //   c785d20000008300bd00     | mov    dword ptr [ebp + 0xd2], 0xbd0083
            //   0f1085c6000000       | movups              xmm0, xmmword ptr [ebp + 0xc6]
            //   c785d600000025009f00     | mov    dword ptr [ebp + 0xd6], 0x9f0025
            //   c785da0000002a00f800     | mov    dword ptr [ebp + 0xda], 0xf8002a
            //   0f118568010000       | movups              xmmword ptr [ebp + 0x168], xmm0

        $sequence_19 = { 4885c0 740e 448b4110 33d2 488bc8 e8???????? }
            // n = 6, score = 100
            //   4885c0               | lea                 esp, [ebx + 0xe]
            //   740e                 | dec                 eax
            //   448b4110             | test                eax, eax
            //   33d2                 | je                  0x10
            //   488bc8               | inc                 esp
            //   e8????????           |                     

        $sequence_20 = { e8???????? 85c0 0f8883020000 33d2 c78594000000f1008500 c78598000000a8003f00 448d630e }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8883020000         | js                  0x289
            //   33d2                 | xor                 edx, edx
            //   c78594000000f1008500     | mov    dword ptr [ebp + 0x94], 0x8500f1
            //   c78598000000a8003f00     | mov    dword ptr [ebp + 0x98], 0x3f00a8
            //   448d630e             | inc                 esp

        $sequence_21 = { 00c1 488b8568020000 488b95b0020000 884c100c 488b85b0020000 488b85b0020000 488b85b0020000 }
            // n = 7, score = 100
            //   00c1                 | ret                 
            //   488b8568020000       | dec                 eax
            //   488b95b0020000       | add                 esp, 0x10
            //   884c100c             | ret                 
            //   488b85b0020000       | dec                 esp
            //   488b85b0020000       | mov                 ebx, dword ptr [esp + 8]
            //   488b85b0020000       | dec                 eax

        $sequence_22 = { 01d1 89ca c1e205 89cb }
            // n = 4, score = 100
            //   01d1                 | sar                 ecx, 4
            //   89ca                 | add                 ecx, edx
            //   c1e205               | add                 ecx, eax
            //   89cb                 | mov                 edx, ecx

    condition:
        7 of them and filesize < 1115136
}