rule win_bazarbackdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.bazarbackdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bazarbackdoor"
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
        $sequence_0 = { 8a03 3c20 7709 84c0 7431 }
            // n = 5, score = 1800
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   3c20                 | cmp                 al, 0x20
            //   7709                 | ja                  0xb
            //   84c0                 | test                al, al
            //   7431                 | je                  0x33

        $sequence_1 = { 0fb6c8 e8???????? 85c0 7403 }
            // n = 4, score = 1800
            //   0fb6c8               | movzx               ecx, al
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5

        $sequence_2 = { ebd2 3c20 7709 48ffc3 }
            // n = 4, score = 1600
            //   ebd2                 | je                  0x24
            //   3c20                 | cmp                 al, 0x22
            //   7709                 | jne                 0x10
            //   48ffc3               | inc                 eax

        $sequence_3 = { 84c0 7431 4084ff 741f }
            // n = 4, score = 1600
            //   84c0                 | inc                 ebx
            //   7431                 | jmp                 0xffffffd7
            //   4084ff               | cmp                 al, 0x20
            //   741f                 | ja                  0xd

        $sequence_4 = { 4084ff 400f94c7 0fb6c8 e8???????? }
            // n = 4, score = 1600
            //   4084ff               | jne                 0xfffffffe
            //   400f94c7             | ja                  0xb
            //   0fb6c8               | test                al, al
            //   e8????????           |                     

        $sequence_5 = { 4084ff 741f 3c22 7507 4084ff 400f94c7 }
            // n = 6, score = 1600
            //   4084ff               | cmp                 al, 0x22
            //   741f                 | inc                 eax
            //   3c22                 | test                bh, bh
            //   7507                 | je                  0x21
            //   4084ff               | cmp                 al, 0x22
            //   400f94c7             | jne                 9

        $sequence_6 = { 41b80f100000 488bce 4889442420 ff15???????? }
            // n = 4, score = 1500
            //   41b80f100000         | cmp                 al, 0x20
            //   488bce               | ja                  0x16
            //   4889442420           | inc                 eax
            //   ff15????????         |                     

        $sequence_7 = { 4889442420 ff15???????? 85c0 780a 4898 }
            // n = 5, score = 1500
            //   4889442420           | sete                bh
            //   ff15????????         |                     
            //   85c0                 | movzx               ecx, al
            //   780a                 | test                eax, eax
            //   4898                 | je                  0xa

        $sequence_8 = { 488bcf ffd0 b802000000 e9???????? }
            // n = 4, score = 1300
            //   488bcf               | je                  0x24
            //   ffd0                 | ja                  0xb
            //   b802000000           | test                al, al
            //   e9????????           |                     

        $sequence_9 = { 41b984010000 41b875f79b8e e8???????? 4885c0 }
            // n = 4, score = 1300
            //   41b984010000         | test                bh, bh
            //   41b875f79b8e         | inc                 eax
            //   e8????????           |                     
            //   4885c0               | test                bh, bh

        $sequence_10 = { e8???????? 4885c0 7407 488bcb ffd0 eb03 }
            // n = 6, score = 1300
            //   e8????????           |                     
            //   4885c0               | xor                 bh, bh
            //   7407                 | mov                 al, byte ptr [ebx]
            //   488bcb               | cmp                 al, 0x20
            //   ffd0                 | ja                  0x12
            //   eb03                 | dec                 eax

        $sequence_11 = { 4885c0 750a b82e000000 e9???????? }
            // n = 4, score = 1300
            //   4885c0               | je                  0x35
            //   750a                 | inc                 eax
            //   b82e000000           | test                bh, bh
            //   e9????????           |                     

        $sequence_12 = { e8???????? 4885c0 7408 488bd5 }
            // n = 4, score = 1300
            //   e8????????           |                     
            //   4885c0               | je                  0x35
            //   7408                 | inc                 eax
            //   488bd5               | test                bh, bh

        $sequence_13 = { 83f802 774b 488b4130 4885c0 }
            // n = 4, score = 1300
            //   83f802               | je                  0x24
            //   774b                 | cmp                 al, 0x22
            //   488b4130             | jne                 0xb
            //   4885c0               | test                al, al

        $sequence_14 = { ff15???????? 0fb74f02 0fb7d8 ff15???????? 0fb74f08 }
            // n = 5, score = 1100
            //   ff15????????         |                     
            //   0fb74f02             | cwde                
            //   0fb7d8               | inc                 ecx
            //   ff15????????         |                     
            //   0fb74f08             | mov                 eax, 0x100f

        $sequence_15 = { 7507 33c0 e9???????? b8ff000000 }
            // n = 4, score = 1000
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   b8ff000000           | mov                 eax, 0xff

        $sequence_16 = { c3 0fb74c0818 b80b010000 663bc8 }
            // n = 4, score = 900
            //   c3                   | dec                 eax
            //   0fb74c0818           | inc                 ebx
            //   b80b010000           | cmp                 al, 0x20
            //   663bc8               | ja                  0xb

        $sequence_17 = { 31ff 4889c1 31d2 4989f0 }
            // n = 4, score = 800
            //   31ff                 | mov                 eax, ebx
            //   4889c1               | dec                 eax
            //   31d2                 | mov                 ecx, dword ptr [esp + 0x58]
            //   4989f0               | dec                 eax

        $sequence_18 = { e8???????? 4889c7 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4889c7               | mov                 eax, 0x100f
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_19 = { e8???????? 4c89e1 e8???????? 8b05???????? }
            // n = 4, score = 800
            //   e8????????           |                     
            //   4c89e1               | dec                 eax
            //   e8????????           |                     
            //   8b05????????         |                     

        $sequence_20 = { ff15???????? 4889c1 31d2 4d89e0 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   4889c1               | mov                 ecx, ebx
            //   31d2                 | call                eax
            //   4d89e0               | jmp                 0xc

        $sequence_21 = { 4889f1 e8???????? 8b05???????? 8b0d???????? }
            // n = 4, score = 800
            //   4889f1               | cwde                
            //   e8????????           |                     
            //   8b05????????         |                     
            //   8b0d????????         |                     

        $sequence_22 = { ffd0 90 4883c430 5b }
            // n = 4, score = 800
            //   ffd0                 | dec                 eax
            //   90                   | test                eax, eax
            //   4883c430             | je                  9
            //   5b                   | dec                 eax

        $sequence_23 = { 4889c1 31d2 4989f8 ff15???????? 4885c0 }
            // n = 5, score = 700
            //   4889c1               | lea                 edx, [ebp - 0x20]
            //   31d2                 | inc                 ecx
            //   4989f8               | mov                 eax, 0x100f
            //   ff15????????         |                     
            //   4885c0               | dec                 eax

        $sequence_24 = { 38d3 7507 08c1 80f101 }
            // n = 4, score = 700
            //   38d3                 | test                bh, bh
            //   7507                 | mov                 al, byte ptr [ebx]
            //   08c1                 | cmp                 al, 0x20
            //   80f101               | ja                  0xb

        $sequence_25 = { 30da 7519 08c1 80f101 }
            // n = 4, score = 700
            //   30da                 | test                bh, bh
            //   7519                 | je                  0x24
            //   08c1                 | mov                 al, byte ptr [ebx]
            //   80f101               | cmp                 al, 0x20

        $sequence_26 = { 8b0d???????? 8b1d???????? 8d51ff 0fafd1 }
            // n = 4, score = 700
            //   8b0d????????         |                     
            //   8b1d????????         |                     
            //   8d51ff               | js                  0x16
            //   0fafd1               | dec                 eax

        $sequence_27 = { 30da 08c1 80f101 08d1 }
            // n = 4, score = 700
            //   30da                 | je                  0x26
            //   08c1                 | cmp                 al, 0x22
            //   80f101               | jne                 0x12
            //   08d1                 | jne                 9

        $sequence_28 = { 7528 0fb64b04 0fb6d1 80f973 }
            // n = 4, score = 700
            //   7528                 | dec                 eax
            //   0fb64b04             | test                eax, eax
            //   0fb6d1               | cmp                 eax, 2
            //   80f973               | ja                  0x4d

        $sequence_29 = { 8bd3 e8???????? 33c0 e9???????? }
            // n = 4, score = 700
            //   8bd3                 | test                eax, eax
            //   e8????????           |                     
            //   33c0                 | js                  0xc
            //   e9????????           |                     

        $sequence_30 = { ff15???????? 31db 4889c1 31d2 }
            // n = 4, score = 700
            //   ff15????????         |                     
            //   31db                 | dec                 eax
            //   4889c1               | mov                 dword ptr [esp + 0x20], eax
            //   31d2                 | test                eax, eax

        $sequence_31 = { 30d8 7507 08ca 80f201 }
            // n = 4, score = 700
            //   30d8                 | je                  0x2a
            //   7507                 | test                al, al
            //   08ca                 | je                  0x35
            //   80f201               | inc                 eax

        $sequence_32 = { 89d0 83f0fe 85d0 0f94c0 }
            // n = 4, score = 700
            //   89d0                 | mov                 ecx, esi
            //   83f0fe               | dec                 eax
            //   85d0                 | mov                 dword ptr [esp + 0x20], eax
            //   0f94c0               | test                eax, eax

        $sequence_33 = { 0fb6d1 80f973 7504 0fb65305 33c0 80f973 0f94c0 }
            // n = 7, score = 700
            //   0fb6d1               | dec                 eax
            //   80f973               | mov                 dword ptr [esp + 0x20], eax
            //   7504                 | test                eax, eax
            //   0fb65305             | js                  0x45
            //   33c0                 | dec                 eax
            //   80f973               | cwde                
            //   0f94c0               | dec                 eax

        $sequence_34 = { c744242003000000 4889f9 ba00000080 41b801000000 }
            // n = 4, score = 700
            //   c744242003000000     | test                eax, eax
            //   4889f9               | js                  0x16
            //   ba00000080           | dec                 eax
            //   41b801000000         | cwde                

        $sequence_35 = { 31ed 4889c1 31d2 4989d8 }
            // n = 4, score = 700
            //   31ed                 | test                eax, eax
            //   4889c1               | inc                 ecx
            //   31d2                 | mov                 eax, 0x100f
            //   4989d8               | dec                 eax

        $sequence_36 = { e8???????? 4889f9 4889f2 ffd0 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   4889f9               | mov                 ecx, esi
            //   4889f2               | dec                 eax
            //   ffd0                 | mov                 dword ptr [esp + 0x20], eax

        $sequence_37 = { 48c744243000000000 c744242880000000 c744242003000000 4889f9 }
            // n = 4, score = 700
            //   48c744243000000000     | test    eax, eax
            //   c744242880000000     | js                  0x13
            //   c744242003000000     | dec                 eax
            //   4889f9               | test                eax, eax

        $sequence_38 = { 7405 80fa2e 750f 0fb6c1 }
            // n = 4, score = 600
            //   7405                 | dec                 eax
            //   80fa2e               | mov                 ecx, dword ptr [esp + 0x58]
            //   750f                 | dec                 eax
            //   0fb6c1               | lea                 edx, [ebp - 0x20]

        $sequence_39 = { 89f0 4883c450 5b 5f }
            // n = 4, score = 600
            //   89f0                 | test                eax, eax
            //   4883c450             | js                  0x49
            //   5b                   | test                eax, eax
            //   5f                   | js                  0x4d

        $sequence_40 = { e8???????? 4c897c2420 4889d9 89fa }
            // n = 4, score = 600
            //   e8????????           |                     
            //   4c897c2420           | dec                 eax
            //   4889d9               | cwde                
            //   89fa                 | cmp                 ecx, -1

        $sequence_41 = { 50 0fb745ea 50 0fb745e8 50 68???????? e8???????? }
            // n = 7, score = 400
            //   50                   | push                eax
            //   0fb745ea             | movzx               eax, word ptr [ebp - 0x16]
            //   50                   | push                eax
            //   0fb745e8             | movzx               eax, word ptr [ebp - 0x18]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_42 = { 8bc3 a3???????? 85c0 7504 }
            // n = 4, score = 400
            //   8bc3                 | mov                 eax, ebx
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7504                 | jne                 6

        $sequence_43 = { 7617 33c9 24f2 0c02 }
            // n = 4, score = 400
            //   7617                 | jbe                 0x19
            //   33c9                 | xor                 ecx, ecx
            //   24f2                 | and                 al, 0xf2
            //   0c02                 | or                  al, 2

        $sequence_44 = { 7409 8b0d???????? 8904b1 5e }
            // n = 4, score = 400
            //   7409                 | je                  0xb
            //   8b0d????????         |                     
            //   8904b1               | mov                 dword ptr [ecx + esi*4], eax
            //   5e                   | pop                 esi

        $sequence_45 = { 8d4101 6a0e 8bf0 5f }
            // n = 4, score = 400
            //   8d4101               | lea                 eax, [ecx + 1]
            //   6a0e                 | push                0xe
            //   8bf0                 | mov                 esi, eax
            //   5f                   | pop                 edi

        $sequence_46 = { 8d4301 8bd7 50 e8???????? }
            // n = 4, score = 400
            //   8d4301               | lea                 eax, [ebx + 1]
            //   8bd7                 | mov                 edx, edi
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_47 = { 6882000000 68e6b8402d 42 e8???????? }
            // n = 4, score = 400
            //   6882000000           | push                0x82
            //   68e6b8402d           | push                0x2d40b8e6
            //   42                   | inc                 edx
            //   e8????????           |                     

        $sequence_48 = { 7506 8b0e 894c2460 0fb7c0 }
            // n = 4, score = 400
            //   7506                 | dec                 eax
            //   8b0e                 | mov                 ecx, esi
            //   894c2460             | dec                 eax
            //   0fb7c0               | mov                 dword ptr [esp + 0x20], eax

        $sequence_49 = { 85d2 740d 33d2 83f902 0f95c2 83c224 eb05 }
            // n = 7, score = 300
            //   85d2                 | test                edx, edx
            //   740d                 | je                  0xf
            //   33d2                 | xor                 edx, edx
            //   83f902               | cmp                 ecx, 2
            //   0f95c2               | setne               dl
            //   83c224               | add                 edx, 0x24
            //   eb05                 | jmp                 7

        $sequence_50 = { 68???????? ff15???????? 8bf8 8bd6 be???????? }
            // n = 5, score = 300
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   8bd6                 | mov                 edx, esi
            //   be????????           |                     

        $sequence_51 = { 50 8d4601 50 ff15???????? 83f8ff }
            // n = 5, score = 300
            //   50                   | push                eax
            //   8d4601               | lea                 eax, [esi + 1]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1

        $sequence_52 = { 41 3bcf 72e5 53 }
            // n = 4, score = 300
            //   41                   | inc                 ecx
            //   3bcf                 | cmp                 ecx, edi
            //   72e5                 | jb                  0xffffffe7
            //   53                   | push                ebx

        $sequence_53 = { 50 43 ffd6 3bd8 7cc7 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   43                   | inc                 ebx
            //   ffd6                 | call                esi
            //   3bd8                 | cmp                 ebx, eax
            //   7cc7                 | jl                  0xffffffc9

        $sequence_54 = { 51 e8???????? 33d2 83c40c 8d4a01 3bf9 }
            // n = 6, score = 300
            //   51                   | push                ecx
            //   e8????????           |                     
            //   33d2                 | xor                 edx, edx
            //   83c40c               | add                 esp, 0xc
            //   8d4a01               | lea                 ecx, [edx + 1]
            //   3bf9                 | cmp                 edi, ecx

        $sequence_55 = { ff7508 56 ff15???????? 6a00 6880000000 6a04 }
            // n = 6, score = 300
            //   ff7508               | dec                 eax
            //   56                   | inc                 ebx
            //   ff15????????         |                     
            //   6a00                 | jmp                 0xffffffd4
            //   6880000000           | cmp                 al, 0x20
            //   6a04                 | ja                  0xf

        $sequence_56 = { 660f73d801 660febd0 660f7ed0 84c0 }
            // n = 4, score = 300
            //   660f73d801           | psrldq              xmm0, 1
            //   660febd0             | por                 xmm2, xmm0
            //   660f7ed0             | movd                eax, xmm2
            //   84c0                 | test                al, al

        $sequence_57 = { 85f6 745c 57 8d450c 50 ff7508 56 }
            // n = 7, score = 300
            //   85f6                 | test                esi, esi
            //   745c                 | je                  0x5e
            //   57                   | push                edi
            //   8d450c               | lea                 eax, [ebp + 0xc]
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   56                   | push                esi

        $sequence_58 = { 8b400c 488b4c2438 4803c8 488bc1 488b8c2488000000 }
            // n = 5, score = 100
            //   8b400c               | dec                 eax
            //   488b4c2438           | inc                 ebx
            //   4803c8               | jmp                 0xffffffd4
            //   488bc1               | cmp                 al, 0x20
            //   488b8c2488000000     | ja                  0xd

        $sequence_59 = { 488b442430 488b00 83782800 0f848c000000 488b442430 83782000 7460 }
            // n = 7, score = 100
            //   488b442430           | test                al, al
            //   488b00               | je                  0x3b
            //   83782800             | inc                 eax
            //   0f848c000000         | test                bh, bh
            //   488b442430           | dec                 eax
            //   83782000             | inc                 ebx
            //   7460                 | dec                 eax

        $sequence_60 = { ff15???????? 33c0 e9???????? 488b442458 4863403c 480508010000 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   33c0                 | cmp                 al, 0x20
            //   e9????????           |                     
            //   488b442458           | ja                  0x12
            //   4863403c             | test                al, al
            //   480508010000         | inc                 eax

        $sequence_61 = { 488b842488000000 488b4008 4889442438 c744242001000000 488b842488000000 }
            // n = 5, score = 100
            //   488b842488000000     | inc                 eax
            //   488b4008             | xor                 bh, bh
            //   4889442438           | mov                 al, byte ptr [ebx]
            //   c744242001000000     | cmp                 al, 0x20
            //   488b842488000000     | ja                  0xf

        $sequence_62 = { 8b44242c 89442438 4863442430 486bc010 488d0de3380200 }
            // n = 5, score = 100
            //   8b44242c             | dec                 eax
            //   89442438             | inc                 ebx
            //   4863442430           | dec                 eax
            //   486bc010             | test                eax, eax
            //   488d0de3380200       | dec                 eax

        $sequence_63 = { 4883ec28 488b442430 4889442408 8b442438 }
            // n = 4, score = 100
            //   4883ec28             | cmovne              ebx, eax
            //   488b442430           | inc                 eax
            //   4889442408           | xor                 bh, bh
            //   8b442438             | mov                 al, byte ptr [ebx]

        $sequence_64 = { 4889442458 488b442458 0fb700 3d4d5a0000 }
            // n = 4, score = 100
            //   4889442458           | inc                 ebx
            //   488b442458           | jmp                 0xffffffd7
            //   0fb700               | cmp                 al, 0x20
            //   3d4d5a0000           | ja                  0x12

        $sequence_65 = { 488b8c24f8000000 4803c8 488bc1 4889442438 }
            // n = 4, score = 100
            //   488b8c24f8000000     | dec                 eax
            //   4803c8               | inc                 ebx
            //   488bc1               | mov                 al, byte ptr [ebx]
            //   4889442438           | test                al, al

    condition:
        7 of them and filesize < 2088960
}