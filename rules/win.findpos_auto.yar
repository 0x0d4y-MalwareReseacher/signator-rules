rule win_findpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.findpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.findpos"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 8bf2 e8???????? 8d85e8e7ffff 50 }
            // n = 4, score = 100
            //   8bf2                 | mov                 esi, edx
            //   e8????????           |                     
            //   8d85e8e7ffff         | lea                 eax, [ebp - 0x1818]
            //   50                   | push                eax

        $sequence_1 = { 03c3 8945f4 2bfb 740b 8b35???????? 8b4df0 ebc3 }
            // n = 7, score = 100
            //   03c3                 | add                 eax, ebx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   2bfb                 | sub                 edi, ebx
            //   740b                 | je                  0xd
            //   8b35????????         |                     
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   ebc3                 | jmp                 0xffffffc5

        $sequence_2 = { 8d85e8fdffff 50 6804010000 ff15???????? 8d85f0feffff 50 }
            // n = 6, score = 100
            //   8d85e8fdffff         | lea                 eax, [ebp - 0x218]
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   ff15????????         |                     
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]
            //   50                   | push                eax

        $sequence_3 = { 0f98c0 5d c20800 55 8bec 51 a1???????? }
            // n = 7, score = 100
            //   0f98c0               | sets                al
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   a1????????           |                     

        $sequence_4 = { 53 51 51 6a01 8d45e4 50 e8???????? }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   6a01                 | push                1
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 51 8b8de8fbffff 8d95ecfbffff e8???????? 83c40c 85c0 743c }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   8b8de8fbffff         | mov                 ecx, dword ptr [ebp - 0x418]
            //   8d95ecfbffff         | lea                 edx, [ebp - 0x414]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   743c                 | je                  0x3e

        $sequence_6 = { 8d4c2460 e9???????? 68???????? 8d8c248c000000 e8???????? 8d8c2488000000 }
            // n = 6, score = 100
            //   8d4c2460             | lea                 ecx, [esp + 0x60]
            //   e9????????           |                     
            //   68????????           |                     
            //   8d8c248c000000       | lea                 ecx, [esp + 0x8c]
            //   e8????????           |                     
            //   8d8c2488000000       | lea                 ecx, [esp + 0x88]

        $sequence_7 = { 8be5 5d c20c00 8bd1 8b0a 80790d00 }
            // n = 6, score = 100
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   8bd1                 | mov                 edx, ecx
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   80790d00             | cmp                 byte ptr [ecx + 0xd], 0

        $sequence_8 = { 2afa b4c5 b7cb 6860eff22b a7 }
            // n = 5, score = 100
            //   2afa                 | sub                 bh, dl
            //   b4c5                 | mov                 ah, 0xc5
            //   b7cb                 | mov                 bh, 0xcb
            //   6860eff22b           | push                0x2bf2ef60
            //   a7                   | cmpsd               dword ptr [esi], dword ptr es:[edi]

        $sequence_9 = { 84c9 740b 880e 46 }
            // n = 4, score = 100
            //   84c9                 | test                cl, cl
            //   740b                 | je                  0xd
            //   880e                 | mov                 byte ptr [esi], cl
            //   46                   | inc                 esi

    condition:
        7 of them and filesize < 286720
}