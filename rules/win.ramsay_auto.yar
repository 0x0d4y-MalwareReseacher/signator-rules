rule win_ramsay_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ramsay."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ramsay"
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
        $sequence_0 = { 7514 ff15???????? 83f820 7502 eb07 }
            // n = 5, score = 600
            //   7514                 | jne                 0x16
            //   ff15????????         |                     
            //   83f820               | cmp                 eax, 0x20
            //   7502                 | jne                 4
            //   eb07                 | jmp                 9

        $sequence_1 = { ff15???????? 85c0 7502 eb02 ebb1 }
            // n = 5, score = 600
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   eb02                 | jmp                 4
            //   ebb1                 | jmp                 0xffffffb3

        $sequence_2 = { 8d55f4 52 8b450c 8b08 51 }
            // n = 5, score = 500
            //   8d55f4               | lea                 edx, [ebp - 0xc]
            //   52                   | push                edx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   51                   | push                ecx

        $sequence_3 = { 8b55e8 0355f8 8a8294010000 8801 ebd3 eb0a 8b4de8 }
            // n = 7, score = 500
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   0355f8               | add                 edx, dword ptr [ebp - 8]
            //   8a8294010000         | mov                 al, byte ptr [edx + 0x194]
            //   8801                 | mov                 byte ptr [ecx], al
            //   ebd3                 | jmp                 0xffffffd5
            //   eb0a                 | jmp                 0xc
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]

        $sequence_4 = { 837dfc00 7504 33c0 eb7a 8d4df0 }
            // n = 5, score = 500
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb7a                 | jmp                 0x7c
            //   8d4df0               | lea                 ecx, [ebp - 0x10]

        $sequence_5 = { 8b55e8 0fb64c15f0 33c1 33d2 }
            // n = 4, score = 500
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   0fb64c15f0           | movzx               ecx, byte ptr [ebp + edx - 0x10]
            //   33c1                 | xor                 eax, ecx
            //   33d2                 | xor                 edx, edx

        $sequence_6 = { a1???????? 33c5 8945f8 8b4508 8a4803 }
            // n = 5, score = 500
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4803               | mov                 cl, byte ptr [eax + 3]

        $sequence_7 = { c745fc00000000 c745f800000000 8b4508 83c001 }
            // n = 4, score = 500
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c001               | add                 eax, 1

        $sequence_8 = { 7511 8b95c4fdffff 52 ff15???????? 33c0 }
            // n = 5, score = 500
            //   7511                 | jne                 0x13
            //   8b95c4fdffff         | mov                 edx, dword ptr [ebp - 0x23c]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 8d55f0 52 e8???????? 83c408 85c0 744c c745e800000000 }
            // n = 7, score = 500
            //   8d55f0               | lea                 edx, [ebp - 0x10]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   744c                 | je                  0x4e
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0

        $sequence_10 = { ff15???????? 33c0 e9???????? e8???????? 85c0 7507 33c0 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax

        $sequence_11 = { e8???????? e9???????? 488b8c2458040000 4833cc e8???????? 4881c460040000 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   e9????????           |                     
            //   488b8c2458040000     | dec                 eax
            //   4833cc               | mov                 ecx, dword ptr [esp + 0x458]
            //   e8????????           |                     
            //   4881c460040000       | dec                 eax

        $sequence_12 = { e8???????? e9???????? 488b942400020000 488d0dddd60100 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e9????????           |                     
            //   488b942400020000     | dec                 eax
            //   488d0dddd60100       | mov                 ecx, dword ptr [esp + 0x5d0]

        $sequence_13 = { e8???????? e9???????? 488d15d8d70100 488b8c2408020000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e9????????           |                     
            //   488d15d8d70100       | dec                 eax
            //   488b8c2408020000     | lea                 ecx, [0x1d6dd]

        $sequence_14 = { e8???????? e9???????? 488d15ced10100 488d8c24b0030000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e9????????           |                     
            //   488d15ced10100       | mov                 ecx, eax
            //   488d8c24b0030000     | dec                 eax

        $sequence_15 = { e8???????? e9???????? 488b8c24d0050000 ff15???????? }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e9????????           |                     
            //   488b8c24d0050000     | xor                 ecx, esp
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 2031616
}