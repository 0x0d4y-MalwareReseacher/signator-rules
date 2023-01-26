rule win_kimsuky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.kimsuky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kimsuky"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 85c0 7516 ff15???????? 8bd8 e8???????? 0fafd8 }
            // n = 6, score = 400
            //   85c0                 | test                eax, eax
            //   7516                 | jne                 0x18
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   0fafd8               | imul                ebx, eax

        $sequence_1 = { 2bca 51 8d85e4f5ffff 50 }
            // n = 4, score = 400
            //   2bca                 | sub                 ecx, edx
            //   51                   | push                ecx
            //   8d85e4f5ffff         | lea                 eax, [ebp - 0xa1c]
            //   50                   | push                eax

        $sequence_2 = { 8d95f0fcffff b9???????? e8???????? 8d95ecfbffff b9???????? e8???????? 8d85f8feffff }
            // n = 7, score = 400
            //   8d95f0fcffff         | lea                 edx, [ebp - 0x310]
            //   b9????????           |                     
            //   e8????????           |                     
            //   8d95ecfbffff         | lea                 edx, [ebp - 0x414]
            //   b9????????           |                     
            //   e8????????           |                     
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]

        $sequence_3 = { 53 ffd7 a3???????? 8d85d4f5ffff }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   a3????????           |                     
            //   8d85d4f5ffff         | lea                 eax, [ebp - 0xa2c]

        $sequence_4 = { 833d????????00 7413 b801000000 8b4dfc }
            // n = 4, score = 400
            //   833d????????00       |                     
            //   7413                 | je                  0x15
            //   b801000000           | mov                 eax, 1
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { 6a04 6a00 68???????? ff15???????? 6a00 }
            // n = 5, score = 400
            //   6a04                 | push                4
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_6 = { 83c801 85c0 7423 6a00 8d85f0feffff }
            // n = 5, score = 400
            //   83c801               | or                  eax, 1
            //   85c0                 | test                eax, eax
            //   7423                 | je                  0x25
            //   6a00                 | push                0
            //   8d85f0feffff         | lea                 eax, [ebp - 0x110]

        $sequence_7 = { 8d4fff 8d53ff 03c8 03d0 3bd9 7704 3bd7 }
            // n = 7, score = 400
            //   8d4fff               | lea                 ecx, [edi - 1]
            //   8d53ff               | lea                 edx, [ebx - 1]
            //   03c8                 | add                 ecx, eax
            //   03d0                 | add                 edx, eax
            //   3bd9                 | cmp                 ebx, ecx
            //   7704                 | ja                  6
            //   3bd7                 | cmp                 edx, edi

        $sequence_8 = { 6a00 6a00 68???????? 8d85e4fbffff 50 8d45e4 }
            // n = 6, score = 400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   8d85e4fbffff         | lea                 eax, [ebp - 0x41c]
            //   50                   | push                eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]

        $sequence_9 = { 0f857affffff 4c8b7c2460 4c8b6c2420 4c8b642428 }
            // n = 4, score = 300
            //   0f857affffff         | jmp                 0xffffffe2
            //   4c8b7c2460           | dec                 eax
            //   4c8b6c2420           | mov                 eax, dword ptr [0x60]
            //   4c8b642428           | dec                 eax

        $sequence_10 = { 4d8b36 4d85f6 0f8540feffff 488b6c2460 4c637d3c }
            // n = 5, score = 300
            //   4d8b36               | jne                 0xffffff80
            //   4d85f6               | dec                 esp
            //   0f8540feffff         | mov                 edi, dword ptr [esp + 0x60]
            //   488b6c2460           | dec                 esp
            //   4c637d3c             | mov                 ebp, dword ptr [esp + 0x20]

        $sequence_11 = { 4157 4883ec40 48896c2470 4889742438 4533ff 4c89642428 4c896c2420 }
            // n = 7, score = 300
            //   4157                 | inc                 ecx
            //   4883ec40             | push                edi
            //   48896c2470           | dec                 eax
            //   4889742438           | sub                 esp, 0x40
            //   4533ff               | dec                 eax
            //   4c89642428           | mov                 dword ptr [esp + 0x70], ebp
            //   4c896c2420           | dec                 eax

        $sequence_12 = { 4d03d1 4d03d9 666666660f1f840000000000 418b0a }
            // n = 4, score = 300
            //   4d03d1               | mov                 dword ptr [esp + 0x30], edi
            //   4d03d9               | dec                 eax
            //   666666660f1f840000000000     | dec    ebp
            //   418b0a               | jmp                 0xffffffdd

        $sequence_13 = { 813c2a50450000 7405 48ffcd ebdb 65488b042560000000 48897c2430 }
            // n = 6, score = 300
            //   813c2a50450000       | mov                 dword ptr [esp + 0x38], esi
            //   7405                 | inc                 ebp
            //   48ffcd               | xor                 edi, edi
            //   ebdb                 | dec                 esp
            //   65488b042560000000     | mov    dword ptr [esp + 0x28], esp
            //   48897c2430           | dec                 esp

        $sequence_14 = { 418b5750 4c897c2460 ffd6 458b4754 488bd5 4c8bf0 }
            // n = 6, score = 300
            //   418b5750             | dec                 eax
            //   4c897c2460           | mov                 eax, dword ptr [0x60]
            //   ffd6                 | dec                 eax
            //   458b4754             | mov                 dword ptr [esp + 0x30], edi
            //   488bd5               | dec                 eax
            //   4c8bf0               | mov                 dword ptr [esp + 0x60], ebp

        $sequence_15 = { ff542468 4533c0 498bce 418d5001 ffd3 488bc3 }
            // n = 6, score = 300
            //   ff542468             | dec                 ebp
            //   4533c0               | add                 ebx, ecx
            //   498bce               | nop                 word ptr [eax + eax]
            //   418d5001             | inc                 ecx
            //   ffd3                 | mov                 ecx, dword ptr [edx]
            //   488bc3               | inc                 ecx

        $sequence_16 = { 85c9 0f8494020000 89bda0000000 897d30 }
            // n = 4, score = 200
            //   85c9                 | test                eax, eax
            //   0f8494020000         | call                dword ptr [esp + 0x68]
            //   89bda0000000         | inc                 ebp
            //   897d30               | xor                 eax, eax

        $sequence_17 = { 8bcf 85c0 0f94c1 85c9 0f8494020000 }
            // n = 5, score = 200
            //   8bcf                 | dec                 esp
            //   85c0                 | arpl                word ptr [ebp + 0x3c], di
            //   0f94c1               | dec                 esp
            //   85c9                 | mov                 edi, dword ptr [esp + 0x60]
            //   0f8494020000         | dec                 esp

        $sequence_18 = { 4c89642430 c744242880000000 c744242002000000 4533c9 4533c0 }
            // n = 5, score = 200
            //   4c89642430           | dec                 eax
            //   c744242880000000     | mov                 edi, dword ptr [esp + 0x30]
            //   c744242002000000     | dec                 eax
            //   4533c9               | mov                 esi, dword ptr [esp + 0x38]
            //   4533c0               | dec                 eax

        $sequence_19 = { 8bd7 3bd8 0f94c2 85d2 7419 }
            // n = 5, score = 200
            //   8bd7                 | inc                 ebp
            //   3bd8                 | xor                 eax, eax
            //   0f94c2               | dec                 ecx
            //   85d2                 | mov                 ecx, esi
            //   7419                 | inc                 ecx

        $sequence_20 = { ff15???????? 498bc6 488b4d20 4833cc }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   498bc6               | test                eax, eax
            //   488b4d20             | jne                 0x1a
            //   4833cc               | mov                 ebx, eax

        $sequence_21 = { 85c0 7471 895c2468 8d4801 }
            // n = 4, score = 200
            //   85c0                 | inc                 ebp
            //   7471                 | xor                 eax, eax
            //   895c2468             | dec                 ecx
            //   8d4801               | mov                 ecx, esi

        $sequence_22 = { 85c0 0f84b3000000 85f6 0f8497000000 8bd6 }
            // n = 5, score = 200
            //   85c0                 | mov                 dword ptr [esp + 0x60], edi
            //   0f84b3000000         | call                esi
            //   85f6                 | inc                 ebp
            //   0f8497000000         | mov                 eax, dword ptr [edi + 0x54]
            //   8bd6                 | dec                 eax

        $sequence_23 = { 8b7590 660f1f440000 837df000 0f841b020000 }
            // n = 4, score = 200
            //   8b7590               | mov                 edx, ebp
            //   660f1f440000         | dec                 esp
            //   837df000             | mov                 esi, eax
            //   0f841b020000         | dec                 ebp

        $sequence_24 = { 8b442468 6683f809 7508 83f809 }
            // n = 4, score = 200
            //   8b442468             | jne                 0x18
            //   6683f809             | mov                 ebx, eax
            //   7508                 | imul                ebx, eax
            //   83f809               | jne                 0x18

        $sequence_25 = { 8bc8 e8???????? 4c8d05dd9b0500 89442458 }
            // n = 4, score = 100
            //   8bc8                 | jne                 0xe
            //   e8????????           |                     
            //   4c8d05dd9b0500       | cmp                 eax, 9
            //   89442458             | lea                 esi, [ebx + 0x40]

        $sequence_26 = { 8bc8 8bd8 e8???????? 486317 4c8d3d029b0200 }
            // n = 5, score = 100
            //   8bc8                 | jne                 0x18
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   486317               | imul                ebx, eax
            //   4c8d3d029b0200       | mov                 ecx, edi

        $sequence_27 = { 8bc8 e8???????? 498bdc bf10000000 }
            // n = 4, score = 100
            //   8bc8                 | mov                 esi, dword ptr [ebp - 0x70]
            //   e8????????           |                     
            //   498bdc               | nop                 word ptr [eax + eax]
            //   bf10000000           | cmp                 dword ptr [ebp - 0x10], 0

        $sequence_28 = { 8bc8 8b93d8af0600 448bc0 85d2 0f85e1fdffff 8b93bcaf0600 85d2 }
            // n = 7, score = 100
            //   8bc8                 | test                eax, eax
            //   8b93d8af0600         | jne                 0x1a
            //   448bc0               | mov                 ebx, eax
            //   85d2                 | test                eax, eax
            //   0f85e1fdffff         | jne                 0x1a
            //   8b93bcaf0600         | mov                 ebx, eax
            //   85d2                 | test                eax, eax

        $sequence_29 = { 8bc8 e8???????? 4c8bf8 458bc4 }
            // n = 4, score = 100
            //   8bc8                 | nop                 word ptr [eax + eax]
            //   e8????????           |                     
            //   4c8bf8               | cmp                 dword ptr [ebp - 0x10], 0
            //   458bc4               | je                  0x234

        $sequence_30 = { 8bc8 cd29 488d0dabc00400 e8???????? }
            // n = 4, score = 100
            //   8bc8                 | cmp                 ebx, eax
            //   cd29                 | sete                dl
            //   488d0dabc00400       | test                edx, edx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1021952
}