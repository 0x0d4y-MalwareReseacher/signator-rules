rule win_ahtapot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ahtapot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ahtapot"
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
        $sequence_0 = { 55 8bec 81ec4c0f0000 a1???????? 33c5 8945fc 53 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec4c0f0000         | sub                 esp, 0xf4c
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   53                   | push                ebx

        $sequence_1 = { 8b9560f3ffff 8d85ccfdffff 50 8d8dbcf5ffff 51 81c6cc100000 56 }
            // n = 7, score = 100
            //   8b9560f3ffff         | mov                 edx, dword ptr [ebp - 0xca0]
            //   8d85ccfdffff         | lea                 eax, [ebp - 0x234]
            //   50                   | push                eax
            //   8d8dbcf5ffff         | lea                 ecx, [ebp - 0xa44]
            //   51                   | push                ecx
            //   81c6cc100000         | add                 esi, 0x10cc
            //   56                   | push                esi

        $sequence_2 = { 750a 895e04 b800020000 eb14 c6461c01 895e10 c6460801 }
            // n = 7, score = 100
            //   750a                 | jne                 0xc
            //   895e04               | mov                 dword ptr [esi + 4], ebx
            //   b800020000           | mov                 eax, 0x200
            //   eb14                 | jmp                 0x16
            //   c6461c01             | mov                 byte ptr [esi + 0x1c], 1
            //   895e10               | mov                 dword ptr [esi + 0x10], ebx
            //   c6460801             | mov                 byte ptr [esi + 8], 1

        $sequence_3 = { 8b06 8bc8 c1f905 83e01f c1e006 8b0c8dc0f24200 8d440104 }
            // n = 7, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   83e01f               | and                 eax, 0x1f
            //   c1e006               | shl                 eax, 6
            //   8b0c8dc0f24200       | mov                 ecx, dword ptr [ecx*4 + 0x42f2c0]
            //   8d440104             | lea                 eax, [ecx + eax + 4]

        $sequence_4 = { 898648af0100 8b9644af0100 8b8648af0100 8d0cd0 3b8e6caf0100 740a c786a4af0600b8a74200 }
            // n = 7, score = 100
            //   898648af0100         | mov                 dword ptr [esi + 0x1af48], eax
            //   8b9644af0100         | mov                 edx, dword ptr [esi + 0x1af44]
            //   8b8648af0100         | mov                 eax, dword ptr [esi + 0x1af48]
            //   8d0cd0               | lea                 ecx, [eax + edx*8]
            //   3b8e6caf0100         | cmp                 ecx, dword ptr [esi + 0x1af6c]
            //   740a                 | je                  0xc
            //   c786a4af0600b8a74200     | mov    dword ptr [esi + 0x6afa4], 0x42a7b8

        $sequence_5 = { e9???????? 8bff 55 8bec ff7510 8b450c ff3485188c4200 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   ff3485188c4200       | push                dword ptr [eax*4 + 0x428c18]

        $sequence_6 = { 8bd9 8db3b40a0000 56 8d85f0fdffff 68???????? 50 ffd7 }
            // n = 7, score = 100
            //   8bd9                 | mov                 ebx, ecx
            //   8db3b40a0000         | lea                 esi, [ebx + 0xab4]
            //   56                   | push                esi
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_7 = { c7472000000000 85c0 7407 50 ff15???????? 8b4704 c7470c00000000 }
            // n = 7, score = 100
            //   c7472000000000       | mov                 dword ptr [edi + 0x20], 0
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   c7470c00000000       | mov                 dword ptr [edi + 0xc], 0

        $sequence_8 = { 7403 83c902 81e13bffffff 33f6 3bc1 740c 8b04b58c8c4200 }
            // n = 7, score = 100
            //   7403                 | je                  5
            //   83c902               | or                  ecx, 2
            //   81e13bffffff         | and                 ecx, 0xffffff3b
            //   33f6                 | xor                 esi, esi
            //   3bc1                 | cmp                 eax, ecx
            //   740c                 | je                  0xe
            //   8b04b58c8c4200       | mov                 eax, dword ptr [esi*4 + 0x428c8c]

        $sequence_9 = { e8???????? 68???????? 8d55ec 52 8975f8 897dfc c745ec20a04200 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   68????????           |                     
            //   8d55ec               | lea                 edx, [ebp - 0x14]
            //   52                   | push                edx
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   c745ec20a04200       | mov                 dword ptr [ebp - 0x14], 0x42a020

    condition:
        7 of them and filesize < 430080
}