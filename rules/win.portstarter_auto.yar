rule win_portstarter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.portstarter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.portstarter"
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
        $sequence_0 = { b902000000 e8???????? 4889842410010000 48899c2488000000 e8???????? 4889842448010000 48899c24c0000000 }
            // n = 7, score = 100
            //   b902000000           | dec                 eax
            //   e8????????           |                     
            //   4889842410010000     | lea                 eax, [0x28d447]
            //   48899c2488000000     | dec                 eax
            //   e8????????           |                     
            //   4889842448010000     | mov                 ecx, ebx
            //   48899c24c0000000     | nop                 dword ptr [eax]

        $sequence_1 = { 90 488d05815c2800 90 e8???????? 488d152cd53000 488910 833d????????00 }
            // n = 7, score = 100
            //   90                   | dec                 eax
            //   488d05815c2800       | mov                 edi, esi
            //   90                   | dec                 esp
            //   e8????????           |                     
            //   488d152cd53000       | mov                 esi, eax
            //   488910               | dec                 esp
            //   833d????????00       |                     

        $sequence_2 = { 90 48b9887721425d7dfd56 48898c248c000000 c7842494000000fdea6423 0fb68c2491000000 884c2467 0fb6942490000000 }
            // n = 7, score = 100
            //   90                   | jae                 0x105e
            //   48b9887721425d7dfd56     | dec    eax
            //   48898c248c000000     | lea                 eax, [0x360266]
            //   c7842494000000fdea6423     | dec    eax
            //   0fb68c2491000000     | mov                 ecx, ebx
            //   884c2467             | dec                 eax
            //   0fb6942490000000     | mov                 ebx, edi

        $sequence_3 = { c3 0fb69404e8010000 0fb6bc04b8010000 29d7 4088bc04b8010000 48ffc0 6690 }
            // n = 7, score = 100
            //   c3                   | dec                 eax
            //   0fb69404e8010000     | mov                 dword ptr [esp + 0x50], edx
            //   0fb6bc04b8010000     | dec                 ecx
            //   29d7                 | mov                 eax, eax
            //   4088bc04b8010000     | dec                 esp
            //   48ffc0               | mov                 ebx, eax
            //   6690                 | nop                 word ptr [eax + eax]

        $sequence_4 = { f6c280 0f84b5000000 48895c2448 4889742450 488d05341c1800 e8???????? 4889442478 }
            // n = 7, score = 100
            //   f6c280               | mov                 ebx, eax
            //   0f84b5000000         | dec                 eax
            //   48895c2448           | mov                 edi, ecx
            //   4889742450           | dec                 eax
            //   488d05341c1800       | lea                 eax, [0x3bcfee]
            //   e8????????           |                     
            //   4889442478           | dec                 eax

        $sequence_5 = { 90 eb11 488d7818 488bb42460020000 e8???????? 4889c3 488d05bb372e00 }
            // n = 7, score = 100
            //   90                   | mov                 ecx, edx
            //   eb11                 | dec                 esp
            //   488d7818             | mov                 esi, eax
            //   488bb42460020000     | dec                 esp
            //   e8????????           |                     
            //   4889c3               | mov                 dword ptr [esp + 0x38], eax
            //   488d05bb372e00       | dec                 esp

        $sequence_6 = { 66898424e8000000 e8???????? 48898424d0000000 48895c2448 0fb78c24e8000000 0fb7c9 4889c8 }
            // n = 7, score = 100
            //   66898424e8000000     | dec                 eax
            //   e8????????           |                     
            //   48898424d0000000     | mov                 eax, dword ptr [esp + 0xc0]
            //   48895c2448           | jmp                 0xc08
            //   0fb78c24e8000000     | dec                 eax
            //   0fb7c9               | mov                 dword ptr [esp + 0x60], ecx
            //   4889c8               | dec                 eax

        $sequence_7 = { e8???????? 488b942428010000 48899048030000 833d????????00 90 7520 488b942410030000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488b942428010000     | dec                 eax
            //   48899048030000       | mov                 edi, esi
            //   833d????????00       |                     
            //   90                   | dec                 esp
            //   7520                 | lea                 eax, [ebx + 1]
            //   488b942410030000     | dec                 esp

        $sequence_8 = { e8???????? 488d8424d8000000 488b9c2430020000 0f1f4000 e8???????? 488d8424d8000000 488b9c2418020000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488d8424d8000000     | jbe                 0x285
            //   488b9c2430020000     | dec                 eax
            //   0f1f4000             | sub                 esp, 0xe0
            //   e8????????           |                     
            //   488d8424d8000000     | dec                 eax
            //   488b9c2418020000     | mov                 dword ptr [esp + 0xd8], ebp

        $sequence_9 = { bb00001000 e8???????? 4c89c0 4889d9 e8???????? 4889da bb00001000 }
            // n = 7, score = 100
            //   bb00001000           | jb                  0x1665
            //   e8????????           |                     
            //   4c89c0               | dec                 esp
            //   4889d9               | mov                 dword ptr [esp + 0x168], ebx
            //   e8????????           |                     
            //   4889da               | dec                 esp
            //   bb00001000           | mov                 eax, eax

    condition:
        7 of them and filesize < 14144512
}