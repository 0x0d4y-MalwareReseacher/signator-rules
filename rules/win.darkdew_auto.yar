rule win_darkdew_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.darkdew."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkdew"
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
        $sequence_0 = { 85db 7467 8b8d30ffffff b80f78fce1 2bcb f7e9 03d1 }
            // n = 7, score = 100
            //   85db                 | test                ebx, ebx
            //   7467                 | je                  0x69
            //   8b8d30ffffff         | mov                 ecx, dword ptr [ebp - 0xd0]
            //   b80f78fce1           | mov                 eax, 0xe1fc780f
            //   2bcb                 | sub                 ecx, ebx
            //   f7e9                 | imul                ecx
            //   03d1                 | add                 edx, ecx

        $sequence_1 = { 8b4d18 2bc1 6a03 68???????? 83f803 7221 83fa10 }
            // n = 7, score = 100
            //   8b4d18               | mov                 ecx, dword ptr [ebp + 0x18]
            //   2bc1                 | sub                 eax, ecx
            //   6a03                 | push                3
            //   68????????           |                     
            //   83f803               | cmp                 eax, 3
            //   7221                 | jb                  0x23
            //   83fa10               | cmp                 edx, 0x10

        $sequence_2 = { 03d6 c1fa09 8bf2 c1ee1f 03f2 f7e9 }
            // n = 6, score = 100
            //   03d6                 | add                 edx, esi
            //   c1fa09               | sar                 edx, 9
            //   8bf2                 | mov                 esi, edx
            //   c1ee1f               | shr                 esi, 0x1f
            //   03f2                 | add                 esi, edx
            //   f7e9                 | imul                ecx

        $sequence_3 = { 8dbd2ce0ffff 81ea44020000 b991000000 8bf3 8955fc }
            // n = 5, score = 100
            //   8dbd2ce0ffff         | lea                 edi, [ebp - 0x1fd4]
            //   81ea44020000         | sub                 edx, 0x244
            //   b991000000           | mov                 ecx, 0x91
            //   8bf3                 | mov                 esi, ebx
            //   8955fc               | mov                 dword ptr [ebp - 4], edx

        $sequence_4 = { 75f9 8b5d98 2bca 8b5594 }
            // n = 4, score = 100
            //   75f9                 | jne                 0xfffffffb
            //   8b5d98               | mov                 ebx, dword ptr [ebp - 0x68]
            //   2bca                 | sub                 ecx, edx
            //   8b5594               | mov                 edx, dword ptr [ebp - 0x6c]

        $sequence_5 = { e8???????? 83c40c eb02 2bf3 81ef44020000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb02                 | jmp                 4
            //   2bf3                 | sub                 esi, ebx
            //   81ef44020000         | sub                 edi, 0x244

        $sequence_6 = { 8b4704 2bc6 50 8b45fc 0544020000 56 }
            // n = 6, score = 100
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0544020000           | add                 eax, 0x244
            //   56                   | push                esi

        $sequence_7 = { 8b00 89853cfeffff b914060000 8d8534feffff }
            // n = 4, score = 100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   89853cfeffff         | mov                 dword ptr [ebp - 0x1c4], eax
            //   b914060000           | mov                 ecx, 0x614
            //   8d8534feffff         | lea                 eax, [ebp - 0x1cc]

        $sequence_8 = { 837c241402 0f8c0c010000 81c7bcfdffff 897c2410 0f1f00 b80f78fce1 f7ee }
            // n = 7, score = 100
            //   837c241402           | cmp                 dword ptr [esp + 0x14], 2
            //   0f8c0c010000         | jl                  0x112
            //   81c7bcfdffff         | add                 edi, 0xfffffdbc
            //   897c2410             | mov                 dword ptr [esp + 0x10], edi
            //   0f1f00               | nop                 dword ptr [eax]
            //   b80f78fce1           | mov                 eax, 0xe1fc780f
            //   f7ee                 | imul                esi

        $sequence_9 = { f3a5 8b4de8 894dfc eb03 8b45f4 }
            // n = 5, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   eb03                 | jmp                 5
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 279552
}