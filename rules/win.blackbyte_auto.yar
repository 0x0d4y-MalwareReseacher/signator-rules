rule win_blackbyte_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.blackbyte."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackbyte"
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
        $sequence_0 = { 488d4101 0f1f8000000000 4883f85b 0f8dc0000000 }
            // n = 4, score = 200
            //   488d4101             | or                  ebx, ecx
            //   0f1f8000000000       | movups              xmmword ptr [esp + 0x20], xmm0
            //   4883f85b             | movsd               qword ptr [esp + 0x40], xmm0
            //   0f8dc0000000         | movups              xmmword ptr [esp + 0x30], xmm1

        $sequence_1 = { 0bd1 8b4c244c 4103cf 450fb67b17 33d1 }
            // n = 5, score = 200
            //   0bd1                 | or                  edx, ecx
            //   8b4c244c             | mov                 ecx, dword ptr [esp + 0x4c]
            //   4103cf               | inc                 ecx
            //   450fb67b17           | add                 ecx, edi
            //   33d1                 | inc                 ebp

        $sequence_2 = { 488d0db4030000 488908 833d????????00 7520 }
            // n = 4, score = 200
            //   488d0db4030000       | dec                 eax
            //   488908               | mov                 edi, dword ptr [esp + 0x48]
            //   833d????????00       |                     
            //   7520                 | dec                 eax

        $sequence_3 = { 39580c 7516 44387ddf 740b 488b45c7 83a0a8030000fd 448bcb }
            // n = 7, score = 200
            //   39580c               | dec                 eax
            //   7516                 | mov                 esi, dword ptr [esp + 0x2e0]
            //   44387ddf             | movaps              xmm7, xmmword ptr [esp + 0x290]
            //   740b                 | movaps              xmm6, xmmword ptr [esp + 0x2a0]
            //   488b45c7             | dec                 esp
            //   83a0a8030000fd       | mov                 esi, dword ptr [esp + 0x2b0]
            //   448bcb               | dec                 eax

        $sequence_4 = { 488d5301 488b5c2468 488b742440 488b7c2448 }
            // n = 4, score = 200
            //   488d5301             | add                 esp, 0x2b8
            //   488b5c2468           | or                  edx, ecx
            //   488b742440           | mov                 ecx, dword ptr [esp + 0x4c]
            //   488b7c2448           | inc                 ecx

        $sequence_5 = { 0bd9 410fb64b28 450fb65b2f 41c1e308 }
            // n = 4, score = 200
            //   0bd9                 | cmp                 dword ptr [ebp + 0x74], esi
            //   410fb64b28           | jne                 0xb6
            //   450fb65b2f           | mov                 eax, dword ptr [ebp + 0x70]
            //   41c1e308             | dec                 esp

        $sequence_6 = { 397574 0f85ad000000 8b4570 4c8d4d58 }
            // n = 4, score = 200
            //   397574               | dec                 eax
            //   0f85ad000000         | lea                 edx, [eax + ebp*8]
            //   8b4570               | cmp                 dword ptr [esp + 0x78], esi
            //   4c8d4d58             | je                  0xc6

        $sequence_7 = { 488d442448 488d5c2438 31c9 31ff be02000000 }
            // n = 5, score = 200
            //   488d442448           | mov                 eax, ebx
            //   488d5c2438           | movaps              xmm7, xmmword ptr [esp + 0x290]
            //   31c9                 | movaps              xmm6, xmmword ptr [esp + 0x2a0]
            //   31ff                 | dec                 esp
            //   be02000000           | mov                 esi, dword ptr [esp + 0x2b0]

        $sequence_8 = { 39742478 0f8496000000 4883cdff 4c8bf5 }
            // n = 4, score = 200
            //   39742478             | mov                 dword ptr [esp + 0x48], esi
            //   0f8496000000         | dec                 eax
            //   4883cdff             | mov                 dword ptr [esp + 0x50], edi
            //   4c8bf5               | nop                 word ptr [eax + eax]

        $sequence_9 = { 0f28bc2490020000 0f28b424a0020000 4c8bb424b0020000 488bb424e0020000 }
            // n = 4, score = 200
            //   0f28bc2490020000     | inc                 ebp
            //   0f28b424a0020000     | movzx               edi, byte ptr [ebx + 0x17]
            //   4c8bb424b0020000     | xor                 edx, ecx
            //   488bb424e0020000     | inc                 ecx

        $sequence_10 = { 488d4b07 4889c3 488d442460 e8???????? }
            // n = 4, score = 200
            //   488d4b07             | dec                 eax
            //   4889c3               | lea                 eax, [esp + 0x48]
            //   488d442460           | dec                 eax
            //   e8????????           |                     

        $sequence_11 = { 396b68 0f8639010000 4889742448 48897c2450 }
            // n = 4, score = 200
            //   396b68               | mov                 esi, dword ptr [esp + 0x2e0]
            //   0f8639010000         | dec                 eax
            //   4889742448           | mov                 ebp, dword ptr [esp + 0x2d8]
            //   48897c2450           | cmp                 dword ptr [eax + 0xc], ebx

        $sequence_12 = { 488d0de5000000 488908 833d????????00 751d }
            // n = 4, score = 200
            //   488d0de5000000       | nop                 dword ptr [eax]
            //   488908               | dec                 eax
            //   833d????????00       |                     
            //   751d                 | mov                 ebx, dword ptr [edi]

        $sequence_13 = { 488d5c241d b911000000 e8???????? 488b6c2440 4883c448 c3 89f0 }
            // n = 7, score = 200
            //   488d5c241d           | dec                 eax
            //   b911000000           | lea                 edx, [ebx + 1]
            //   e8????????           |                     
            //   488b6c2440           | dec                 eax
            //   4883c448             | mov                 ebx, dword ptr [esp + 0x68]
            //   c3                   | dec                 eax
            //   89f0                 | mov                 esi, dword ptr [esp + 0x40]

        $sequence_14 = { 488d1592020000 4889542458 48894c2460 488d4c2458 }
            // n = 4, score = 200
            //   488d1592020000       | or                  ebx, ecx
            //   4889542458           | or                  ebx, ecx
            //   48894c2460           | inc                 ecx
            //   488d4c2458           | movzx               ecx, byte ptr [ebx + 0x28]

        $sequence_15 = { 0bd9 410fb64b29 c1e308 0bd9 }
            // n = 4, score = 200
            //   0bd9                 | dec                 esp
            //   410fb64b29           | lea                 eax, [ebp + 0x3e8]
            //   c1e308               | movaps              xmm7, xmmword ptr [esp + 0x290]
            //   0bd9                 | movaps              xmm6, xmmword ptr [esp + 0x2a0]

    condition:
        7 of them and filesize < 9435136
}