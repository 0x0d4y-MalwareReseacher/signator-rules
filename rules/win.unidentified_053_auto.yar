rule win_unidentified_053_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.unidentified_053."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_053"
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
        $sequence_0 = { 753c ff75e4 68???????? e8???????? 85c0 59 }
            // n = 6, score = 100
            //   753c                 | jne                 0x3e
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   68????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx

        $sequence_1 = { c1c603 81ea584dff93 8915???????? e8???????? 42 }
            // n = 5, score = 100
            //   c1c603               | rol                 esi, 3
            //   81ea584dff93         | sub                 edx, 0x93ff4d58
            //   8915????????         |                     
            //   e8????????           |                     
            //   42                   | inc                 edx

        $sequence_2 = { 8d3c85a8914100 833f00 bb00100000 7520 53 e8???????? }
            // n = 6, score = 100
            //   8d3c85a8914100       | lea                 edi, [eax*4 + 0x4191a8]
            //   833f00               | cmp                 dword ptr [edi], 0
            //   bb00100000           | mov                 ebx, 0x1000
            //   7520                 | jne                 0x22
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_3 = { ff75f0 50 ff91c4010000 8945f4 85c0 }
            // n = 5, score = 100
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   ff91c4010000         | call                dword ptr [ecx + 0x1c4]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   85c0                 | test                eax, eax

        $sequence_4 = { f7d7 c1c30e ffd0 890d???????? 87c7 2bc3 f7da }
            // n = 7, score = 100
            //   f7d7                 | not                 edi
            //   c1c30e               | rol                 ebx, 0xe
            //   ffd0                 | call                eax
            //   890d????????         |                     
            //   87c7                 | xchg                edi, eax
            //   2bc3                 | sub                 eax, ebx
            //   f7da                 | neg                 edx

        $sequence_5 = { f7db c1c017 e8???????? f7d1 }
            // n = 4, score = 100
            //   f7db                 | neg                 ebx
            //   c1c017               | rol                 eax, 0x17
            //   e8????????           |                     
            //   f7d1                 | not                 ecx

        $sequence_6 = { 03f7 46 f7d8 81ebd4b243e9 c1c80c }
            // n = 5, score = 100
            //   03f7                 | add                 esi, edi
            //   46                   | inc                 esi
            //   f7d8                 | neg                 eax
            //   81ebd4b243e9         | sub                 ebx, 0xe943b2d4
            //   c1c80c               | ror                 eax, 0xc

        $sequence_7 = { 3b8e50894100 0f8515010000 a1???????? 83f801 0f84df000000 3bc2 }
            // n = 6, score = 100
            //   3b8e50894100         | cmp                 ecx, dword ptr [esi + 0x418950]
            //   0f8515010000         | jne                 0x11b
            //   a1????????           |                     
            //   83f801               | cmp                 eax, 1
            //   0f84df000000         | je                  0xe5
            //   3bc2                 | cmp                 eax, edx

        $sequence_8 = { 81f669d8509c f7d2 686c6c6f63 e8???????? 4e 03c1 890d???????? }
            // n = 7, score = 100
            //   81f669d8509c         | xor                 esi, 0x9c50d869
            //   f7d2                 | not                 edx
            //   686c6c6f63           | push                0x636f6c6c
            //   e8????????           |                     
            //   4e                   | dec                 esi
            //   03c1                 | add                 eax, ecx
            //   890d????????         |                     

        $sequence_9 = { 8b048588814100 234508 8b4e14 8d04c1 0fb64801 8b5004 83fa10 }
            // n = 7, score = 100
            //   8b048588814100       | mov                 eax, dword ptr [eax*4 + 0x418188]
            //   234508               | and                 eax, dword ptr [ebp + 8]
            //   8b4e14               | mov                 ecx, dword ptr [esi + 0x14]
            //   8d04c1               | lea                 eax, [ecx + eax*8]
            //   0fb64801             | movzx               ecx, byte ptr [eax + 1]
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   83fa10               | cmp                 edx, 0x10

    condition:
        7 of them and filesize < 294912
}