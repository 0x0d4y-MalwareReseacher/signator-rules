rule win_avaddon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.avaddon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.avaddon"
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
        $sequence_0 = { 8d45c0 ff7608 ff7604 ff36 68???????? 50 e8???????? }
            // n = 7, score = 200
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff7604               | push                dword ptr [esi + 4]
            //   ff36                 | push                dword ptr [esi]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_1 = { 7411 8d8d48feffff 81e6ffefffff e8???????? f7c600080000 7411 8d8d60feffff }
            // n = 7, score = 200
            //   7411                 | je                  0x13
            //   8d8d48feffff         | lea                 ecx, [ebp - 0x1b8]
            //   81e6ffefffff         | and                 esi, 0xffffefff
            //   e8????????           |                     
            //   f7c600080000         | test                esi, 0x800
            //   7411                 | je                  0x13
            //   8d8d60feffff         | lea                 ecx, [ebp - 0x1a0]

        $sequence_2 = { 8b8dc0feffff 8d57ff 03530c 49 034b08 4e 8b4588 }
            // n = 7, score = 200
            //   8b8dc0feffff         | mov                 ecx, dword ptr [ebp - 0x140]
            //   8d57ff               | lea                 edx, [edi - 1]
            //   03530c               | add                 edx, dword ptr [ebx + 0xc]
            //   49                   | dec                 ecx
            //   034b08               | add                 ecx, dword ptr [ebx + 8]
            //   4e                   | dec                 esi
            //   8b4588               | mov                 eax, dword ptr [ebp - 0x78]

        $sequence_3 = { 8d040a 8bd0 8945dc 83ca0f }
            // n = 4, score = 200
            //   8d040a               | lea                 eax, [edx + ecx]
            //   8bd0                 | mov                 edx, eax
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   83ca0f               | or                  edx, 0xf

        $sequence_4 = { b9???????? b8???????? 0f42c1 8d4dd8 50 e8???????? 47 }
            // n = 7, score = 200
            //   b9????????           |                     
            //   b8????????           |                     
            //   0f42c1               | cmovb               eax, ecx
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   50                   | push                eax
            //   e8????????           |                     
            //   47                   | inc                 edi

        $sequence_5 = { 0f849f000000 57 8bfe 8d5640 8d482c 2bf8 90 }
            // n = 7, score = 200
            //   0f849f000000         | je                  0xa5
            //   57                   | push                edi
            //   8bfe                 | mov                 edi, esi
            //   8d5640               | lea                 edx, [esi + 0x40]
            //   8d482c               | lea                 ecx, [eax + 0x2c]
            //   2bf8                 | sub                 edi, eax
            //   90                   | nop                 

        $sequence_6 = { 03c6 894708 8b17 8b45f8 8b4df4 52 8bd0 }
            // n = 7, score = 200
            //   03c6                 | add                 eax, esi
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   52                   | push                edx
            //   8bd0                 | mov                 edx, eax

        $sequence_7 = { 894df8 3bd9 7320 8d4301 894710 83f910 7202 }
            // n = 7, score = 200
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   3bd9                 | cmp                 ebx, ecx
            //   7320                 | jae                 0x22
            //   8d4301               | lea                 eax, [ebx + 1]
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   83f910               | cmp                 ecx, 0x10
            //   7202                 | jb                  4

        $sequence_8 = { 8b4d88 0f1f00 837d8000 8bc2 8b9518ffffff 8985a8feffff 899500ffffff }
            // n = 7, score = 200
            //   8b4d88               | mov                 ecx, dword ptr [ebp - 0x78]
            //   0f1f00               | nop                 dword ptr [eax]
            //   837d8000             | cmp                 dword ptr [ebp - 0x80], 0
            //   8bc2                 | mov                 eax, edx
            //   8b9518ffffff         | mov                 edx, dword ptr [ebp - 0xe8]
            //   8985a8feffff         | mov                 dword ptr [ebp - 0x158], eax
            //   899500ffffff         | mov                 dword ptr [ebp - 0x100], edx

        $sequence_9 = { 8985fcfeffff 3bbd38ffffff 7d05 8b4d84 ebcc c70000000000 8b4d80 }
            // n = 7, score = 200
            //   8985fcfeffff         | mov                 dword ptr [ebp - 0x104], eax
            //   3bbd38ffffff         | cmp                 edi, dword ptr [ebp - 0xc8]
            //   7d05                 | jge                 7
            //   8b4d84               | mov                 ecx, dword ptr [ebp - 0x7c]
            //   ebcc                 | jmp                 0xffffffce
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   8b4d80               | mov                 ecx, dword ptr [ebp - 0x80]

    condition:
        7 of them and filesize < 2343936
}