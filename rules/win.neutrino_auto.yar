rule win_neutrino_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.neutrino."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neutrino"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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

        $sequence_1 = { 741b e8???????? 85c0 7412 e8???????? 85c0 7409 }
            // n = 7, score = 1800
            //   741b                 | je                  0x1d
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb

        $sequence_2 = { 50 6a0b 6a07 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a0b                 | push                0xb
            //   6a07                 | push                7
            //   e8????????           |                     

        $sequence_3 = { 50 6a05 6a03 e8???????? }
            // n = 4, score = 1600
            //   50                   | push                eax
            //   6a05                 | push                5
            //   6a03                 | push                3
            //   e8????????           |                     

        $sequence_4 = { ff15???????? 50 ff15???????? 837dfc00 0f95c0 8be5 }
            // n = 6, score = 1500
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   0f95c0               | setne               al
            //   8be5                 | mov                 esp, ebp

        $sequence_5 = { 6a00 ff15???????? 6880000000 ff15???????? }
            // n = 4, score = 1500
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6880000000           | push                0x80
            //   ff15????????         |                     

        $sequence_6 = { 85d2 7502 eb02 ebb4 8b45f8 8945f4 8b4d0c }
            // n = 7, score = 1500
            //   85d2                 | test                edx, edx
            //   7502                 | jne                 4
            //   eb02                 | jmp                 4
            //   ebb4                 | jmp                 0xffffffb6
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_7 = { 8b4508 83c001 894508 8b4dfc 3b4d14 7e05 83c8ff }
            // n = 7, score = 1500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c001               | add                 eax, 1
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   3b4d14               | cmp                 ecx, dword ptr [ebp + 0x14]
            //   7e05                 | jle                 7
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_8 = { 85c0 7447 8b4df4 0fbe11 8b45fc 0fbe08 3bd1 }
            // n = 7, score = 1500
            //   85c0                 | test                eax, eax
            //   7447                 | je                  0x49
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   3bd1                 | cmp                 edx, ecx

        $sequence_9 = { 85c0 750f 8b4d0c 894dfc 8b55f4 83c201 }
            // n = 6, score = 1500
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   83c201               | add                 edx, 1

        $sequence_10 = { 837d0800 7408 8b4508 a3???????? 8b0d???????? 894df8 eb09 }
            // n = 7, score = 1500
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7408                 | je                  0xa
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   a3????????           |                     
            //   8b0d????????         |                     
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   eb09                 | jmp                 0xb

        $sequence_11 = { 0404 0404 0404 0404 0404 0402 0202 }
            // n = 7, score = 1500
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0402                 | add                 al, 2
            //   0202                 | add                 al, byte ptr [edx]

        $sequence_12 = { 894dfc 8b55f4 83c201 8955f4 ebaf 8b45f4 a3???????? }
            // n = 7, score = 1500
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   83c201               | add                 edx, 1
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   ebaf                 | jmp                 0xffffffb1
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   a3????????           |                     

        $sequence_13 = { 83c001 8945fc ebdb 8b4dfc 0fbe11 85d2 7502 }
            // n = 7, score = 1500
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ebdb                 | jmp                 0xffffffdd
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   85d2                 | test                edx, edx
            //   7502                 | jne                 4

        $sequence_14 = { 6a00 6a00 e8???????? 83c40c 0fb6c0 }
            // n = 5, score = 1500
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0fb6c0               | movzx               eax, al

        $sequence_15 = { 0404 0404 010404 0202 020402 0404 }
            // n = 6, score = 1500
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   010404               | add                 dword ptr [esp + eax], eax
            //   0202                 | add                 al, byte ptr [edx]
            //   020402               | add                 al, byte ptr [edx + eax]
            //   0404                 | add                 al, 4

        $sequence_16 = { 8b55f8 83c201 8955f8 8b45f8 0fbe08 85c9 7439 }
            // n = 7, score = 1500
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   83c201               | add                 edx, 1
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   85c9                 | test                ecx, ecx
            //   7439                 | je                  0x3b

        $sequence_17 = { e9???????? 6a01 ff15???????? 85c0 }
            // n = 4, score = 1500
            //   e9????????           |                     
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_18 = { 7409 8bd0 8b00 85c0 75f4 c3 }
            // n = 6, score = 1300
            //   7409                 | je                  0xb
            //   8bd0                 | mov                 edx, eax
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   85c0                 | test                eax, eax
            //   75f4                 | jne                 0xfffffff6
            //   c3                   | ret                 

        $sequence_19 = { 83c302 f645fe02 740a 834a1804 8a03 }
            // n = 5, score = 1300
            //   83c302               | add                 ebx, 2
            //   f645fe02             | test                byte ptr [ebp - 2], 2
            //   740a                 | je                  0xc
            //   834a1804             | or                  dword ptr [edx + 0x18], 4
            //   8a03                 | mov                 al, byte ptr [ebx]

        $sequence_20 = { 83c404 85c0 0f95c2 0fb6c2 50 }
            // n = 5, score = 1200
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   0f95c2               | setne               dl
            //   0fb6c2               | movzx               eax, dl
            //   50                   | push                eax

        $sequence_21 = { 8d85b8feffff 50 68???????? ff15???????? 8945fc }
            // n = 5, score = 1100
            //   8d85b8feffff         | lea                 eax, dword ptr [ebp - 0x148]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_22 = { 55 8bec 81ecf80f0000 837d0800 }
            // n = 4, score = 1100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ecf80f0000         | sub                 esp, 0xff8
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0

        $sequence_23 = { 83c40c 6804010000 8d85f8fdffff 50 }
            // n = 4, score = 1000
            //   83c40c               | add                 esp, 0xc
            //   6804010000           | push                0x104
            //   8d85f8fdffff         | lea                 eax, dword ptr [ebp - 0x208]
            //   50                   | push                eax

        $sequence_24 = { 8930 8b4518 2bf7 8930 }
            // n = 4, score = 900
            //   8930                 | mov                 dword ptr [eax], esi
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   2bf7                 | sub                 esi, edi
            //   8930                 | mov                 dword ptr [eax], esi

        $sequence_25 = { b301 ff750c e8???????? 59 }
            // n = 4, score = 900
            //   b301                 | mov                 bl, 1
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_26 = { 56 e8???????? 83c414 84c0 740f 8b45f8 85c0 }
            // n = 7, score = 900
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   84c0                 | test                al, al
            //   740f                 | je                  0x11
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   85c0                 | test                eax, eax

        $sequence_27 = { 8b45f8 85c0 7408 c6040600 }
            // n = 4, score = 900
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   c6040600             | mov                 byte ptr [esi + eax], 0

        $sequence_28 = { e8???????? 8d8508f0ffff 50 e8???????? 59 59 32c0 }
            // n = 7, score = 900
            //   e8????????           |                     
            //   8d8508f0ffff         | lea                 eax, dword ptr [ebp - 0xff8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   32c0                 | xor                 al, al

        $sequence_29 = { 59 85db 7405 83c303 }
            // n = 4, score = 800
            //   59                   | pop                 ecx
            //   85db                 | test                ebx, ebx
            //   7405                 | je                  7
            //   83c303               | add                 ebx, 3

        $sequence_30 = { c3 6a01 ff15???????? 59 }
            // n = 4, score = 800
            //   c3                   | ret                 
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   59                   | pop                 ecx

        $sequence_31 = { 56 57 33ff 393d???????? 7522 be???????? }
            // n = 6, score = 800
            //   56                   | push                esi
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   393d????????         |                     
            //   7522                 | jne                 0x24
            //   be????????           |                     

        $sequence_32 = { 8bc6 2bc3 50 53 ff75fc }
            // n = 5, score = 800
            //   8bc6                 | mov                 eax, esi
            //   2bc3                 | sub                 eax, ebx
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_33 = { c3 83c004 74ed 8b4d0c }
            // n = 4, score = 800
            //   c3                   | ret                 
            //   83c004               | add                 eax, 4
            //   74ed                 | je                  0xffffffef
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 507904
}