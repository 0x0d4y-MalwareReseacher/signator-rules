rule win_arkei_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.arkei_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.arkei_stealer"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8b4e20 8b16 8d448a0e 6a00 8d4de4 51 6a0e }
            // n = 7, score = 400
            //   8b4e20               | mov                 ecx, dword ptr [esi + 0x20]
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8d448a0e             | lea                 eax, [edx + ecx*4 + 0xe]
            //   6a00                 | push                0
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   51                   | push                ecx
            //   6a0e                 | push                0xe

        $sequence_1 = { 730c ba01000000 8acb d3e2 895620 8b4604 }
            // n = 6, score = 400
            //   730c                 | jae                 0xe
            //   ba01000000           | mov                 edx, 1
            //   8acb                 | mov                 cl, bl
            //   d3e2                 | shl                 edx, cl
            //   895620               | mov                 dword ptr [esi + 0x20], edx
            //   8b4604               | mov                 eax, dword ptr [esi + 4]

        $sequence_2 = { 6a00 6a00 ff15???????? 50 8945fc e8???????? }
            // n = 6, score = 400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   e8????????           |                     

        $sequence_3 = { 8d4c020e 33d2 894dee 8955f2 }
            // n = 4, score = 400
            //   8d4c020e             | lea                 ecx, [edx + eax + 0xe]
            //   33d2                 | xor                 edx, edx
            //   894dee               | mov                 dword ptr [ebp - 0x12], ecx
            //   8955f2               | mov                 dword ptr [ebp - 0xe], edx

        $sequence_4 = { c1f803 0fafc1 0faf4608 33ff 50 57 }
            // n = 6, score = 400
            //   c1f803               | sar                 eax, 3
            //   0fafc1               | imul                eax, ecx
            //   0faf4608             | imul                eax, dword ptr [esi + 8]
            //   33ff                 | xor                 edi, edi
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_5 = { 53 57 ff15???????? 85c0 0f841dfeffff 57 }
            // n = 6, score = 400
            //   53                   | push                ebx
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f841dfeffff         | je                  0xfffffe23
            //   57                   | push                edi

        $sequence_6 = { 57 50 51 ff15???????? 85c0 0f84c4feffff }
            // n = 6, score = 400
            //   57                   | push                edi
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f84c4feffff         | je                  0xfffffeca

        $sequence_7 = { ba424d0000 668955ec 8b4620 8b0e }
            // n = 4, score = 400
            //   ba424d0000           | mov                 edx, 0x4d42
            //   668955ec             | mov                 word ptr [ebp - 0x14], dx
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   8b0e                 | mov                 ecx, dword ptr [esi]

        $sequence_8 = { 53 56 6a00 6a00 51 ff15???????? 85c0 }
            // n = 7, score = 400
            //   53                   | push                ebx
            //   56                   | push                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_9 = { ff15???????? 85c0 74aa 8b4dd6 0faf4dd4 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   74aa                 | je                  0xffffffac
            //   8b4dd6               | mov                 ecx, dword ptr [ebp - 0x2a]
            //   0faf4dd4             | imul                ecx, dword ptr [ebp - 0x2c]

    condition:
        7 of them and filesize < 1744896
}