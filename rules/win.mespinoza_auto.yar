rule win_mespinoza_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mespinoza."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mespinoza"
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
        $sequence_0 = { 8b4c242c 8b442414 81c1a1ebd96e 33442430 03f1 33442438 8bce }
            // n = 7, score = 200
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   81c1a1ebd96e         | add                 ecx, 0x6ed9eba1
            //   33442430             | xor                 eax, dword ptr [esp + 0x30]
            //   03f1                 | add                 esi, ecx
            //   33442438             | xor                 eax, dword ptr [esp + 0x38]
            //   8bce                 | mov                 ecx, esi

        $sequence_1 = { 762c 6a01 57 50 ff760c 56 e8???????? }
            // n = 7, score = 200
            //   762c                 | jbe                 0x2e
            //   6a01                 | push                1
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_2 = { 03c6 8db1d6c162ca 03f0 8b442464 8bce }
            // n = 5, score = 200
            //   03c6                 | add                 eax, esi
            //   8db1d6c162ca         | lea                 esi, [ecx - 0x359d3e2a]
            //   03f0                 | add                 esi, eax
            //   8b442464             | mov                 eax, dword ptr [esp + 0x64]
            //   8bce                 | mov                 ecx, esi

        $sequence_3 = { ff5264 8b4d08 50 e8???????? 8d4db4 e8???????? 8b4508 }
            // n = 7, score = 200
            //   ff5264               | call                dword ptr [edx + 0x64]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d4db4               | lea                 ecx, [ebp - 0x4c]
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_4 = { 3bc7 8b442434 72cb 89742434 3bf7 0f83f8000000 }
            // n = 6, score = 200
            //   3bc7                 | cmp                 eax, edi
            //   8b442434             | mov                 eax, dword ptr [esp + 0x34]
            //   72cb                 | jb                  0xffffffcd
            //   89742434             | mov                 dword ptr [esp + 0x34], esi
            //   3bf7                 | cmp                 esi, edi
            //   0f83f8000000         | jae                 0xfe

        $sequence_5 = { 39959cebffff 0f8cf0feffff 7f08 3bc8 0f82e6feffff 33c0 6a02 }
            // n = 7, score = 200
            //   39959cebffff         | cmp                 dword ptr [ebp - 0x1464], edx
            //   0f8cf0feffff         | jl                  0xfffffef6
            //   7f08                 | jg                  0xa
            //   3bc8                 | cmp                 ecx, eax
            //   0f82e6feffff         | jb                  0xfffffeec
            //   33c0                 | xor                 eax, eax
            //   6a02                 | push                2

        $sequence_6 = { 50 53 ff15???????? 8dbdf8feffff 4f 8a4701 47 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8dbdf8feffff         | lea                 edi, [ebp - 0x108]
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   47                   | inc                 edi

        $sequence_7 = { 6bca30 030c8500b04700 f6412d01 7428 e8???????? c70016000000 }
            // n = 6, score = 200
            //   6bca30               | imul                ecx, edx, 0x30
            //   030c8500b04700       | add                 ecx, dword ptr [eax*4 + 0x47b000]
            //   f6412d01             | test                byte ptr [ecx + 0x2d], 1
            //   7428                 | je                  0x2a
            //   e8????????           |                     
            //   c70016000000         | mov                 dword ptr [eax], 0x16

        $sequence_8 = { 8d45f4 64a300000000 8bf9 897df0 8b7510 }
            // n = 5, score = 200
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8bf9                 | mov                 edi, ecx
            //   897df0               | mov                 dword ptr [ebp - 0x10], edi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]

        $sequence_9 = { 8b4518 6a40 895de0 8945ec e8???????? 8bf8 59 }
            // n = 7, score = 200
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   6a40                 | push                0x40
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 1091584
}