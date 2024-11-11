rule win_xpertrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.xpertrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xpertrat"
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
        $sequence_0 = { ff08 40 0430 ff0a 4c 000c00 }
            // n = 6, score = 200
            //   ff08                 | dec                 dword ptr [eax]
            //   40                   | inc                 eax
            //   0430                 | add                 al, 0x30
            //   ff0a                 | dec                 dword ptr [edx]
            //   4c                   | dec                 esp
            //   000c00               | add                 byte ptr [eax + eax], cl

        $sequence_1 = { 0d98000700 6e 74ff 6e }
            // n = 4, score = 200
            //   0d98000700           | or                  eax, 0x70098
            //   6e                   | outsb               dx, byte ptr [esi]
            //   74ff                 | je                  1
            //   6e                   | outsb               dx, byte ptr [esi]

        $sequence_2 = { 0000 00a1cc004400 0bc0 7402 ffe0 68???????? b8???????? }
            // n = 7, score = 200
            //   0000                 | add                 byte ptr [eax], al
            //   00a1cc004400         | add                 byte ptr [ecx + 0x4400cc], ah
            //   0bc0                 | or                  eax, eax
            //   7402                 | je                  4
            //   ffe0                 | jmp                 eax
            //   68????????           |                     
            //   b8????????           |                     

        $sequence_3 = { 008a3800cc1c 5e 006c70ff 0808 }
            // n = 4, score = 200
            //   008a3800cc1c         | add                 byte ptr [edx + 0x1ccc0038], cl
            //   5e                   | pop                 esi
            //   006c70ff             | add                 byte ptr [eax + esi*2 - 1], ch
            //   0808                 | or                  byte ptr [eax], cl

        $sequence_4 = { 0870ff 0d80000700 0474 ff0478 }
            // n = 4, score = 200
            //   0870ff               | or                  byte ptr [eax - 1], dh
            //   0d80000700           | or                  eax, 0x70080
            //   0474                 | add                 al, 0x74
            //   ff0478               | inc                 dword ptr [eax + edi*2]

        $sequence_5 = { ff05???????? 000d???????? 0878ff 0d98000700 6e }
            // n = 5, score = 200
            //   ff05????????         |                     
            //   000d????????         |                     
            //   0878ff               | or                  byte ptr [eax - 1], bh
            //   0d98000700           | or                  eax, 0x70098
            //   6e                   | outsb               dx, byte ptr [esi]

        $sequence_6 = { 006c70ff 0808 008f38001b26 001b 0d002a2364 ff08 }
            // n = 6, score = 200
            //   006c70ff             | add                 byte ptr [eax + esi*2 - 1], ch
            //   0808                 | or                  byte ptr [eax], cl
            //   008f38001b26         | add                 byte ptr [edi + 0x261b0038], cl
            //   001b                 | add                 byte ptr [ebx], bl
            //   0d002a2364           | or                  eax, 0x64232a00
            //   ff08                 | dec                 dword ptr [eax]

        $sequence_7 = { 007168 ff0468 ff0a 250004003c 6c 70ff 0808 }
            // n = 7, score = 200
            //   007168               | add                 byte ptr [ecx + 0x68], dh
            //   ff0468               | inc                 dword ptr [eax + ebp*2]
            //   ff0a                 | dec                 dword ptr [edx]
            //   250004003c           | and                 eax, 0x3c000400
            //   6c                   | insb                byte ptr es:[edi], dx
            //   70ff                 | jo                  1
            //   0808                 | or                  byte ptr [eax], cl

        $sequence_8 = { ff15???????? 6a00 6a05 6a01 8d55b4 6a00 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a05                 | push                5
            //   6a01                 | push                1
            //   8d55b4               | lea                 edx, [ebp - 0x4c]
            //   6a00                 | push                0

        $sequence_9 = { ff15???????? 6a00 68fbfdffff 8b06 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   68fbfdffff           | push                0xfffffdfb
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_10 = { ff15???????? 6a00 6a05 56 ff15???????? 83c40c 33db }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a05                 | push                5
            //   56                   | push                esi
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   33db                 | xor                 ebx, ebx

        $sequence_11 = { ff15???????? 6a00 6a01 6a01 8d45b4 6a00 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a01                 | push                1
            //   8d45b4               | lea                 eax, [ebp - 0x4c]
            //   6a00                 | push                0

        $sequence_12 = { ff15???????? 6a00 6a04 8b4510 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a04                 | push                4
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_13 = { ff15???????? 6a00 68???????? 8d4dcc }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   68????????           |                     
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]

        $sequence_14 = { ff15???????? 6a00 6a02 56 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   56                   | push                esi

        $sequence_15 = { ff15???????? 6a00 6a00 6a01 6a03 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a03                 | push                3

    condition:
        7 of them and filesize < 8560640
}