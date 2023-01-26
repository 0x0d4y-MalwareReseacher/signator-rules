rule win_bazarbackdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.bazarbackdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bazarbackdoor"
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
        $sequence_0 = { 488bce 4889442420 ff15???????? 85c0 780a 4898 }
            // n = 6, score = 1600
            //   488bce               | push                eax
            //   4889442420           | push                eax
            //   ff15????????         |                     
            //   85c0                 | movzx               eax, word ptr [ebp - 0x16]
            //   780a                 | push                eax
            //   4898                 | movzx               eax, word ptr [ebp - 0x18]

        $sequence_1 = { e8???????? 4885c0 740a ba02000000 488bce }
            // n = 5, score = 1400
            //   e8????????           |                     
            //   4885c0               | mov                 eax, ecx
            //   740a                 | dec                 eax
            //   ba02000000           | lea                 edx, [ebp + eax + 0x79f]
            //   488bce               | dec                 eax

        $sequence_2 = { 488b4130 4885c0 7442 48635004 85d2 }
            // n = 5, score = 1400
            //   488b4130             | mov                 eax, 0x100f
            //   4885c0               | dec                 eax
            //   7442                 | mov                 ecx, esi
            //   48635004             | dec                 eax
            //   85d2                 | mov                 dword ptr [esp + 0x20], eax

        $sequence_3 = { 4533c0 c744242002000000 ba00000040 ffd0 }
            // n = 4, score = 1200
            //   4533c0               | test                eax, eax
            //   c744242002000000     | js                  0x13
            //   ba00000040           | dec                 eax
            //   ffd0                 | cwde                

        $sequence_4 = { 0fb74f02 0fb7d8 ff15???????? 0fb74f08 }
            // n = 4, score = 1200
            //   0fb74f02             | movzx               ecx, word ptr [edi + 2]
            //   0fb7d8               | movzx               ebx, ax
            //   ff15????????         |                     
            //   0fb74f08             | movzx               ecx, word ptr [edi + 8]

        $sequence_5 = { 0fb70f ff15???????? 0fb74f02 0fb7d8 }
            // n = 4, score = 1200
            //   0fb70f               | movzx               ecx, word ptr [edi]
            //   ff15????????         |                     
            //   0fb74f02             | movzx               ecx, word ptr [edi + 2]
            //   0fb7d8               | movzx               ebx, ax

        $sequence_6 = { 488d4d80 e8???????? 498bd6 488d4d80 e8???????? }
            // n = 5, score = 1100
            //   488d4d80             | dec                 eax
            //   e8????????           |                     
            //   498bd6               | mov                 ecx, esi
            //   488d4d80             | dec                 eax
            //   e8????????           |                     

        $sequence_7 = { ff15???????? 0fb74f08 440fb7e8 ff15???????? }
            // n = 4, score = 1100
            //   ff15????????         |                     
            //   0fb74f08             | movzx               ebp, ax
            //   440fb7e8             | movzx               ecx, word ptr [edi + 8]
            //   ff15????????         |                     

        $sequence_8 = { 7507 33c0 e9???????? b8ff000000 }
            // n = 4, score = 1000
            //   7507                 | mov                 ebx, eax
            //   33c0                 | inc                 ecx
            //   e9????????           |                     
            //   b8ff000000           | lea                 edx, [ebp + 8]

        $sequence_9 = { c3 0fb74c0818 b80b010000 663bc8 }
            // n = 4, score = 1000
            //   c3                   | dec                 eax
            //   0fb74c0818           | sub                 ecx, 0xc0
            //   b80b010000           | dec                 eax
            //   663bc8               | shl                 ecx, 8

        $sequence_10 = { 4885c9 7406 488b11 ff5210 ff15???????? }
            // n = 5, score = 1000
            //   4885c9               | movzx               ecx, word ptr [edi + 8]
            //   7406                 | inc                 esp
            //   488b11               | movzx               ebp, ax
            //   ff5210               | movzx               ecx, word ptr [edi + 2]
            //   ff15????????         |                     

        $sequence_11 = { e8???????? cc 4053 4883ec20 b902000000 }
            // n = 5, score = 900
            //   e8????????           |                     
            //   cc                   | dec                 eax
            //   4053                 | mov                 ecx, esi
            //   4883ec20             | dec                 eax
            //   b902000000           | mov                 dword ptr [esp + 0x20], eax

        $sequence_12 = { 4533c9 4889442428 488d95a0070000 488d442470 }
            // n = 4, score = 800
            //   4533c9               | jb                  0x20
            //   4889442428           | movzx               ecx, al
            //   488d95a0070000       | movzx               eax, byte ptr [edx + 1]
            //   488d442470           | sub                 al, dl

        $sequence_13 = { 488d9590050000 488bce ff15???????? 85c0 }
            // n = 4, score = 800
            //   488d9590050000       | mov                 dword ptr [esp + 0x20], eax
            //   488bce               | test                eax, eax
            //   ff15????????         |                     
            //   85c0                 | inc                 ecx

        $sequence_14 = { 4c89742440 4c89742438 4489742430 4c89742428 }
            // n = 4, score = 800
            //   4c89742440           | je                  8
            //   4c89742438           | dec                 eax
            //   4489742430           | mov                 edx, dword ptr [ecx]
            //   4c89742428           | call                dword ptr [edx + 0x10]

        $sequence_15 = { ff15???????? ff15???????? 4d8bc5 33d2 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   ff15????????         |                     
            //   4d8bc5               | jne                 0x1b
            //   33d2                 | cmp                 ecx, -1

        $sequence_16 = { 4889f1 e8???????? 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   4889f1               | mov                 dword ptr [esp + 0x20], eax
            //   e8????????           |                     
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_17 = { 4881e9c0000000 48c1e108 4803c8 8bc1 488d94059f070000 }
            // n = 5, score = 800
            //   4881e9c0000000       | push                esi
            //   48c1e108             | push                8
            //   4803c8               | dec                 eax
            //   8bc1                 | mov                 ecx, esi
            //   488d94059f070000     | dec                 eax

        $sequence_18 = { 33d2 488bc8 ff15???????? ff15???????? 4c8bc3 33d2 }
            // n = 6, score = 800
            //   33d2                 | test                eax, eax
            //   488bc8               | je                  0xc
            //   ff15????????         |                     
            //   ff15????????         |                     
            //   4c8bc3               | mov                 edx, 2
            //   33d2                 | dec                 eax

        $sequence_19 = { ffd0 90 4883c430 5b }
            // n = 4, score = 800
            //   ffd0                 | test                eax, eax
            //   90                   | dec                 eax
            //   4883c430             | mov                 dword ptr [esp + 0x20], eax
            //   5b                   | test                eax, eax

        $sequence_20 = { 418d5508 488bc8 ff15???????? 488bd8 }
            // n = 4, score = 800
            //   418d5508             | movzx               ebp, ax
            //   488bc8               | dec                 eax
            //   ff15????????         |                     
            //   488bd8               | test                ecx, ecx

        $sequence_21 = { e8???????? 4889c7 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4889c7               | dec                 eax
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_22 = { ff15???????? 4889c1 31d2 4d89e0 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   4889c1               | js                  0xc
            //   31d2                 | dec                 eax
            //   4d89e0               | cwde                

        $sequence_23 = { 31ff 4889c1 31d2 4989f0 }
            // n = 4, score = 800
            //   31ff                 | inc                 ecx
            //   4889c1               | mov                 eax, 0x100f
            //   31d2                 | dec                 eax
            //   4989f0               | mov                 ecx, esi

        $sequence_24 = { e8???????? 4c89e1 e8???????? 8b05???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4c89e1               | test                eax, eax
            //   e8????????           |                     
            //   8b05????????         |                     

        $sequence_25 = { 488d95a0070000 488d442470 41b80f100000 488bce 4889442420 }
            // n = 5, score = 800
            //   488d95a0070000       | dec                 al
            //   488d442470           | mov                 byte ptr [edx + ebx], al
            //   41b80f100000         | mov                 edx, ecx
            //   488bce               | mov                 al, cl
            //   4889442420           | sub                 al, dl

        $sequence_26 = { 7528 0fb64b04 0fb6d1 80f973 }
            // n = 4, score = 700
            //   7528                 | mov                 dword ptr [esp + 0x20], eax
            //   0fb64b04             | test                eax, eax
            //   0fb6d1               | js                  0x16
            //   80f973               | inc                 ecx

        $sequence_27 = { ff15???????? 31db 4889c1 31d2 }
            // n = 4, score = 700
            //   ff15????????         |                     
            //   31db                 | dec                 eax
            //   4889c1               | lea                 eax, [esp + 0x50]
            //   31d2                 | inc                 ebp

        $sequence_28 = { 83ff09 0f9fc1 83ff0a 0f9cc3 }
            // n = 4, score = 700
            //   83ff09               | mov                 dword ptr [esp + 0x20], eax
            //   0f9fc1               | test                eax, eax
            //   83ff0a               | js                  0x16
            //   0f9cc3               | dec                 eax

        $sequence_29 = { 0fb6d1 80f973 7504 0fb65305 33c0 80f973 0f94c0 }
            // n = 7, score = 700
            //   0fb6d1               | cmp                 eax, ecx
            //   80f973               | cmovg               eax, ecx
            //   7504                 | cdq                 
            //   0fb65305             | sub                 eax, edx
            //   33c0                 | inc                 ecx
            //   80f973               | mov                 eax, 0x100f
            //   0f94c0               | dec                 eax

        $sequence_30 = { c744242880000000 c744242003000000 4889f9 ba00000080 41b801000000 }
            // n = 5, score = 700
            //   c744242880000000     | test                eax, eax
            //   c744242003000000     | js                  0x13
            //   4889f9               | dec                 eax
            //   ba00000080           | cwde                
            //   41b801000000         | inc                 ecx

        $sequence_31 = { 0f94c3 83f909 0f9fc0 83f90a 0f9cc1 30d9 }
            // n = 6, score = 700
            //   0f94c3               | mov                 edi, eax
            //   83f909               | mov                 dword ptr [esp + 0x20], 2
            //   0f9fc0               | mov                 edx, 0x40000000
            //   83f90a               | call                eax
            //   0f9cc1               | dec                 eax
            //   30d9                 | mov                 edi, eax

        $sequence_32 = { 488bd3 e8???????? ff15???????? 4c8bc3 33d2 488bc8 }
            // n = 6, score = 700
            //   488bd3               | mov                 dword ptr [esp + 0x20], eax
            //   e8????????           |                     
            //   ff15????????         |                     
            //   4c8bc3               | inc                 ebp
            //   33d2                 | xor                 ecx, ecx
            //   488bc8               | dec                 eax

        $sequence_33 = { 8b05???????? 8d59ff 0fafd9 89da 83f2fe }
            // n = 5, score = 700
            //   8b05????????         |                     
            //   8d59ff               | mov                 ecx, esi
            //   0fafd9               | dec                 eax
            //   89da                 | mov                 dword ptr [esp + 0x20], eax
            //   83f2fe               | test                eax, eax

        $sequence_34 = { 0f94c0 833d????????0a 0f9cc2 89d1 20c1 30c2 08ca }
            // n = 7, score = 700
            //   0f94c0               | dec                 eax
            //   833d????????0a       |                     
            //   0f9cc2               | lea                 ecx, [ebp - 0x80]
            //   89d1                 | dec                 ecx
            //   20c1                 | mov                 edx, esi
            //   30c2                 | dec                 eax
            //   08ca                 | lea                 ecx, [ebp - 0x80]

        $sequence_35 = { 8d51ff 0fafd1 89d1 83f1fe 85d1 0f95c2 833d????????09 }
            // n = 7, score = 700
            //   8d51ff               | mov                 dword ptr [esp + 0x40], ecx
            //   0fafd1               | inc                 ecx
            //   89d1                 | mov                 eax, 0x100f
            //   83f1fe               | dec                 eax
            //   85d1                 | mov                 ecx, esi
            //   0f95c2               | dec                 eax
            //   833d????????09       |                     

        $sequence_36 = { 4889c1 31d2 4989f8 41ffd6 }
            // n = 4, score = 700
            //   4889c1               | xor                 ecx, ecx
            //   31d2                 | dec                 eax
            //   4989f8               | mov                 dword ptr [esp + 0x48], eax
            //   41ffd6               | dec                 eax

        $sequence_37 = { 31d2 4989f8 ff15???????? 4885c0 }
            // n = 4, score = 700
            //   31d2                 | dec                 eax
            //   4989f8               | mov                 dword ptr [esp + 0x20], eax
            //   ff15????????         |                     
            //   4885c0               | test                eax, eax

        $sequence_38 = { e8???????? 4889f9 4889f2 ffd0 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   4889f9               | mov                 ecx, esi
            //   4889f2               | dec                 eax
            //   ffd0                 | mov                 dword ptr [esp + 0x20], eax

        $sequence_39 = { 08ca 80f201 7502 ebfe }
            // n = 4, score = 700
            //   08ca                 | dec                 ecx
            //   80f201               | mov                 edx, esi
            //   7502                 | dec                 eax
            //   ebfe                 | lea                 ecx, [ebp - 0x80]

        $sequence_40 = { 31ed 4889c1 31d2 4989d8 }
            // n = 4, score = 700
            //   31ed                 | mov                 ecx, esi
            //   4889c1               | dec                 eax
            //   31d2                 | mov                 dword ptr [esp + 0x20], eax
            //   4989d8               | test                eax, eax

        $sequence_41 = { 0f9cc1 84c1 7516 30c1 7512 }
            // n = 5, score = 700
            //   0f9cc1               | mov                 dword ptr [esp + 0x28], 0x80
            //   84c1                 | inc                 ebp
            //   7516                 | xor                 ecx, ecx
            //   30c1                 | inc                 ebp
            //   7512                 | xor                 eax, eax

        $sequence_42 = { 08c1 80f101 7502 ebfe }
            // n = 4, score = 700
            //   08c1                 | mov                 edx, 0x40000000
            //   80f101               | call                eax
            //   7502                 | dec                 eax
            //   ebfe                 | lea                 ecx, [ebp - 0x80]

        $sequence_43 = { 4533c9 4533c0 c744242002000000 ba1f000f00 }
            // n = 4, score = 700
            //   4533c9               | setl                bl
            //   4533c0               | lea                 ebx, [ecx - 1]
            //   c744242002000000     | imul                ebx, ecx
            //   ba1f000f00           | mov                 edx, ebx

        $sequence_44 = { 7405 80fa2e 750f 0fb6c1 }
            // n = 4, score = 600
            //   7405                 | dec                 eax
            //   80fa2e               | sub                 ecx, 0xc0
            //   750f                 | dec                 eax
            //   0fb6c1               | shl                 ecx, 8

        $sequence_45 = { 89f0 4883c450 5b 5f }
            // n = 4, score = 600
            //   89f0                 | dec                 eax
            //   4883c450             | mov                 dword ptr [esp + 0x20], eax
            //   5b                   | test                eax, eax
            //   5f                   | js                  0x13

        $sequence_46 = { 4c8bf0 4889442458 488d4801 e8???????? }
            // n = 4, score = 500
            //   4c8bf0               | inc                 ecx
            //   4889442458           | mov                 eax, 0x100f
            //   488d4801             | dec                 eax
            //   e8????????           |                     

        $sequence_47 = { 50 0fb745e8 50 68???????? e8???????? }
            // n = 5, score = 400
            //   50                   | dec                 eax
            //   0fb745e8             | mov                 ecx, eax
            //   50                   | dec                 eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_48 = { 57 8d4101 6a0d 8bf0 5f }
            // n = 5, score = 400
            //   57                   | push                eax
            //   8d4101               | movzx               eax, word ptr [ebp - 0x18]
            //   6a0d                 | push                eax
            //   8bf0                 | movzx               eax, word ptr [ebp - 0x16]
            //   5f                   | push                eax

        $sequence_49 = { 6a00 ff36 ff15???????? 51 51 }
            // n = 5, score = 400
            //   6a00                 | dec                 eax
            //   ff36                 | lea                 eax, [ebp - 0x80]
            //   ff15????????         |                     
            //   51                   | inc                 ecx
            //   51                   | mov                 eax, 0x100f

        $sequence_50 = { 6685ff 0f849c000000 837c2460ff 0f858c000000 }
            // n = 4, score = 400
            //   6685ff               | inc                 esp
            //   0f849c000000         | mov                 eax, dword ptr [edi + 0x50]
            //   837c2460ff           | inc                 ecx
            //   0f858c000000         | mov                 eax, 0x100f

        $sequence_51 = { 740c 8b5508 8b0e e8???????? eb02 }
            // n = 5, score = 400
            //   740c                 | movzx               eax, word ptr [ebp - 0x18]
            //   8b5508               | push                eax
            //   8b0e                 | push                eax
            //   e8????????           |                     
            //   eb02                 | movzx               eax, word ptr [ebp - 0x16]

        $sequence_52 = { 66890d???????? 0fb7ca ff15???????? b901000000 66c746020100 668906 ff15???????? }
            // n = 7, score = 400
            //   66890d????????       |                     
            //   0fb7ca               | dec                 eax
            //   ff15????????         |                     
            //   b901000000           | cwde                
            //   66c746020100         | call                eax
            //   668906               | mov                 eax, 5
            //   ff15????????         |                     

        $sequence_53 = { 81fb80000000 760c 80e1f2 80c902 }
            // n = 4, score = 400
            //   81fb80000000         | dec                 eax
            //   760c                 | cwde                
            //   80e1f2               | test                eax, eax
            //   80c902               | js                  0xc

        $sequence_54 = { 57 8bf2 8bf9 33d2 33c9 6a7e }
            // n = 6, score = 400
            //   57                   | jne                 9
            //   8bf2                 | xor                 eax, eax
            //   8bf9                 | mov                 eax, 0xff
            //   33d2                 | push                eax
            //   33c9                 | movzx               eax, word ptr [ebp - 0x18]
            //   6a7e                 | push                eax

        $sequence_55 = { eb02 8bc3 a3???????? 85c0 7507 6a13 e9???????? }
            // n = 7, score = 400
            //   eb02                 | movzx               eax, word ptr [ebp - 0x18]
            //   8bc3                 | push                eax
            //   a3????????           |                     
            //   85c0                 | and                 dword ptr [esi + 8], 0
            //   7507                 | mov                 ecx, dword ptr [esi + 4]
            //   6a13                 | lea                 edi, [eax + 1]
            //   e9????????           |                     

        $sequence_56 = { e8???????? 83660800 8b4e04 8d7801 3bf9 763c 833e00 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83660800             | inc                 ebp
            //   8b4e04               | xor                 ecx, ecx
            //   8d7801               | dec                 eax
            //   3bf9                 | mov                 dword ptr [esp + 0x28], eax
            //   763c                 | dec                 eax
            //   833e00               | lea                 edx, [ebp + 0x3b0]

        $sequence_57 = { ffd3 50 ffd6 33c0 5f 5e 5b }
            // n = 7, score = 300
            //   ffd3                 | call                ebx
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_58 = { 750b 8ac1 2ac2 fec8 88041a 8bd1 41 }
            // n = 7, score = 300
            //   750b                 | jne                 0xd
            //   8ac1                 | mov                 al, cl
            //   2ac2                 | sub                 al, dl
            //   fec8                 | dec                 al
            //   88041a               | mov                 byte ptr [edx + ebx], al
            //   8bd1                 | mov                 edx, ecx
            //   41                   | inc                 ecx

        $sequence_59 = { 660f73d801 660febd0 660f7ed0 84c0 }
            // n = 4, score = 300
            //   660f73d801           | psrldq              xmm0, 1
            //   660febd0             | por                 xmm2, xmm0
            //   660f7ed0             | movd                eax, xmm2
            //   84c0                 | test                al, al

        $sequence_60 = { c60000 8d4001 83e901 75f5 8d45f0 }
            // n = 5, score = 300
            //   c60000               | mov                 byte ptr [eax], 0
            //   8d4001               | lea                 eax, [eax + 1]
            //   83e901               | sub                 ecx, 1
            //   75f5                 | jne                 0xfffffff7
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_61 = { 8a0419 84c0 7404 3c2e }
            // n = 4, score = 300
            //   8a0419               | mov                 al, byte ptr [ecx + ebx]
            //   84c0                 | test                al, al
            //   7404                 | je                  6
            //   3c2e                 | cmp                 al, 0x2e

        $sequence_62 = { 8d4701 84c9 0f45c7 803a00 }
            // n = 4, score = 300
            //   8d4701               | lea                 eax, [edi + 1]
            //   84c9                 | test                cl, cl
            //   0f45c7               | cmovne              eax, edi
            //   803a00               | cmp                 byte ptr [edx], 0

        $sequence_63 = { 3cc0 721e 0fb6c8 0fb64201 }
            // n = 4, score = 300
            //   3cc0                 | je                  8
            //   721e                 | dec                 eax
            //   0fb6c8               | mov                 edx, dword ptr [ecx]
            //   0fb64201             | call                dword ptr [edx + 0x10]

        $sequence_64 = { 85d2 740d 33d2 83f902 0f95c2 83c224 eb05 }
            // n = 7, score = 300
            //   85d2                 | test                edx, edx
            //   740d                 | je                  0xf
            //   33d2                 | xor                 edx, edx
            //   83f902               | cmp                 ecx, 2
            //   0f95c2               | setne               dl
            //   83c224               | add                 edx, 0x24
            //   eb05                 | jmp                 7

        $sequence_65 = { 68???????? e8???????? 83c410 b800308804 }
            // n = 4, score = 300
            //   68????????           |                     
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   b800308804           | mov                 eax, 0x4883000

    condition:
        7 of them and filesize < 2088960
}