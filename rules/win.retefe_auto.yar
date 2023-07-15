rule win_retefe_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.retefe."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.retefe"
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
        $sequence_0 = { 68f5000000 50 ff15???????? b801000000 }
            // n = 4, score = 1200
            //   68f5000000           | push                0xf5
            //   50                   | push                eax
            //   ff15????????         |                     
            //   b801000000           | mov                 eax, 1

        $sequence_1 = { 51 8bf8 ffd6 85c0 }
            // n = 4, score = 1200
            //   51                   | push                ecx
            //   8bf8                 | mov                 edi, eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax

        $sequence_2 = { 6a00 6a01 ff15???????? 8bf0 85f6 7410 6a09 }
            // n = 7, score = 1200
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7410                 | je                  0x12
            //   6a09                 | push                9

        $sequence_3 = { 6a16 89442470 e8???????? 83c45c }
            // n = 4, score = 800
            //   6a16                 | push                0x16
            //   89442470             | mov                 dword ptr [esp + 0x70], eax
            //   e8????????           |                     
            //   83c45c               | add                 esp, 0x5c

        $sequence_4 = { e8???????? 894604 83c404 8bc6 e8???????? }
            // n = 5, score = 800
            //   e8????????           |                     
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   83c404               | add                 esp, 4
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     

        $sequence_5 = { e8???????? 6a08 e8???????? 894604 }
            // n = 4, score = 800
            //   e8????????           |                     
            //   6a08                 | push                8
            //   e8????????           |                     
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_6 = { 880c10 8b4e04 40 3b4104 }
            // n = 4, score = 800
            //   880c10               | mov                 byte ptr [eax + edx], cl
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   40                   | inc                 eax
            //   3b4104               | cmp                 eax, dword ptr [ecx + 4]

        $sequence_7 = { e8???????? 8b4e04 8901 8b4e04 }
            // n = 4, score = 800
            //   e8????????           |                     
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]

        $sequence_8 = { 6a1e 6a71 6afa 6ae0 }
            // n = 4, score = 800
            //   6a1e                 | push                0x1e
            //   6a71                 | push                0x71
            //   6afa                 | push                -6
            //   6ae0                 | push                -0x20

        $sequence_9 = { 8d480c 83caff f00fc111 4a 85d2 7f5e }
            // n = 6, score = 800
            //   8d480c               | lea                 ecx, [eax + 0xc]
            //   83caff               | or                  edx, 0xffffffff
            //   f00fc111             | lock xadd           dword ptr [ecx], edx
            //   4a                   | dec                 edx
            //   85d2                 | test                edx, edx
            //   7f5e                 | jg                  0x60

        $sequence_10 = { 6adb 6a52 6ada 6a2c 6adc }
            // n = 5, score = 800
            //   6adb                 | push                -0x25
            //   6a52                 | push                0x52
            //   6ada                 | push                -0x26
            //   6a2c                 | push                0x2c
            //   6adc                 | push                -0x24

        $sequence_11 = { 8901 8b4e04 33c0 83c404 394104 }
            // n = 5, score = 800
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   33c0                 | xor                 eax, eax
            //   83c404               | add                 esp, 4
            //   394104               | cmp                 dword ptr [ecx + 4], eax

        $sequence_12 = { 85c0 0f840d010000 6a00 6a04 6a6e 6af9 }
            // n = 6, score = 800
            //   85c0                 | test                eax, eax
            //   0f840d010000         | je                  0x113
            //   6a00                 | push                0
            //   6a04                 | push                4
            //   6a6e                 | push                0x6e
            //   6af9                 | push                -7

        $sequence_13 = { 57 3805???????? 0f85cb000000 e8???????? }
            // n = 4, score = 100
            //   57                   | push                edi
            //   3805????????         |                     
            //   0f85cb000000         | jne                 0xd1
            //   e8????????           |                     

        $sequence_14 = { 660f58ca 660f2815???????? f20f59db 660f282d???????? 660f59f5 660f28aa70324100 660f54e5 }
            // n = 7, score = 100
            //   660f58ca             | addpd               xmm1, xmm2
            //   660f2815????????     |                     
            //   f20f59db             | mulsd               xmm3, xmm3
            //   660f282d????????     |                     
            //   660f59f5             | mulpd               xmm6, xmm5
            //   660f28aa70324100     | movapd              xmm5, xmmword ptr [edx + 0x413270]
            //   660f54e5             | andpd               xmm4, xmm5

        $sequence_15 = { 742d c70600000000 f6c101 7422 ff750c 68???????? e8???????? }
            // n = 7, score = 100
            //   742d                 | je                  0x2f
            //   c70600000000         | mov                 dword ptr [esi], 0
            //   f6c101               | test                cl, 1
            //   7422                 | je                  0x24
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_16 = { ff5008 ff15???????? 33c0 5e c3 b805400080 }
            // n = 6, score = 100
            //   ff5008               | call                dword ptr [eax + 8]
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   b805400080           | mov                 eax, 0x80004005

        $sequence_17 = { 0f84ca040000 56 e8???????? 84c0 }
            // n = 4, score = 100
            //   0f84ca040000         | je                  0x4d0
            //   56                   | push                esi
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_18 = { 891d???????? e8???????? 8bf0 bd???????? 83fe09 }
            // n = 5, score = 100
            //   891d????????         |                     
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   bd????????           |                     
            //   83fe09               | cmp                 esi, 9

        $sequence_19 = { 8315????????ff 7812 7f04 85d2 720c }
            // n = 5, score = 100
            //   8315????????ff       |                     
            //   7812                 | js                  0x14
            //   7f04                 | jg                  6
            //   85d2                 | test                edx, edx
            //   720c                 | jb                  0xe

        $sequence_20 = { 88442413 8d442430 50 56 ff15???????? }
            // n = 5, score = 100
            //   88442413             | mov                 byte ptr [esp + 0x13], al
            //   8d442430             | lea                 eax, [esp + 0x30]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_21 = { 8d6b40 6a18 59 8bfd f3a5 }
            // n = 5, score = 100
            //   8d6b40               | lea                 ebp, [ebx + 0x40]
            //   6a18                 | push                0x18
            //   59                   | pop                 ecx
            //   8bfd                 | mov                 edi, ebp
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]

        $sequence_22 = { eb58 57 8bfe 83e63f c1ff06 6bf630 8b04bda0bf4200 }
            // n = 7, score = 100
            //   eb58                 | jmp                 0x5a
            //   57                   | push                edi
            //   8bfe                 | mov                 edi, esi
            //   83e63f               | and                 esi, 0x3f
            //   c1ff06               | sar                 edi, 6
            //   6bf630               | imul                esi, esi, 0x30
            //   8b04bda0bf4200       | mov                 eax, dword ptr [edi*4 + 0x42bfa0]

        $sequence_23 = { eb02 33c0 88049d91384300 88049d90344300 }
            // n = 4, score = 100
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   88049d91384300       | mov                 byte ptr [ebx*4 + 0x433891], al
            //   88049d90344300       | mov                 byte ptr [ebx*4 + 0x433490], al

        $sequence_24 = { 8b08 ff511c 33c0 5f }
            // n = 4, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff511c               | call                dword ptr [ecx + 0x1c]
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi

        $sequence_25 = { 83c8ff 8d4e04 f00fc101 7530 85f6 }
            // n = 5, score = 100
            //   83c8ff               | or                  eax, 0xffffffff
            //   8d4e04               | lea                 ecx, [esi + 4]
            //   f00fc101             | lock xadd           dword ptr [ecx], eax
            //   7530                 | jne                 0x32
            //   85f6                 | test                esi, esi

        $sequence_26 = { 33c0 c705????????343e4100 68???????? c705????????10c44200 }
            // n = 4, score = 100
            //   33c0                 | xor                 eax, eax
            //   c705????????343e4100     |     
            //   68????????           |                     
            //   c705????????10c44200     |     

        $sequence_27 = { 7409 83e801 0f8580000000 8b4508 dd00 ebc6 c745e018344100 }
            // n = 7, score = 100
            //   7409                 | je                  0xb
            //   83e801               | sub                 eax, 1
            //   0f8580000000         | jne                 0x86
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   dd00                 | fld                 qword ptr [eax]
            //   ebc6                 | jmp                 0xffffffc8
            //   c745e018344100       | mov                 dword ptr [ebp - 0x20], 0x413418

        $sequence_28 = { d9f1 833d????????00 0f85ec1a0000 8d0d409f4200 }
            // n = 4, score = 100
            //   d9f1                 | fyl2x               
            //   833d????????00       |                     
            //   0f85ec1a0000         | jne                 0x1af2
            //   8d0d409f4200         | lea                 ecx, [0x429f40]

    condition:
        7 of them and filesize < 843776
}