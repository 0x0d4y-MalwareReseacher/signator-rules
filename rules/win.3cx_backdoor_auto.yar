rule win_3cx_backdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.3cx_backdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.3cx_backdoor"
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
        $sequence_0 = { c645c800 41b805000000 488d1528fe0200 488d4dc8 e8???????? 90 4c8d4dc8 }
            // n = 7, score = 100
            //   c645c800             | shl                 ecx, 0x16
            //   41b805000000         | dec                 ebp
            //   488d1528fe0200       | add                 eax, edx
            //   488d4dc8             | xor                 eax, ecx
            //   e8????????           |                     
            //   90                   | inc                 ebp
            //   4c8d4dc8             | mov                 edx, eax

        $sequence_1 = { c60120 488b8360040000 4c0128 8b4b20 83f9ff 7408 4503cd }
            // n = 7, score = 100
            //   c60120               | dec                 eax
            //   488b8360040000       | mov                 dword ptr [ebp - 0x18], eax
            //   4c0128               | dec                 eax
            //   8b4b20               | lea                 ecx, [ebp - 0x18]
            //   83f9ff               | dec                 ecx
            //   7408                 | mov                 eax, dword ptr [esi]
            //   4503cd               | mov                 byte ptr [ebp - 0x20], dl

        $sequence_2 = { 7512 ff15???????? 8bc8 e8???????? e9???????? 2bc3 488d0d0387fdff }
            // n = 7, score = 100
            //   7512                 | sub                 eax, ecx
            //   ff15????????         |                     
            //   8bc8                 | dec                 eax
            //   e8????????           |                     
            //   e9????????           |                     
            //   2bc3                 | add                 eax, -8
            //   488d0d0387fdff       | dec                 eax

        $sequence_3 = { 482bc1 4883c0f8 4883f81f 0f87ad020000 e8???????? 4c897580 48c745880f000000 }
            // n = 7, score = 100
            //   482bc1               | inc                 ebp
            //   4883c0f8             | xor                 eax, eax
            //   4883f81f             | mov                 dword ptr [esp + 0x20], edi
            //   0f87ad020000         | xor                 edx, edx
            //   e8????????           |                     
            //   4c897580             | inc                 ebp
            //   48c745880f000000     | xor                 esp, esp

        $sequence_4 = { 807b1900 0f8595000000 4c8b6618 498b28 0f1f4000 0f1f840000000000 48895c2438 }
            // n = 7, score = 100
            //   807b1900             | mov                 eax, edx
            //   0f8595000000         | dec                 eax
            //   4c8b6618             | not                 eax
            //   498b28               | dec                 eax
            //   0f1f4000             | shr                 eax, 5
            //   0f1f840000000000     | dec                 eax
            //   48895c2438           | lea                 eax, [eax*4 + 4]

        $sequence_5 = { 0f85c7000000 48897c2430 48897c2440 4c89742448 41b804000000 488d1595820300 488d4c2430 }
            // n = 7, score = 100
            //   0f85c7000000         | inc                 ecx
            //   48897c2430           | inc                 esi
            //   48897c2440           | inc                 esp
            //   4c89742448           | mov                 dword ptr [esp + 0x30], ebp
            //   41b804000000         | dec                 esp
            //   488d1595820300       | mov                 dword ptr [esp + 0x38], ebp
            //   488d4c2430           | nop                 word ptr [eax + eax]

        $sequence_6 = { 8b4f40 41bf0b000000 83f90e 0f8569020000 488d4f48 488d55d8 e8???????? }
            // n = 7, score = 100
            //   8b4f40               | dec                 eax
            //   41bf0b000000         | inc                 edx
            //   83f90e               | dec                 eax
            //   0f8569020000         | mov                 ecx, dword ptr [esp + 0x30]
            //   488d4f48             | cmp                 byte ptr [ebx + 0x29], 0
            //   488d55d8             | jne                 0x18a0
            //   e8????????           |                     

        $sequence_7 = { 482bc2 4d8bf8 48c1f804 482bf2 49b8ffffffffffffff0f 4c8bf1 493bc0 }
            // n = 7, score = 100
            //   482bc2               | dec                 eax
            //   4d8bf8               | lea                 edx, [0x3941f]
            //   48c1f804             | inc                 ebp
            //   482bf2               | xor                 edi, edi
            //   49b8ffffffffffffff0f     | jmp    0x4a1
            //   4c8bf1               | inc                 ecx
            //   493bc0               | mov                 esp, 0x19

        $sequence_8 = { 0f840e010000 498bce bec57d0f00 e8???????? 488bd8 4885c0 }
            // n = 6, score = 100
            //   0f840e010000         | dec                 eax
            //   498bce               | mov                 dword ptr [ebx + 0x18], 0xf
            //   bec57d0f00           | movups              xmmword ptr [edi], xmm0
            //   e8????????           |                     
            //   488bd8               | dec                 eax
            //   4885c0               | lea                 ecx, [edi + 0x10]

        $sequence_9 = { eb27 c6030d 4c8d1d4688fdff eb1b 498b8ceb20260400 8a44f938 }
            // n = 6, score = 100
            //   eb27                 | dec                 eax
            //   c6030d               | cmp                 edx, 0x1000
            //   4c8d1d4688fdff       | dec                 ecx
            //   eb1b                 | mov                 dword ptr [edi], eax
            //   498b8ceb20260400     | inc                 ecx
            //   8a44f938             | mov                 byte ptr [edi + 8], 1

    condition:
        7 of them and filesize < 585728
}