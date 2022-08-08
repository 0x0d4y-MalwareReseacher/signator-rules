rule win_former_first_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.former_first_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.former_first_rat"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 6a00 8d45fc 50 8b4620 51 }
            // n = 5, score = 200
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   51                   | push                ecx

        $sequence_1 = { 8d4804 89442414 8b442430 3bc8 7407 83c0fc 89442414 }
            // n = 7, score = 200
            //   8d4804               | lea                 ecx, [eax + 4]
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   3bc8                 | cmp                 ecx, eax
            //   7407                 | je                  9
            //   83c0fc               | add                 eax, -4
            //   89442414             | mov                 dword ptr [esp + 0x14], eax

        $sequence_2 = { 75f8 66a1???????? 668907 8d45f4 8bd0 8a08 40 }
            // n = 7, score = 200
            //   75f8                 | jne                 0xfffffffa
            //   66a1????????         |                     
            //   668907               | mov                 word ptr [edi], ax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   8bd0                 | mov                 edx, eax
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   40                   | inc                 eax

        $sequence_3 = { 668917 75ec 8b4dfc 33cd 5f }
            // n = 5, score = 200
            //   668917               | mov                 word ptr [edi], dx
            //   75ec                 | jne                 0xffffffee
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp
            //   5f                   | pop                 edi

        $sequence_4 = { e8???????? 69c0e8030000 50 ffd6 833d????????00 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   69c0e8030000         | imul                eax, eax, 0x3e8
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   833d????????00       |                     

        $sequence_5 = { 8b0d???????? 6a40 6a00 68???????? 890f e8???????? }
            // n = 6, score = 200
            //   8b0d????????         |                     
            //   6a40                 | push                0x40
            //   6a00                 | push                0
            //   68????????           |                     
            //   890f                 | mov                 dword ptr [edi], ecx
            //   e8????????           |                     

        $sequence_6 = { 8935???????? 8975dc ff15???????? a1???????? 83f805 0f858e000000 }
            // n = 6, score = 200
            //   8935????????         |                     
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   ff15????????         |                     
            //   a1????????           |                     
            //   83f805               | cmp                 eax, 5
            //   0f858e000000         | jne                 0x94

        $sequence_7 = { e8???????? 8b95f0feffff 83c404 52 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8b95f0feffff         | mov                 edx, dword ptr [ebp - 0x110]
            //   83c404               | add                 esp, 4
            //   52                   | push                edx

        $sequence_8 = { 03c2 83e003 3bc2 7516 418bc2 }
            // n = 5, score = 100
            //   03c2                 | mov                 byte ptr [ebx], dl
            //   83e003               | inc                 edx
            //   3bc2                 | xor                 byte ptr [ecx + eax], dl
            //   7516                 | inc                 edx
            //   418bc2               | mov                 cl, byte ptr [ecx + eax]

        $sequence_9 = { 017130 83793005 7407 33c0 }
            // n = 4, score = 100
            //   017130               | add                 dword ptr [ecx + 0x30], esi
            //   83793005             | cmp                 dword ptr [ecx + 0x30], 5
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax

        $sequence_10 = { 02c8 488d05f0f60100 02c9 4002ce }
            // n = 4, score = 100
            //   02c8                 | mov                 eax, dword ptr [ecx + 0x10]
            //   488d05f0f60100       | cmp                 dword ptr [eax + 0x94], 0
            //   02c9                 | add                 cl, al
            //   4002ce               | dec                 eax

        $sequence_11 = { 03c1 89442468 413bc5 7250 }
            // n = 4, score = 100
            //   03c1                 | inc                 ecx
            //   89442468             | movzx               ecx, dl
            //   413bc5               | inc                 edx
            //   7250                 | xor                 dl, byte ptr [ecx + eax]

        $sequence_12 = { 03cf 8908 488b4340 48833800 }
            // n = 4, score = 100
            //   03cf                 | inc                 ecx
            //   8908                 | xor                 byte ptr [ebx + edi], dl
            //   488b4340             | add                 ecx, edx
            //   48833800             | movzx               ecx, cl

        $sequence_13 = { 03ca 0fb6c9 428a1401 4130143b }
            // n = 4, score = 100
            //   03ca                 | mov                 dword ptr [esp + 0x68], eax
            //   0fb6c9               | inc                 ecx
            //   428a1401             | cmp                 eax, ebp
            //   4130143b             | jb                  0x88

        $sequence_14 = { 03cd 8908 f6437804 7417 }
            // n = 4, score = 100
            //   03cd                 | jne                 0x1d
            //   8908                 | inc                 ecx
            //   f6437804             | mov                 eax, edx
            //   7417                 | add                 eax, edx

        $sequence_15 = { 02ca 4402d1 410fb6ca 42321401 }
            // n = 4, score = 100
            //   02ca                 | dec                 eax
            //   4402d1               | cmp                 edi, eax
            //   410fb6ca             | add                 cl, al
            //   42321401             | dec                 eax

    condition:
        7 of them and filesize < 626688
}