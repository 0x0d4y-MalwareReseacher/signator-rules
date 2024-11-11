rule win_buhtrap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.buhtrap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buhtrap"
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
        $sequence_0 = { e8???????? 59 59 84c0 0f8435010000 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f8435010000         | je                  0x13b

        $sequence_1 = { 6aff 57 50 68e9fd0000 ff15???????? 8bf0 83fe01 }
            // n = 7, score = 400
            //   6aff                 | push                -1
            //   57                   | push                edi
            //   50                   | push                eax
            //   68e9fd0000           | push                0xfde9
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   83fe01               | cmp                 esi, 1

        $sequence_2 = { 8bec 83ec44 53 56 57 bf04010000 }
            // n = 6, score = 400
            //   8bec                 | mov                 ebp, esp
            //   83ec44               | sub                 esp, 0x44
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   bf04010000           | mov                 edi, 0x104

        $sequence_3 = { 6a00 6a00 ab ab 8b45f8 50 }
            // n = 6, score = 400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_4 = { e8???????? 6a06 5a b9???????? 8945c4 e8???????? }
            // n = 6, score = 400
            //   e8????????           |                     
            //   6a06                 | push                6
            //   5a                   | pop                 edx
            //   b9????????           |                     
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   e8????????           |                     

        $sequence_5 = { e8???????? 803d????????00 7426 8b0d???????? 85c9 7406 }
            // n = 6, score = 400
            //   e8????????           |                     
            //   803d????????00       |                     
            //   7426                 | je                  0x28
            //   8b0d????????         |                     
            //   85c9                 | test                ecx, ecx
            //   7406                 | je                  8

        $sequence_6 = { 746f 3b45f8 776a 6805010000 ff15???????? }
            // n = 5, score = 400
            //   746f                 | je                  0x71
            //   3b45f8               | cmp                 eax, dword ptr [ebp - 8]
            //   776a                 | ja                  0x6c
            //   6805010000           | push                0x105
            //   ff15????????         |                     

        $sequence_7 = { 56 ff15???????? 83c414 84db 7541 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   84db                 | test                bl, bl
            //   7541                 | jne                 0x43

        $sequence_8 = { 85c0 742f 6a01 53 6a0c }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   742f                 | je                  0x31
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   6a0c                 | push                0xc

        $sequence_9 = { 7429 8b7b20 6a00 8d7308 e8???????? 59 }
            // n = 6, score = 100
            //   7429                 | je                  0x2b
            //   8b7b20               | mov                 edi, dword ptr [ebx + 0x20]
            //   6a00                 | push                0
            //   8d7308               | lea                 esi, [ebx + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_10 = { e8???????? 8b5dec 83c410 eb57 8d45f0 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   83c410               | add                 esp, 0x10
            //   eb57                 | jmp                 0x59
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_11 = { 83e800 57 745b 48 7567 }
            // n = 5, score = 100
            //   83e800               | sub                 eax, 0
            //   57                   | push                edi
            //   745b                 | je                  0x5d
            //   48                   | dec                 eax
            //   7567                 | jne                 0x69

        $sequence_12 = { ff75f8 ffd7 85c0 754c 8b45fc }
            // n = 5, score = 100
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   754c                 | jne                 0x4e
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_13 = { 83c40c 85c0 7452 b8ff000000 e8???????? 880437 }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7452                 | je                  0x54
            //   b8ff000000           | mov                 eax, 0xff
            //   e8????????           |                     
            //   880437               | mov                 byte ptr [edi + esi], al

        $sequence_14 = { 59 84c0 0f84a3000000 6a10 }
            // n = 4, score = 100
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f84a3000000         | je                  0xa9
            //   6a10                 | push                0x10

    condition:
        7 of them and filesize < 131072
}