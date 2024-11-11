rule win_retro_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.retro."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.retro"
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
        $sequence_0 = { e8???????? 8b442434 8b4c2460 03c8 8bc1 89442460 e9???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b442434             | mov                 dword ptr [esp + 0x38], ecx
            //   8b4c2460             | mov                 edx, ebx
            //   03c8                 | mov                 dword ptr [esp + 0x24], ebx
            //   8bc1                 | mov                 dword ptr [esp + 0x20], ebx
            //   89442460             | inc                 esp
            //   e9????????           |                     

        $sequence_1 = { 890a 8b44fdbc 448b44fdac 448d4820 453bc1 7e0f }
            // n = 6, score = 200
            //   890a                 | mov                 ecx, dword ptr [esp + 0x80]
            //   8b44fdbc             | mov                 dword ptr [esp + 0x70], 0
            //   448b44fdac           | mov                 dword ptr [esp + 0x20], 0xf0000000
            //   448d4820             | inc                 esp
            //   453bc1               | mov                 eax, eax
            //   7e0f                 | dec                 eax

        $sequence_2 = { 4d8bcf 4d8bc6 8bcf e8???????? 0f28742440 4883c450 415f }
            // n = 7, score = 200
            //   4d8bcf               | inc                 esp
            //   4d8bc6               | addps               xmm7, xmm0
            //   8bcf                 | inc                 esp
            //   e8????????           |                     
            //   0f28742440           | addps               xmm3, xmm0
            //   4883c450             | movss               xmm0, dword ptr [esp + 0x58]
            //   415f                 | inc                 ecx

        $sequence_3 = { 488b8b50560000 488d154c810200 448bc0 e8???????? c70620010000 ba08000000 488bcb }
            // n = 7, score = 200
            //   488b8b50560000       | jmp                 0x488
            //   488d154c810200       | inc                 ecx
            //   448bc0               | subps               xmm0, xmm0
            //   e8????????           |                     
            //   c70620010000         | unpcklps            xmm0, xmm0
            //   ba08000000           | cvtps2pd            xmm1, xmm0
            //   488bcb               | jmp                 0x4a1

        $sequence_4 = { e8???????? 83bedc120000ff 7d19 488d154db30300 488d0d9eb80300 41b899020000 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83bedc120000ff       | cmp                 ecx, eax
            //   7d19                 | je                  0x12ab
            //   488d154db30300       | jbe                 0x1312
            //   488d0d9eb80300       | inc                 ecx
            //   41b899020000         | cmp                 ecx, 6
            //   e8????????           |                     

        $sequence_5 = { 4b8d0408 4883c310 4883c610 f30f5946f4 f30f594ef8 0f14c0 0f14c9 }
            // n = 7, score = 200
            //   4b8d0408             | divss               xmm3, xmm1
            //   4883c310             | nop                 dword ptr [eax]
            //   4883c610             | dec                 esp
            //   f30f5946f4           | mov                 ebx, dword ptr [esp + 0x100]
            //   f30f594ef8           | inc                 ebp
            //   0f14c0               | xor                 eax, eax
            //   0f14c9               | inc                 ecx

        $sequence_6 = { 3984cfe86c0000 7419 488d151eb90300 488d0d0fbb0300 41b8dc010000 e8???????? 488b5c2440 }
            // n = 7, score = 200
            //   3984cfe86c0000       | dec                 eax
            //   7419                 | add                 edx, eax
            //   488d151eb90300       | dec                 esp
            //   488d0d0fbb0300       | add                 eax, eax
            //   41b8dc010000         | dec                 eax
            //   e8????????           |                     
            //   488b5c2440           | dec                 edi

        $sequence_7 = { 488bd9 e8???????? 85c0 740e f30f1083e4000000 4883c420 5b }
            // n = 7, score = 200
            //   488bd9               | cvtsd2ss            xmm1, xmm6
            //   e8????????           |                     
            //   85c0                 | movss               dword ptr [edi + 0x1f4], xmm1
            //   740e                 | movss               dword ptr [edi + 0x44], xmm1
            //   f30f1083e4000000     | cmp                 ebx, 0x37
            //   4883c420             | jl                  0x1624
            //   5b                   | divsd               xmm6, xmm1

        $sequence_8 = { 660f7f4c2430 660f6f0d???????? 660f7f442440 660f6f05???????? 660f7f4c2450 660f6f0d???????? 660f7f442460 }
            // n = 7, score = 200
            //   660f7f4c2430         | cvtps2pd            xmm1, xmm0
            //   660f6f0d????????     |                     
            //   660f7f442440         | inc                 cx
            //   660f6f05????????     |                     
            //   660f7f4c2450         | movaps              xmm0, xmm1
            //   660f6f0d????????     |                     
            //   660f7f442460         | inc                 ecx

        $sequence_9 = { 8b4638 85c0 7fc5 48634658 488d0c40 48634664 4803c8 }
            // n = 7, score = 200
            //   8b4638               | mov                 byte ptr [ecx - 1], al
            //   85c0                 | jne                 0x191d
            //   7fc5                 | dec                 ecx
            //   48634658             | add                 eax, 0x64
            //   488d0c40             | inc                 ecx
            //   48634664             | mov                 dword ptr [ecx + 0x14], 0xffffffff
            //   4803c8               | test                dl, 8

    condition:
        7 of them and filesize < 1409024
}