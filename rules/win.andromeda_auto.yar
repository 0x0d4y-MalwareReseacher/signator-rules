rule win_andromeda_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.andromeda."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.andromeda"
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
        $sequence_0 = { 02da 368ab42b00ffffff 3688b42800ffffff 3688942b00ffffff 02d6 81e2ff000000 368a942a00ffffff }
            // n = 7, score = 800
            //   02da                 | add                 bl, dl
            //   368ab42b00ffffff     | mov                 dh, byte ptr ss:[ebx + ebp - 0x100]
            //   3688b42800ffffff     | mov                 byte ptr ss:[eax + ebp - 0x100], dh
            //   3688942b00ffffff     | mov                 byte ptr ss:[ebx + ebp - 0x100], dl
            //   02d6                 | add                 dl, dh
            //   81e2ff000000         | and                 edx, 0xff
            //   368a942a00ffffff     | mov                 dl, byte ptr ss:[edx + ebp - 0x100]

        $sequence_1 = { 55 8bec 81c400ffffff 60 b940000000 }
            // n = 5, score = 800
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81c400ffffff         | add                 esp, 0xffffff00
            //   60                   | pushal              
            //   b940000000           | mov                 ecx, 0x40

        $sequence_2 = { 81e2ff000000 368a942a00ffffff 301439 41 3b4d14 75c3 61 }
            // n = 7, score = 800
            //   81e2ff000000         | and                 edx, 0xff
            //   368a942a00ffffff     | mov                 dl, byte ptr ss:[edx + ebp - 0x100]
            //   301439               | xor                 byte ptr [ecx + edi], dl
            //   41                   | inc                 ecx
            //   3b4d14               | cmp                 ecx, dword ptr [ebp + 0x14]
            //   75c3                 | jne                 0xffffffc5
            //   61                   | popal               

        $sequence_3 = { 33db 33c9 33d2 8b7d10 }
            // n = 4, score = 800
            //   33db                 | xor                 ebx, ebx
            //   33c9                 | xor                 ecx, ecx
            //   33d2                 | xor                 edx, edx
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]

        $sequence_4 = { 3688942800ffffff fec1 7408 43 3b5d0c 74cf ebcf }
            // n = 7, score = 800
            //   3688942800ffffff     | mov                 byte ptr ss:[eax + ebp - 0x100], dl
            //   fec1                 | inc                 cl
            //   7408                 | je                  0xa
            //   43                   | inc                 ebx
            //   3b5d0c               | cmp                 ebx, dword ptr [ebp + 0xc]
            //   74cf                 | je                  0xffffffd1
            //   ebcf                 | jmp                 0xffffffd1

        $sequence_5 = { b940000000 8d7dfc b8fcfdfeff fd }
            // n = 4, score = 800
            //   b940000000           | mov                 ecx, 0x40
            //   8d7dfc               | lea                 edi, [ebp - 4]
            //   b8fcfdfeff           | mov                 eax, 0xfffefdfc
            //   fd                   | std                 

        $sequence_6 = { 2d04040404 e2f8 fc 33c0 8b7508 33db 368a942900ffffff }
            // n = 7, score = 800
            //   2d04040404           | sub                 eax, 0x4040404
            //   e2f8                 | loop                0xfffffffa
            //   fc                   | cld                 
            //   33c0                 | xor                 eax, eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33db                 | xor                 ebx, ebx
            //   368a942900ffffff     | mov                 dl, byte ptr ss:[ecx + ebp - 0x100]

        $sequence_7 = { 8b7508 33db 368a942900ffffff 02c2 020433 368ab42800ffffff 3688b42900ffffff }
            // n = 7, score = 800
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33db                 | xor                 ebx, ebx
            //   368a942900ffffff     | mov                 dl, byte ptr ss:[ecx + ebp - 0x100]
            //   02c2                 | add                 al, dl
            //   020433               | add                 al, byte ptr [ebx + esi]
            //   368ab42800ffffff     | mov                 dh, byte ptr ss:[eax + ebp - 0x100]
            //   3688b42900ffffff     | mov                 byte ptr ss:[ecx + ebp - 0x100], dh

        $sequence_8 = { 60 e8???????? 5d 81ed???????? }
            // n = 4, score = 700
            //   60                   | pushal              
            //   e8????????           |                     
            //   5d                   | pop                 ebp
            //   81ed????????         |                     

        $sequence_9 = { 50 e8???????? 83c40c 6800000100 e8???????? }
            // n = 5, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6800000100           | push                0x10000
            //   e8????????           |                     

        $sequence_10 = { 3c41 0f9dc2 85ca 7404 0420 8806 }
            // n = 6, score = 400
            //   3c41                 | cmp                 al, 0x41
            //   0f9dc2               | setge               dl
            //   85ca                 | test                edx, ecx
            //   7404                 | je                  6
            //   0420                 | add                 al, 0x20
            //   8806                 | mov                 byte ptr [esi], al

        $sequence_11 = { 0fb64601 84c0 7905 0d00ffffff }
            // n = 4, score = 400
            //   0fb64601             | movzx               eax, byte ptr [esi + 1]
            //   84c0                 | test                al, al
            //   7905                 | jns                 7
            //   0d00ffffff           | or                  eax, 0xffffff00

        $sequence_12 = { 8a06 33c9 3c5a 0f9ec1 33d2 3c41 }
            // n = 6, score = 400
            //   8a06                 | mov                 al, byte ptr [esi]
            //   33c9                 | xor                 ecx, ecx
            //   3c5a                 | cmp                 al, 0x5a
            //   0f9ec1               | setle               cl
            //   33d2                 | xor                 edx, edx
            //   3c41                 | cmp                 al, 0x41

        $sequence_13 = { 6a30 8d45d0 50 6a01 ff7508 e8???????? 85c0 }
            // n = 7, score = 400
            //   6a30                 | push                0x30
            //   8d45d0               | lea                 eax, [ebp - 0x30]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_14 = { 66c10608 66c1460408 66c1460608 66c1460808 66c1460a08 }
            // n = 5, score = 300
            //   66c10608             | rol                 word ptr [esi], 8
            //   66c1460408           | rol                 word ptr [esi + 4], 8
            //   66c1460608           | rol                 word ptr [esi + 6], 8
            //   66c1460808           | rol                 word ptr [esi + 8], 8
            //   66c1460a08           | rol                 word ptr [esi + 0xa], 8

        $sequence_15 = { 6811010000 57 68???????? ff15???????? 50 }
            // n = 5, score = 300
            //   6811010000           | push                0x111
            //   57                   | push                edi
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_16 = { 7526 ff75f8 e8???????? 40 }
            // n = 4, score = 200
            //   7526                 | jne                 0x28
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     
            //   40                   | inc                 eax

        $sequence_17 = { ff75f8 ff75fc e8???????? 6a06 ff75f8 e8???????? 8d45f4 }
            // n = 7, score = 200
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   6a06                 | push                6
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_18 = { 6a00 ff35???????? e8???????? 8945f8 83f800 }
            // n = 5, score = 200
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   83f800               | cmp                 eax, 0

        $sequence_19 = { 6804010000 ff75f8 68???????? e8???????? 6804010000 ff75fc 6a00 }
            // n = 7, score = 200
            //   6804010000           | push                0x104
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   68????????           |                     
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   6a00                 | push                0

        $sequence_20 = { 6a10 8d45e0 50 ff75f0 e8???????? 83f8ff 7466 }
            // n = 7, score = 200
            //   6a10                 | push                0x10
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   7466                 | je                  0x68

        $sequence_21 = { 7457 33c0 8d7d9c b944000000 f3aa 6a00 }
            // n = 6, score = 200
            //   7457                 | je                  0x59
            //   33c0                 | xor                 eax, eax
            //   8d7d9c               | lea                 edi, [ebp - 0x64]
            //   b944000000           | mov                 ecx, 0x44
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   6a00                 | push                0

        $sequence_22 = { 6a00 68???????? 6802000080 e8???????? 83f800 741f 8d45f4 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   68????????           |                     
            //   6802000080           | push                0x80000002
            //   e8????????           |                     
            //   83f800               | cmp                 eax, 0
            //   741f                 | je                  0x21
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_23 = { 6a00 6a06 6a01 6a02 e8???????? 8945f0 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   6a06                 | push                6
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_24 = { ebdd 4b 81c1ec94ed46 81c27ec28f2d eb89 }
            // n = 5, score = 100
            //   ebdd                 | jmp                 0xffffffdf
            //   4b                   | dec                 ebx
            //   81c1ec94ed46         | add                 ecx, 0x46ed94ec
            //   81c27ec28f2d         | add                 edx, 0x2d8fc27e
            //   eb89                 | jmp                 0xffffff8b

        $sequence_25 = { ff5638 0faf45e4 8bf8 ff5624 69db0132fa43 ff75f8 f7d8 }
            // n = 7, score = 100
            //   ff5638               | call                dword ptr [esi + 0x38]
            //   0faf45e4             | imul                eax, dword ptr [ebp - 0x1c]
            //   8bf8                 | mov                 edi, eax
            //   ff5624               | call                dword ptr [esi + 0x24]
            //   69db0132fa43         | imul                ebx, ebx, 0x43fa3201
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   f7d8                 | neg                 eax

        $sequence_26 = { 8b45fc 8d440026 50 6a08 ff750c ff5604 894510 }
            // n = 7, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8d440026             | lea                 eax, [eax + eax + 0x26]
            //   50                   | push                eax
            //   6a08                 | push                8
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff5604               | call                dword ptr [esi + 4]
            //   894510               | mov                 dword ptr [ebp + 0x10], eax

        $sequence_27 = { ff5614 23d8 81ef5b9adf33 81fb207ec5f4 7583 e9???????? c64405d800 }
            // n = 7, score = 100
            //   ff5614               | call                dword ptr [esi + 0x14]
            //   23d8                 | and                 ebx, eax
            //   81ef5b9adf33         | sub                 edi, 0x33df9a5b
            //   81fb207ec5f4         | cmp                 ebx, 0xf4c57e20
            //   7583                 | jne                 0xffffff85
            //   e9????????           |                     
            //   c64405d800           | mov                 byte ptr [ebp + eax - 0x28], 0

        $sequence_28 = { ff5644 ff5614 0fafd8 56 }
            // n = 4, score = 100
            //   ff5644               | call                dword ptr [esi + 0x44]
            //   ff5614               | call                dword ptr [esi + 0x14]
            //   0fafd8               | imul                ebx, eax
            //   56                   | push                esi

        $sequence_29 = { 8b400c 89456c 6af5 ff5630 23d8 ff560c }
            // n = 6, score = 100
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   89456c               | mov                 dword ptr [ebp + 0x6c], eax
            //   6af5                 | push                -0xb
            //   ff5630               | call                dword ptr [esi + 0x30]
            //   23d8                 | and                 ebx, eax
            //   ff560c               | call                dword ptr [esi + 0xc]

        $sequence_30 = { 81e700f0ffff 817508f758d728 ff5638 0fafd8 b84d5a0000 }
            // n = 5, score = 100
            //   81e700f0ffff         | and                 edi, 0xfffff000
            //   817508f758d728       | xor                 dword ptr [ebp + 8], 0x28d758f7
            //   ff5638               | call                dword ptr [esi + 0x38]
            //   0fafd8               | imul                ebx, eax
            //   b84d5a0000           | mov                 eax, 0x5a4d

        $sequence_31 = { 69fff24c07dd 0bf8 8b45f0 81cbbfdf851b }
            // n = 4, score = 100
            //   69fff24c07dd         | imul                edi, edi, 0xdd074cf2
            //   0bf8                 | or                  edi, eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   81cbbfdf851b         | or                  ebx, 0x1b85dfbf

    condition:
        7 of them and filesize < 204800
}