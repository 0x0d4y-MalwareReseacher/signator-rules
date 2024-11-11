rule win_neutrino_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.neutrino."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neutrino"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { ff15???????? c1e010 50 ff15???????? }
            // n = 4, score = 2300
            //   ff15????????         |                     
            //   c1e010               | shl                 eax, 0x10
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_1 = { 50 6a0b 6a07 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a0b                 | push                0xb
            //   6a07                 | push                7
            //   e8????????           |                     

        $sequence_2 = { 50 6a05 6a03 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a05                 | push                5
            //   6a03                 | push                3
            //   e8????????           |                     

        $sequence_3 = { 0404 0404 0402 0202 0202 }
            // n = 5, score = 1500
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0402                 | add                 al, 2
            //   0202                 | add                 al, byte ptr [edx]
            //   0202                 | add                 al, byte ptr [edx]

        $sequence_4 = { 837d0800 7408 8b4508 a3???????? 8b0d???????? 894df8 eb09 }
            // n = 7, score = 1500
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7408                 | je                  0xa
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   a3????????           |                     
            //   8b0d????????         |                     
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   eb09                 | jmp                 0xb

        $sequence_5 = { 8b45ac 50 ff15???????? 8945d0 837dd000 }
            // n = 5, score = 1500
            //   8b45ac               | mov                 eax, dword ptr [ebp - 0x54]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   837dd000             | cmp                 dword ptr [ebp - 0x30], 0

        $sequence_6 = { 0fbe08 3bd1 7513 8b55f4 c60200 8b45f4 83c001 }
            // n = 7, score = 1500
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   3bd1                 | cmp                 edx, ecx
            //   7513                 | jne                 0x15
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   c60200               | mov                 byte ptr [edx], 0
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c001               | add                 eax, 1

        $sequence_7 = { 8b4df8 0fbe11 3bc2 740b 8b45fc 83c001 8945fc }
            // n = 7, score = 1500
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   3bc2                 | cmp                 eax, edx
            //   740b                 | je                  0xd
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_8 = { 83c001 8945fc ebdb 8b4dfc 0fbe11 85d2 7502 }
            // n = 7, score = 1500
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ebdb                 | jmp                 0xffffffdd
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   85d2                 | test                edx, edx
            //   7502                 | jne                 4

        $sequence_9 = { 8b4d0c 894dfc 8b55f4 0fbe02 85c0 7447 8b4df4 }
            // n = 7, score = 1500
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   85c0                 | test                eax, eax
            //   7447                 | je                  0x49
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_10 = { 6a00 6a00 e8???????? 83c40c 0fb6c0 }
            // n = 5, score = 1500
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0fb6c0               | movzx               eax, al

        $sequence_11 = { e9???????? 6a01 ff15???????? 85c0 }
            // n = 4, score = 1500
            //   e9????????           |                     
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_12 = { 0404 010404 0202 020402 0404 }
            // n = 5, score = 1500
            //   0404                 | add                 al, 4
            //   010404               | add                 dword ptr [esp + eax], eax
            //   0202                 | add                 al, byte ptr [edx]
            //   020402               | add                 al, byte ptr [edx + eax]
            //   0404                 | add                 al, 4

        $sequence_13 = { 8945fc 8b4d08 83c101 894d08 0fb6550c 83fa01 7509 }
            // n = 7, score = 1500
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   83c101               | add                 ecx, 1
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   0fb6550c             | movzx               edx, byte ptr [ebp + 0xc]
            //   83fa01               | cmp                 edx, 1
            //   7509                 | jne                 0xb

        $sequence_14 = { 50 ff15???????? 837dfc00 0f95c0 8be5 }
            // n = 5, score = 1500
            //   50                   | push                eax
            //   ff15????????         |                     
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   0f95c0               | setne               al
            //   8be5                 | mov                 esp, ebp

        $sequence_15 = { 020402 0404 0404 0404 0404 0404 0403 }
            // n = 7, score = 1500
            //   020402               | add                 al, byte ptr [edx + eax]
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0403                 | add                 al, 3

        $sequence_16 = { 6a00 ff15???????? 6880000000 ff15???????? }
            // n = 4, score = 1500
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6880000000           | push                0x80
            //   ff15????????         |                     

        $sequence_17 = { 8b55f8 83c201 8955f8 8b45f8 0fbe08 85c9 7439 }
            // n = 7, score = 1500
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   83c201               | add                 edx, 1
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   85c9                 | test                ecx, ecx
            //   7439                 | je                  0x3b

        $sequence_18 = { 83ec14 8b4508 53 57 6a1c 8945f4 59 }
            // n = 7, score = 1300
            //   83ec14               | sub                 esp, 0x14
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   57                   | push                edi
            //   6a1c                 | push                0x1c
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   59                   | pop                 ecx

        $sequence_19 = { 75f4 c3 8b4804 890e ff4808 897004 751e }
            // n = 7, score = 1300
            //   75f4                 | jne                 0xfffffff6
            //   c3                   | ret                 
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   890e                 | mov                 dword ptr [esi], ecx
            //   ff4808               | dec                 dword ptr [eax + 8]
            //   897004               | mov                 dword ptr [eax + 4], esi
            //   751e                 | jne                 0x20

        $sequence_20 = { 7448 f645fe40 7420 f645ff08 0f8485000000 814a1808010000 }
            // n = 6, score = 1300
            //   7448                 | je                  0x4a
            //   f645fe40             | test                byte ptr [ebp - 2], 0x40
            //   7420                 | je                  0x22
            //   f645ff08             | test                byte ptr [ebp - 1], 8
            //   0f8485000000         | je                  0x8b
            //   814a1808010000       | or                  dword ptr [edx + 0x18], 0x108

        $sequence_21 = { 0f879a000000 807dfd01 0f8597000000 e9???????? 2d8c000000 747e 48 }
            // n = 7, score = 1300
            //   0f879a000000         | ja                  0xa0
            //   807dfd01             | cmp                 byte ptr [ebp - 3], 1
            //   0f8597000000         | jne                 0x9d
            //   e9????????           |                     
            //   2d8c000000           | sub                 eax, 0x8c
            //   747e                 | je                  0x80
            //   48                   | dec                 eax

        $sequence_22 = { 807dfd04 c645fc03 0f84ae000000 807dfd05 eb12 807dfd04 }
            // n = 6, score = 1300
            //   807dfd04             | cmp                 byte ptr [ebp - 3], 4
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   0f84ae000000         | je                  0xb4
            //   807dfd05             | cmp                 byte ptr [ebp - 3], 5
            //   eb12                 | jmp                 0x14
            //   807dfd04             | cmp                 byte ptr [ebp - 3], 4

        $sequence_23 = { 83c302 f645fe02 740a 834a1804 8a03 884210 43 }
            // n = 7, score = 1300
            //   83c302               | add                 ebx, 2
            //   f645fe02             | test                byte ptr [ebp - 2], 2
            //   740a                 | je                  0xc
            //   834a1804             | or                  dword ptr [edx + 0x18], 4
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   884210               | mov                 byte ptr [edx + 0x10], al
            //   43                   | inc                 ebx

        $sequence_24 = { 7408 83c6fb a5 66a5 eb01 a5 }
            // n = 6, score = 1300
            //   7408                 | je                  0xa
            //   83c6fb               | add                 esi, -5
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   eb01                 | jmp                 3
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_25 = { 7409 8bd0 8b00 85c0 75f4 c3 8b4804 }
            // n = 7, score = 1300
            //   7409                 | je                  0xb
            //   8bd0                 | mov                 edx, eax
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   85c0                 | test                eax, eax
            //   75f4                 | jne                 0xfffffff6
            //   c3                   | ret                 
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]

        $sequence_26 = { 8d85b8feffff 50 68???????? ff15???????? 8945fc }
            // n = 5, score = 1100
            //   8d85b8feffff         | lea                 eax, [ebp - 0x148]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_27 = { 83c40c 6804010000 8d85f8fdffff 50 }
            // n = 4, score = 1000
            //   83c40c               | add                 esp, 0xc
            //   6804010000           | push                0x104
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]
            //   50                   | push                eax

        $sequence_28 = { ff750c ff7508 ff15???????? 83f8ff 0f95c0 5d }
            // n = 6, score = 800
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   0f95c0               | setne               al
            //   5d                   | pop                 ebp

        $sequence_29 = { eb05 68???????? 50 ff510c }
            // n = 4, score = 800
            //   eb05                 | jmp                 7
            //   68????????           |                     
            //   50                   | push                eax
            //   ff510c               | call                dword ptr [ecx + 0xc]

        $sequence_30 = { 57 33ff 393d???????? 7522 be???????? ff15???????? 57 }
            // n = 7, score = 800
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   393d????????         |                     
            //   7522                 | jne                 0x24
            //   be????????           |                     
            //   ff15????????         |                     
            //   57                   | push                edi

        $sequence_31 = { 50 ff15???????? 6a40 ff75f0 }
            // n = 4, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a40                 | push                0x40
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_32 = { 85c0 7412 68???????? 50 ff15???????? f7d8 }
            // n = 6, score = 800
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   f7d8                 | neg                 eax

        $sequence_33 = { ff15???????? 6a64 e8???????? 59 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   6a64                 | push                0x64
            //   e8????????           |                     
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 507904
}