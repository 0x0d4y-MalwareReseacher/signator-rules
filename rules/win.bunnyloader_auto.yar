rule win_bunnyloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.bunnyloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bunnyloader"
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
        $sequence_0 = { ff33 e8???????? 83c408 85c0 7441 85f6 7535 }
            // n = 7, score = 100
            //   ff33                 | push                dword ptr [ebx]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7441                 | je                  0x43
            //   85f6                 | test                esi, esi
            //   7535                 | jne                 0x37

        $sequence_1 = { ff74242c 8bce 52 ba0e000000 e8???????? 83c40c eb7a }
            // n = 7, score = 100
            //   ff74242c             | push                dword ptr [esp + 0x2c]
            //   8bce                 | mov                 ecx, esi
            //   52                   | push                edx
            //   ba0e000000           | mov                 edx, 0xe
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb7a                 | jmp                 0x7c

        $sequence_2 = { c744881000000000 6af8 ff742428 8bcf e8???????? 8b442410 83c408 }
            // n = 7, score = 100
            //   c744881000000000     | mov                 dword ptr [eax + ecx*4 + 0x10], 0
            //   6af8                 | push                -8
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   83c408               | add                 esp, 8

        $sequence_3 = { ffb564e6ffff ffd6 6800800000 6a00 57 ff15???????? 6804010000 }
            // n = 7, score = 100
            //   ffb564e6ffff         | push                dword ptr [ebp - 0x199c]
            //   ffd6                 | call                esi
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6804010000           | push                0x104

        $sequence_4 = { ff742418 ba87000000 8bce e8???????? 83c40c 8bd0 e9???????? }
            // n = 7, score = 100
            //   ff742418             | push                dword ptr [esp + 0x18]
            //   ba87000000           | mov                 edx, 0x87
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bd0                 | mov                 edx, eax
            //   e9????????           |                     

        $sequence_5 = { 8bcf 0fb68394000000 53 50 6aff e8???????? 8bf0 }
            // n = 7, score = 100
            //   8bcf                 | mov                 ecx, edi
            //   0fb68394000000       | movzx               eax, byte ptr [ebx + 0x94]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_6 = { ff751c 8b4d08 57 56 ff7510 e8???????? 83c414 }
            // n = 7, score = 100
            //   ff751c               | push                dword ptr [ebp + 0x1c]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   56                   | push                esi
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14

        $sequence_7 = { 8bda 8945fc 8bd1 8955f8 3907 7e6d 8b4d08 }
            // n = 7, score = 100
            //   8bda                 | mov                 ebx, edx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8bd1                 | mov                 edx, ecx
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   3907                 | cmp                 dword ptr [edi], eax
            //   7e6d                 | jle                 0x6f
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_8 = { ff742410 ba35000000 8bce 6a00 ff74242c e8???????? 83c40c }
            // n = 7, score = 100
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   ba35000000           | mov                 edx, 0x35
            //   8bce                 | mov                 ecx, esi
            //   6a00                 | push                0
            //   ff74242c             | push                dword ptr [esp + 0x2c]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_9 = { ff75e8 e8???????? ff75e8 8bf0 e8???????? 33c0 83c40c }
            // n = 7, score = 100
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   83c40c               | add                 esp, 0xc

    condition:
        7 of them and filesize < 2998272
}