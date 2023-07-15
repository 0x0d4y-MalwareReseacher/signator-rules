rule win_babar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.babar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.babar"
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
        $sequence_0 = { 3bd3 7f1d 8bc3 2bc2 8d448500 }
            // n = 5, score = 400
            //   3bd3                 | cmp                 edx, ebx
            //   7f1d                 | jg                  0x1f
            //   8bc3                 | mov                 eax, ebx
            //   2bc2                 | sub                 eax, edx
            //   8d448500             | lea                 eax, [ebp + eax*4]

        $sequence_1 = { 3bd5 7e47 8d0c9500000000 2bd9 }
            // n = 4, score = 400
            //   3bd5                 | cmp                 edx, ebp
            //   7e47                 | jle                 0x49
            //   8d0c9500000000       | lea                 ecx, [edx*4]
            //   2bd9                 | sub                 ebx, ecx

        $sequence_2 = { 46 8bcb e8???????? 8983d8020000 }
            // n = 4, score = 400
            //   46                   | inc                 esi
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8983d8020000         | mov                 dword ptr [ebx + 0x2d8], eax

        $sequence_3 = { 3bd6 0f82eefeffff 8b742458 03f5 }
            // n = 4, score = 400
            //   3bd6                 | cmp                 edx, esi
            //   0f82eefeffff         | jb                  0xfffffef4
            //   8b742458             | mov                 esi, dword ptr [esp + 0x58]
            //   03f5                 | add                 esi, ebp

        $sequence_4 = { 3bd6 0f86f9feffff 8b54243c 8b442438 }
            // n = 4, score = 400
            //   3bd6                 | cmp                 edx, esi
            //   0f86f9feffff         | jbe                 0xfffffeff
            //   8b54243c             | mov                 edx, dword ptr [esp + 0x3c]
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]

        $sequence_5 = { 3bd3 d8442410 d95c2410 7eeb }
            // n = 4, score = 400
            //   3bd3                 | cmp                 edx, ebx
            //   d8442410             | fadd                dword ptr [esp + 0x10]
            //   d95c2410             | fstp                dword ptr [esp + 0x10]
            //   7eeb                 | jle                 0xffffffed

        $sequence_6 = { 3bd5 0f8671ffffff 8144241890020000 ddd8 }
            // n = 4, score = 400
            //   3bd5                 | cmp                 edx, ebp
            //   0f8671ffffff         | jbe                 0xffffff77
            //   8144241890020000     | add                 dword ptr [esp + 0x18], 0x290
            //   ddd8                 | fstp                st(0)

        $sequence_7 = { 3bd6 0f8c7affffff 8bbc24d0000000 ddd9 }
            // n = 4, score = 400
            //   3bd6                 | cmp                 edx, esi
            //   0f8c7affffff         | jl                  0xffffff80
            //   8bbc24d0000000       | mov                 edi, dword ptr [esp + 0xd0]
            //   ddd9                 | fstp                st(1)

        $sequence_8 = { 56 8937 ffd5 894704 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   8937                 | mov                 dword ptr [edi], esi
            //   ffd5                 | call                ebp
            //   894704               | mov                 dword ptr [edi + 4], eax

        $sequence_9 = { 5e 5d 33c0 5b 8b8c2400020000 }
            // n = 5, score = 200
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   8b8c2400020000       | mov                 ecx, dword ptr [esp + 0x200]

        $sequence_10 = { 33c0 5b 8b8c2470120000 33cc }
            // n = 4, score = 200
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   8b8c2470120000       | mov                 ecx, dword ptr [esp + 0x1270]
            //   33cc                 | xor                 ecx, esp

        $sequence_11 = { 5d c3 8b5500 52 ff15???????? 5f 894504 }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b5500               | mov                 edx, dword ptr [ebp]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   894504               | mov                 dword ptr [ebp + 4], eax

        $sequence_12 = { b8abaaaaaa f7e5 8bfa d1ef 8d04bd00000000 2bc7 }
            // n = 6, score = 200
            //   b8abaaaaaa           | mov                 eax, 0xaaaaaaab
            //   f7e5                 | mul                 ebp
            //   8bfa                 | mov                 edi, edx
            //   d1ef                 | shr                 edi, 1
            //   8d04bd00000000       | lea                 eax, [edi*4]
            //   2bc7                 | sub                 eax, edi

        $sequence_13 = { 6a00 56 e8???????? 83c410 5f 8bc6 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi

        $sequence_14 = { 66f7460c0c01 754e 53 57 8d3c85489c0110 833f00 bb00100000 }
            // n = 7, score = 200
            //   66f7460c0c01         | test                word ptr [esi + 0xc], 0x10c
            //   754e                 | jne                 0x50
            //   53                   | push                ebx
            //   57                   | push                edi
            //   8d3c85489c0110       | lea                 edi, [eax*4 + 0x10019c48]
            //   833f00               | cmp                 dword ptr [edi], 0
            //   bb00100000           | mov                 ebx, 0x1000

        $sequence_15 = { 50 8d4c2458 51 68???????? 68???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8d4c2458             | lea                 ecx, [esp + 0x58]
            //   51                   | push                ecx
            //   68????????           |                     
            //   68????????           |                     

    condition:
        7 of them and filesize < 1294336
}