rule win_former_first_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.former_first_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.former_first_rat"
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
        $sequence_0 = { c78500ffffff00100000 89b5e8feffff e8???????? 8bd8 83c404 899df0feffff 3bde }
            // n = 7, score = 200
            //   c78500ffffff00100000     | mov    dword ptr [ebp - 0x100], 0x1000
            //   89b5e8feffff         | mov                 dword ptr [ebp - 0x118], esi
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   83c404               | add                 esp, 4
            //   899df0feffff         | mov                 dword ptr [ebp - 0x110], ebx
            //   3bde                 | cmp                 ebx, esi

        $sequence_1 = { e8???????? 83c408 3bc3 7510 56 68???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   3bc3                 | cmp                 eax, ebx
            //   7510                 | jne                 0x12
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_2 = { 50 ff15???????? 8b4d10 8b55e8 6a00 51 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_3 = { 66890c02 83c002 6685c9 75f1 8d85e0fdffff }
            // n = 5, score = 200
            //   66890c02             | mov                 word ptr [edx + eax], cx
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx
            //   75f1                 | jne                 0xfffffff3
            //   8d85e0fdffff         | lea                 eax, [ebp - 0x220]

        $sequence_4 = { 6a00 8d8dfceeffff 51 6800100000 8d95f4efffff 52 50 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   8d8dfceeffff         | lea                 ecx, [ebp - 0x1104]
            //   51                   | push                ecx
            //   6800100000           | push                0x1000
            //   8d95f4efffff         | lea                 edx, [ebp - 0x100c]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_5 = { 68???????? e8???????? 8b0d???????? 2b0d???????? b87fe0077e f7e9 }
            // n = 6, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   2b0d????????         |                     
            //   b87fe0077e           | mov                 eax, 0x7e07e07f
            //   f7e9                 | imul                ecx

        $sequence_6 = { 8b4de8 8b45f0 8b55ec 898db0fbffff }
            // n = 4, score = 200
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   898db0fbffff         | mov                 dword ptr [ebp - 0x450], ecx

        $sequence_7 = { 8b742438 8b06 8d4804 89442414 8b442430 }
            // n = 5, score = 200
            //   8b742438             | mov                 esi, dword ptr [esp + 0x38]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d4804               | lea                 ecx, [eax + 4]
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]

        $sequence_8 = { 03c2 83e003 3bc2 7516 418bc2 }
            // n = 5, score = 100
            //   03c2                 | mov                 byte ptr [ebx], dl
            //   83e003               | inc                 edx
            //   3bc2                 | xor                 byte ptr [ecx + eax], dl
            //   7516                 | inc                 edx
            //   418bc2               | mov                 cl, byte ptr [ecx + eax]

        $sequence_9 = { 03ca 0fb6c9 428a1401 4130143b }
            // n = 4, score = 100
            //   03ca                 | mov                 dword ptr [esp + 0x68], eax
            //   0fb6c9               | inc                 ecx
            //   428a1401             | cmp                 eax, ebp
            //   4130143b             | jb                  0x5b

        $sequence_10 = { 02ca 4402d1 410fb6ca 42321401 }
            // n = 4, score = 100
            //   02ca                 | dec                 eax
            //   4402d1               | cmp                 edi, eax
            //   410fb6ca             | add                 cl, al
            //   42321401             | dec                 eax

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

        $sequence_13 = { 02c8 488d05f0f60100 02c9 4002ce }
            // n = 4, score = 100
            //   02c8                 | mov                 eax, dword ptr [ecx + 0x10]
            //   488d05f0f60100       | cmp                 dword ptr [eax + 0x94], 0
            //   02c9                 | add                 cl, al
            //   4002ce               | dec                 eax

        $sequence_14 = { 017130 83793005 7407 33c0 }
            // n = 4, score = 100
            //   017130               | add                 dword ptr [ecx + 0x30], esi
            //   83793005             | cmp                 dword ptr [ecx + 0x30], 5
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax

        $sequence_15 = { 03cd 8908 f6437804 7417 }
            // n = 4, score = 100
            //   03cd                 | jne                 0x1f
            //   8908                 | inc                 ecx
            //   f6437804             | mov                 eax, edx
            //   7417                 | add                 eax, edx

    condition:
        7 of them and filesize < 626688
}