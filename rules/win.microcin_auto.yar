rule win_microcin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.microcin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.microcin"
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
        $sequence_0 = { 488bcb ff15???????? 488b8db0010000 4833cc e8???????? 488b9c24d8020000 4881c4c0020000 }
            // n = 7, score = 400
            //   488bcb               | push                eax
            //   ff15????????         |                     
            //   488b8db0010000       | lea                 eax, [ebp - 0x108]
            //   4833cc               | push                eax
            //   e8????????           |                     
            //   488b9c24d8020000     | push                esi
            //   4881c4c0020000       | test                eax, eax

        $sequence_1 = { ff15???????? 85c0 7426 8b400c }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   85c0                 | mov                 ecx, ebp
            //   7426                 | dec                 esp
            //   8b400c               | lea                 eax, [0x112b7]

        $sequence_2 = { 50 6805100000 68ffff0000 56 8b35???????? ffd6 6a04 }
            // n = 7, score = 400
            //   50                   | push                1
            //   6805100000           | or                  ecx, 4
            //   68ffff0000           | mov                 dword ptr [ebp - 0x10], ecx
            //   56                   | mov                 edx, dword ptr [ebp - 0x10]
            //   8b35????????         |                     
            //   ffd6                 | shr                 edx, 1
            //   6a04                 | mov                 dword ptr [ebp - 0x10], edx

        $sequence_3 = { 48895c2410 55 488dac2440feffff 4881ecc0020000 }
            // n = 4, score = 400
            //   48895c2410           | push                0x104
            //   55                   | push                eax
            //   488dac2440feffff     | lea                 eax, [ebp - 0x108]
            //   4881ecc0020000       | lea                 eax, [ebp - 0x54]

        $sequence_4 = { ff15???????? 8b3d???????? 8d85e0feffff 50 }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   8d85e0feffff         | mov                 esi, eax
            //   50                   | test                esi, esi

        $sequence_5 = { 488903 48894308 488b0d???????? ff15???????? 4885c0 }
            // n = 5, score = 400
            //   488903               | push                eax
            //   48894308             | push                0x80000001
            //   488b0d????????       |                     
            //   ff15????????         |                     
            //   4885c0               | add                 esp, 0xc

        $sequence_6 = { ff15???????? 8b1d???????? 8d85a8feffff 50 ffd3 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   8d85a8feffff         | mov                 dword ptr [esp + 0x3c], 0
            //   50                   | test                ax, ax
            //   ffd3                 | je                  0x4e

        $sequence_7 = { ff15???????? 488d4d90 ff15???????? 4863c8 807c0d8f5c 7412 488d4d90 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   488d4d90             | cmovne              esi, edi
            //   ff15????????         |                     
            //   4863c8               | lea                 eax, [ebp - 0x54]
            //   807c0d8f5c           | push                eax
            //   7412                 | push                0x80000001
            //   488d4d90             | test                eax, eax

        $sequence_8 = { ff15???????? 4863c8 c6840d8002000076 488d8d80020000 }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   4863c8               | test                eax, eax
            //   c6840d8002000076     | je                  0x2a
            //   488d8d80020000       | mov                 eax, dword ptr [eax + 0xc]

        $sequence_9 = { 41c7868400000004000000 4533c9 33d2 498d4e70 ff15???????? 85c0 }
            // n = 6, score = 400
            //   41c7868400000004000000     | lea    eax, [ebp - 0x108]
            //   4533c9               | push                0x104
            //   33d2                 | push                eax
            //   498d4e70             | lea                 eax, [ebp - 0x108]
            //   ff15????????         |                     
            //   85c0                 | jle                 0x1a

        $sequence_10 = { 488d4d71 4803c8 e8???????? 418907 }
            // n = 4, score = 400
            //   488d4d71             | cmp                 byte ptr [ebp + esi - 0x158], 0x3a
            //   4803c8               | je                  0x29
            //   e8????????           |                     
            //   418907               | lea                 eax, [ebp - 0x158]

        $sequence_11 = { 56 ff15???????? 85c0 0f45f7 }
            // n = 4, score = 400
            //   56                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | mov                 dword ptr [ebp - 0x364], edx
            //   0f45f7               | mov                 dword ptr [ebp - 0x360], 0

        $sequence_12 = { 8d45ac 50 6801000080 ff15???????? 85c0 }
            // n = 5, score = 400
            //   8d45ac               | mov                 eax, dword ptr [ebp - 0x360]
            //   50                   | test                eax, eax
            //   6801000080           | jbe                 0x49
            //   ff15????????         |                     
            //   85c0                 | dec                 ecx

        $sequence_13 = { c744244c7246316b e8???????? 488bc6 488b8df0040000 4833cc e8???????? 4881c400060000 }
            // n = 7, score = 400
            //   c744244c7246316b     | inc                 esi
            //   e8????????           |                     
            //   488bc6               | push                eax
            //   488b8df0040000       | call                ebx
            //   4833cc               | push                eax
            //   e8????????           |                     
            //   4881c400060000       | push                esi

        $sequence_14 = { 50 ffd3 85c0 7e18 }
            // n = 4, score = 400
            //   50                   | mov                 dword ptr [ecx + 0x28], eax
            //   ffd3                 | mov                 edx, dword ptr [ebp - 8]
            //   85c0                 | cmp                 dword ptr [edx + 0x28], 0
            //   7e18                 | add                 ecx, 4

        $sequence_15 = { 8d85f8feffff 6804010000 50 ff15???????? 8d85f8feffff 50 }
            // n = 6, score = 400
            //   8d85f8feffff         | mov                 eax, dword ptr [ebp - 0x2088]
            //   6804010000           | mov                 esi, dword ptr [ebp - 0x2088]
            //   50                   | imul                esi, dword ptr [ecx + eax*4]
            //   ff15????????         |                     
            //   8d85f8feffff         | add                 edx, esi
            //   50                   | mov                 ecx, dword ptr [ebp - 8]

        $sequence_16 = { 636373 7673 6873742e65 7865 }
            // n = 4, score = 200
            //   636373               | int3                
            //   7673                 | dec                 esp
            //   6873742e65           | lea                 eax, [0x1126c]
            //   7865                 | jbe                 0x6b

        $sequence_17 = { 8b8578dfffff 8bb578dfffff 0faf3481 03d6 }
            // n = 4, score = 200
            //   8b8578dfffff         | cli                 
            //   8bb578dfffff         | cli                 
            //   0faf3481             | cli                 
            //   03d6                 | dec                 ecx

        $sequence_18 = { 6828010000 8d85ccfeffff 6a00 50 }
            // n = 4, score = 200
            //   6828010000           | jbe                 0x6b
            //   8d85ccfeffff         | jb                  0x73
            //   6a00                 | outsb               dx, byte ptr [esi]
            //   50                   | insd                dword ptr es:[edi], dx

        $sequence_19 = { 83c104 8b957cffffff 898c9578feffff 8b857cffffff 8b4c8584 }
            // n = 5, score = 200
            //   83c104               | cli                 
            //   8b957cffffff         | cli                 
            //   898c9578feffff       | cli                 
            //   8b857cffffff         | cli                 
            //   8b4c8584             | cli                 

        $sequence_20 = { 488bcd e8???????? 85c0 751a 488d15f8110100 41b810200100 }
            // n = 6, score = 200
            //   488bcd               | dec                 eax
            //   e8????????           |                     
            //   85c0                 | sub                 esp, 0x20
            //   751a                 | mov                 ebx, ecx
            //   488d15f8110100       | dec                 eax
            //   41b810200100         | lea                 ecx, [0x10c95]

        $sequence_21 = { 488d15730c0100 488bc8 ff15???????? 4885c0 7404 }
            // n = 5, score = 200
            //   488d15730c0100       | inc                 ecx
            //   488bc8               | mov                 ecx, 3
            //   ff15????????         |                     
            //   4885c0               | dec                 eax
            //   7404                 | lea                 ecx, [ebp + eax*2 - 0x44]

        $sequence_22 = { ff15???????? 418d7c24e7 85c0 752a 4c8d0502130100 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   418d7c24e7           | inc                 ecx
            //   85c0                 | lea                 edi, [esp - 0x19]
            //   752a                 | test                eax, eax
            //   4c8d0502130100       | jne                 0x2c

        $sequence_23 = { fa fa fa fa }
            // n = 4, score = 200
            //   fa                   | lea                 ecx, [0x10c95]
            //   fa                   | dec                 eax
            //   fa                   | test                eax, eax
            //   fa                   | je                  0x1e

        $sequence_24 = { 7669 726f 6e 6d 656e 7400 }
            // n = 6, score = 200
            //   7669                 | mov                 ecx, 3
            //   726f                 | dec                 eax
            //   6e                   | lea                 ecx, [ebp + eax*2 - 0x44]
            //   6d                   | dec                 eax
            //   656e                 | mov                 eax, ecx
            //   7400                 | dec                 eax

        $sequence_25 = { 53 53 56 43 }
            // n = 4, score = 200
            //   53                   | lea                 eax, [0x11302]
            //   53                   | mov                 edx, edi
            //   56                   | dec                 ecx
            //   43                   | mov                 ecx, ebp

        $sequence_26 = { 3d01010000 7d0d 8a4c181c 888818384100 40 ebe9 }
            // n = 6, score = 200
            //   3d01010000           | push                ebx
            //   7d0d                 | push                esi
            //   8a4c181c             | inc                 ebx
            //   888818384100         | dec                 ecx
            //   40                   | push                ebx
            //   ebe9                 | push                ebx

        $sequence_27 = { 7370 696465726167656e 742e 657865 }
            // n = 4, score = 200
            //   7370                 | lea                 edx, [0x10c73]
            //   696465726167656e     | dec                 eax
            //   742e                 | mov                 ecx, eax
            //   657865               | dec                 eax

        $sequence_28 = { 488d15f8110100 41b810200100 488bcd e8???????? e9???????? 4533c9 }
            // n = 6, score = 200
            //   488d15f8110100       | test                eax, eax
            //   41b810200100         | jne                 0x2c
            //   488bcd               | dec                 esp
            //   e8????????           |                     
            //   e9????????           |                     
            //   4533c9               | lea                 eax, [0x11302]

        $sequence_29 = { 4c8d0502130100 8bd7 498bcd e8???????? 85c0 7415 }
            // n = 6, score = 200
            //   4c8d0502130100       | dec                 esp
            //   8bd7                 | lea                 eax, [0x112b7]
            //   498bcd               | inc                 ecx
            //   e8????????           |                     
            //   85c0                 | mov                 ecx, 3
            //   7415                 | dec                 eax

        $sequence_30 = { e8???????? 4c8d05b7120100 41b903000000 488d4c45bc 488bc1 492bc5 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   4c8d05b7120100       | dec                 eax
            //   41b903000000         | lea                 edx, [0x111f8]
            //   488d4c45bc           | inc                 ecx
            //   488bc1               | mov                 eax, 0x12010
            //   492bc5               | dec                 eax

        $sequence_31 = { 0fb645fb 99 b903000000 f7f9 83fa01 7510 }
            // n = 6, score = 200
            //   0fb645fb             | outsb               dx, byte ptr gs:[esi]
            //   99                   | je                  0xa
            //   b903000000           | outsb               dx, byte ptr [esi]
            //   f7f9                 | insd                dword ptr es:[edi], dx
            //   83fa01               | outsb               dx, byte ptr gs:[esi]
            //   7510                 | je                  5

        $sequence_32 = { 4883ec20 8bd9 488d0d950c0100 ff15???????? 4885c0 }
            // n = 5, score = 200
            //   4883ec20             | lea                 ecx, [ebp + eax*2 - 0x44]
            //   8bd9                 | dec                 eax
            //   488d0d950c0100       | mov                 eax, ecx
            //   ff15????????         |                     
            //   4885c0               | dec                 ecx

        $sequence_33 = { 0f8563010000 8b5588 89957cffffff 8b8504ffffff 898574feffff 8b4d0c 8b91fc020000 }
            // n = 7, score = 200
            //   0f8563010000         | push                esi
            //   8b5588               | inc                 ebx
            //   89957cffffff         | outsb               dx, byte ptr [esi]
            //   8b8504ffffff         | jbe                 0x6b
            //   898574feffff         | jb                  0x73
            //   8b4d0c               | outsb               dx, byte ptr [esi]
            //   8b91fc020000         | insd                dword ptr es:[edi], dx

        $sequence_34 = { 8945fc 8b4dfc 030d???????? 894dfc 8b55fc 8b450c 8a08 }
            // n = 7, score = 200
            //   8945fc               | jb                  0x71
            //   8b4dfc               | outsb               dx, byte ptr [esi]
            //   030d????????         |                     
            //   894dfc               | insd                dword ptr es:[edi], dx
            //   8b55fc               | outsb               dx, byte ptr gs:[esi]
            //   8b450c               | je                  6
            //   8a08                 | push                ebx

        $sequence_35 = { ff15???????? 4885c0 7419 488d15730c0100 488bc8 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   4885c0               | dec                 ecx
            //   7419                 | mov                 ecx, ebp
            //   488d15730c0100       | test                eax, eax
            //   488bc8               | je                  0x1e

        $sequence_36 = { 8b4df8 e8???????? 68???????? 6a01 }
            // n = 4, score = 200
            //   8b4df8               | push                ebx
            //   e8????????           |                     
            //   68????????           |                     
            //   6a01                 | push                ebx

        $sequence_37 = { 6a00 ff15???????? 8b4df8 894128 8b55f8 837a2800 }
            // n = 6, score = 200
            //   6a00                 | cli                 
            //   ff15????????         |                     
            //   8b4df8               | cli                 
            //   894128               | cli                 
            //   8b55f8               | cli                 
            //   837a2800             | cli                 

        $sequence_38 = { ff15???????? 8d85d4f4ffff 50 ff15???????? 6804010000 8d85f0feffff 6a00 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d85d4f4ffff         | mov                 edx, dword ptr [ebp - 0x78]
            //   50                   | mov                 dword ptr [ebp - 0x84], edx
            //   ff15????????         |                     
            //   6804010000           | mov                 eax, dword ptr [ebp - 0xfc]
            //   8d85f0feffff         | mov                 dword ptr [ebp - 0x18c], eax
            //   6a00                 | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_39 = { 8b4804 0fb74906 83e902 6bc928 034808 56 }
            // n = 6, score = 100
            //   8b4804               | jb                  0x73
            //   0fb74906             | outsb               dx, byte ptr [esi]
            //   83e902               | insd                dword ptr es:[edi], dx
            //   6bc928               | outsb               dx, byte ptr gs:[esi]
            //   034808               | je                  0xa
            //   56                   | arpl                word ptr [ebx + 0x73], sp

        $sequence_40 = { ff15???????? e9???????? 68???????? 8d45dc 50 ff15???????? e9???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   e9????????           |                     
            //   68????????           |                     
            //   8d45dc               | push                4
            //   50                   | xor                 esi, esi
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_41 = { c785b4feffff00000000 ff15???????? 50 56 ff15???????? }
            // n = 5, score = 100
            //   c785b4feffff00000000     | mov    ecx, dword ptr [eax + 4]
            //   ff15????????         |                     
            //   50                   | movzx               ecx, word ptr [ecx + 6]
            //   56                   | sub                 ecx, 2
            //   ff15????????         |                     

        $sequence_42 = { 89c1 e8???????? 894510 8b4510 }
            // n = 4, score = 100
            //   89c1                 | cli                 
            //   e8????????           |                     
            //   894510               | cli                 
            //   8b4510               | cli                 

        $sequence_43 = { 895d08 52 53 41 }
            // n = 4, score = 100
            //   895d08               | jb                  0x71
            //   52                   | outsb               dx, byte ptr [esi]
            //   53                   | insd                dword ptr es:[edi], dx
            //   41                   | outsb               dx, byte ptr gs:[esi]

        $sequence_44 = { 4c 89e9 48 89f2 4c 89b6a8000000 }
            // n = 6, score = 100
            //   4c                   | je                  8
            //   89e9                 | cli                 
            //   48                   | cli                 
            //   89f2                 | cli                 
            //   4c                   | cli                 
            //   89b6a8000000         | cli                 

        $sequence_45 = { c744243c00000000 ff15???????? 6685c0 7441 6a00 56 }
            // n = 6, score = 100
            //   c744243c00000000     | imul                ecx, ecx, 0x28
            //   ff15????????         |                     
            //   6685c0               | add                 ecx, dword ptr [eax + 8]
            //   7441                 | push                esi
            //   6a00                 | pop                 ecx
            //   56                   | pop                 ecx

        $sequence_46 = { 8b803c010000 56 8945f4 8d451c 50 6a04 33f6 }
            // n = 7, score = 100
            //   8b803c010000         | outsb               dx, byte ptr gs:[esi]
            //   56                   | je                  0xa
            //   8945f4               | dec                 ecx
            //   8d451c               | push                ebx
            //   50                   | push                ebx
            //   6a04                 | push                esi
            //   33f6                 | jbe                 0x6b

        $sequence_47 = { 50 e8???????? 83c40c 8d442458 68???????? 50 }
            // n = 6, score = 100
            //   50                   | mov                 dword ptr [ebp - 4], eax
            //   e8????????           |                     
            //   83c40c               | mov                 ecx, dword ptr [ebp - 4]
            //   8d442458             | mov                 dword ptr [ebp - 4], ecx
            //   68????????           |                     
            //   50                   | mov                 edx, dword ptr [ebp - 4]

        $sequence_48 = { 1515151515 1515151011 12????????15 1515151515 1515151515 }
            // n = 5, score = 100
            //   1515151515           | test                eax, eax
            //   1515151011           | je                  0x6c
            //   12????????15         |                     
            //   1515151515           | mov                 ecx, dword ptr [esi + 0x10]
            //   1515151515           | add                 ecx, eax

        $sequence_49 = { 8bf0 85f6 0f8480000000 33c9 85f6 740a }
            // n = 6, score = 100
            //   8bf0                 | jge                 0x14
            //   85f6                 | mov                 cl, byte ptr [eax + ebx + 0x1c]
            //   0f8480000000         | mov                 byte ptr [eax + 0x413818], cl
            //   33c9                 | inc                 eax
            //   85f6                 | jmp                 0xfffffffd
            //   740a                 | jne                 0x169

    condition:
        7 of them and filesize < 417792
}