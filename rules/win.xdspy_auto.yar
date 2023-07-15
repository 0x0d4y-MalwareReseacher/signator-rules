rule win_xdspy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.xdspy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xdspy"
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
        $sequence_0 = { 7cf1 53 50 8d85ecd8ffff 6a01 }
            // n = 5, score = 200
            //   7cf1                 | dec                 eax
            //   53                   | lea                 edx, [0x172d64]
            //   50                   | dec                 eax
            //   8d85ecd8ffff         | lea                 ecx, [0x173049]
            //   6a01                 | inc                 edx

        $sequence_1 = { 50 e8???????? 59 57 8d45a8 50 }
            // n = 6, score = 200
            //   50                   | lea                 eax, [eax + esi + 4]
            //   e8????????           |                     
            //   59                   | and                 byte ptr [eax], 0xfd
            //   57                   | mov                 eax, edi
            //   8d45a8               | push                eax
            //   50                   | add                 esp, 0x14

        $sequence_2 = { 83c40c 6bc930 8975e0 8db1000c4100 8975e4 }
            // n = 5, score = 200
            //   83c40c               | inc                 edi
            //   6bc930               | cmp                 edi, ebx
            //   8975e0               | jl                  0xffffffda
            //   8db1000c4100         | lea                 eax, [ebp - 0x13f0]
            //   8975e4               | mov                 esi, dword ptr [edi*4 + 0x414e80]

        $sequence_3 = { 50 e8???????? 83c414 47 3bfb 7cd1 8d8510ecffff }
            // n = 7, score = 200
            //   50                   | mov                 cx, word ptr [ebx + eax*2 + 0x10]
            //   e8????????           |                     
            //   83c414               | mov                 word ptr [eax*2 + 0x414d30], cx
            //   47                   | inc                 eax
            //   3bfb                 | jmp                 0xfffffffa
            //   7cd1                 | jl                  0xfffffff3
            //   8d8510ecffff         | push                ebx

        $sequence_4 = { 7d10 668b4c4310 66890c45304d4100 40 ebe8 }
            // n = 5, score = 200
            //   7d10                 | cmp                 byte ptr [esp + 0x30], bh
            //   668b4c4310           | je                  0x1b
            //   66890c45304d4100     | nop                 word ptr [eax + eax]
            //   40                   | dec                 byte ptr [eax]
            //   ebe8                 | je                  0x22b

        $sequence_5 = { e8???????? 81c59c550000 c9 c21000 ff25???????? ff25???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   81c59c550000         | mov                 eax, dword ptr [eax*4 + 0x414e80]
            //   c9                   | and                 esi, 0x1f
            //   c21000               | shl                 esi, 6
            //   ff25????????         |                     
            //   ff25????????         |                     

        $sequence_6 = { 8b34bd804e4100 85f6 0f84ba000000 8975e0 }
            // n = 4, score = 200
            //   8b34bd804e4100       | push                eax
            //   85f6                 | lea                 eax, [ebp - 0x2714]
            //   0f84ba000000         | push                1
            //   8975e0               | sar                 eax, 5

        $sequence_7 = { c1f805 8b0485804e4100 83e61f c1e606 8d443004 8020fd 8bc7 }
            // n = 7, score = 200
            //   c1f805               | movzx               eax, byte ptr [ecx + ebp + 0x210a8]
            //   8b0485804e4100       | sub                 al, 0x45
            //   83e61f               | inc                 edx
            //   c1e606               | mov                 byte ptr [ecx + ebp + 0x17a6f8], al
            //   8d443004             | dec                 eax
            //   8020fd               | inc                 ecx
            //   8bc7                 | jge                 0x12

        $sequence_8 = { f30f6f05???????? 488bcf 4c8d0558371700 488bd3 660ff805???????? }
            // n = 5, score = 100
            //   f30f6f05????????     |                     
            //   488bcf               | dec                 eax
            //   4c8d0558371700       | mov                 ecx, edi
            //   488bd3               | dec                 esp
            //   660ff805????????     |                     

        $sequence_9 = { 488d8d90140000 ff15???????? 4885c0 7412 }
            // n = 4, score = 100
            //   488d8d90140000       | lea                 ecx, [0x1733a0]
            //   ff15????????         |                     
            //   4885c0               | dec                 eax
            //   7412                 | lea                 ecx, [ecx + 1]

        $sequence_10 = { c705????????67646d70 488d0da0331700 66c705????????7466 c705????????6e747764 c705????????73752f65 }
            // n = 5, score = 100
            //   c705????????67646d70     |     
            //   488d0da0331700       | lea                 eax, [ebp + 0x1360]
            //   66c705????????7466     |     
            //   c705????????6e747764     |     
            //   c705????????73752f65     |     

        $sequence_11 = { 0f8425020000 48631d???????? 488d15642d1700 488d0d49301700 c705????????6778736a }
            // n = 5, score = 100
            //   0f8425020000         | lea                 ecx, [ebp + 0x1490]
            //   48631d????????       |                     
            //   488d15642d1700       | dec                 eax
            //   488d0d49301700       | test                eax, eax
            //   c705????????6778736a     |     

        $sequence_12 = { 44387c2430 7414 660f1f840000000000 fe08 }
            // n = 4, score = 100
            //   44387c2430           | cmp                 byte ptr [ebp + 0x2660], 0
            //   7414                 | dec                 eax
            //   660f1f840000000000     | lea    eax, [ebp + 0x2660]
            //   fe08                 | dec                 eax

        $sequence_13 = { 488d8560130000 4038bd60130000 7414 660f1f840000000000 }
            // n = 4, score = 100
            //   488d8560130000       | lea                 eax, [0x173758]
            //   4038bd60130000       | dec                 eax
            //   7414                 | mov                 edx, ebx
            //   660f1f840000000000     | dec    eax

        $sequence_14 = { 488d4901 84c0 75e8 80bd6026000000 488d8560260000 }
            // n = 5, score = 100
            //   488d4901             | inc                 eax
            //   84c0                 | cmp                 byte ptr [ebp + 0x1360], bh
            //   75e8                 | je                  0x16
            //   80bd6026000000       | nop                 word ptr [eax + eax]
            //   488d8560260000       | dec                 eax

        $sequence_15 = { c705????????73752f65 66c705????????6d6d 0f1f440000 0fb6843148991700 }
            // n = 4, score = 100
            //   c705????????73752f65     |     
            //   66c705????????6d6d     |     
            //   0f1f440000           | test                al, al
            //   0fb6843148991700     | jne                 0xfffffff0

    condition:
        7 of them and filesize < 3244032
}