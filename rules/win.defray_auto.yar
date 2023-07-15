rule win_defray_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.defray."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.defray"
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
        $sequence_0 = { 03c8 8bc1 83d200 8345fc04 25ffffff0f 46 0facd11c }
            // n = 7, score = 200
            //   03c8                 | add                 ecx, eax
            //   8bc1                 | mov                 eax, ecx
            //   83d200               | adc                 edx, 0
            //   8345fc04             | add                 dword ptr [ebp - 4], 4
            //   25ffffff0f           | and                 eax, 0xfffffff
            //   46                   | inc                 esi
            //   0facd11c             | shrd                ecx, edx, 0x1c

        $sequence_1 = { 3938 0f857ffeffff 8b4dfc 8bfe 897d0c 3b7d10 75cb }
            // n = 7, score = 200
            //   3938                 | cmp                 dword ptr [eax], edi
            //   0f857ffeffff         | jne                 0xfffffe85
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8bfe                 | mov                 edi, esi
            //   897d0c               | mov                 dword ptr [ebp + 0xc], edi
            //   3b7d10               | cmp                 edi, dword ptr [ebp + 0x10]
            //   75cb                 | jne                 0xffffffcd

        $sequence_2 = { eb01 5b bf006a1800 57 e8???????? 8bf0 }
            // n = 6, score = 200
            //   eb01                 | jmp                 3
            //   5b                   | pop                 ebx
            //   bf006a1800           | mov                 edi, 0x186a00
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_3 = { 742b 0fb611 0fb6c0 eb17 81fa00010000 7313 8a8740b54800 }
            // n = 7, score = 200
            //   742b                 | je                  0x2d
            //   0fb611               | movzx               edx, byte ptr [ecx]
            //   0fb6c0               | movzx               eax, al
            //   eb17                 | jmp                 0x19
            //   81fa00010000         | cmp                 edx, 0x100
            //   7313                 | jae                 0x15
            //   8a8740b54800         | mov                 al, byte ptr [edi + 0x48b540]

        $sequence_4 = { 56 57 33c0 8dbc2470020000 ab 33db 53 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax
            //   8dbc2470020000       | lea                 edi, [esp + 0x270]
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx

        $sequence_5 = { 8d85d8feffff c785dcfeffff06000000 33c9 89bde0feffff 50 }
            // n = 5, score = 200
            //   8d85d8feffff         | lea                 eax, [ebp - 0x128]
            //   c785dcfeffff06000000     | mov    dword ptr [ebp - 0x124], 6
            //   33c9                 | xor                 ecx, ecx
            //   89bde0feffff         | mov                 dword ptr [ebp - 0x120], edi
            //   50                   | push                eax

        $sequence_6 = { 59 85c0 755b 8bb57ccfffff 8d8580cfffff 50 56 }
            // n = 7, score = 200
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   755b                 | jne                 0x5d
            //   8bb57ccfffff         | mov                 esi, dword ptr [ebp - 0x3084]
            //   8d8580cfffff         | lea                 eax, [ebp - 0x3080]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_7 = { 53 f3a5 50 e8???????? 83c40c 8dbd68f9ffff be???????? }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8dbd68f9ffff         | lea                 edi, [ebp - 0x698]
            //   be????????           |                     

        $sequence_8 = { 8bec 81ece4000000 a1???????? 33c5 8945fc 8b4508 85c0 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   81ece4000000         | sub                 esp, 0xe4
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   85c0                 | test                eax, eax

        $sequence_9 = { be53ffffff eb05 be40ffffff 8bcf c7878c00000000000000 e8???????? }
            // n = 6, score = 200
            //   be53ffffff           | mov                 esi, 0xffffff53
            //   eb05                 | jmp                 7
            //   be40ffffff           | mov                 esi, 0xffffff40
            //   8bcf                 | mov                 ecx, edi
            //   c7878c00000000000000     | mov    dword ptr [edi + 0x8c], 0
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1253376
}