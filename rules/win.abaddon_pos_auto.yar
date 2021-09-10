rule win_abaddon_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.abaddon_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.abaddon_pos"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 48 81c3fc030000 8903 48 8b9ed0050000 }
            // n = 5, score = 100
            //   48                   | dec                 eax
            //   81c3fc030000         | add                 ebx, 0x3fc
            //   8903                 | mov                 dword ptr [ebx], eax
            //   48                   | dec                 eax
            //   8b9ed0050000         | mov                 ebx, dword ptr [esi + 0x5d0]

        $sequence_1 = { 6a00 ff15???????? 89855cfeffff 6a04 6800300000 6850900100 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   89855cfeffff         | mov                 dword ptr [ebp - 0x1a4], eax
            //   6a04                 | push                4
            //   6800300000           | push                0x3000
            //   6850900100           | push                0x19050

        $sequence_2 = { 31db 48 8bbed0050000 48 81c7f8030000 48 }
            // n = 6, score = 100
            //   31db                 | xor                 ebx, ebx
            //   48                   | dec                 eax
            //   8bbed0050000         | mov                 edi, dword ptr [esi + 0x5d0]
            //   48                   | dec                 eax
            //   81c7f8030000         | add                 edi, 0x3f8
            //   48                   | dec                 eax

        $sequence_3 = { 760f 80395e 740a 80393d 7405 }
            // n = 5, score = 100
            //   760f                 | jbe                 0x11
            //   80395e               | cmp                 byte ptr [ecx], 0x5e
            //   740a                 | je                  0xc
            //   80393d               | cmp                 byte ptr [ecx], 0x3d
            //   7405                 | je                  7

        $sequence_4 = { ba00000000 eb05 ba01000000 0186ac010000 3b9ea8010000 }
            // n = 5, score = 100
            //   ba00000000           | mov                 edx, 0
            //   eb05                 | jmp                 7
            //   ba01000000           | mov                 edx, 1
            //   0186ac010000         | add                 dword ptr [esi + 0x1ac], eax
            //   3b9ea8010000         | cmp                 ebx, dword ptr [esi + 0x1a8]

        $sequence_5 = { 8b86d0050000 48 0500040000 833800 0f860d020000 48 83ec20 }
            // n = 7, score = 100
            //   8b86d0050000         | mov                 eax, dword ptr [esi + 0x5d0]
            //   48                   | dec                 eax
            //   0500040000           | add                 eax, 0x400
            //   833800               | cmp                 dword ptr [eax], 0
            //   0f860d020000         | jbe                 0x213
            //   48                   | dec                 eax
            //   83ec20               | sub                 esp, 0x20

        $sequence_6 = { c7c102020000 48 8d96f0050000 ff15???????? }
            // n = 4, score = 100
            //   c7c102020000         | mov                 ecx, 0x202
            //   48                   | dec                 eax
            //   8d96f0050000         | lea                 edx, dword ptr [esi + 0x5f0]
            //   ff15????????         |                     

        $sequence_7 = { 48 83ec20 48 8b8ed0050000 48 c7c200d00700 ff15???????? }
            // n = 7, score = 100
            //   48                   | dec                 eax
            //   83ec20               | sub                 esp, 0x20
            //   48                   | dec                 eax
            //   8b8ed0050000         | mov                 ecx, dword ptr [esi + 0x5d0]
            //   48                   | dec                 eax
            //   c7c200d00700         | mov                 edx, 0x7d000
            //   ff15????????         |                     

        $sequence_8 = { 48 89d9 ff15???????? 48 83c420 }
            // n = 5, score = 100
            //   48                   | dec                 eax
            //   89d9                 | mov                 ecx, ebx
            //   ff15????????         |                     
            //   48                   | dec                 eax
            //   83c420               | add                 esp, 0x20

        $sequence_9 = { 83c420 48 83ec30 48 c7c100000000 }
            // n = 5, score = 100
            //   83c420               | add                 esp, 0x20
            //   48                   | dec                 eax
            //   83ec30               | sub                 esp, 0x30
            //   48                   | dec                 eax
            //   c7c100000000         | mov                 ecx, 0

        $sequence_10 = { 038560feffff 89c6 81c680000000 ffb6ac000000 }
            // n = 4, score = 100
            //   038560feffff         | add                 eax, dword ptr [ebp - 0x1a0]
            //   89c6                 | mov                 esi, eax
            //   81c680000000         | add                 esi, 0x80
            //   ffb6ac000000         | push                dword ptr [esi + 0xac]

        $sequence_11 = { 8b9e0c010000 8b8600010000 01d8 89867c010000 8b8684010000 39867c010000 }
            // n = 6, score = 100
            //   8b9e0c010000         | mov                 ebx, dword ptr [esi + 0x10c]
            //   8b8600010000         | mov                 eax, dword ptr [esi + 0x100]
            //   01d8                 | add                 eax, ebx
            //   89867c010000         | mov                 dword ptr [esi + 0x17c], eax
            //   8b8684010000         | mov                 eax, dword ptr [esi + 0x184]
            //   39867c010000         | cmp                 dword ptr [esi + 0x17c], eax

        $sequence_12 = { 0500040000 833800 763a 31db 89d8 }
            // n = 5, score = 100
            //   0500040000           | add                 eax, 0x400
            //   833800               | cmp                 dword ptr [eax], 0
            //   763a                 | jbe                 0x3c
            //   31db                 | xor                 ebx, ebx
            //   89d8                 | mov                 eax, ebx

        $sequence_13 = { e9???????? eb91 81be0c01000080cf0700 7607 }
            // n = 4, score = 100
            //   e9????????           |                     
            //   eb91                 | jmp                 0xffffff93
            //   81be0c01000080cf0700     | cmp    dword ptr [esi + 0x10c], 0x7cf80
            //   7607                 | jbe                 9

        $sequence_14 = { c70630010000 48 83ec20 48 c7c10f000000 48 }
            // n = 6, score = 100
            //   c70630010000         | mov                 dword ptr [esi], 0x130
            //   48                   | dec                 eax
            //   83ec20               | sub                 esp, 0x20
            //   48                   | dec                 eax
            //   c7c10f000000         | mov                 ecx, 0xf
            //   48                   | dec                 eax

        $sequence_15 = { 43 e9???????? c6840ec001000000 8b9ebc010000 }
            // n = 4, score = 100
            //   43                   | inc                 ebx
            //   e9????????           |                     
            //   c6840ec001000000     | mov                 byte ptr [esi + ecx + 0x1c0], 0
            //   8b9ebc010000         | mov                 ebx, dword ptr [esi + 0x1bc]

    condition:
        7 of them and filesize < 40960
}