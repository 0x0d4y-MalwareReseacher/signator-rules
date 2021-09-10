rule win_smominru_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.smominru."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.smominru"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 5d 83ec60 53 56 }
            // n = 4, score = 100
            //   5d                   | pop                 ebp
            //   83ec60               | sub                 esp, 0x60
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_1 = { 395d1c 0f8c7420ab7b 395d18 0f845620ab7b 8b7514 3bf3 }
            // n = 6, score = 100
            //   395d1c               | cmp                 dword ptr [ebp + 0x1c], ebx
            //   0f8c7420ab7b         | jl                  0x7bab207a
            //   395d18               | cmp                 dword ptr [ebp + 0x18], ebx
            //   0f845620ab7b         | je                  0x7bab205c
            //   8b7514               | mov                 esi, dword ptr [ebp + 0x14]
            //   3bf3                 | cmp                 esi, ebx

        $sequence_2 = { 0f8933dfbb7b 8b10 8bc8 c1e903 33ca }
            // n = 5, score = 100
            //   0f8933dfbb7b         | jns                 0x7bbbdf39
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8bc8                 | mov                 ecx, eax
            //   c1e903               | shr                 ecx, 3
            //   33ca                 | xor                 ecx, edx

        $sequence_3 = { 8bc6 e8???????? eb11 3bbe74010000 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb11                 | jmp                 0x13
            //   3bbe74010000         | cmp                 edi, dword ptr [esi + 0x174]

        $sequence_4 = { 89461c 8b85f0fdffff 894620 8bc3 5b 8b4dfc }
            // n = 6, score = 100
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   8b85f0fdffff         | mov                 eax, dword ptr [ebp - 0x210]
            //   894620               | mov                 dword ptr [esi + 0x20], eax
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { 3bc3 0f846d4ac17b 8a4807 80f904 0f848a4ac17b 57 84c9 }
            // n = 7, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   0f846d4ac17b         | je                  0x7bc14a73
            //   8a4807               | mov                 cl, byte ptr [eax + 7]
            //   80f904               | cmp                 cl, 4
            //   0f848a4ac17b         | je                  0x7bc14a90
            //   57                   | push                edi
            //   84c9                 | test                cl, cl

        $sequence_6 = { 83f903 0f84bee3a87b e8???????? 5d c20400 }
            // n = 5, score = 100
            //   83f903               | cmp                 ecx, 3
            //   0f84bee3a87b         | je                  0x7ba8e3c4
            //   e8????????           |                     
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4

        $sequence_7 = { 8bc6 e8???????? eb15 8d45d4 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb15                 | jmp                 0x17
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]

        $sequence_8 = { 8bc6 e8???????? eb12 33d2 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb12                 | jmp                 0x14
            //   33d2                 | xor                 edx, edx

        $sequence_9 = { 8bc6 e8???????? eb0c ba80000000 8bc6 }
            // n = 5, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb0c                 | jmp                 0xe
            //   ba80000000           | mov                 edx, 0x80
            //   8bc6                 | mov                 eax, esi

        $sequence_10 = { 55 8d6c2400 8b4508 83f8f4 0f8422a2ab7b 83f8f5 0f8405a2ab7b }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8d6c2400             | lea                 ebp, dword ptr [esp]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83f8f4               | cmp                 eax, -0xc
            //   0f8422a2ab7b         | je                  0x7baba228
            //   83f8f5               | cmp                 eax, -0xb
            //   0f8405a2ab7b         | je                  0x7baba20b

        $sequence_11 = { 8bc6 e8???????? eb10 6a00 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb10                 | jmp                 0x12
            //   6a00                 | push                0

        $sequence_12 = { 8bc6 e8???????? eb0e 85f6 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb0e                 | jmp                 0x10
            //   85f6                 | test                esi, esi

        $sequence_13 = { 8bc6 e8???????? eb14 b92d0b0000 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb14                 | jmp                 0x16
            //   b92d0b0000           | mov                 ecx, 0xb2d

        $sequence_14 = { 8bc6 e8???????? eb16 8bc6 }
            // n = 4, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   eb16                 | jmp                 0x18
            //   8bc6                 | mov                 eax, esi

        $sequence_15 = { 8907 8b45e4 8b4df0 64890d00000000 59 5f }
            // n = 6, score = 100
            //   8907                 | mov                 dword ptr [edi], eax
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 8167424
}