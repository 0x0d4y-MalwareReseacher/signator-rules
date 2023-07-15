rule win_fudmodule_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.fudmodule."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fudmodule"
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
        $sequence_0 = { 488b96c8090000 488bce e8???????? 488bc8 488986d0090000 }
            // n = 5, score = 100
            //   488b96c8090000       | mov                 dword ptr [ebp + 0x14c], 0x33006c
            //   488bce               | mov                 dword ptr [ebp + 0x154], 0x6c0064
            //   e8????????           |                     
            //   488bc8               | mov                 dword ptr [ebp + 0x158], 0x6c
            //   488986d0090000       | inc                 sp

        $sequence_1 = { 488d8d60010000 e8???????? 488d442468 488dbd60010000 482bf8 660f1f840000000000 0fb710 }
            // n = 7, score = 100
            //   488d8d60010000       | lea                 eax, [0xb98c]
            //   e8????????           |                     
            //   488d442468           | dec                 eax
            //   488dbd60010000       | cmp                 ebx, eax
            //   482bf8               | ja                  0x1a5
            //   660f1f840000000000     | dec    eax
            //   0fb710               | mov                 edx, ebx

        $sequence_2 = { 4c8d459f 488d5308 488bc8 488d45bf 41b908000000 }
            // n = 5, score = 100
            //   4c8d459f             | dec                 eax
            //   488d5308             | xor                 ecx, esp
            //   488bc8               | inc                 ebp
            //   488d45bf             | test                edx, edx
            //   41b908000000         | je                  0x41

        $sequence_3 = { c745d04e455449 c745d44f2e5359 66c745d85300 6690 8bd0 b940000000 }
            // n = 6, score = 100
            //   c745d04e455449       | dec                 eax
            //   c745d44f2e5359       | sub                 edi, ebx
            //   66c745d85300         | movzx               edx, byte ptr [ecx]
            //   6690                 | movzx               eax, byte ptr [ecx + edi]
            //   8bd0                 | sub                 edx, eax
            //   b940000000           | jne                 0x91f

        $sequence_4 = { 488d0d08b60000 483bd9 723e 488d058cb90000 483bd8 7732 488bd3 }
            // n = 7, score = 100
            //   488d0d08b60000       | mov                 byte ptr [esp + 0x36], 5
            //   483bd9               | mov                 word ptr [esp + 0x3c], 0x83f0
            //   723e                 | mov                 byte ptr [esp + 0x3e], 5
            //   488d058cb90000       | dec                 esp
            //   483bd8               | lea                 eax, [ebp - 0x70]
            //   7732                 | dec                 eax
            //   488bd3               | lea                 edx, [0xccee]

        $sequence_5 = { 448bdf 8bd7 7760 440fb74c15f0 4c8d5415f0 4c8d44243c 66453b08 }
            // n = 7, score = 100
            //   448bdf               | je                  0xb01
            //   8bd7                 | dec                 eax
            //   7760                 | mov                 edx, dword ptr [eax]
            //   440fb74c15f0         | dec                 eax
            //   4c8d5415f0           | test                edx, edx
            //   4c8d44243c           | je                  0xb01
            //   66453b08             | dec                 eax

        $sequence_6 = { e8???????? 33ed 48396c2440 0f86e1000000 4889bc2410010000 6666660f1f840000000000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   33ed                 | cmp                 edx, 0x1ef
            //   48396c2440           | jl                  0xcee
            //   0f86e1000000         | dec                 eax
            //   4889bc2410010000     | cmp                 eax, 0x800000
            //   6666660f1f840000000000     | jbe    0xce3

        $sequence_7 = { 488d443805 493bc6 757e 4c8b742428 4533c9 4a8d5c1fd8 }
            // n = 6, score = 100
            //   488d443805           | dec                 eax
            //   493bc6               | add                 esp, 0x38
            //   757e                 | pop                 edi
            //   4c8b742428           | test                eax, eax
            //   4533c9               | jne                 0xbce
            //   4a8d5c1fd8           | dec                 eax

        $sequence_8 = { 488bb42488000000 4883c460 415c 5f 5d c3 4c8bc9 }
            // n = 7, score = 100
            //   488bb42488000000     | rep stosd           dword ptr es:[edi], eax
            //   4883c460             | dec                 eax
            //   415c                 | lea                 edi, [0x9bea]
            //   5f                   | dec                 eax
            //   5d                   | sub                 edi, ebp
            //   c3                   | mov                 al, byte ptr [edi + ebx]
            //   4c8bc9               | mov                 byte ptr [ebx], al

        $sequence_9 = { 85c0 0f44d9 488b4c2430 ff15???????? 8bc3 488b8d00040000 4833cc }
            // n = 7, score = 100
            //   85c0                 | cmp                 dword ptr [edi + 0xa20], 0
            //   0f44d9               | je                  0x26d
            //   488b4c2430           | je                  0x2a4
            //   ff15????????         |                     
            //   8bc3                 | cmp                 eax, 0x2800
            //   488b8d00040000       | jg                  0x26a
            //   4833cc               | je                  0x1e1

    condition:
        7 of them and filesize < 223232
}