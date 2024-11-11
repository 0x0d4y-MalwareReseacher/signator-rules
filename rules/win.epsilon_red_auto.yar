rule win_epsilon_red_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.epsilon_red."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.epsilon_red"
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
        $sequence_0 = { 84c9 0f84df000000 90 4889c2 48c1e80d 660f1f440000 483d00200000 }
            // n = 7, score = 200
            //   84c9                 | mov                 dword ptr [esp + 0x10], ebp
            //   0f84df000000         | dec                 eax
            //   90                   | lea                 ebp, [esp + 0x10]
            //   4889c2               | dec                 eax
            //   48c1e80d             | lea                 eax, [0xd6131]
            //   660f1f440000         | dec                 eax
            //   483d00200000         | mov                 ecx, dword ptr [ecx]

        $sequence_1 = { 807c241000 750c 488b442430 488b4c2438 ebb9 c644244001 488b6c2420 }
            // n = 7, score = 200
            //   807c241000           | dec                 eax
            //   750c                 | mov                 eax, dword ptr [esp + 0x10]
            //   488b442430           | dec                 eax
            //   488b4c2438           | mov                 dword ptr [esp + 0xa0], eax
            //   ebb9                 | dec                 eax
            //   c644244001           | mov                 ecx, dword ptr [esp + 0x1c0]
            //   488b6c2420           | dec                 eax

        $sequence_2 = { e9???????? 4983fa23 4d89e8 e9???????? 4c8b942400010000 4989dd 0f1f4000 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   4983fa23             | dec                 eax
            //   4d89e8               | lea                 ebp, [esp + 0x2000000]
            //   e9????????           |                     
            //   4c8b942400010000     | dec                 eax
            //   4989dd               | mov                 ebx, dword ptr [ecx + 0x20]
            //   0f1f4000             | dec                 eax

        $sequence_3 = { 488d6c2430 488b442440 488d7808 488b4808 488b542448 4889fb eb0c }
            // n = 7, score = 200
            //   488d6c2430           | dec                 esp
            //   488b442440           | mov                 dword ptr [esp + 0x58], eax
            //   488d7808             | dec                 eax
            //   488b4808             | mov                 ecx, dword ptr [eax + 0x10110]
            //   488b542448           | dec                 eax
            //   4889fb               | mov                 dword ptr [esp], 0x100000
            //   eb0c                 | dec                 eax

        $sequence_4 = { e9???????? 65488b042528000000 488b8000000000 488b4030 488b80a0000000 4889442440 8400 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   65488b042528000000     | mov    eax, dword ptr [esp + 0xb0]
            //   488b8000000000       | dec                 eax
            //   488b4030             | mov                 dword ptr [esp + 0x78], eax
            //   488b80a0000000       | movups              xmm0, xmmword ptr [esp + 0xb8]
            //   4889442440           | movups              xmmword ptr [esp + 0x80], xmm0
            //   8400                 | movups              xmm0, xmmword ptr [esp + 0xc8]

        $sequence_5 = { e9???????? 488b842428010000 488b4850 488b942450010000 48891424 48c744240800000000 ffd1 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   488b842428010000     | mov                 ecx, dword ptr [esp + 0x20]
            //   488b4850             | jmp                 0x5e9
            //   488b942450010000     | dec                 eax
            //   48891424             | lea                 edi, [ecx + 0x28]
            //   48c744240800000000     | jmp    0x63a
            //   ffd1                 | xor                 ecx, ecx

        $sequence_6 = { 8b542448 31db 4839cb 7d4e 0fb63418 81fe80000000 7d16 }
            // n = 7, score = 200
            //   8b542448             | mov                 dword ptr [esp + 0x10], edx
            //   31db                 | dec                 eax
            //   4839cb               | mov                 ecx, dword ptr [esp + 0xa8]
            //   7d4e                 | dec                 eax
            //   0fb63418             | mov                 dword ptr [esp + 0x78], ecx
            //   81fe80000000         | dec                 eax
            //   7d16                 | mov                 ecx, dword ptr [esp + 0xb0]

        $sequence_7 = { e8???????? 807c242800 0f8556ffffff c68424e800000000 488bac24c0000000 4881c4c8000000 90 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   807c242800           | dec                 eax
            //   0f8556ffffff         | lea                 ecx, [esp + 0x18]
            //   c68424e800000000     | dec                 eax
            //   488bac24c0000000     | mov                 dword ptr [esp], ecx
            //   4881c4c8000000       | dec                 eax
            //   90                   | lea                 eax, [0x15a2a0]

        $sequence_8 = { ebe2 4c89442448 488b4330 488b08 48890c24 4889442408 c644241001 }
            // n = 7, score = 200
            //   ebe2                 | mov                 dword ptr [esp + 0x50], eax
            //   4c89442448           | dec                 eax
            //   488b4330             | mov                 ecx, dword ptr [esp + 0x20]
            //   488b08               | dec                 eax
            //   48890c24             | lea                 edx, [eax + ecx]
            //   4889442408           | dec                 eax
            //   c644241001           | mov                 dword ptr [esp + 8], 0

        $sequence_9 = { b900200000 0f1f4000 e8???????? b900200000 e8???????? 4c89c8 b900200000 }
            // n = 7, score = 200
            //   b900200000           | dec                 eax
            //   0f1f4000             | mov                 edi, dword ptr [esp + 0x80]
            //   e8????????           |                     
            //   b900200000           | dec                 ecx
            //   e8????????           |                     
            //   4c89c8               | mov                 eax, 0xffffffff
            //   b900200000           | retf                

    condition:
        7 of them and filesize < 5075968
}