rule win_konni_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.konni."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.konni"
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
        $sequence_0 = { 8a8c0df8feffff 300c07 40 3b4514 7c93 8b4dfc 5f }
            // n = 7, score = 800
            //   8a8c0df8feffff       | mov                 cl, byte ptr [ebp + ecx - 0x108]
            //   300c07               | xor                 byte ptr [edi + eax], cl
            //   40                   | inc                 eax
            //   3b4514               | cmp                 eax, dword ptr [ebp + 0x14]
            //   7c93                 | jl                  0xffffff95
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   5f                   | pop                 edi

        $sequence_1 = { 83c40c 83c618 4f 75cb }
            // n = 4, score = 800
            //   83c40c               | add                 esp, 0xc
            //   83c618               | add                 esi, 0x18
            //   4f                   | dec                 edi
            //   75cb                 | jne                 0xffffffcd

        $sequence_2 = { 8b4de4 8d55e8 52 8d45dc 50 }
            // n = 5, score = 800
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   8d55e8               | lea                 edx, [ebp - 0x18]
            //   52                   | push                edx
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax

        $sequence_3 = { 890d???????? 8815???????? ff15???????? 85c0 7552 8d4de0 51 }
            // n = 7, score = 800
            //   890d????????         |                     
            //   8815????????         |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7552                 | jne                 0x54
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   51                   | push                ecx

        $sequence_4 = { 03c0 33460c 03c0 334610 }
            // n = 4, score = 800
            //   03c0                 | add                 eax, eax
            //   33460c               | xor                 eax, dword ptr [esi + 0xc]
            //   03c0                 | add                 eax, eax
            //   334610               | xor                 eax, dword ptr [esi + 0x10]

        $sequence_5 = { 83e601 8970ec d0f9 0fbef1 }
            // n = 4, score = 800
            //   83e601               | and                 esi, 1
            //   8970ec               | mov                 dword ptr [eax - 0x14], esi
            //   d0f9                 | sar                 cl, 1
            //   0fbef1               | movsx               esi, cl

        $sequence_6 = { 83c418 8b45e4 50 ff15???????? 8b4dfc 33cd }
            // n = 6, score = 800
            //   83c418               | add                 esp, 0x18
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

        $sequence_7 = { 6a01 ff15???????? 50 a3???????? }
            // n = 4, score = 500
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   50                   | push                eax
            //   a3????????           |                     

        $sequence_8 = { 68b6030000 6a0d 50 ff15???????? }
            // n = 4, score = 500
            //   68b6030000           | push                0x3b6
            //   6a0d                 | push                0xd
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_9 = { 8b9cae68020000 33d2 56 e8???????? 8a9435dec44600 }
            // n = 5, score = 200
            //   8b9cae68020000       | mov                 ebx, dword ptr [esi + ebp*4 + 0x268]
            //   33d2                 | xor                 edx, edx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a9435dec44600       | mov                 dl, byte ptr [ebp + esi + 0x46c4de]

        $sequence_10 = { 50 038594040000 59 0bc9 89851a040000 61 7508 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   038594040000         | add                 eax, dword ptr [ebp + 0x494]
            //   59                   | pop                 ecx
            //   0bc9                 | or                  ecx, ecx
            //   89851a040000         | mov                 dword ptr [ebp + 0x41a], eax
            //   61                   | popal               
            //   7508                 | jne                 0xa

        $sequence_11 = { e8???????? 8a8c30dec44600 5e bb01000000 83c604 d3e3 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8a8c30dec44600       | mov                 cl, byte ptr [eax + esi + 0x46c4de]
            //   5e                   | pop                 esi
            //   bb01000000           | mov                 ebx, 1
            //   83c604               | add                 esi, 4
            //   d3e3                 | shl                 ebx, cl

        $sequence_12 = { 68d0070000 ff15???????? 8b4dfc 33cd b801000000 5e }
            // n = 6, score = 200
            //   68d0070000           | push                0x7d0
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp
            //   b801000000           | mov                 eax, 1
            //   5e                   | pop                 esi

        $sequence_13 = { ff95b50f0000 898598040000 8bf0 8d7d51 57 56 }
            // n = 6, score = 200
            //   ff95b50f0000         | call                dword ptr [ebp + 0xfb5]
            //   898598040000         | mov                 dword ptr [ebp + 0x498], eax
            //   8bf0                 | mov                 esi, eax
            //   8d7d51               | lea                 edi, [ebp + 0x51]
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_14 = { 50 ffd6 68???????? 8d8df0faffff 51 ffd6 8b35???????? }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   8d8df0faffff         | lea                 ecx, [ebp - 0x510]
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   8b35????????         |                     

        $sequence_15 = { 83bd9404000000 899d94040000 0f85d7030000 8d85a0040000 50 ff95b50f0000 898598040000 }
            // n = 7, score = 200
            //   83bd9404000000       | cmp                 dword ptr [ebp + 0x494], 0
            //   899d94040000         | mov                 dword ptr [ebp + 0x494], ebx
            //   0f85d7030000         | jne                 0x3dd
            //   8d85a0040000         | lea                 eax, [ebp + 0x4a0]
            //   50                   | push                eax
            //   ff95b50f0000         | call                dword ptr [ebp + 0xfb5]
            //   898598040000         | mov                 dword ptr [ebp + 0x498], eax

        $sequence_16 = { 33c9 56 e8???????? 8a8c30a6c44600 5e }
            // n = 5, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a8c30a6c44600       | mov                 cl, byte ptr [eax + esi + 0x46c4a6]
            //   5e                   | pop                 esi

        $sequence_17 = { ff95b10f0000 ab b000 ae }
            // n = 4, score = 200
            //   ff95b10f0000         | call                dword ptr [ebp + 0xfb1]
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   b000                 | mov                 al, 0
            //   ae                   | scasb               al, byte ptr es:[edi]

        $sequence_18 = { 57 6804010000 8d95f8feffff 52 50 ff15???????? 8d85f8feffff }
            // n = 7, score = 200
            //   57                   | push                edi
            //   6804010000           | push                0x104
            //   8d95f8feffff         | lea                 edx, [ebp - 0x108]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]

        $sequence_19 = { 8d95f0fcffff 52 6a00 6a00 ff15???????? }
            // n = 5, score = 200
            //   8d95f0fcffff         | lea                 edx, [ebp - 0x310]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_20 = { 4c89742420 ff15???????? 488bd8 4885c0 744f }
            // n = 5, score = 200
            //   4c89742420           | dec                 esp
            //   ff15????????         |                     
            //   488bd8               | mov                 dword ptr [esp + 0x20], esi
            //   4885c0               | dec                 eax
            //   744f                 | mov                 ebx, eax

        $sequence_21 = { 68e8030000 ffd7 4e 75f6 5f e9???????? }
            // n = 6, score = 200
            //   68e8030000           | push                0x3e8
            //   ffd7                 | call                edi
            //   4e                   | dec                 esi
            //   75f6                 | jne                 0xfffffff8
            //   5f                   | pop                 edi
            //   e9????????           |                     

        $sequence_22 = { 8d8ea0000000 e8???????? 8b4e08 33db 56 e8???????? 8a9c30c2c44600 }
            // n = 7, score = 200
            //   8d8ea0000000         | lea                 ecx, [esi + 0xa0]
            //   e8????????           |                     
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   33db                 | xor                 ebx, ebx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a9c30c2c44600       | mov                 bl, byte ptr [eax + esi + 0x46c4c2]

        $sequence_23 = { ff15???????? 8d95f8feffff 52 ff15???????? 8b3d???????? }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   8d95f8feffff         | lea                 edx, [ebp - 0x108]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b3d????????         |                     

        $sequence_24 = { ff15???????? 85c0 755b 57 6804010000 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   755b                 | jne                 0x5d
            //   57                   | push                edi
            //   6804010000           | push                0x104

        $sequence_25 = { a1???????? c705????????58214000 8935???????? a3???????? ff15???????? a3???????? 83f8ff }
            // n = 7, score = 200
            //   a1????????           |                     
            //   c705????????58214000     |     
            //   8935????????         |                     
            //   a3????????           |                     
            //   ff15????????         |                     
            //   a3????????           |                     
            //   83f8ff               | cmp                 eax, -1

        $sequence_26 = { 418bc1 d3e8 8842ff 418bc2 d3e8 884203 }
            // n = 6, score = 100
            //   418bc1               | sub                 eax, edx
            //   d3e8                 | dec                 eax
            //   8842ff               | lea                 ecx, [esp + 0x20]
            //   418bc2               | inc                 ecx
            //   d3e8                 | mov                 eax, 0x234
            //   884203               | movups              xmm0, xmmword ptr [ebp + 0x40]

        $sequence_27 = { 85db 0f8486000000 41880e 4b8b84f9a02e0200 4183caff }
            // n = 5, score = 100
            //   85db                 | dec                 eax
            //   0f8486000000         | test                eax, eax
            //   41880e               | je                  0x57
            //   4b8b84f9a02e0200     | dec                 eax
            //   4183caff             | lea                 eax, [0x136ed]

        $sequence_28 = { 0fbec3 8a80e8700010 83e00f eb02 33c0 }
            // n = 5, score = 100
            //   0fbec3               | movsx               eax, bl
            //   8a80e8700010         | mov                 al, byte ptr [eax + 0x100070e8]
            //   83e00f               | and                 eax, 0xf
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax

        $sequence_29 = { ff15???????? 440fb75c2428 440fb744242a 440fb74c242c }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   440fb75c2428         | mov                 ebx, dword ptr [esp]
            //   440fb744242a         | inc                 ebp
            //   440fb74c242c         | lea                 edi, [esp - 0x10]

        $sequence_30 = { 8b08 ff15???????? 488d15f3170100 488bcb }
            // n = 4, score = 100
            //   8b08                 | mov                 dword ptr [esp + 0x20], esi
            //   ff15????????         |                     
            //   488d15f3170100       | dec                 eax
            //   488bcb               | mov                 ebx, eax

        $sequence_31 = { 59 0010 d05900 1023 }
            // n = 4, score = 100
            //   59                   | pop                 ecx
            //   0010                 | add                 byte ptr [eax], dl
            //   d05900               | rcr                 byte ptr [ecx], 1
            //   1023                 | adc                 byte ptr [ebx], ah

        $sequence_32 = { 488d05ed360100 c3 4053 4883ec20 8b05???????? bb14000000 85c0 }
            // n = 7, score = 100
            //   488d05ed360100       | mov                 byte ptr [edx - 1], al
            //   c3                   | inc                 ecx
            //   4053                 | mov                 eax, edx
            //   4883ec20             | shr                 eax, cl
            //   8b05????????         |                     
            //   bb14000000           | mov                 byte ptr [edx + 3], al
            //   85c0                 | inc                 ebp

        $sequence_33 = { 488d05e9e9feff 4a8b84f8a02e0200 400f95c7 4503e4 }
            // n = 4, score = 100
            //   488d05e9e9feff       | mov                 ebp, dword ptr [esp + 4]
            //   4a8b84f8a02e0200     | inc                 ebp
            //   400f95c7             | lea                 ebp, [ebx + 0x10]
            //   4503e4               | inc                 esp

        $sequence_34 = { 4c8d6108 4d8b2c24 eb20 4c8d25a4c30000 488b0d???????? bf01000000 897c2460 }
            // n = 7, score = 100
            //   4c8d6108             | mov                 eax, edi
            //   4d8b2c24             | not                 ecx
            //   eb20                 | inc                 ecx
            //   4c8d25a4c30000       | ror                 eax, 0xb
            //   488b0d????????       |                     
            //   bf01000000           | je                  0x278
            //   897c2460             | dec                 eax

        $sequence_35 = { 8b442404 c7405030880010 c7401401000000 c3 56 57 ff15???????? }
            // n = 7, score = 100
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   c7405030880010       | mov                 dword ptr [eax + 0x50], 0x10008830
            //   c7401401000000       | mov                 dword ptr [eax + 0x14], 1
            //   c3                   | ret                 
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_36 = { e8???????? b9ff000000 e8???????? 488bfb 4803ff 4c8d2d25c70000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   b9ff000000           | mov                 ecx, dword ptr [edx + 0x50]
            //   e8????????           |                     
            //   488bfb               | mov                 dword ptr [esp + 4], esi
            //   4803ff               | inc                 ecx
            //   4c8d2d25c70000       | mov                 esi, dword ptr [edx + 0x60]

        $sequence_37 = { 488d4c2420 41b834020000 0f104540 488bd7 }
            // n = 4, score = 100
            //   488d4c2420           | mov                 ecx, edi
            //   41b834020000         | inc                 esi
            //   0f104540             | lea                 edi, [edx + eax]
            //   488bd7               | inc                 esp

        $sequence_38 = { 6a03 57 bf???????? 57 e8???????? 8d45fc }
            // n = 6, score = 100
            //   6a03                 | push                3
            //   57                   | push                edi
            //   bf????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_39 = { 03d1 8bcf 468d3c02 448bc7 f7d1 41c1c80b }
            // n = 6, score = 100
            //   03d1                 | mov                 ebp, edx
            //   8bcf                 | dec                 eax
            //   468d3c02             | mov                 dword ptr [esp + 0x30], 0
            //   448bc7               | inc                 ebp
            //   f7d1                 | lea                 eax, [ecx + 1]
            //   41c1c80b             | mov                 edx, 0x80000000

        $sequence_40 = { 458b4a50 89742404 418b7260 8b6c2404 458d6b10 448b1c24 }
            // n = 6, score = 100
            //   458b4a50             | dec                 eax
            //   89742404             | mov                 edx, edi
            //   418b7260             | dec                 esp
            //   8b6c2404             | lea                 esp, [ecx + 8]
            //   458d6b10             | dec                 ebp
            //   448b1c24             | mov                 ebp, dword ptr [esp]

        $sequence_41 = { 57 33ff 397d08 0f85a3010000 8b7510 53 817e0402010000 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   397d08               | cmp                 dword ptr [ebp + 8], edi
            //   0f85a3010000         | jne                 0x1a9
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   53                   | push                ebx
            //   817e0402010000       | cmp                 dword ptr [esi + 4], 0x102

        $sequence_42 = { 488d542440 4533c9 e8???????? 85c0 7403 894310 488b03 }
            // n = 7, score = 100
            //   488d542440           | mov                 ecx, 0x40
            //   4533c9               | dec                 ecx
            //   e8????????           |                     
            //   85c0                 | lea                 edx, [edi + 1]
            //   7403                 | dec                 esp
            //   894310               | mov                 ebp, eax
            //   488b03               | dec                 esp

        $sequence_43 = { 4533c9 488bea 48c744243000000000 458d4101 ba00000080 c744242820000000 }
            // n = 6, score = 100
            //   4533c9               | dec                 eax
            //   488bea               | test                eax, eax
            //   48c744243000000000     | je    0x54
            //   458d4101             | inc                 ebp
            //   ba00000080           | xor                 ecx, ecx
            //   c744242820000000     | dec                 eax

        $sequence_44 = { 0f8472020000 488b05???????? 488b15???????? 482bc2 }
            // n = 4, score = 100
            //   0f8472020000         | mov                 dword ptr [esp + 0x28], 0x20
            //   488b05????????       |                     
            //   488b15????????       |                     
            //   482bc2               | add                 edx, ecx

        $sequence_45 = { a3???????? 741e 68???????? 68???????? 50 e8???????? }
            // n = 6, score = 100
            //   a3????????           |                     
            //   741e                 | je                  0x20
            //   68????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 330752
}