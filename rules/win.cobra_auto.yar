rule win_cobra_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.cobra."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cobra"
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
        $sequence_0 = { 7511 e8???????? 85c0 7508 ff15???????? }
            // n = 5, score = 2900
            //   7511                 | mov                 eax, dword ptr [esp + 8]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0x10
            //   ff15????????         |                     

        $sequence_1 = { ff25???????? 53 56 57 8bd9 33f6 }
            // n = 6, score = 2500
            //   ff25????????         |                     
            //   53                   | mov                 ecx, 0x80
            //   56                   | test                eax, eax
            //   57                   | mov                 eax, dword ptr [esp + 8]
            //   8bd9                 | test                eax, eax
            //   33f6                 | jne                 0x10

        $sequence_2 = { 85c0 750e 3905???????? 7e2c ff0d???????? 83f801 8b0d???????? }
            // n = 7, score = 2500
            //   85c0                 | push                ecx
            //   750e                 | mov                 dword ptr [ebp - 0x40], 0
            //   3905????????         |                     
            //   7e2c                 | lea                 eax, [ebp - 0x34]
            //   ff0d????????         |                     
            //   83f801               | push                eax
            //   8b0d????????         |                     

        $sequence_3 = { c3 85db 7405 83fb03 }
            // n = 4, score = 2500
            //   c3                   | pop                 ebx
            //   85db                 | ret                 
            //   7405                 | cmp                 ebx, 1
            //   83fb03               | je                  0xd

        $sequence_4 = { 85c0 750e 33ff 8bc7 }
            // n = 4, score = 2500
            //   85c0                 | cmp                 ebx, 2
            //   750e                 | pop                 edi
            //   33ff                 | pop                 esi
            //   8bc7                 | pop                 ebx

        $sequence_5 = { 7514 391d???????? 754d 33c0 }
            // n = 4, score = 2500
            //   7514                 | cmp                 esi, -1
            //   391d????????         |                     
            //   754d                 | jne                 0xd
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 5b c3 83fb01 7405 83fb02 7537 }
            // n = 6, score = 2500
            //   5b                   | jne                 0xfffffff6
            //   c3                   | mov                 dword ptr [eax], edx
            //   83fb01               | mov                 dword ptr [eax + 4], ecx
            //   7405                 | push                0xc0000000
            //   83fb02               | push                eax
            //   7537                 | mov                 esi, eax

        $sequence_7 = { 890d???????? 753c b980000000 e8???????? 85c0 }
            // n = 5, score = 2500
            //   890d????????         |                     
            //   753c                 | mov                 dword ptr [ebp - 0x40], 0
            //   b980000000           | mov                 dword ptr [ebp - 0x50], 0xffffffff
            //   e8????????           |                     
            //   85c0                 | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_8 = { 85c0 a3???????? 7504 33c0 eb68 }
            // n = 5, score = 2500
            //   85c0                 | mov                 edx, dword ptr [ebp - 0x38]
            //   a3????????           |                     
            //   7504                 | push                edx
            //   33c0                 | mov                 dword ptr [ebp - 0x40], 0
            //   eb68                 | lea                 ecx, [ebp - 0x34]

        $sequence_9 = { 83f801 75f1 b900010000 e8???????? }
            // n = 4, score = 2500
            //   83f801               | mov                 dword ptr [eax], ecx
            //   75f1                 | mov                 dword ptr [eax + 4], edx
            //   b900010000           | mov                 dword ptr [eax + 8], ecx
            //   e8????????           |                     

        $sequence_10 = { 5f 5e 5b c3 85ff 7418 }
            // n = 6, score = 2500
            //   5f                   | ret                 
            //   5e                   | cmp                 ebx, 1
            //   5b                   | je                  0xa
            //   c3                   | cmp                 ebx, 2
            //   85ff                 | jne                 0x16
            //   7418                 | jne                 0x51

        $sequence_11 = { 85c0 0f8e8c000000 83e801 8905???????? }
            // n = 4, score = 2500
            //   85c0                 | test                edi, edi
            //   0f8e8c000000         | mov                 edi, eax
            //   83e801               | cmp                 ebx, 1
            //   8905????????         |                     

        $sequence_12 = { e8???????? 8bf8 83fb01 751d 85ff }
            // n = 5, score = 2500
            //   e8????????           |                     
            //   8bf8                 | xor                 eax, eax
            //   83fb01               | push                ebx
            //   751d                 | push                esi
            //   85ff                 | xor                 ebx, ebx

        $sequence_13 = { 33d2 b9e8030000 f7f1 83f805 }
            // n = 4, score = 2300
            //   33d2                 | jle                 0x32
            //   b9e8030000           | test                eax, eax
            //   f7f1                 | jne                 6
            //   83f805               | xor                 eax, eax

        $sequence_14 = { 7407 33c0 e9???????? ff15???????? e9???????? }
            // n = 5, score = 1900
            //   7407                 | push                edi
            //   33c0                 | mov                 ebx, ecx
            //   e9????????           |                     
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_15 = { e8???????? 834df8ff 53 57 33db 6800200000 }
            // n = 6, score = 1900
            //   e8????????           |                     
            //   834df8ff             | test                eax, eax
            //   53                   | jne                 8
            //   57                   | xor                 eax, eax
            //   33db                 | mov                 ecx, 0x80
            //   6800200000           | test                eax, eax

        $sequence_16 = { ff15???????? 8b3d???????? 55 bbffffff7f }
            // n = 4, score = 1900
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   55                   | push                ebx
            //   bbffffff7f           | mov                 ecx, 0x80

        $sequence_17 = { 7f07 e8???????? eb26 83c0ff }
            // n = 4, score = 1200
            //   7f07                 | jg                  9
            //   e8????????           |                     
            //   eb26                 | jmp                 0x28
            //   83c0ff               | add                 eax, -1

        $sequence_18 = { eb6d e8???????? 85c0 7564 }
            // n = 4, score = 1200
            //   eb6d                 | jmp                 0x6f
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7564                 | jne                 0x66

        $sequence_19 = { e8???????? 33db 3bc3 741a }
            // n = 4, score = 1200
            //   e8????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   3bc3                 | cmp                 eax, ebx
            //   741a                 | je                  0x1c

        $sequence_20 = { ff5024 488d4d08 e8???????? 488d4d08 e8???????? }
            // n = 5, score = 1100
            //   ff5024               | inc                 ebp
            //   488d4d08             | xor                 esi, esi
            //   e8????????           |                     
            //   488d4d08             | inc                 ecx
            //   e8????????           |                     

        $sequence_21 = { 8bc7 eb0e 4883c108 e8???????? }
            // n = 4, score = 1100
            //   8bc7                 | ret                 
            //   eb0e                 | mov                 eax, ebp
            //   4883c108             | jmp                 0xffffffe8
            //   e8????????           |                     

        $sequence_22 = { c3 8bc5 ebe4 4533f6 413bee 75f4 }
            // n = 6, score = 1100
            //   c3                   | mov                 esi, dword ptr [esp + 0x38]
            //   8bc5                 | dec                 eax
            //   ebe4                 | add                 esp, 0x20
            //   4533f6               | ret                 
            //   413bee               | mov                 eax, ebp
            //   75f4                 | jmp                 0xffffffe8

        $sequence_23 = { 83385c 7e4b 4c8b505c 4d85d2 7442 448b6c2470 4c8bce }
            // n = 7, score = 1100
            //   83385c               | mov                 eax, edi
            //   7e4b                 | jmp                 0x10
            //   4c8b505c             | dec                 eax
            //   4d85d2               | add                 ecx, 8
            //   7442                 | mov                 eax, 0x21590001
            //   448b6c2470           | mov                 eax, edi
            //   4c8bce               | jmp                 0x10

        $sequence_24 = { e8???????? b801005921 488b5c2430 488b742438 4883c420 }
            // n = 5, score = 1100
            //   e8????????           |                     
            //   b801005921           | mov                 eax, 0x21590001
            //   488b5c2430           | dec                 eax
            //   488b742438           | mov                 ebx, dword ptr [esp + 0x30]
            //   4883c420             | dec                 eax

        $sequence_25 = { 83781400 750a b865005921 e9???????? }
            // n = 4, score = 900
            //   83781400             | mov                 edx, dword ptr [eax + 0x5c]
            //   750a                 | dec                 ebp
            //   b865005921           | test                edx, edx
            //   e9????????           |                     

        $sequence_26 = { 83c0fe 668b4802 83c002 663bcb 75f4 8b15???????? 8b0d???????? }
            // n = 7, score = 800
            //   83c0fe               | test                eax, eax
            //   668b4802             | jne                 0x12
            //   83c002               | jle                 0x32
            //   663bcb               | mov                 ecx, dword ptr [ecx]
            //   75f4                 | jne                 0x3e
            //   8b15????????         |                     
            //   8b0d????????         |                     

        $sequence_27 = { c3 8b4d08 57 51 6a00 }
            // n = 5, score = 800
            //   c3                   | cmp                 dword ptr [eax + ecx], 0x4550
            //   8b4d08               | jne                 5
            //   57                   | xor                 eax, eax
            //   51                   | ret                 
            //   6a00                 | je                  9

        $sequence_28 = { 6689440ffc 6685c0 75ee f685c003000010 }
            // n = 4, score = 800
            //   6689440ffc           | jne                 0x81
            //   6685c0               | test                eax, eax
            //   75ee                 | jle                 0x94
            //   f685c003000010       | sub                 eax, 1

        $sequence_29 = { 8908 8b0d???????? 895004 894808 33c0 }
            // n = 5, score = 800
            //   8908                 | push                edi
            //   8b0d????????         |                     
            //   895004               | mov                 ebx, ecx
            //   894808               | xor                 esi, esi
            //   33c0                 | mov                 eax, dword ptr [esp + 8]

        $sequence_30 = { 8b7d0c 3bc3 7508 3bfb }
            // n = 4, score = 800
            //   8b7d0c               | push                dword ptr [ebp + 0xc]
            //   3bc3                 | push                dword ptr [ebp + 8]
            //   7508                 | add                 esp, 0xc
            //   3bfb                 | test                eax, eax

        $sequence_31 = { 83feff 7505 33c0 5e 5d c3 8b4d08 }
            // n = 7, score = 800
            //   83feff               | mov                 dword ptr [eax + 8], ecx
            //   7505                 | xor                 eax, eax
            //   33c0                 | add                 eax, -2
            //   5e                   | mov                 cx, word ptr [eax + 2]
            //   5d                   | add                 eax, 2
            //   c3                   | cmp                 cx, bx
            //   8b4d08               | jne                 0xfffffffc

        $sequence_32 = { ff15???????? 83f87a 740b 3d230000c0 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   83f87a               | test                eax, eax
            //   740b                 | jle                 0x92
            //   3d230000c0           | sub                 eax, 1

        $sequence_33 = { 8bec 56 6a00 6880000000 6a03 6a00 6a03 }
            // n = 7, score = 800
            //   8bec                 | xor                 eax, eax
            //   56                   | cmp                 eax, -1
            //   6a00                 | je                  9
            //   6880000000           | xor                 eax, eax
            //   6a03                 | cmp                 eax, -1
            //   6a00                 | je                  9
            //   6a03                 | xor                 eax, eax

        $sequence_34 = { 68???????? 51 ffd6 83c40c 6a28 }
            // n = 5, score = 800
            //   68????????           |                     
            //   51                   | push                edi
            //   ffd6                 | push                ecx
            //   83c40c               | push                0
            //   6a28                 | push                0

        $sequence_35 = { 6a03 68000000c0 50 ff15???????? 8bf0 83feff 7505 }
            // n = 7, score = 800
            //   6a03                 | mov                 dword ptr [eax], edx
            //   68000000c0           | add                 eax, 2
            //   50                   | cmp                 cx, bx
            //   ff15????????         |                     
            //   8bf0                 | jne                 0xfffffff6
            //   83feff               | mov                 dword ptr [eax], edx
            //   7505                 | mov                 ecx, dword ptr [ebp + 8]

        $sequence_36 = { 8d45e8 50 6a00 6aff e8???????? 85c0 7405 }
            // n = 7, score = 800
            //   8d45e8               | cmp                 dword ptr [eax], 0x5c
            //   50                   | jle                 0x4d
            //   6a00                 | dec                 esp
            //   6aff                 | mov                 edx, dword ptr [eax + 0x5c]
            //   e8????????           |                     
            //   85c0                 | dec                 ebp
            //   7405                 | test                edx, edx

        $sequence_37 = { 4156 4157 488dac24b8f3ffff 4881ec480d0000 4533e4 4c8bf1 488bda }
            // n = 7, score = 700
            //   4156                 | mov                 edx, edi
            //   4157                 | test                al, al
            //   488dac24b8f3ffff     | cmovne              edi, ecx
            //   4881ec480d0000       | dec                 eax
            //   4533e4               | mov                 ecx, esi
            //   4c8bf1               | mov                 edx, edi
            //   488bda               | mov                 ecx, 0x14

        $sequence_38 = { ff15???????? 488bcf ff15???????? 41b701 }
            // n = 4, score = 700
            //   ff15????????         |                     
            //   488bcf               | mov                 dword ptr [esp + 0x50], ecx
            //   ff15????????         |                     
            //   41b701               | dec                 esp

        $sequence_39 = { 8d8588feffff 68???????? 50 ff15???????? 83c42c }
            // n = 5, score = 700
            //   8d8588feffff         | cmp                 eax, 1
            //   68????????           |                     
            //   50                   | test                eax, eax
            //   ff15????????         |                     
            //   83c42c               | jne                 6

        $sequence_40 = { 4584ff 7518 33c0 4881c4480d0000 }
            // n = 4, score = 700
            //   4584ff               | test                al, al
            //   7518                 | cmovne              edi, ecx
            //   33c0                 | dec                 eax
            //   4881c4480d0000       | mov                 ecx, esi

        $sequence_41 = { 48894c2450 4c89642448 488d4c2468 48894c2440 }
            // n = 4, score = 700
            //   48894c2450           | test                al, al
            //   4c89642448           | cmovne              edi, ecx
            //   488d4c2468           | dec                 eax
            //   48894c2440           | mov                 ecx, esi

        $sequence_42 = { 48894706 488b05???????? 4889470e 0fb705???????? }
            // n = 4, score = 700
            //   48894706             | test                eax, eax
            //   488b05????????       |                     
            //   4889470e             | dec                 eax
            //   0fb705????????       |                     

        $sequence_43 = { 84c0 0f45f9 488bce 8bd7 ff15???????? }
            // n = 5, score = 700
            //   84c0                 | mov                 edi, eax
            //   0f45f9               | cmp                 ebx, 1
            //   488bce               | jne                 0x22
            //   8bd7                 | test                edi, edi
            //   ff15????????         |                     

        $sequence_44 = { 7507 32c0 e9???????? c745b818000000 }
            // n = 4, score = 600
            //   7507                 | push                0
            //   32c0                 | push                -1
            //   e9????????           |                     
            //   c745b818000000       | test                eax, eax

        $sequence_45 = { 83c002 6685c9 75f5 2bc2 d1f8 66837c43fe5c }
            // n = 6, score = 500
            //   83c002               | xor                 eax, eax
            //   6685c9               | jmp                 0x6e
            //   75f5                 | and                 dword ptr [eax], 0
            //   2bc2                 | test                eax, eax
            //   d1f8                 | jne                 6
            //   66837c43fe5c         | xor                 eax, eax

        $sequence_46 = { 05a2000000 50 8d8c249c0d0000 68???????? }
            // n = 4, score = 300
            //   05a2000000           | test                eax, eax
            //   50                   | jne                 0x3e
            //   8d8c249c0d0000       | mov                 ecx, 0x80
            //   68????????           |                     

        $sequence_47 = { 0f8431ffffff 8b4d08 5f 8931 }
            // n = 4, score = 300
            //   0f8431ffffff         | test                cx, cx
            //   8b4d08               | jne                 0xfffffffa
            //   5f                   | sub                 eax, edx
            //   8931                 | sar                 eax, 1

        $sequence_48 = { 0f8456feffff 807c241301 6800080000 0f8544020000 }
            // n = 4, score = 300
            //   0f8456feffff         | lea                 eax, [esp + 0xd9c]
            //   807c241301           | push                eax
            //   6800080000           | add                 eax, 0xa1
            //   0f8544020000         | push                eax

        $sequence_49 = { 0f84100f0000 6800080000 57 56 }
            // n = 4, score = 300
            //   0f84100f0000         | cmp                 ebx, 1
            //   6800080000           | je                  0xb
            //   57                   | pop                 edi
            //   56                   | pop                 esi

        $sequence_50 = { 05a2000000 50 8d94249c0d0000 68???????? }
            // n = 4, score = 300
            //   05a2000000           | mov                 ecx, 0x3e8
            //   50                   | div                 ecx
            //   8d94249c0d0000       | cmp                 eax, 5
            //   68????????           |                     

        $sequence_51 = { 05a1000000 50 8d84249c0d0000 68???????? }
            // n = 4, score = 300
            //   05a1000000           | xor                 eax, eax
            //   50                   | jmp                 0x6e
            //   8d84249c0d0000       | mov                 eax, dword ptr [esp + 8]
            //   68????????           |                     

        $sequence_52 = { 668cc8 c3 53 50 }
            // n = 4, score = 200
            //   668cc8               | test                eax, eax
            //   c3                   | je                  7
            //   53                   | push                0x18
            //   50                   | lea                 eax, [ebp - 0x18]

        $sequence_53 = { 85c0 740a b8050000c0 e9???????? }
            // n = 4, score = 200
            //   85c0                 | push                eax
            //   740a                 | push                0
            //   b8050000c0           | push                -1
            //   e9????????           |                     

        $sequence_54 = { c745c000000000 8d45cc 50 8b4dc8 51 ff15???????? }
            // n = 6, score = 100
            //   c745c000000000       | xor                 esi, esi
            //   8d45cc               | add                 eax, edx
            //   50                   | adc                 ecx, esi
            //   8b4dc8               | push                ecx
            //   51                   | xor                 esi, esi
            //   ff15????????         |                     

        $sequence_55 = { c745c000000000 8d4dcc 51 8b55c8 }
            // n = 4, score = 100
            //   c745c000000000       | push                ebx
            //   8d4dcc               | push                eax
            //   51                   | test                eax, eax
            //   8b55c8               | je                  0xc

    condition:
        7 of them and filesize < 1368064
}