rule win_qakbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.qakbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.qakbot"
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
        $sequence_0 = { 33c0 7402 ebfa e8???????? }
            // n = 4, score = 15300
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4
            //   ebfa                 | jmp                 0xfffffffc
            //   e8????????           |                     

        $sequence_1 = { 7402 ebfa 33c0 7402 }
            // n = 4, score = 15200
            //   7402                 | je                  4
            //   ebfa                 | jmp                 0xfffffffc
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_2 = { 7402 ebfa eb06 33c0 7402 }
            // n = 5, score = 14800
            //   7402                 | je                  4
            //   ebfa                 | jmp                 0xfffffffc
            //   eb06                 | jmp                 8
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_3 = { eb13 e8???????? 33c9 85c0 }
            // n = 4, score = 14700
            //   eb13                 | jmp                 0x15
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   85c0                 | test                eax, eax

        $sequence_4 = { 50 e8???????? 8b06 47 59 }
            // n = 5, score = 14300
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   47                   | inc                 edi
            //   59                   | pop                 ecx

        $sequence_5 = { 8d45fc 6aff 50 e8???????? }
            // n = 4, score = 14000
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_6 = { e8???????? 59 59 33c0 7402 }
            // n = 5, score = 13800
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_7 = { 59 59 6afb e9???????? }
            // n = 4, score = 13700
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   6afb                 | push                -5
            //   e9????????           |                     

        $sequence_8 = { 50 8d8534f6ffff 6a00 50 }
            // n = 4, score = 13600
            //   50                   | push                eax
            //   8d8534f6ffff         | lea                 eax, [ebp - 0x9cc]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_9 = { 740d 8d45fc 6a00 50 }
            // n = 4, score = 13600
            //   740d                 | je                  0xf
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_10 = { 8945fc e8???????? 8bf0 8d45fc 50 e8???????? }
            // n = 6, score = 13400
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_11 = { 33c0 e9???????? 33c0 7402 }
            // n = 4, score = 13200
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_12 = { 8975f8 8975f0 8975f4 e8???????? }
            // n = 4, score = 13100
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   e8????????           |                     

        $sequence_13 = { 7402 ebfa e9???????? 6a00 }
            // n = 4, score = 13000
            //   7402                 | je                  4
            //   ebfa                 | jmp                 0xfffffffc
            //   e9????????           |                     
            //   6a00                 | push                0

        $sequence_14 = { eb0b c644301c00 ff465c 8b465c 83f840 7cf0 }
            // n = 6, score = 12900
            //   eb0b                 | jmp                 0xd
            //   c644301c00           | mov                 byte ptr [eax + esi + 0x1c], 0
            //   ff465c               | inc                 dword ptr [esi + 0x5c]
            //   8b465c               | mov                 eax, dword ptr [esi + 0x5c]
            //   83f840               | cmp                 eax, 0x40
            //   7cf0                 | jl                  0xfffffff2

        $sequence_15 = { c644301c00 ff465c 8b465c 83f838 7cf0 8a461b }
            // n = 6, score = 12900
            //   c644301c00           | mov                 byte ptr [eax + esi + 0x1c], 0
            //   ff465c               | inc                 dword ptr [esi + 0x5c]
            //   8b465c               | mov                 eax, dword ptr [esi + 0x5c]
            //   83f838               | cmp                 eax, 0x38
            //   7cf0                 | jl                  0xfffffff2
            //   8a461b               | mov                 al, byte ptr [esi + 0x1b]

        $sequence_16 = { 837e5c38 7cef eb10 c644301c00 }
            // n = 4, score = 12900
            //   837e5c38             | cmp                 dword ptr [esi + 0x5c], 0x38
            //   7cef                 | jl                  0xfffffff1
            //   eb10                 | jmp                 0x12
            //   c644301c00           | mov                 byte ptr [eax + esi + 0x1c], 0

        $sequence_17 = { e8???????? 8d45f4 6aff 50 }
            // n = 4, score = 12700
            //   e8????????           |                     
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   6aff                 | push                -1
            //   50                   | push                eax

        $sequence_18 = { e8???????? 83c410 33c0 7402 }
            // n = 4, score = 12700
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_19 = { 85c0 750a 33c0 7402 }
            // n = 4, score = 12600
            //   85c0                 | test                eax, eax
            //   750a                 | jne                 0xc
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_20 = { 7507 c7466401000000 83f840 7507 }
            // n = 4, score = 12300
            //   7507                 | jne                 9
            //   c7466401000000       | mov                 dword ptr [esi + 0x64], 1
            //   83f840               | cmp                 eax, 0x40
            //   7507                 | jne                 9

        $sequence_21 = { 837dfc00 750b 33c0 7402 }
            // n = 4, score = 12200
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   750b                 | jne                 0xd
            //   33c0                 | xor                 eax, eax
            //   7402                 | je                  4

        $sequence_22 = { c7466001000000 33c0 40 5e }
            // n = 4, score = 11800
            //   c7466001000000       | mov                 dword ptr [esi + 0x60], 1
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5e                   | pop                 esi

        $sequence_23 = { 7402 ebfa 837d1000 7408 }
            // n = 4, score = 11500
            //   7402                 | je                  4
            //   ebfa                 | jmp                 0xfffffffc
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   7408                 | je                  0xa

        $sequence_24 = { 80ea80 8855f0 e8???????? 0fb64df7 }
            // n = 4, score = 11500
            //   80ea80               | sub                 dl, 0x80
            //   8855f0               | mov                 byte ptr [ebp - 0x10], dl
            //   e8????????           |                     
            //   0fb64df7             | movzx               ecx, byte ptr [ebp - 9]

        $sequence_25 = { e8???????? 59 85c0 7505 6afe }
            // n = 5, score = 11100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   6afe                 | push                -2

        $sequence_26 = { e8???????? 33c0 c3 55 8bec 51 51 }
            // n = 7, score = 8400
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   51                   | push                ecx

        $sequence_27 = { 50 ff5508 8bf0 59 }
            // n = 4, score = 6300
            //   50                   | push                eax
            //   ff5508               | call                dword ptr [ebp + 8]
            //   8bf0                 | mov                 esi, eax
            //   59                   | pop                 ecx

        $sequence_28 = { 6a00 58 0f95c0 40 50 }
            // n = 5, score = 5800
            //   6a00                 | push                0
            //   58                   | pop                 eax
            //   0f95c0               | setne               al
            //   40                   | inc                 eax
            //   50                   | push                eax

        $sequence_29 = { 85c0 750c 57 ff15???????? 6afe }
            // n = 5, score = 5200
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6afe                 | push                -2

        $sequence_30 = { c3 33c9 3d80000000 0f94c1 }
            // n = 4, score = 5200
            //   c3                   | ret                 
            //   33c9                 | xor                 ecx, ecx
            //   3d80000000           | cmp                 eax, 0x80
            //   0f94c1               | sete                cl

        $sequence_31 = { 57 ff15???????? 33c0 85f6 0f94c0 }
            // n = 5, score = 5200
            //   57                   | push                edi
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   85f6                 | test                esi, esi
            //   0f94c0               | sete                al

        $sequence_32 = { 6a02 ff15???????? 8bf8 83c8ff }
            // n = 4, score = 5000
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_33 = { 5e 33c0 c9 c3 55 8bec }
            // n = 6, score = 4800
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_34 = { 8a442421 a801 7540 eb00 668b442422 }
            // n = 5, score = 100
            //   8a442421             | mov                 al, byte ptr [esp + 0x21]
            //   a801                 | test                al, 1
            //   7540                 | jne                 0x42
            //   eb00                 | jmp                 2
            //   668b442422           | mov                 ax, word ptr [esp + 0x22]

        $sequence_35 = { 31c9 8b4078 89c2 8b742448 01c6 8b7c2448 8b440720 }
            // n = 7, score = 100
            //   31c9                 | xor                 ecx, ecx
            //   8b4078               | mov                 eax, dword ptr [eax + 0x78]
            //   89c2                 | mov                 edx, eax
            //   8b742448             | mov                 esi, dword ptr [esp + 0x48]
            //   01c6                 | add                 esi, eax
            //   8b7c2448             | mov                 edi, dword ptr [esp + 0x48]
            //   8b440720             | mov                 eax, dword ptr [edi + eax + 0x20]

        $sequence_36 = { 81c622be8b8f 01f2 8b75dc 01d6 8975d0 ebb3 31c0 }
            // n = 7, score = 100
            //   81c622be8b8f         | add                 esi, 0x8f8bbe22
            //   01f2                 | add                 edx, esi
            //   8b75dc               | mov                 esi, dword ptr [ebp - 0x24]
            //   01d6                 | add                 esi, edx
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi
            //   ebb3                 | jmp                 0xffffffb5
            //   31c0                 | xor                 eax, eax

        $sequence_37 = { 8b44240c 83c0f8 668b4c241e 66894c243e }
            // n = 4, score = 100
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   83c0f8               | add                 eax, -8
            //   668b4c241e           | mov                 cx, word ptr [esp + 0x1e]
            //   66894c243e           | mov                 word ptr [esp + 0x3e], cx

        $sequence_38 = { 8b4c2414 890c24 89442404 e8???????? 8b442414 890424 e8???????? }
            // n = 7, score = 100
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   890c24               | mov                 dword ptr [esp], ecx
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   e8????????           |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     

        $sequence_39 = { c7403ce0000000 8b442478 8944244c 8b44247c 89442448 }
            // n = 5, score = 100
            //   c7403ce0000000       | mov                 dword ptr [eax + 0x3c], 0xe0
            //   8b442478             | mov                 eax, dword ptr [esp + 0x78]
            //   8944244c             | mov                 dword ptr [esp + 0x4c], eax
            //   8b44247c             | mov                 eax, dword ptr [esp + 0x7c]
            //   89442448             | mov                 dword ptr [esp + 0x48], eax

        $sequence_40 = { 8945b8 8955cc 74bf e9???????? }
            // n = 4, score = 100
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   8955cc               | mov                 dword ptr [ebp - 0x34], edx
            //   74bf                 | je                  0xffffffc1
            //   e9????????           |                     

        $sequence_41 = { e9???????? 8b442470 b901000000 8b942480000000 83fa00 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   8b442470             | mov                 eax, dword ptr [esp + 0x70]
            //   b901000000           | mov                 ecx, 1
            //   8b942480000000       | mov                 edx, dword ptr [esp + 0x80]
            //   83fa00               | cmp                 edx, 0

    condition:
        7 of them and filesize < 1168384
}