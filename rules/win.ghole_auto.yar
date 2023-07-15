rule win_ghole_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.ghole."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ghole"
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
        $sequence_0 = { 8d1410 48 8b45e8 48 8b00 48 8902 }
            // n = 7, score = 100
            //   8d1410               | lea                 edx, [eax + edx]
            //   48                   | dec                 eax
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   48                   | dec                 eax
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   48                   | dec                 eax
            //   8902                 | mov                 dword ptr [edx], eax

        $sequence_1 = { c745fcffffffff 48 8b45c8 48 89c7 e8???????? 48 }
            // n = 7, score = 100
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   48                   | dec                 eax
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   48                   | dec                 eax
            //   89c7                 | mov                 edi, eax
            //   e8????????           |                     
            //   48                   | dec                 eax

        $sequence_2 = { e9???????? 48 8b1d???????? 48 8b55a0 48 8b45c0 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   48                   | dec                 eax
            //   8b1d????????         |                     
            //   48                   | dec                 eax
            //   8b55a0               | mov                 edx, dword ptr [ebp - 0x60]
            //   48                   | dec                 eax
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]

        $sequence_3 = { 837decff 7523 48 8b05???????? ffd0 89c7 }
            // n = 6, score = 100
            //   837decff             | cmp                 dword ptr [ebp - 0x14], -1
            //   7523                 | jne                 0x25
            //   48                   | dec                 eax
            //   8b05????????         |                     
            //   ffd0                 | call                eax
            //   89c7                 | mov                 edi, eax

        $sequence_4 = { 48 83ec48 48 897dc8 8975c4 48 8955b8 }
            // n = 7, score = 100
            //   48                   | dec                 eax
            //   83ec48               | sub                 esp, 0x48
            //   48                   | dec                 eax
            //   897dc8               | mov                 dword ptr [ebp - 0x38], edi
            //   8975c4               | mov                 dword ptr [ebp - 0x3c], esi
            //   48                   | dec                 eax
            //   8955b8               | mov                 dword ptr [ebp - 0x48], edx

        $sequence_5 = { 8b45e8 48 89c7 e8???????? c745f801000000 eb24 48 }
            // n = 7, score = 100
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   48                   | dec                 eax
            //   89c7                 | mov                 edi, eax
            //   e8????????           |                     
            //   c745f801000000       | mov                 dword ptr [ebp - 8], 1
            //   eb24                 | jmp                 0x26
            //   48                   | dec                 eax

        $sequence_6 = { 8345f808 8b45b4 3b45f8 77b2 48 8b45b8 }
            // n = 6, score = 100
            //   8345f808             | add                 dword ptr [ebp - 8], 8
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   3b45f8               | cmp                 eax, dword ptr [ebp - 8]
            //   77b2                 | ja                  0xffffffb4
            //   48                   | dec                 eax
            //   8b45b8               | mov                 eax, dword ptr [ebp - 0x48]

        $sequence_7 = { 8b00 8d5001 48 8b45e0 8910 8345f801 8b55f8 }
            // n = 7, score = 100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8d5001               | lea                 edx, [eax + 1]
            //   48                   | dec                 eax
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8910                 | mov                 dword ptr [eax], edx
            //   8345f801             | add                 dword ptr [ebp - 8], 1
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_8 = { bea40f0000 48 89c7 e8???????? e9???????? 817dc49a020000 }
            // n = 6, score = 100
            //   bea40f0000           | mov                 esi, 0xfa4
            //   48                   | dec                 eax
            //   89c7                 | mov                 edi, eax
            //   e8????????           |                     
            //   e9????????           |                     
            //   817dc49a020000       | cmp                 dword ptr [ebp - 0x3c], 0x29a

        $sequence_9 = { 741b 48 8b45e0 48 8b00 48 }
            // n = 6, score = 100
            //   741b                 | je                  0x1d
            //   48                   | dec                 eax
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   48                   | dec                 eax
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   48                   | dec                 eax

    condition:
        7 of them and filesize < 622592
}