rule win_microcin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.microcin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.microcin"
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
        $sequence_0 = { ff15???????? 8b3d???????? 8d85e0feffff 50 ffd7 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   8d85e0feffff         | dec                 eax
            //   50                   | xor                 ecx, esp
            //   ffd7                 | dec                 eax

        $sequence_1 = { 56 ff15???????? 85c0 0f45f7 }
            // n = 4, score = 400
            //   56                   | dec                 eax
            //   ff15????????         |                     
            //   85c0                 | lea                 ecx, [ebp + 0x280]
            //   0f45f7               | dec                 eax

        $sequence_2 = { ff15???????? 488bcb ff15???????? 488b8db0010000 4833cc e8???????? 488b9c24d8020000 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   488bcb               | push                0xf
            //   ff15????????         |                     
            //   488b8db0010000       | mov                 edx, dword ptr [ebp - 4]
            //   4833cc               | add                 edx, 1
            //   e8????????           |                     
            //   488b9c24d8020000     | mov                 dword ptr [ebp - 4], edx

        $sequence_3 = { 488b05???????? 4833c4 488985f0040000 4c8b3d???????? 4533c0 }
            // n = 5, score = 400
            //   488b05????????       |                     
            //   4833c4               | sub                 esp, 0x20
            //   488985f0040000       | mov                 ebx, ecx
            //   4c8b3d????????       |                     
            //   4533c0               | dec                 eax

        $sequence_4 = { e8???????? 83c40c 8d85f8feffff 6804010000 50 ff15???????? 8d85f8feffff }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83c40c               | mov                 ecx, 3
            //   8d85f8feffff         | dec                 esp
            //   6804010000           | lea                 eax, [0x11374]
            //   50                   | dec                 eax
            //   ff15????????         |                     
            //   8d85f8feffff         | mov                 ecx, ebp

        $sequence_5 = { 85c0 7e18 80bc35a8feffff3a 741f 8d85a8feffff 46 50 }
            // n = 7, score = 400
            //   85c0                 | inc                 ecx
            //   7e18                 | mov                 edx, esp
            //   80bc35a8feffff3a     | xor                 ecx, ecx
            //   741f                 | dec                 eax
            //   8d85a8feffff         | arpl                ax, cx
            //   46                   | mov                 byte ptr [ebp + ecx + 0x280], 0x45
            //   50                   | dec                 eax

        $sequence_6 = { c7461401000000 4d8d8680000000 418900 4989b688000000 41c7868400000004000000 }
            // n = 5, score = 400
            //   c7461401000000       | test                eax, eax
            //   4d8d8680000000       | jne                 0x1e
            //   418900               | dec                 eax
            //   4989b688000000       | lea                 edx, [0x111f8]
            //   41c7868400000004000000     | inc    ecx

        $sequence_7 = { 50 6805100000 68ffff0000 56 8b35???????? ffd6 6a04 }
            // n = 7, score = 400
            //   50                   | dec                 eax
            //   6805100000           | lea                 ecx, [esp + 0x60]
            //   68ffff0000           | dec                 eax
            //   56                   | arpl                ax, cx
            //   8b35????????         |                     
            //   ffd6                 | mov                 dword ptr [esp + 0x4c], 0x6b314672
            //   6a04                 | dec                 eax

        $sequence_8 = { 4863c8 c6840d8002000033 488d8d80020000 ff15???????? 4863c8 c6840d8002000079 }
            // n = 6, score = 400
            //   4863c8               | lea                 ecx, [0x10c95]
            //   c6840d8002000033     | dec                 eax
            //   488d8d80020000       | test                eax, eax
            //   ff15????????         |                     
            //   4863c8               | inc                 eax
            //   c6840d8002000079     | push                ebx

        $sequence_9 = { 33f6 50 ffd3 85c0 7e18 80bc35a8feffff3a }
            // n = 6, score = 400
            //   33f6                 | mov                 eax, esi
            //   50                   | dec                 eax
            //   ffd3                 | mov                 ecx, dword ptr [ebp + 0x4f0]
            //   85c0                 | dec                 eax
            //   7e18                 | xor                 ecx, esp
            //   80bc35a8feffff3a     | dec                 eax

        $sequence_10 = { ff15???????? 8b1d???????? 8d85a8feffff 50 ffd3 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   8d85a8feffff         | mov                 byte ptr [ebp + ecx + 0x280], 0x77
            //   50                   | dec                 eax
            //   ffd3                 | lea                 ecx, [ebp + 0x280]

        $sequence_11 = { 807c0c5f5c 7413 488d4c2460 ff15???????? 4863c8 }
            // n = 5, score = 400
            //   807c0c5f5c           | sub                 edx, 1
            //   7413                 | cmp                 dword ptr [ebp - 0x2084], edx
            //   488d4c2460           | jge                 0xc9
            //   ff15????????         |                     
            //   4863c8               | mov                 eax, dword ptr [ebp - 0x2088]

        $sequence_12 = { e8???????? ff75d4 e8???????? 83c40c 8bc7 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   ff75d4               | dec                 eax
            //   e8????????           |                     
            //   83c40c               | lea                 ecx, [ebp + 0x280]
            //   8bc7                 | dec                 eax

        $sequence_13 = { 4863c8 c6840d8002000045 488d8d80020000 ff15???????? 4863c8 c6840d8002000034 }
            // n = 6, score = 400
            //   4863c8               | mov                 dword ptr [eax + 4], edx
            //   c6840d8002000045     | add                 edx, dword ptr [ebp + 0x10]
            //   488d8d80020000       | mov                 eax, dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   4863c8               | imul                eax, eax, 0x68
            //   c6840d8002000034     | add                 eax, dword ptr [ebp + 8]

        $sequence_14 = { 85ff 410f44fd 4863df 488bcb }
            // n = 4, score = 400
            //   85ff                 | dec                 eax
            //   410f44fd             | cmp                 eax, 0x3c
            //   4863df               | jbe                 0x49
            //   488bcb               | dec                 ecx

        $sequence_15 = { c744244c7246316b e8???????? 488bc6 488b8df0040000 4833cc e8???????? }
            // n = 6, score = 400
            //   c744244c7246316b     | imul                edx, edx, 0x68
            //   e8????????           |                     
            //   488bc6               | lea                 eax, [ebp + edx - 0x2080]
            //   488b8df0040000       | mov                 ecx, dword ptr [ebp - 0x2088]
            //   4833cc               | imul                ecx, ecx, 0x68
            //   e8????????           |                     

        $sequence_16 = { 6bd268 8d841580dfffff 8b8d78dfffff 6bc968 }
            // n = 4, score = 200
            //   6bd268               | dec                 eax
            //   8d841580dfffff       | lea                 eax, [esi + 1]
            //   8b8d78dfffff         | cmp                 byte ptr [esi], 0x90
            //   6bc968               | mov                 eax, dword ptr [ecx + 0x28]

        $sequence_17 = { 49 53 53 56 43 }
            // n = 5, score = 200
            //   49                   | lea                 eax, [0x1126c]
            //   53                   | dec                 ecx
            //   53                   | mov                 edx, esp
            //   56                   | dec                 eax
            //   43                   | mov                 ecx, ebp

        $sequence_18 = { 8b75f8 8b148a 0faf14b0 8b4514 895004 }
            // n = 5, score = 200
            //   8b75f8               | cli                 
            //   8b148a               | cli                 
            //   0faf14b0             | cli                 
            //   8b4514               | cli                 
            //   895004               | cli                 

        $sequence_19 = { 7370 696465726167656e 742e 657865 }
            // n = 4, score = 200
            //   7370                 | sub                 eax, ebp
            //   696465726167656e     | dec                 eax
            //   742e                 | sar                 eax, 1
            //   657865               | dec                 eax

        $sequence_20 = { 6828010000 8d85ccfeffff 6a00 50 }
            // n = 4, score = 200
            //   6828010000           | insd                dword ptr es:[edi], dx
            //   8d85ccfeffff         | outsb               dx, byte ptr gs:[esi]
            //   6a00                 | je                  5
            //   50                   | cli                 

        $sequence_21 = { 035510 8b45fc 6bc068 034508 8b4dfc 8b148a 8b4df8 }
            // n = 7, score = 200
            //   035510               | mov                 ecx, dword ptr [ebp]
            //   8b45fc               | dec                 eax
            //   6bc068               | mov                 esi, dword ptr [ebp + 8]
            //   034508               | dec                 eax
            //   8b4dfc               | mov                 edx, esi
            //   8b148a               | inc                 esp
            //   8b4df8               | movzx               eax, byte ptr [ecx]

        $sequence_22 = { fa fa fa fa fa fa }
            // n = 6, score = 200
            //   fa                   | jbe                 0x49
            //   fa                   | dec                 ecx
            //   fa                   | mov                 ecx, ebp
            //   fa                   | dec                 esp
            //   fa                   | lea                 eax, [0x112b7]
            //   fa                   | dec                 eax

        $sequence_23 = { 89857cffffff 83bd7cffffff20 7d21 b920000000 2b8d7cffffff 8b957cffffff }
            // n = 6, score = 200
            //   89857cffffff         | cli                 
            //   83bd7cffffff20       | cli                 
            //   7d21                 | cli                 
            //   b920000000           | cli                 
            //   2b8d7cffffff         | cli                 
            //   8b957cffffff         | push                ebx

        $sequence_24 = { 636373 7673 6873742e65 7865 }
            // n = 4, score = 200
            //   636373               | lea                 eax, [0x11235]
            //   7673                 | xor                 eax, eax
            //   6873742e65           | dec                 ecx
            //   7865                 | mov                 edx, eax

        $sequence_25 = { e8???????? 85c0 751a 488d15f8110100 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   751a                 | jne                 0x1c
            //   488d15f8110100       | dec                 eax

        $sequence_26 = { 8b45f4 895024 8b4df4 83c108 51 }
            // n = 5, score = 200
            //   8b45f4               | push                ebx
            //   895024               | push                esi
            //   8b4df4               | inc                 ebx
            //   83c108               | cli                 
            //   51                   | cli                 

        $sequence_27 = { 418d7c24e7 85c0 752a 4c8d0502130100 8bd7 }
            // n = 5, score = 200
            //   418d7c24e7           | dec                 eax
            //   85c0                 | mov                 ecx, ebp
            //   752a                 | test                eax, eax
            //   4c8d0502130100       | jne                 0x4b
            //   8bd7                 | inc                 eax

        $sequence_28 = { 4c8d0535120100 33c0 498bd0 3b0a 740e ffc0 4883c210 }
            // n = 7, score = 200
            //   4c8d0535120100       | dec                 eax
            //   33c0                 | mov                 ecx, ebp
            //   498bd0               | xor                 edx, edx
            //   3b0a                 | xor                 ecx, ecx
            //   740e                 | dec                 eax
            //   ffc0                 | mov                 dword ptr [esp + 0x20], esi
            //   4883c210             | int3                

        $sequence_29 = { 4053 4883ec20 8bd9 488d0d950c0100 }
            // n = 4, score = 200
            //   4053                 | dec                 esp
            //   4883ec20             | lea                 eax, [0x1126c]
            //   8bd9                 | dec                 ecx
            //   488d0d950c0100       | mov                 edx, esp

        $sequence_30 = { 488d15f8110100 41b810200100 488bcd e8???????? }
            // n = 4, score = 200
            //   488d15f8110100       | lea                 ecx, [0x10c95]
            //   41b810200100         | inc                 ecx
            //   488bcd               | lea                 edi, [esp - 0x19]
            //   e8????????           |                     

        $sequence_31 = { 4889742420 e8???????? cc 4c8d056c120100 498bd4 488bcd e8???????? }
            // n = 7, score = 200
            //   4889742420           | lea                 edx, [0x111f8]
            //   e8????????           |                     
            //   cc                   | dec                 eax
            //   4c8d056c120100       | mov                 dword ptr [esp + 0x20], esi
            //   498bd4               | int3                
            //   488bcd               | dec                 esp
            //   e8????????           |                     

        $sequence_32 = { 6a0f ff15???????? 8b55fc 83c201 8955fc 817dfce8030000 }
            // n = 6, score = 200
            //   6a0f                 | inc                 ecx
            //   ff15????????         |                     
            //   8b55fc               | mov                 dword ptr [eax + 0xa0], eax
            //   83c201               | inc                 esp
            //   8955fc               | movzx               esi, word ptr [ecx + 0x14]
            //   817dfce8030000       | dec                 esi

        $sequence_33 = { 4883f83c 7647 498bcd e8???????? 4c8d05b7120100 }
            // n = 5, score = 200
            //   4883f83c             | test                eax, eax
            //   7647                 | jne                 0x1e
            //   498bcd               | dec                 eax
            //   e8????????           |                     
            //   4c8d05b7120100       | lea                 edx, [0x111f8]

        $sequence_34 = { 6e 7669 726f 6e 6d 656e 7400 }
            // n = 7, score = 200
            //   6e                   | cmp                 ecx, dword ptr [edx]
            //   7669                 | je                  0x17
            //   726f                 | inc                 eax
            //   6e                   | dec                 eax
            //   6d                   | add                 edx, 0x10
            //   656e                 | int3                
            //   7400                 | dec                 esp

        $sequence_35 = { f7f1 8955f8 c745f400000000 eb09 8b55f4 }
            // n = 5, score = 200
            //   f7f1                 | je                  5
            //   8955f8               | cli                 
            //   c745f400000000       | cli                 
            //   eb09                 | cli                 
            //   8b55f4               | cli                 

        $sequence_36 = { 83ea01 39957cdfffff 0f8dbd000000 8b8578dfffff }
            // n = 4, score = 200
            //   83ea01               | jmp                 4
            //   39957cdfffff         | xor                 edi, edi
            //   0f8dbd000000         | dec                 eax
            //   8b8578dfffff         | mov                 edx, ebx

        $sequence_37 = { 4c8d05b7120100 41b903000000 488d4c45bc 488bc1 492bc5 48d1f8 482bf8 }
            // n = 7, score = 200
            //   4c8d05b7120100       | dec                 ecx
            //   41b903000000         | mov                 ecx, ebp
            //   488d4c45bc           | dec                 esp
            //   488bc1               | lea                 eax, [0x112b7]
            //   492bc5               | dec                 eax
            //   48d1f8               | mov                 ecx, ebp
            //   482bf8               | test                eax, eax

        $sequence_38 = { 8b04c5c09b4000 5d c3 33c0 5d }
            // n = 5, score = 100
            //   8b04c5c09b4000       | insd                dword ptr es:[edi], dx
            //   5d                   | outsb               dx, byte ptr gs:[esi]
            //   c3                   | je                  8
            //   33c0                 | push                ebx
            //   5d                   | push                ebx

        $sequence_39 = { 56 c785b4feffff00000000 ff15???????? 50 56 ff15???????? }
            // n = 6, score = 100
            //   56                   | cli                 
            //   c785b4feffff00000000     | cli    
            //   ff15????????         |                     
            //   50                   | cli                 
            //   56                   | cli                 
            //   ff15????????         |                     

        $sequence_40 = { 85f6 0f8480000000 33c9 85f6 740a 80740ddc6e }
            // n = 6, score = 100
            //   85f6                 | push                dword ptr [ebp - 0x1c]
            //   0f8480000000         | call                dword ptr [ebp - 0x24]
            //   33c9                 | cmp                 eax, 0xea
            //   85f6                 | jne                 0xca
            //   740a                 | popal               
            //   80740ddc6e           | jb                  0x68

        $sequence_41 = { 8b4d00 48 8b7508 48 89f2 44 0fb601 }
            // n = 7, score = 100
            //   8b4d00               | jb                  0x71
            //   48                   | outsb               dx, byte ptr [esi]
            //   8b7508               | insd                dword ptr es:[edi], dx
            //   48                   | outsb               dx, byte ptr gs:[esi]
            //   89f2                 | je                  8
            //   44                   | dec                 ecx
            //   0fb601               | push                ebx

        $sequence_42 = { eb02 33ff 48 89da 48 8d4601 803e90 }
            // n = 7, score = 100
            //   eb02                 | push                ebx
            //   33ff                 | push                esi
            //   48                   | jae                 0x72
            //   89da                 | imul                esp, dword ptr [ebp + 0x72], 0x6e656761
            //   48                   | je                  0x30
            //   8d4601               | js                  0x6a
            //   803e90               | jb                  0x71

        $sequence_43 = { 68???????? 50 ff15???????? 83c428 8d85e8f4ffff 50 ff15???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | jae                 0x72
            //   ff15????????         |                     
            //   83c428               | imul                esp, dword ptr [ebp + 0x72], 0x6e656761
            //   8d85e8f4ffff         | je                  0x30
            //   50                   | js                  0x6a
            //   ff15????????         |                     

        $sequence_44 = { 50 e8???????? 83c40c 8d85c8feffff 68???????? 50 }
            // n = 6, score = 100
            //   50                   | outsb               dx, byte ptr gs:[esi]
            //   e8????????           |                     
            //   83c40c               | je                  0xa
            //   8d85c8feffff         | cli                 
            //   68????????           |                     
            //   50                   | cli                 

        $sequence_45 = { 50 57 ff15???????? 85c0 74d5 39b5b0feffff }
            // n = 6, score = 100
            //   50                   | push                0x128
            //   57                   | lea                 eax, [ebp - 0x134]
            //   ff15????????         |                     
            //   85c0                 | push                0
            //   74d5                 | push                eax
            //   39b5b0feffff         | push                dword ptr [ebp - 0xc]

        $sequence_46 = { ff75f4 ff75e4 ff55dc 3dea000000 0f85bc000000 }
            // n = 5, score = 100
            //   ff75f4               | cli                 
            //   ff75e4               | cli                 
            //   ff55dc               | cli                 
            //   3dea000000           | cli                 
            //   0f85bc000000         | arpl                word ptr [ebx + 0x73], sp

        $sequence_47 = { 8b4128 41 8980a0000000 44 0fb77114 4e 8d4c3198 }
            // n = 7, score = 100
            //   8b4128               | outsb               dx, byte ptr [esi]
            //   41                   | insd                dword ptr es:[edi], dx
            //   8980a0000000         | outsb               dx, byte ptr gs:[esi]
            //   44                   | je                  5
            //   0fb77114             | cli                 
            //   4e                   | cli                 
            //   8d4c3198             | cli                 

        $sequence_48 = { 61 7265 008f45c8e81f 0000 }
            // n = 4, score = 100
            //   61                   | jbe                 0x78
            //   7265                 | push                0x652e7473
            //   008f45c8e81f         | js                  0x6c
            //   0000                 | outsb               dx, byte ptr [esi]

        $sequence_49 = { 50 0fb785daf4ffff 50 0fb785d6f4ffff 50 0fb785d4f4ffff 50 }
            // n = 7, score = 100
            //   50                   | push                esi
            //   0fb785daf4ffff       | inc                 ebx
            //   50                   | outsb               dx, byte ptr [esi]
            //   0fb785d6f4ffff       | jbe                 0x6b
            //   50                   | jb                  0x73
            //   0fb785d4f4ffff       | outsb               dx, byte ptr [esi]
            //   50                   | insd                dword ptr es:[edi], dx

    condition:
        7 of them and filesize < 417792
}