rule win_coronavirus_ransomware_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.coronavirus_ransomware."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.coronavirus_ransomware"
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
        $sequence_0 = { 837de001 0f8eda030000 b9???????? 8b45d0 8b4004 668b10 663b11 }
            // n = 7, score = 100
            //   837de001             | cmp                 dword ptr [ebp - 0x20], 1
            //   0f8eda030000         | jle                 0x3e0
            //   b9????????           |                     
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   668b10               | mov                 dx, word ptr [eax]
            //   663b11               | cmp                 dx, word ptr [ecx]

        $sequence_1 = { a3???????? ba01000000 b8???????? 8b08 8bf1 c1ee1e 33f1 }
            // n = 7, score = 100
            //   a3????????           |                     
            //   ba01000000           | mov                 edx, 1
            //   b8????????           |                     
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8bf1                 | mov                 esi, ecx
            //   c1ee1e               | shr                 esi, 0x1e
            //   33f1                 | xor                 esi, ecx

        $sequence_2 = { 66898c05682effff 83c002 6685c9 75e9 68???????? }
            // n = 5, score = 100
            //   66898c05682effff     | mov                 word ptr [ebp + eax - 0xd198], cx
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx
            //   75e9                 | jne                 0xffffffeb
            //   68????????           |                     

        $sequence_3 = { 50 e8???????? 89bd74feffff 6800010000 57 8d8d78feffff }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   89bd74feffff         | mov                 dword ptr [ebp - 0x18c], edi
            //   6800010000           | push                0x100
            //   57                   | push                edi
            //   8d8d78feffff         | lea                 ecx, [ebp - 0x188]

        $sequence_4 = { 85c0 7515 668b0b 83c302 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7515                 | jne                 0x17
            //   668b0b               | mov                 cx, word ptr [ebx]
            //   83c302               | add                 ebx, 2

        $sequence_5 = { 52 50 51 ffd7 85c0 7405 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7

        $sequence_6 = { 89048d8ccf4000 81f9e3000000 7cc1 81f96f020000 7d3a }
            // n = 5, score = 100
            //   89048d8ccf4000       | mov                 dword ptr [ecx*4 + 0x40cf8c], eax
            //   81f9e3000000         | cmp                 ecx, 0xe3
            //   7cc1                 | jl                  0xffffffc3
            //   81f96f020000         | cmp                 ecx, 0x26f
            //   7d3a                 | jge                 0x3c

        $sequence_7 = { 85c0 7420 8a11 3a16 755b 83f801 7615 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7420                 | je                  0x22
            //   8a11                 | mov                 dl, byte ptr [ecx]
            //   3a16                 | cmp                 dl, byte ptr [esi]
            //   755b                 | jne                 0x5d
            //   83f801               | cmp                 eax, 1
            //   7615                 | jbe                 0x17

        $sequence_8 = { 8b15???????? 51 6a08 52 89442444 ffd6 }
            // n = 6, score = 100
            //   8b15????????         |                     
            //   51                   | push                ecx
            //   6a08                 | push                8
            //   52                   | push                edx
            //   89442444             | mov                 dword ptr [esp + 0x44], eax
            //   ffd6                 | call                esi

        $sequence_9 = { 8b4604 68???????? 50 ffd7 83c418 85c0 }
            // n = 6, score = 100
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 235520
}