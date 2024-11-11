rule win_fast_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.fast_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fast_pos"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 837efc00 8d56fc 8bc8 7c1f }
            // n = 4, score = 1000
            //   837efc00             | cmp                 dword ptr [esi - 4], 0
            //   8d56fc               | lea                 edx, [esi - 4]
            //   8bc8                 | mov                 ecx, eax
            //   7c1f                 | jl                  0x21

        $sequence_1 = { 8b95e4feffff 8bcf 83c2f0 8d420c f00fc108 49 85c9 }
            // n = 7, score = 1000
            //   8b95e4feffff         | mov                 edx, dword ptr [ebp - 0x11c]
            //   8bcf                 | mov                 ecx, edi
            //   83c2f0               | add                 edx, -0x10
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   f00fc108             | lock xadd           dword ptr [eax], ecx
            //   49                   | dec                 ecx
            //   85c9                 | test                ecx, ecx

        $sequence_2 = { 8b95e4feffff 83c408 83c2f0 8bcf 8d420c f00fc108 }
            // n = 6, score = 1000
            //   8b95e4feffff         | mov                 edx, dword ptr [ebp - 0x11c]
            //   83c408               | add                 esp, 8
            //   83c2f0               | add                 edx, -0x10
            //   8bcf                 | mov                 ecx, edi
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   f00fc108             | lock xadd           dword ptr [eax], ecx

        $sequence_3 = { ff15???????? 50 ff36 8d85e0feffff }
            // n = 4, score = 1000
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff36                 | push                dword ptr [esi]
            //   8d85e0feffff         | lea                 eax, [ebp - 0x120]

        $sequence_4 = { 50 8d85ecfeffff 50 6a00 6a00 68???????? ffb5e8feffff }
            // n = 7, score = 1000
            //   50                   | push                eax
            //   8d85ecfeffff         | lea                 eax, [ebp - 0x114]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   ffb5e8feffff         | push                dword ptr [ebp - 0x118]

        $sequence_5 = { c785e0feffff01000000 c785e8feffff00000000 c785e4feffff04010000 ff15???????? 85c0 7558 }
            // n = 6, score = 1000
            //   c785e0feffff01000000     | mov    dword ptr [ebp - 0x120], 1
            //   c785e8feffff00000000     | mov    dword ptr [ebp - 0x118], 0
            //   c785e4feffff04010000     | mov    dword ptr [ebp - 0x11c], 0x104
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7558                 | jne                 0x5a

        $sequence_6 = { ff5004 80bdebfeffff00 7432 8d8de4feffff e8???????? ff30 }
            // n = 6, score = 1000
            //   ff5004               | call                dword ptr [eax + 4]
            //   80bdebfeffff00       | cmp                 byte ptr [ebp - 0x115], 0
            //   7432                 | je                  0x34
            //   8d8de4feffff         | lea                 ecx, [ebp - 0x11c]
            //   e8????????           |                     
            //   ff30                 | push                dword ptr [eax]

        $sequence_7 = { 8d4710 8b4ef4 41 51 56 51 }
            // n = 6, score = 1000
            //   8d4710               | lea                 eax, [edi + 0x10]
            //   8b4ef4               | mov                 ecx, dword ptr [esi - 0xc]
            //   41                   | inc                 ecx
            //   51                   | push                ecx
            //   56                   | push                esi
            //   51                   | push                ecx

        $sequence_8 = { c785e8feffff01000000 e8???????? 83c40c 8bc6 }
            // n = 4, score = 1000
            //   c785e8feffff01000000     | mov    dword ptr [ebp - 0x118], 1
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bc6                 | mov                 eax, esi

        $sequence_9 = { 6a64 8d4580 c745fc00000000 50 89b578ffffff c7857cffffff00000000 ff15???????? }
            // n = 7, score = 1000
            //   6a64                 | push                0x64
            //   8d4580               | lea                 eax, [ebp - 0x80]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   50                   | push                eax
            //   89b578ffffff         | mov                 dword ptr [ebp - 0x88], esi
            //   c7857cffffff00000000     | mov    dword ptr [ebp - 0x84], 0
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 327680
}