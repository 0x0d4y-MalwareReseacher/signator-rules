rule win_meduza_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.meduza."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.meduza"
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
        $sequence_0 = { ff10 8b75f0 8d4df8 46 8975f0 e8???????? 8b4df4 }
            // n = 7, score = 100
            //   ff10                 | call                dword ptr [eax]
            //   8b75f0               | mov                 esi, dword ptr [ebp - 0x10]
            //   8d4df8               | lea                 ecx, [ebp - 8]
            //   46                   | inc                 esi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   e8????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { 8985d0eeffff 898dd4eeffff c785d8e4ffff12b8295c c785dce4ffffd94ef7ef 8b85d8e4ffff 8b8ddce4ffff 8985d8eeffff }
            // n = 7, score = 100
            //   8985d0eeffff         | mov                 dword ptr [ebp - 0x1130], eax
            //   898dd4eeffff         | mov                 dword ptr [ebp - 0x112c], ecx
            //   c785d8e4ffff12b8295c     | mov    dword ptr [ebp - 0x1b28], 0x5c29b812
            //   c785dce4ffffd94ef7ef     | mov    dword ptr [ebp - 0x1b24], 0xeff74ed9
            //   8b85d8e4ffff         | mov                 eax, dword ptr [ebp - 0x1b28]
            //   8b8ddce4ffff         | mov                 ecx, dword ptr [ebp - 0x1b24]
            //   8985d8eeffff         | mov                 dword ptr [ebp - 0x1128], eax

        $sequence_2 = { ff10 e9???????? 6a05 68???????? e9???????? 807e0800 8b0f }
            // n = 7, score = 100
            //   ff10                 | call                dword ptr [eax]
            //   e9????????           |                     
            //   6a05                 | push                5
            //   68????????           |                     
            //   e9????????           |                     
            //   807e0800             | cmp                 byte ptr [esi + 8], 0
            //   8b0f                 | mov                 ecx, dword ptr [edi]

        $sequence_3 = { e9???????? 8d8dc0bdffff e9???????? 8d8df0bdffff e9???????? 8d8df0bdffff e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8d8dc0bdffff         | lea                 ecx, [ebp - 0x4240]
            //   e9????????           |                     
            //   8d8df0bdffff         | lea                 ecx, [ebp - 0x4210]
            //   e9????????           |                     
            //   8d8df0bdffff         | lea                 ecx, [ebp - 0x4210]
            //   e9????????           |                     

        $sequence_4 = { 8b8d4cf8ffff 898decf2ffff 8985e8f2ffff c78548f8ffff53aa4aea c7854cf8ffff6e523d34 8b8548f8ffff 8b8d4cf8ffff }
            // n = 7, score = 100
            //   8b8d4cf8ffff         | mov                 ecx, dword ptr [ebp - 0x7b4]
            //   898decf2ffff         | mov                 dword ptr [ebp - 0xd14], ecx
            //   8985e8f2ffff         | mov                 dword ptr [ebp - 0xd18], eax
            //   c78548f8ffff53aa4aea     | mov    dword ptr [ebp - 0x7b8], 0xea4aaa53
            //   c7854cf8ffff6e523d34     | mov    dword ptr [ebp - 0x7b4], 0x343d526e
            //   8b8548f8ffff         | mov                 eax, dword ptr [ebp - 0x7b8]
            //   8b8d4cf8ffff         | mov                 ecx, dword ptr [ebp - 0x7b4]

        $sequence_5 = { ff75b0 57 ff15???????? 57 85c0 7428 ff15???????? }
            // n = 7, score = 100
            //   ff75b0               | push                dword ptr [ebp - 0x50]
            //   57                   | push                edi
            //   ff15????????         |                     
            //   57                   | push                edi
            //   85c0                 | test                eax, eax
            //   7428                 | je                  0x2a
            //   ff15????????         |                     

        $sequence_6 = { 03c6 c745fc00000000 8d5808 8945f0 0f57c0 c60000 660fd603 }
            // n = 7, score = 100
            //   03c6                 | add                 eax, esi
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8d5808               | lea                 ebx, [eax + 8]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   0f57c0               | xorps               xmm0, xmm0
            //   c60000               | mov                 byte ptr [eax], 0
            //   660fd603             | movq                qword ptr [ebx], xmm0

        $sequence_7 = { 898d2cffffff 8d8d30f6ffff 898528ffffff 8d5101 660fef8d20ffffff 0f298d30f6ffff 0f118530ecffff }
            // n = 7, score = 100
            //   898d2cffffff         | mov                 dword ptr [ebp - 0xd4], ecx
            //   8d8d30f6ffff         | lea                 ecx, [ebp - 0x9d0]
            //   898528ffffff         | mov                 dword ptr [ebp - 0xd8], eax
            //   8d5101               | lea                 edx, [ecx + 1]
            //   660fef8d20ffffff     | pxor                xmm1, xmmword ptr [ebp - 0xe0]
            //   0f298d30f6ffff       | movaps              xmmword ptr [ebp - 0x9d0], xmm1
            //   0f118530ecffff       | movups              xmmword ptr [ebp - 0x13d0], xmm0

        $sequence_8 = { e9???????? 8d8d28ffffff e9???????? 8b4584 83e002 0f840c000000 836584fd }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8d8d28ffffff         | lea                 ecx, [ebp - 0xd8]
            //   e9????????           |                     
            //   8b4584               | mov                 eax, dword ptr [ebp - 0x7c]
            //   83e002               | and                 eax, 2
            //   0f840c000000         | je                  0x12
            //   836584fd             | and                 dword ptr [ebp - 0x7c], 0xfffffffd

        $sequence_9 = { c785d8e4ffffcb46855e c785dce4ffffee6e1f36 8b85d8e4ffff 8b8ddce4ffff c785d8e4ffff88642bdd 8985c0fbffff 898dc4fbffff }
            // n = 7, score = 100
            //   c785d8e4ffffcb46855e     | mov    dword ptr [ebp - 0x1b28], 0x5e8546cb
            //   c785dce4ffffee6e1f36     | mov    dword ptr [ebp - 0x1b24], 0x361f6eee
            //   8b85d8e4ffff         | mov                 eax, dword ptr [ebp - 0x1b28]
            //   8b8ddce4ffff         | mov                 ecx, dword ptr [ebp - 0x1b24]
            //   c785d8e4ffff88642bdd     | mov    dword ptr [ebp - 0x1b28], 0xdd2b6488
            //   8985c0fbffff         | mov                 dword ptr [ebp - 0x440], eax
            //   898dc4fbffff         | mov                 dword ptr [ebp - 0x43c], ecx

    condition:
        7 of them and filesize < 1433600
}