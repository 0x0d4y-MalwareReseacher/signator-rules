rule win_disttrack_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.disttrack."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.disttrack"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { ff15???????? 8d45dc 50 ff15???????? 8b4ddc }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   8d45dc               | mov                 dl, ch
            //   50                   | shr                 dl, 4
            //   ff15????????         |                     
            //   8b4ddc               | cmp                 eax, ebx

        $sequence_1 = { e8???????? 83c404 50 e8???????? 83c404 68???????? ff15???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | je                  0x75
            //   50                   | push                0x800
            //   e8????????           |                     
            //   83c404               | mov                 esi, eax
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_2 = { ff15???????? 5d 5b 8bc7 5f 5e }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   5d                   | je                  0xffffffe1
            //   5b                   | mov                 eax, dword ptr [eax + ecx]
            //   8bc7                 | mov                 dword ptr [esp + 0x80], eax
            //   5f                   | mov                 dword ptr [esp + 0x58], ebx
            //   5e                   | mov                 dword ptr [esp + 0x68], ebx

        $sequence_3 = { 58 5e 5d c3 6a0c 68???????? }
            // n = 6, score = 200
            //   58                   | dec                 eax
            //   5e                   | sar                 eax, 3
            //   5d                   | dec                 eax
            //   c3                   | cmp                 eax, edx
            //   6a0c                 | jae                 0x9f
            //   68????????           |                     

        $sequence_4 = { 52 6a00 6a00 6848000700 }
            // n = 4, score = 200
            //   52                   | mov                 dword ptr [esp + 0x78], ebx
            //   6a00                 | mov                 dword ptr [esp + 0x54], ebx
            //   6a00                 | inc                 dword ptr [esp + 0x10]
            //   6848000700           | cmp                 byte ptr [esp + 0xf], 0

        $sequence_5 = { 57 e8???????? 6a07 e8???????? 59 c3 6a10 }
            // n = 7, score = 200
            //   57                   | xor                 ebx, ebx
            //   e8????????           |                     
            //   6a07                 | dec                 eax
            //   e8????????           |                     
            //   59                   | mov                 dword ptr [esp + 0x58], ebx
            //   c3                   | dec                 eax
            //   6a10                 | test                edx, edx

        $sequence_6 = { 57 e8???????? 39bc2498000000 0f845a010000 8b44242c 8b4004 f644043801 }
            // n = 7, score = 100
            //   57                   | pop                 edi
            //   e8????????           |                     
            //   39bc2498000000       | pop                 esi
            //   0f845a010000         | push                edx
            //   8b44242c             | push                0
            //   8b4004               | push                0
            //   f644043801           | push                0x70048

        $sequence_7 = { eb54 488b8130010000 4885c0 7403 f0ff08 488d0577f50000 be01000000 }
            // n = 7, score = 100
            //   eb54                 | jmp                 0x56
            //   488b8130010000       | dec                 eax
            //   4885c0               | mov                 eax, dword ptr [ecx + 0x130]
            //   7403                 | dec                 eax
            //   f0ff08               | test                eax, eax
            //   488d0577f50000       | je                  8
            //   be01000000           | lock dec            dword ptr [eax]

        $sequence_8 = { 33d2 75fc eb0d ff15???????? 8945bc }
            // n = 5, score = 100
            //   33d2                 | pop                 edi
            //   75fc                 | pop                 esi
            //   eb0d                 | add                 esp, 4
            //   ff15????????         |                     
            //   8945bc               | push                eax

        $sequence_9 = { 48c1f803 483bc2 0f8399000000 33db 48895c2458 4885d2 }
            // n = 6, score = 100
            //   48c1f803             | add                 eax, 0x14
            //   483bc2               | mov                 dword ptr [eax], ebx
            //   0f8399000000         | dec                 esp
            //   33db                 | lea                 edx, [0x14cb7]
            //   48895c2458           | dec                 eax
            //   4885d2               | test                eax, eax

        $sequence_10 = { 4883c014 8918 e8???????? 4c8d15b74c0100 4885c0 7404 }
            // n = 6, score = 100
            //   4883c014             | sub                 edx, ecx
            //   8918                 | inc                 esp
            //   e8????????           |                     
            //   4c8d15b74c0100       | movzx               esp, word ptr [ebp - 0x2a]
            //   4885c0               | movzx               edi, word ptr [ebp - 0x2e]
            //   7404                 | inc                 esp

        $sequence_11 = { ff442410 e9???????? 807c240f00 741a ff15???????? }
            // n = 5, score = 100
            //   ff442410             | pop                 ebp
            //   e9????????           |                     
            //   807c240f00           | ret                 
            //   741a                 | push                0xc
            //   ff15????????         |                     

        $sequence_12 = { 498bcc e8???????? 488d3d77570100 488bcf e8???????? 488d8de0070000 488bd7 }
            // n = 7, score = 100
            //   498bcc               | cmp                 dword ptr [edi - 0x10], eax
            //   e8????????           |                     
            //   488d3d77570100       | je                  0x18
            //   488bcf               | dec                 eax
            //   e8????????           |                     
            //   488d8de0070000       | mov                 ecx, dword ptr [edi]
            //   488bd7               | dec                 eax

        $sequence_13 = { be06000000 488d0579200100 483947f0 7412 488b0f 4885c9 740a }
            // n = 7, score = 100
            //   be06000000           | movzx               ebp, word ptr [ebp - 0x30]
            //   488d0579200100       | dec                 eax
            //   483947f0             | lea                 ecx, [ebp - 0x20]
            //   7412                 | inc                 sp
            //   488b0f               | cmp                 dword ptr [ebp - 0x20], ebp
            //   4885c9               | jb                  0x61
            //   740a                 | dec                 eax

        $sequence_14 = { 5f 8be5 5d c20400 6a01 53 e8???????? }
            // n = 7, score = 100
            //   5f                   | push                eax
            //   8be5                 | add                 esp, 4
            //   5d                   | lea                 eax, [ebp - 0x24]
            //   c20400               | push                eax
            //   6a01                 | mov                 ecx, dword ptr [ebp - 0x24]
            //   53                   | add                 esp, 4
            //   e8????????           |                     

        $sequence_15 = { 7cde 8b4df8 8b5df4 8ac1 02c0 8ad5 c0ea04 }
            // n = 7, score = 100
            //   7cde                 | jmp                 0xffffffb4
            //   8b4df8               | push                0x16
            //   8b5df4               | pop                 eax
            //   8ac1                 | pop                 esi
            //   02c0                 | pop                 ebp
            //   8ad5                 | ret                 
            //   c0ea04               | push                0xc

        $sequence_16 = { e8???????? 59 ebcf 8bc6 c1f805 8b0485a08d4200 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   59                   | push                eax
            //   ebcf                 | lea                 eax, [ebp - 0x24]
            //   8bc6                 | push                eax
            //   c1f805               | mov                 ecx, dword ptr [ebp - 0x24]
            //   8b0485a08d4200       | add                 esp, 4

        $sequence_17 = { 440fb765d6 0fb77dd2 440fb76dd0 488d4de0 ff15???????? 6644396de0 724d }
            // n = 7, score = 100
            //   440fb765d6           | dec                 esp
            //   0fb77dd2             | mov                 ecx, ecx
            //   440fb76dd0           | inc                 ebp
            //   488d4de0             | test                eax, eax
            //   ff15????????         |                     
            //   6644396de0           | je                  0x1c
            //   724d                 | dec                 eax

        $sequence_18 = { c1f905 8b0c8d40174200 83e01f c1e006 f644080401 74cd 8b0408 }
            // n = 7, score = 100
            //   c1f905               | pop                 esi
            //   8b0c8d40174200       | pop                 ebp
            //   83e01f               | ret                 
            //   c1e006               | push                0xc
            //   f644080401           | pop                 eax
            //   74cd                 | pop                 esi
            //   8b0408               | pop                 ebp

        $sequence_19 = { 02d3 8a5dfe 80e33f c0e802 }
            // n = 4, score = 100
            //   02d3                 | push                7
            //   8a5dfe               | pop                 ecx
            //   80e33f               | ret                 
            //   c0e802               | push                0x10

        $sequence_20 = { 3bc3 7473 6800080000 e8???????? 8bf0 83c404 }
            // n = 6, score = 100
            //   3bc3                 | push                7
            //   7473                 | pop                 ecx
            //   6800080000           | ret                 
            //   e8????????           |                     
            //   8bf0                 | push                0x10
            //   83c404               | pop                 eax

        $sequence_21 = { 458d4101 c744242800001000 c744242003000000 ff15???????? 4883f8ff 740d }
            // n = 6, score = 100
            //   458d4101             | je                  0x10
            //   c744242800001000     | mov                 esi, 6
            //   c744242003000000     | dec                 eax
            //   ff15????????         |                     
            //   4883f8ff             | lea                 eax, [0x12079]
            //   740d                 | dec                 eax

        $sequence_22 = { 7423 4885d2 741e 4c8bc9 4585c0 7412 482bd1 }
            // n = 7, score = 100
            //   7423                 | dec                 eax
            //   4885d2               | lea                 eax, [0xf577]
            //   741e                 | mov                 esi, 1
            //   4c8bc9               | je                  0x25
            //   4585c0               | dec                 eax
            //   7412                 | test                edx, edx
            //   482bd1               | je                  0x20

        $sequence_23 = { 89842480000000 895c2458 895c2468 895c2478 895c2454 }
            // n = 5, score = 100
            //   89842480000000       | ret                 
            //   895c2458             | push                0xc
            //   895c2468             | push                0x16
            //   895c2478             | pop                 eax
            //   895c2454             | pop                 esi

        $sequence_24 = { 8d42e0 6683f858 770f 0fb7c2 0fbe8050ff4100 }
            // n = 5, score = 100
            //   8d42e0               | push                eax
            //   6683f858             | add                 esp, 4
            //   770f                 | pop                 ebp
            //   0fb7c2               | pop                 ebx
            //   0fbe8050ff4100       | mov                 eax, edi

        $sequence_25 = { 8b4508 0345d8 50 8b4dcc 51 }
            // n = 5, score = 100
            //   8b4508               | push                0xc
            //   0345d8               | push                ebx
            //   50                   | pop                 ebp
            //   8b4dcc               | pop                 ebx
            //   51                   | mov                 eax, edi

    condition:
        7 of them and filesize < 1112064
}