rule win_zeus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.zeus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus"
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
        $sequence_0 = { eb58 833f00 7651 8b5f08 }
            // n = 4, score = 700
            //   eb58                 | jmp                 0x5a
            //   833f00               | cmp                 dword ptr [edi], 0
            //   7651                 | jbe                 0x53
            //   8b5f08               | mov                 ebx, dword ptr [edi + 8]

        $sequence_1 = { c9 c20c00 55 8bec 81ec34040000 53 }
            // n = 6, score = 600
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec34040000         | sub                 esp, 0x434
            //   53                   | push                ebx

        $sequence_2 = { eb03 8b4df8 8a01 894df4 eb0c }
            // n = 5, score = 600
            //   eb03                 | jmp                 5
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   eb0c                 | jmp                 0xe

        $sequence_3 = { eb16 83f910 7415 83f90f 7410 83f911 }
            // n = 6, score = 600
            //   eb16                 | jmp                 0x18
            //   83f910               | cmp                 ecx, 0x10
            //   7415                 | je                  0x17
            //   83f90f               | cmp                 ecx, 0xf
            //   7410                 | je                  0x12
            //   83f911               | cmp                 ecx, 0x11

        $sequence_4 = { 8b16 57 ff702c e8???????? 8bf8 8b4608 83780c04 }
            // n = 7, score = 600
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   57                   | push                edi
            //   ff702c               | push                dword ptr [eax + 0x2c]
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   83780c04             | cmp                 dword ptr [eax + 0xc], 4

        $sequence_5 = { 8d442428 50 0fb64304 50 }
            // n = 4, score = 600
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   0fb64304             | movzx               eax, byte ptr [ebx + 4]
            //   50                   | push                eax

        $sequence_6 = { 8b16 8b02 03c2 897808 }
            // n = 4, score = 600
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   03c2                 | add                 eax, edx
            //   897808               | mov                 dword ptr [eax + 8], edi

        $sequence_7 = { 8365fc00 53 56 8bda 8bf1 832600 03c3 }
            // n = 7, score = 600
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bda                 | mov                 ebx, edx
            //   8bf1                 | mov                 esi, ecx
            //   832600               | and                 dword ptr [esi], 0
            //   03c3                 | add                 eax, ebx

        $sequence_8 = { 8bf3 6810270000 ff35???????? ff15???????? }
            // n = 4, score = 500
            //   8bf3                 | mov                 esi, ebx
            //   6810270000           | push                0x2710
            //   ff35????????         |                     
            //   ff15????????         |                     

        $sequence_9 = { e8???????? 84c0 7442 6a10 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7442                 | je                  0x44
            //   6a10                 | push                0x10

        $sequence_10 = { 891d???????? 891d???????? ffd6 68???????? }
            // n = 4, score = 500
            //   891d????????         |                     
            //   891d????????         |                     
            //   ffd6                 | call                esi
            //   68????????           |                     

        $sequence_11 = { 8d8db0fdffff e8???????? 8ad8 84db }
            // n = 4, score = 400
            //   8d8db0fdffff         | lea                 ecx, [ebp - 0x250]
            //   e8????????           |                     
            //   8ad8                 | mov                 bl, al
            //   84db                 | test                bl, bl

        $sequence_12 = { c20400 55 8bec f6451802 }
            // n = 4, score = 300
            //   c20400               | ret                 4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   f6451802             | test                byte ptr [ebp + 0x18], 2

        $sequence_13 = { 8ac3 5b c20800 55 8bec 83e4f8 }
            // n = 6, score = 300
            //   8ac3                 | mov                 al, bl
            //   5b                   | pop                 ebx
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83e4f8               | and                 esp, 0xfffffff8

        $sequence_14 = { 56 ff15???????? 5e 8ac3 5b c20800 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   8ac3                 | mov                 al, bl
            //   5b                   | pop                 ebx
            //   c20800               | ret                 8

        $sequence_15 = { 68???????? 6809080002 8bc6 50 8d45fc 50 e8???????? }
            // n = 7, score = 200
            //   68????????           |                     
            //   6809080002           | push                0x2000809
            //   8bc6                 | mov                 eax, esi
            //   50                   | push                eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_16 = { 81fb45415356 0f85b2000000 b365 6a15 }
            // n = 4, score = 200
            //   81fb45415356         | cmp                 ebx, 0x56534145
            //   0f85b2000000         | jne                 0xb8
            //   b365                 | mov                 bl, 0x65
            //   6a15                 | push                0x15

        $sequence_17 = { e8???????? 68e6010000 68???????? 6809080002 8bc6 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   68e6010000           | push                0x1e6
            //   68????????           |                     
            //   6809080002           | push                0x2000809
            //   8bc6                 | mov                 eax, esi

        $sequence_18 = { 7506 b364 6a14 eb18 81fb5a5c4156 740c 81fb45415356 }
            // n = 7, score = 200
            //   7506                 | jne                 8
            //   b364                 | mov                 bl, 0x64
            //   6a14                 | push                0x14
            //   eb18                 | jmp                 0x1a
            //   81fb5a5c4156         | cmp                 ebx, 0x56415c5a
            //   740c                 | je                  0xe
            //   81fb45415356         | cmp                 ebx, 0x56534145

        $sequence_19 = { 8b03 3509080002 3d5c5b4550 740b }
            // n = 4, score = 200
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   3509080002           | xor                 eax, 0x2000809
            //   3d5c5b4550           | cmp                 eax, 0x50455b5c
            //   740b                 | je                  0xd

        $sequence_20 = { 81fb5d515047 7410 81fb4f4d4156 7408 81fb59495354 7506 b364 }
            // n = 7, score = 200
            //   81fb5d515047         | cmp                 ebx, 0x4750515d
            //   7410                 | je                  0x12
            //   81fb4f4d4156         | cmp                 ebx, 0x56414d4f
            //   7408                 | je                  0xa
            //   81fb59495354         | cmp                 ebx, 0x54534959
            //   7506                 | jne                 8
            //   b364                 | mov                 bl, 0x64

        $sequence_21 = { 7506 807b0244 7429 83fe04 0f82ec000000 8b1b 81f309080002 }
            // n = 7, score = 200
            //   7506                 | jne                 8
            //   807b0244             | cmp                 byte ptr [ebx + 2], 0x44
            //   7429                 | je                  0x2b
            //   83fe04               | cmp                 esi, 4
            //   0f82ec000000         | jb                  0xf2
            //   8b1b                 | mov                 ebx, dword ptr [ebx]
            //   81f309080002         | xor                 ebx, 0x2000809

        $sequence_22 = { 3d5c5b4550 740b 3d59495351 0f85ca000000 807b0420 }
            // n = 5, score = 200
            //   3d5c5b4550           | cmp                 eax, 0x50455b5c
            //   740b                 | je                  0xd
            //   3d59495351           | cmp                 eax, 0x51534959
            //   0f85ca000000         | jne                 0xd0
            //   807b0420             | cmp                 byte ptr [ebx + 4], 0x20

    condition:
        7 of them and filesize < 319488
}