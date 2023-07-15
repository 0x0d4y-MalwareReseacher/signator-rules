rule win_unidentified_039_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.unidentified_039."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_039"
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
        $sequence_0 = { c1e808 83e00f 6bc01f c1e704 83c30c 03fa }
            // n = 6, score = 100
            //   c1e808               | shr                 eax, 8
            //   83e00f               | and                 eax, 0xf
            //   6bc01f               | imul                eax, eax, 0x1f
            //   c1e704               | shl                 edi, 4
            //   83c30c               | add                 ebx, 0xc
            //   03fa                 | add                 edi, edx

        $sequence_1 = { 3bc8 7c09 ff75f0 ff15???????? ff75e4 ff15???????? }
            // n = 6, score = 100
            //   3bc8                 | cmp                 ecx, eax
            //   7c09                 | jl                  0xb
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff15????????         |                     
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff15????????         |                     

        $sequence_2 = { 68ff030000 8d85f40f0000 50 ff75e4 c745d8c8010000 c745d866530000 ff15???????? }
            // n = 7, score = 100
            //   68ff030000           | push                0x3ff
            //   8d85f40f0000         | lea                 eax, [ebp + 0xff4]
            //   50                   | push                eax
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   c745d8c8010000       | mov                 dword ptr [ebp - 0x28], 0x1c8
            //   c745d866530000       | mov                 dword ptr [ebp - 0x28], 0x5366
            //   ff15????????         |                     

        $sequence_3 = { c745f47e1f0000 c745ec977e0000 8b45f4 8b4d08 0fafc1 8b4dec 33c1 }
            // n = 7, score = 100
            //   c745f47e1f0000       | mov                 dword ptr [ebp - 0xc], 0x1f7e
            //   c745ec977e0000       | mov                 dword ptr [ebp - 0x14], 0x7e97
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   0fafc1               | imul                eax, ecx
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   33c1                 | xor                 eax, ecx

        $sequence_4 = { c7452811440000 c74520ed6f0000 8b4530 8b4d34 2bc8 8b4538 23c8 }
            // n = 7, score = 100
            //   c7452811440000       | mov                 dword ptr [ebp + 0x28], 0x4411
            //   c74520ed6f0000       | mov                 dword ptr [ebp + 0x20], 0x6fed
            //   8b4530               | mov                 eax, dword ptr [ebp + 0x30]
            //   8b4d34               | mov                 ecx, dword ptr [ebp + 0x34]
            //   2bc8                 | sub                 ecx, eax
            //   8b4538               | mov                 eax, dword ptr [ebp + 0x38]
            //   23c8                 | and                 ecx, eax

        $sequence_5 = { ff75d4 ff75d0 6801000050 ff75d8 ff75dc 53 ffd7 }
            // n = 7, score = 100
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   6801000050           | push                0x50000001
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   53                   | push                ebx
            //   ffd7                 | call                edi

        $sequence_6 = { 33c8 894de0 8b45ec 8b4df0 3bc8 7c0a 53 }
            // n = 7, score = 100
            //   33c8                 | xor                 ecx, eax
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   3bc8                 | cmp                 ecx, eax
            //   7c0a                 | jl                  0xc
            //   53                   | push                ebx

        $sequence_7 = { ff75e8 ff15???????? 8b4508 e8???????? c3 6a14 68???????? }
            // n = 7, score = 100
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   ff15????????         |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   c3                   | ret                 
            //   6a14                 | push                0x14
            //   68????????           |                     

        $sequence_8 = { 50 e8???????? 59 59 c7451cb7360000 c7453475060000 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   c7451cb7360000       | mov                 dword ptr [ebp + 0x1c], 0x36b7
            //   c7453475060000       | mov                 dword ptr [ebp + 0x34], 0x675

        $sequence_9 = { 034dd8 8b45e8 8b55f0 2bd0 8b45dc 23ca }
            // n = 6, score = 100
            //   034dd8               | add                 ecx, dword ptr [ebp - 0x28]
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   2bd0                 | sub                 edx, eax
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   23ca                 | and                 ecx, edx

    condition:
        7 of them and filesize < 262144
}