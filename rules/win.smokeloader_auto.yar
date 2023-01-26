rule win_smokeloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.smokeloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.smokeloader"
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
        $sequence_0 = { ff15???????? 8d45f0 50 8d45e8 50 8d45e0 }
            // n = 6, score = 1300
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   8d45e0               | lea                 eax, [ebp - 0x20]

        $sequence_1 = { 50 8d45e0 50 56 ff15???????? 56 ff15???????? }
            // n = 7, score = 1100
            //   50                   | push                eax
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_2 = { ff15???????? 8bf0 8d45dc 50 6a00 53 }
            // n = 6, score = 1100
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   53                   | push                ebx

        $sequence_3 = { 57 ff15???????? 6a00 6800000002 6a03 6a00 6a03 }
            // n = 7, score = 1100
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6800000002           | push                0x2000000
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   6a03                 | push                3

        $sequence_4 = { 6a00 53 ff15???????? 8d45f0 }
            // n = 4, score = 1100
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_5 = { 0fb64405dc 50 8d45ec 50 }
            // n = 4, score = 900
            //   0fb64405dc           | mov                 ax, gs
            //   50                   | test                ax, ax
            //   8d45ec               | je                  0xb
            //   50                   | mov                 ax, gs

        $sequence_6 = { e8???????? 8bf0 8d45fc 50 ff75fc 56 6a19 }
            // n = 7, score = 900
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   56                   | push                esi
            //   6a19                 | push                0x19

        $sequence_7 = { 56 8d45fc 50 57 57 6a19 ff75f8 }
            // n = 7, score = 900
            //   56                   | push                esi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi
            //   57                   | push                edi
            //   6a19                 | push                0x19
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_8 = { 50 56 681f000f00 57 }
            // n = 4, score = 900
            //   50                   | lea                 eax, [ebp - 0x14]
            //   56                   | push                eax
            //   681f000f00           | mov                 esi, eax
            //   57                   | lea                 eax, [ebp - 4]

        $sequence_9 = { ff15???????? bf90010000 8bcf e8???????? }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   bf90010000           | mov                 edi, 0x190
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_10 = { 740a 83c104 83f920 72f0 }
            // n = 4, score = 900
            //   740a                 | test                ax, ax
            //   83c104               | je                  0xb
            //   83f920               | mov                 edi, eax
            //   72f0                 | lea                 eax, [ebp - 0x10]

        $sequence_11 = { 668ce8 6685c0 7406 fe05???????? }
            // n = 4, score = 900
            //   668ce8               | push                0
            //   6685c0               | push                ebx
            //   7406                 | push                edi
            //   fe05????????         |                     

        $sequence_12 = { 7507 33c0 e9???????? e8???????? b904010000 }
            // n = 5, score = 800
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e8????????           |                     
            //   b904010000           | mov                 ecx, 0x104

        $sequence_13 = { 8b07 03c3 50 ff15???????? }
            // n = 4, score = 800
            //   8b07                 | push                esi
            //   03c3                 | push                esi
            //   50                   | push                ebx
            //   ff15????????         |                     

        $sequence_14 = { e8???????? ff75f8 ff15???????? 5e 8bc7 5f }
            // n = 6, score = 800
            //   e8????????           |                     
            //   ff75f8               | push                edi
            //   ff15????????         |                     
            //   5e                   | push                edi
            //   8bc7                 | push                0x19
            //   5f                   | mov                 esi, eax

        $sequence_15 = { 56 ff15???????? 50 56 6a00 ff15???????? }
            // n = 6, score = 800
            //   56                   | push                0
            //   ff15????????         |                     
            //   50                   | push                0x2000000
            //   56                   | push                3
            //   6a00                 | push                ebx
            //   ff15????????         |                     

        $sequence_16 = { 8b37 eb03 8b773c 03f7 33c0 }
            // n = 5, score = 700
            //   8b37                 | push                0x19
            //   eb03                 | push                dword ptr [ebp - 8]
            //   8b773c               | mov                 esi, eax
            //   03f7                 | lea                 eax, [ebp - 4]
            //   33c0                 | push                eax

        $sequence_17 = { 0fb6c2 03f0 23f1 8a443418 }
            // n = 4, score = 700
            //   0fb6c2               | push                eax
            //   03f0                 | mov                 esi, eax
            //   23f1                 | lea                 eax, [ebp - 4]
            //   8a443418             | push                eax

        $sequence_18 = { 30042b 43 3b9c241c010000 72c0 5f 5e }
            // n = 6, score = 700
            //   30042b               | push                dword ptr [ebp - 4]
            //   43                   | push                esi
            //   3b9c241c010000       | push                0x19
            //   72c0                 | push                esi
            //   5f                   | lea                 eax, [ebp - 4]
            //   5e                   | push                eax

        $sequence_19 = { 8d85f0fdffff 8b750c 8b7d10 50 }
            // n = 4, score = 500
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   50                   | push                eax

        $sequence_20 = { c70200000000 6800800000 52 51 }
            // n = 4, score = 500
            //   c70200000000         | mov                 dword ptr [edx], 0
            //   6800800000           | push                0x8000
            //   52                   | push                edx
            //   51                   | push                ecx

        $sequence_21 = { 8d8decfdffff 8d95f0fdffff c70200000000 6800800000 }
            // n = 4, score = 500
            //   8d8decfdffff         | lea                 ecx, [ebp - 0x214]
            //   8d95f0fdffff         | lea                 edx, [ebp - 0x210]
            //   c70200000000         | mov                 dword ptr [edx], 0
            //   6800800000           | push                0x8000

        $sequence_22 = { e8???????? 2500300038 005800 2500300038 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   2500300038           | and                 eax, 0x38003000
            //   005800               | add                 byte ptr [eax], bl
            //   2500300038           | and                 eax, 0x38003000

        $sequence_23 = { 8db5f8fdffff c60653 56 6a00 }
            // n = 4, score = 500
            //   8db5f8fdffff         | lea                 esi, [ebp - 0x208]
            //   c60653               | mov                 byte ptr [esi], 0x53
            //   56                   | push                esi
            //   6a00                 | push                0

        $sequence_24 = { 89c6 6804010000 56 57 }
            // n = 4, score = 500
            //   89c6                 | mov                 esi, eax
            //   6804010000           | push                0x104
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_25 = { 31c0 66894603 8d8de8fdffff 50 50 50 }
            // n = 6, score = 500
            //   31c0                 | xor                 eax, eax
            //   66894603             | mov                 word ptr [esi + 3], ax
            //   8d8de8fdffff         | lea                 ecx, [ebp - 0x218]
            //   50                   | push                eax
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_26 = { 53 e8???????? 8d8decfdffff 8d95f0fdffff }
            // n = 4, score = 500
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8d8decfdffff         | lea                 ecx, [ebp - 0x214]
            //   8d95f0fdffff         | lea                 edx, [ebp - 0x210]

        $sequence_27 = { 30d0 aa e2f3 7505 }
            // n = 4, score = 400
            //   30d0                 | xor                 al, dl
            //   aa                   | stosb               byte ptr es:[edi], al
            //   e2f3                 | loop                0xfffffff5
            //   7505                 | jne                 7

        $sequence_28 = { fc 5f 5e 5b }
            // n = 4, score = 400
            //   fc                   | ficomp              word ptr [ecx + 0x299dd855]
            //   5f                   | pop                 edx
            //   5e                   | fcomp               dword ptr [ebp - 0x642b8ad7]
            //   5b                   | insb                byte ptr es:[edi], dx

        $sequence_29 = { 55 89e5 81ec5c060000 53 56 }
            // n = 5, score = 400
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   81ec5c060000         | sub                 esp, 0x65c
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_30 = { 60 89c6 89cf fc b280 31db }
            // n = 6, score = 400
            //   60                   | push                0x19
            //   89c6                 | push                esi
            //   89cf                 | lea                 eax, [ebp - 4]
            //   fc                   | push                eax
            //   b280                 | push                edi
            //   31db                 | push                edi

        $sequence_31 = { 4903d9 4c2bd8 8b4b01 418a0413 41ba04000000 }
            // n = 5, score = 300
            //   4903d9               | dec                 eax
            //   4c2bd8               | arpl                ax, cx
            //   8b4b01               | dec                 ecx
            //   418a0413             | cmp                 ecx, eax
            //   41ba04000000         | jb                  0xfffffff3

        $sequence_32 = { c1e205 01c2 31c0 ac 01c2 }
            // n = 5, score = 300
            //   c1e205               | shl                 edx, 5
            //   01c2                 | add                 edx, eax
            //   31c0                 | xor                 eax, eax
            //   ac                   | lodsb               al, byte ptr [esi]
            //   01c2                 | add                 edx, eax

        $sequence_33 = { 4c 01c7 8b048f 4c 01c0 }
            // n = 5, score = 300
            //   4c                   | dec                 esp
            //   01c7                 | add                 edi, eax
            //   8b048f               | mov                 eax, dword ptr [edi + ecx*4]
            //   4c                   | dec                 esp
            //   01c0                 | add                 eax, eax

        $sequence_34 = { 49 8d3c8c 8b37 4c 01c6 }
            // n = 5, score = 300
            //   49                   | dec                 ecx
            //   8d3c8c               | lea                 edi, [esp + ecx*4]
            //   8b37                 | mov                 esi, dword ptr [edi]
            //   4c                   | dec                 esp
            //   01c6                 | add                 esi, eax

        $sequence_35 = { ff15???????? 8be8 85c0 7e5a ffc0 4863c8 e8???????? }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   8be8                 | xor                 eax, eax
            //   85c0                 | mov                 edx, 0x40000000
            //   7e5a                 | mov                 dword ptr [esp + 0x28], 0x80
            //   ffc0                 | mov                 dword ptr [esp + 0x20], 2
            //   4863c8               | dec                 esp
            //   e8????????           |                     

        $sequence_36 = { ac 01c2 85c0 75f0 }
            // n = 4, score = 300
            //   ac                   | lodsb               al, byte ptr [esi]
            //   01c2                 | add                 edx, eax
            //   85c0                 | test                eax, eax
            //   75f0                 | jne                 0xfffffff2

        $sequence_37 = { 4533c0 ba00000040 c744242880000000 c744242002000000 ff15???????? 4c8be8 }
            // n = 6, score = 300
            //   4533c0               | inc                 esp
            //   ba00000040           | mov                 dword ptr [esp + 0x20], eax
            //   c744242880000000     | dec                 esp
            //   c744242002000000     | lea                 eax, [esp + 0x40]
            //   ff15????????         |                     
            //   4c8be8               | inc                 ebp

        $sequence_38 = { 4533c9 ba000000c0 488bcf c744242800000002 4489442420 ff15???????? 4c8d442440 }
            // n = 7, score = 300
            //   4533c9               | inc                 ebp
            //   ba000000c0           | xor                 ecx, ecx
            //   488bcf               | mov                 edx, 0xc0000000
            //   c744242800000002     | dec                 eax
            //   4489442420           | mov                 ecx, edi
            //   ff15????????         |                     
            //   4c8d442440           | mov                 dword ptr [esp + 0x28], 0x2000000

        $sequence_39 = { 41 8b7b24 4c 01c7 668b0c4f 41 }
            // n = 6, score = 300
            //   41                   | inc                 ecx
            //   8b7b24               | mov                 edi, dword ptr [ebx + 0x24]
            //   4c                   | dec                 esp
            //   01c7                 | add                 edi, eax
            //   668b0c4f             | mov                 cx, word ptr [edi + ecx*2]
            //   41                   | inc                 ecx

        $sequence_40 = { 4f 8d1c10 41 8b4b18 45 }
            // n = 5, score = 300
            //   4f                   | dec                 edi
            //   8d1c10               | lea                 ebx, [eax + edx]
            //   41                   | inc                 ecx
            //   8b4b18               | mov                 ecx, dword ptr [ebx + 0x18]
            //   45                   | inc                 ebp

        $sequence_41 = { 493bc8 72f1 881a 4885ff 7430 488b05???????? }
            // n = 6, score = 300
            //   493bc8               | mov                 ebp, eax
            //   72f1                 | mov                 ebp, eax
            //   881a                 | test                eax, eax
            //   4885ff               | jle                 0x5e
            //   7430                 | inc                 eax
            //   488b05????????       |                     

        $sequence_42 = { 55 89e5 81ec54040000 53 }
            // n = 4, score = 300
            //   55                   | mov                 dword ptr [ecx + 8], edx
            //   89e5                 | mov                 eax, dword ptr [ebp - 0x10]
            //   81ec54040000         | mov                 ecx, dword ptr [eax + 0xc]
            //   53                   | mov                 dword ptr [ebp - 0x78], ecx

        $sequence_43 = { 895148 689d1e6b63 8b45e4 50 e8???????? 8945b4 8b4da0 }
            // n = 7, score = 200
            //   895148               | mov                 dword ptr [edx], 0
            //   689d1e6b63           | push                0x8000
            //   8b45e4               | push                edx
            //   50                   | lea                 ecx, [ebp - 0x214]
            //   e8????????           |                     
            //   8945b4               | lea                 edx, [ebp - 0x210]
            //   8b4da0               | mov                 dword ptr [edx], 0

        $sequence_44 = { 8b55d8 895108 8b45f0 8b480c 894d88 }
            // n = 5, score = 200
            //   8b55d8               | push                eax
            //   895108               | mov                 dword ptr [ebp - 0x84], eax
            //   8b45f0               | mov                 ecx, dword ptr [ebp - 0x60]
            //   8b480c               | mov                 edx, dword ptr [ebp - 0x84]
            //   894d88               | mov                 dword ptr [ecx + 0x64], edx

        $sequence_45 = { 31c9 c1c108 3208 40 803800 75f5 }
            // n = 6, score = 200
            //   31c9                 | push                edi
            //   c1c108               | jne                 0xffffffee
            //   3208                 | pop                 eax
            //   40                   | sub                 esi, eax
            //   803800               | shr                 esi, 1
            //   75f5                 | add                 esi, dword ptr [edi + 0x24]

        $sequence_46 = { 6a04 8d45b4 50 6a09 8b4dac 51 e8???????? }
            // n = 7, score = 200
            //   6a04                 | mov                 dword ptr [ebp - 0x78], ecx
            //   8d45b4               | mov                 ecx, dword ptr [ebp - 8]
            //   50                   | mov                 eax, dword ptr [ecx + 2]
            //   6a09                 | sub                 eax, 0x34bf10
            //   8b4dac               | mov                 edx, dword ptr [ebp - 8]
            //   51                   | movzx               ecx, word ptr [edx]
            //   e8????????           |                     

        $sequence_47 = { 5b c9 c20800 55 89e5 83ec04 }
            // n = 6, score = 200
            //   5b                   | push                ebp
            //   c9                   | mov                 ebp, esp
            //   c20800               | sub                 esp, 0x454
            //   55                   | ret                 0x10
            //   89e5                 | push                ebp
            //   83ec04               | mov                 ebp, esp

        $sequence_48 = { 75ec 58 29c6 d1ee 037724 0fb7442efe }
            // n = 6, score = 200
            //   75ec                 | movsb               byte ptr es:[edi], byte ptr [esi]
            //   58                   | mov                 esi, eax
            //   29c6                 | mov                 edi, ecx
            //   d1ee                 | cld                 
            //   037724               | mov                 dl, 0x80
            //   0fb7442efe           | mov                 esi, eax

        $sequence_49 = { 83c4d0 1e 53 56 57 }
            // n = 5, score = 200
            //   83c4d0               | mov                 esi, eax
            //   1e                   | mov                 edi, ecx
            //   53                   | cld                 
            //   56                   | mov                 dl, 0x80
            //   57                   | xor                 ebx, ebx

        $sequence_50 = { 8946fc ad 85c0 75f3 }
            // n = 4, score = 200
            //   8946fc               | add                 esi, dword ptr [edi + 0x24]
            //   ad                   | movzx               eax, word ptr [esi + ebp - 2]
            //   85c0                 | shl                 eax, 2
            //   75f3                 | xor                 ecx, ecx

        $sequence_51 = { aa e2f3 7506 7404 }
            // n = 4, score = 200
            //   aa                   | sub                 esp, 0x454
            //   e2f3                 | ret                 0x10
            //   7506                 | push                ebp
            //   7404                 | mov                 ebp, esp

        $sequence_52 = { 8b4df8 8b4102 2d10bf3400 8b55f8 0fb70a }
            // n = 5, score = 200
            //   8b4df8               | mov                 eax, dword ptr [ebp - 0x28]
            //   8b4102               | push                eax
            //   2d10bf3400           | mov                 dword ptr [ebp - 0x74], 0
            //   8b55f8               | jmp                 0x13
            //   0fb70a               | mov                 ecx, dword ptr [ebp - 0x74]

        $sequence_53 = { 01ee 56 ad 01e8 }
            // n = 4, score = 200
            //   01ee                 | push                ebx
            //   56                   | pop                 eax
            //   ad                   | sub                 esi, eax
            //   01e8                 | shr                 esi, 1

        $sequence_54 = { 01e8 5e c3 60 89c6 }
            // n = 5, score = 200
            //   01e8                 | xor                 ecx, ecx
            //   5e                   | shl                 eax, 2
            //   c3                   | add                 eax, dword ptr [edi + 0x1c]
            //   60                   | mov                 eax, dword ptr [eax + ebp]
            //   89c6                 | add                 eax, ebp

        $sequence_55 = { 0fb7442efe c1e002 03471c 8b0428 }
            // n = 4, score = 200
            //   0fb7442efe           | movzx               eax, word ptr [esi + ebp - 2]
            //   c1e002               | mov                 ebp, esp
            //   03471c               | add                 esp, -0x30
            //   8b0428               | push                ds

        $sequence_56 = { 8b4da0 8b5598 895160 6876b8f3c1 }
            // n = 4, score = 200
            //   8b4da0               | add                 ecx, 1
            //   8b5598               | mov                 ebp, esp
            //   895160               | sub                 esp, 0xc
            //   6876b8f3c1           | mov                 dword ptr [ebp - 8], eax

        $sequence_57 = { 8bec 83ec0c e8???????? 8945f8 8b45f8 8b486c 894df4 }
            // n = 7, score = 200
            //   8bec                 | mov                 dword ptr [ecx + 0x48], edx
            //   83ec0c               | push                0x636b1e9d
            //   e8????????           |                     
            //   8945f8               | mov                 eax, dword ptr [ebp - 0x1c]
            //   8b45f8               | push                eax
            //   8b486c               | mov                 dword ptr [ebp - 0x4c], eax
            //   894df4               | mov                 ecx, dword ptr [ebp - 0x60]

        $sequence_58 = { 8b45d8 50 e8???????? c7458c00000000 eb09 8b4d8c 83c101 }
            // n = 7, score = 200
            //   8b45d8               | push                eax
            //   50                   | push                eax
            //   e8????????           |                     
            //   c7458c00000000       | push                ecx
            //   eb09                 | push                eax
            //   8b4d8c               | push                eax
            //   83c101               | push                esi

        $sequence_59 = { 50 e8???????? 89857cffffff 8b4da0 8b957cffffff 895164 }
            // n = 6, score = 200
            //   50                   | push                0x8000
            //   e8????????           |                     
            //   89857cffffff         | push                edx
            //   8b4da0               | push                ecx
            //   8b957cffffff         | push                -1
            //   895164               | push                eax

        $sequence_60 = { d89d2975d49b 6c 9d 0d0d0d3759 }
            // n = 4, score = 100
            //   d89d2975d49b         | xor                 al, dl
            //   6c                   | stosb               byte ptr es:[edi], al
            //   9d                   | loop                0xfffffff6
            //   0d0d0d3759           | jne                 0xb

        $sequence_61 = { 19d4 1b550b a2???????? 29a5375d37a2 a2???????? }
            // n = 5, score = 100
            //   19d4                 | ret                 8
            //   1b550b               | push                ebp
            //   a2????????           |                     
            //   29a5375d37a2         | mov                 ebp, esp
            //   a2????????           |                     

        $sequence_62 = { 5d 5d 5d de9955d89d29 5a }
            // n = 5, score = 100
            //   5d                   | sub                 esp, 4
            //   5d                   | stosb               byte ptr es:[edi], al
            //   5d                   | loop                0xfffffff5
            //   de9955d89d29         | jne                 0xa
            //   5a                   | je                  0xa

        $sequence_63 = { 145d 0e 5d 095d0f }
            // n = 4, score = 100
            //   145d                 | pop                 ecx
            //   0e                   | pop                 ebp
            //   5d                   | mov                 dh, 0x58
            //   095d0f               | push                ecx

        $sequence_64 = { 59 5d b658 51 635c4dc8 }
            // n = 5, score = 100
            //   59                   | loop                0xfffffff5
            //   5d                   | jne                 0xa
            //   b658                 | je                  0xa
            //   51                   | pop                 ebx
            //   635c4dc8             | leave               

    condition:
        7 of them and filesize < 245760
}