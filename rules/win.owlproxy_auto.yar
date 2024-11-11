rule win_owlproxy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.owlproxy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.owlproxy"
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
        $sequence_0 = { 4883ec30 48c7442420feffffff 48895c2448 488bfa 488bd9 e8???????? 488d05fe020200 }
            // n = 7, score = 200
            //   4883ec30             | mov                 edx, 0x55
            //   48c7442420feffffff     | dec    eax
            //   48895c2448           | add                 eax, eax
            //   488bfa               | dec                 eax
            //   488bd9               | mov                 ebp, dword ptr [ebp + eax*8]
            //   e8????????           |                     
            //   488d05fe020200       | dec                 eax

        $sequence_1 = { 48837f1810 7205 488b0f eb03 488bcf ff15???????? eb4f }
            // n = 7, score = 200
            //   48837f1810           | inc                 ecx
            //   7205                 | mov                 eax, 2
            //   488b0f               | dec                 eax
            //   eb03                 | mov                 edx, edi
            //   488bcf               | dec                 eax
            //   ff15????????         |                     
            //   eb4f                 | lea                 eax, [ebx + 0x80]

        $sequence_2 = { 488bcf 664489bd88010000 4c897c2420 4489bdb0010000 }
            // n = 4, score = 200
            //   488bcf               | mov                 dword ptr [ebp + 0x10], ebx
            //   664489bd88010000     | mov                 word ptr [ebp], bx
            //   4c897c2420           | dec                 eax
            //   4489bdb0010000       | cmp                 dword ptr [ebp - 8], 0x10

        $sequence_3 = { 418bfc 6690 bae8030000 488b4dc0 ff15???????? 8bf0 4c89642428 }
            // n = 7, score = 200
            //   418bfc               | mov                 ecx, ebx
            //   6690                 | dec                 eax
            //   bae8030000           | mov                 ecx, dword ptr [esp + 0x50]
            //   488b4dc0             | jmp                 0xa38
            //   ff15????????         |                     
            //   8bf0                 | dec                 eax
            //   4c89642428           | mov                 eax, dword ptr [esp + 0x38]

        $sequence_4 = { 48837f1810 7203 488b3f 448bc9 4c8bc7 33d2 }
            // n = 6, score = 200
            //   48837f1810           | lea                 ecx, [0x26d7c]
            //   7203                 | dec                 ecx
            //   488b3f               | sub                 ecx, ecx
            //   448bc9               | dec                 eax
            //   4c8bc7               | inc                 ecx
            //   33d2                 | jae                 0x566

        $sequence_5 = { 488b742438 488bc3 488b5c2430 4883c420 5f c3 488d0d7c200200 }
            // n = 7, score = 200
            //   488b742438           | mov                 esp, ecx
            //   488bc3               | mov                 dword ptr [esp + 0x40], 0
            //   488b5c2430           | movaps              xmmword ptr [ebp + 0x50], xmm0
            //   4883c420             | movaps              xmmword ptr [ebp + 0x60], xmm1
            //   5f                   | dec                 esp
            //   c3                   | mov                 esp, ebx
            //   488d0d7c200200       | dec                 eax

        $sequence_6 = { e8???????? eb75 4584c0 745b 4883fa08 7355 4c89742440 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   eb75                 | dec                 eax
            //   4584c0               | mov                 eax, esi
            //   745b                 | dec                 eax
            //   4883fa08             | sub                 eax, ebx
            //   7355                 | dec                 eax
            //   4c89742440           | dec                 eax

        $sequence_7 = { b8c0110000 e8???????? 482be0 48c74588feffffff 48899c2418120000 488b05???????? }
            // n = 6, score = 200
            //   b8c0110000           | mov                 dword ptr [ebp], eax
            //   e8????????           |                     
            //   482be0               | dec                 eax
            //   48c74588feffffff     | mov                 dword ptr [ebp + 8], eax
            //   48899c2418120000     | dec                 esp
            //   488b05????????       |                     

        $sequence_8 = { 4c8bcf 488bd7 488d8d10010000 e8???????? 488b8d90000000 }
            // n = 5, score = 200
            //   4c8bcf               | mov                 dword ptr [ebx + 0x28], edi
            //   488bd7               | dec                 eax
            //   488d8d10010000       | mov                 dword ptr [ebx + 0x30], edi
            //   e8????????           |                     
            //   488b8d90000000       | mov                 dword ptr [ebx + 0x38], 0xffffffff

        $sequence_9 = { 480f42d1 488d4c2428 e8???????? 488b4c2430 4c8b4c2428 4a8d040f 4885c9 }
            // n = 7, score = 200
            //   480f42d1             | dec                 eax
            //   488d4c2428           | cmp                 esi, eax
            //   e8????????           |                     
            //   488b4c2430           | ja                  0x3a0
            //   4c8b4c2428           | dec                 esp
            //   4a8d040f             | lea                 edi, [esp + 0x50]
            //   4885c9               | dec                 esp

    condition:
        7 of them and filesize < 475136
}