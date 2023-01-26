rule win_flusihoc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.flusihoc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.flusihoc"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 53 56 57 6a40 8d442428 }
            // n = 5, score = 400
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a40                 | push                0x40
            //   8d442428             | lea                 eax, [esp + 0x28]

        $sequence_1 = { 89842450160000 53 56 8b7508 }
            // n = 4, score = 400
            //   89842450160000       | mov                 dword ptr [esp + 0x1650], eax
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_2 = { ff15???????? 8b35???????? 6860ea0000 ffd6 ebf7 3b0d???????? 7502 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   6860ea0000           | push                0xea60
            //   ffd6                 | call                esi
            //   ebf7                 | jmp                 0xfffffff9
            //   3b0d????????         |                     
            //   7502                 | jne                 4

        $sequence_3 = { ff15???????? 8bf0 ff15???????? 3db7000000 7510 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   3db7000000           | cmp                 eax, 0xb7
            //   7510                 | jne                 0x12

        $sequence_4 = { 33c0 5e 8be5 5d c21000 8d45fc }
            // n = 6, score = 400
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_5 = { 7510 56 ff15???????? 33c0 5e 8be5 }
            // n = 6, score = 400
            //   7510                 | jne                 0x12
            //   56                   | push                esi
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp

        $sequence_6 = { 8d85b0feffff 50 6802000080 ff15???????? }
            // n = 4, score = 400
            //   8d85b0feffff         | lea                 eax, [ebp - 0x150]
            //   50                   | push                eax
            //   6802000080           | push                0x80000002
            //   ff15????????         |                     

        $sequence_7 = { 7416 8d4de8 3c7c 740f }
            // n = 4, score = 400
            //   7416                 | je                  0x18
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   3c7c                 | cmp                 al, 0x7c
            //   740f                 | je                  0x11

        $sequence_8 = { 7505 fe06 fe461e 3d68010000 7505 fe06 }
            // n = 6, score = 400
            //   7505                 | jne                 7
            //   fe06                 | inc                 byte ptr [esi]
            //   fe461e               | inc                 byte ptr [esi + 0x1e]
            //   3d68010000           | cmp                 eax, 0x168
            //   7505                 | jne                 7
            //   fe06                 | inc                 byte ptr [esi]

        $sequence_9 = { e8???????? a1???????? 33c4 89842450160000 }
            // n = 4, score = 400
            //   e8????????           |                     
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89842450160000       | mov                 dword ptr [esp + 0x1650], eax

        $sequence_10 = { 51 ffd6 8b542414 52 ffd6 6a0a ff15???????? }
            // n = 7, score = 400
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   6a0a                 | push                0xa
            //   ff15????????         |                     

        $sequence_11 = { 68???????? 6a00 6a00 ff15???????? 8b35???????? 6860ea0000 }
            // n = 6, score = 400
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   6860ea0000           | push                0xea60

        $sequence_12 = { 8d7c2428 50 f3a5 c684246402000000 e8???????? 68d6000000 }
            // n = 6, score = 400
            //   8d7c2428             | lea                 edi, [esp + 0x28]
            //   50                   | push                eax
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   c684246402000000     | mov                 byte ptr [esp + 0x264], 0
            //   e8????????           |                     
            //   68d6000000           | push                0xd6

        $sequence_13 = { 8b8c24ec0b0000 5f 5e 5b 33cc 33c0 }
            // n = 6, score = 400
            //   8b8c24ec0b0000       | mov                 ecx, dword ptr [esp + 0xbec]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   33cc                 | xor                 ecx, esp
            //   33c0                 | xor                 eax, eax

        $sequence_14 = { 80864d01000004 83f822 7506 fe8e42010000 3d14010000 7506 fe8633010000 }
            // n = 7, score = 400
            //   80864d01000004       | add                 byte ptr [esi + 0x14d], 4
            //   83f822               | cmp                 eax, 0x22
            //   7506                 | jne                 8
            //   fe8e42010000         | dec                 byte ptr [esi + 0x142]
            //   3d14010000           | cmp                 eax, 0x114
            //   7506                 | jne                 8
            //   fe8633010000         | inc                 byte ptr [esi + 0x133]

        $sequence_15 = { c21000 8d45fc 50 6a00 6a00 68???????? }
            // n = 6, score = 400
            //   c21000               | ret                 0x10
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

    condition:
        7 of them and filesize < 319488
}