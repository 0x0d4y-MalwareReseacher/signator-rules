rule win_flawedgrace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.flawedgrace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.flawedgrace"
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
        $sequence_0 = { c68583dcffff00 c68584dcfffffb c68585dcffff04 c68586dcffff56 c68587dcffff69 c68588dcffff72 c68589dcffff74 }
            // n = 7, score = 200
            //   c68583dcffff00       | mov                 byte ptr [ebp - 0x237d], 0
            //   c68584dcfffffb       | mov                 byte ptr [ebp - 0x237c], 0xfb
            //   c68585dcffff04       | mov                 byte ptr [ebp - 0x237b], 4
            //   c68586dcffff56       | mov                 byte ptr [ebp - 0x237a], 0x56
            //   c68587dcffff69       | mov                 byte ptr [ebp - 0x2379], 0x69
            //   c68588dcffff72       | mov                 byte ptr [ebp - 0x2378], 0x72
            //   c68589dcffff74       | mov                 byte ptr [ebp - 0x2377], 0x74

        $sequence_1 = { 8b4a1c 8bc1 c1e808 0fb6f0 8bc1 c1e810 0fb6f9 }
            // n = 7, score = 200
            //   8b4a1c               | mov                 ecx, dword ptr [edx + 0x1c]
            //   8bc1                 | mov                 eax, ecx
            //   c1e808               | shr                 eax, 8
            //   0fb6f0               | movzx               esi, al
            //   8bc1                 | mov                 eax, ecx
            //   c1e810               | shr                 eax, 0x10
            //   0fb6f9               | movzx               edi, cl

        $sequence_2 = { c685c7f6ffff00 c685c8f6ffff6c c685c9f6ffff21 c685caf6ffff00 c685cbf6ffff00 c685ccf6ffff7e c685cdf6ffff21 }
            // n = 7, score = 200
            //   c685c7f6ffff00       | mov                 byte ptr [ebp - 0x939], 0
            //   c685c8f6ffff6c       | mov                 byte ptr [ebp - 0x938], 0x6c
            //   c685c9f6ffff21       | mov                 byte ptr [ebp - 0x937], 0x21
            //   c685caf6ffff00       | mov                 byte ptr [ebp - 0x936], 0
            //   c685cbf6ffff00       | mov                 byte ptr [ebp - 0x935], 0
            //   c685ccf6ffff7e       | mov                 byte ptr [ebp - 0x934], 0x7e
            //   c685cdf6ffff21       | mov                 byte ptr [ebp - 0x933], 0x21

        $sequence_3 = { c6851ccbffffbd c6851dcbffffb0 c6851ecbfffffd c6851fcbffffff c68520cbffffff c68521cbffff48 c68522cbffff83 }
            // n = 7, score = 200
            //   c6851ccbffffbd       | mov                 byte ptr [ebp - 0x34e4], 0xbd
            //   c6851dcbffffb0       | mov                 byte ptr [ebp - 0x34e3], 0xb0
            //   c6851ecbfffffd       | mov                 byte ptr [ebp - 0x34e2], 0xfd
            //   c6851fcbffffff       | mov                 byte ptr [ebp - 0x34e1], 0xff
            //   c68520cbffffff       | mov                 byte ptr [ebp - 0x34e0], 0xff
            //   c68521cbffff48       | mov                 byte ptr [ebp - 0x34df], 0x48
            //   c68522cbffff83       | mov                 byte ptr [ebp - 0x34de], 0x83

        $sequence_4 = { 897508 0f1002 0f1106 f30f7e4210 660fd64610 8b4e08 85c9 }
            // n = 7, score = 200
            //   897508               | mov                 dword ptr [ebp + 8], esi
            //   0f1002               | movups              xmm0, xmmword ptr [edx]
            //   0f1106               | movups              xmmword ptr [esi], xmm0
            //   f30f7e4210           | movq                xmm0, qword ptr [edx + 0x10]
            //   660fd64610           | movq                qword ptr [esi + 0x10], xmm0
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   85c9                 | test                ecx, ecx

        $sequence_5 = { c6859cc8ffff01 c6859dc8ffff00 c6859ec8ffff00 c6859fc8ffff48 c685a0c8ffff83 c685a1c8ffffec c685a2c8ffff20 }
            // n = 7, score = 200
            //   c6859cc8ffff01       | mov                 byte ptr [ebp - 0x3764], 1
            //   c6859dc8ffff00       | mov                 byte ptr [ebp - 0x3763], 0
            //   c6859ec8ffff00       | mov                 byte ptr [ebp - 0x3762], 0
            //   c6859fc8ffff48       | mov                 byte ptr [ebp - 0x3761], 0x48
            //   c685a0c8ffff83       | mov                 byte ptr [ebp - 0x3760], 0x83
            //   c685a1c8ffffec       | mov                 byte ptr [ebp - 0x375f], 0xec
            //   c685a2c8ffff20       | mov                 byte ptr [ebp - 0x375e], 0x20

        $sequence_6 = { 83c410 83f81b eb2f 8d442454 660fd6442454 50 8b4708 }
            // n = 7, score = 200
            //   83c410               | add                 esp, 0x10
            //   83f81b               | cmp                 eax, 0x1b
            //   eb2f                 | jmp                 0x31
            //   8d442454             | lea                 eax, [esp + 0x54]
            //   660fd6442454         | movq                qword ptr [esp + 0x54], xmm0
            //   50                   | push                eax
            //   8b4708               | mov                 eax, dword ptr [edi + 8]

        $sequence_7 = { 6a00 ffd6 8983a8020000 8db3d8020000 c645fc03 56 8975e0 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ffd6                 | call                esi
            //   8983a8020000         | mov                 dword ptr [ebx + 0x2a8], eax
            //   8db3d8020000         | lea                 esi, [ebx + 0x2d8]
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   56                   | push                esi
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi

        $sequence_8 = { 83854cc0ffff02 80bda7c0ffff00 75ae c785c8bfffff00000000 eb0b 1bc9 83c901 }
            // n = 7, score = 200
            //   83854cc0ffff02       | add                 dword ptr [ebp - 0x3fb4], 2
            //   80bda7c0ffff00       | cmp                 byte ptr [ebp - 0x3f59], 0
            //   75ae                 | jne                 0xffffffb0
            //   c785c8bfffff00000000     | mov    dword ptr [ebp - 0x4038], 0
            //   eb0b                 | jmp                 0xd
            //   1bc9                 | sbb                 ecx, ecx
            //   83c901               | or                  ecx, 1

        $sequence_9 = { 50 56 ff15???????? 8bf8 56 ff15???????? 8bc7 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bc7                 | mov                 eax, edi

    condition:
        7 of them and filesize < 966656
}