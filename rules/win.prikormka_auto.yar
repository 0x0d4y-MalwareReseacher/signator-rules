rule win_prikormka_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.prikormka."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.prikormka"
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
        $sequence_0 = { 8d0446 50 e8???????? 83c40c 6a00 56 }
            // n = 6, score = 1600
            //   8d0446               | lea                 eax, dword ptr [esi + eax*2]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6a00                 | push                0
            //   56                   | push                esi

        $sequence_1 = { 6800020000 ff15???????? 68???????? ffd7 }
            // n = 4, score = 1400
            //   6800020000           | push                0x200
            //   ff15????????         |                     
            //   68????????           |                     
            //   ffd7                 | call                edi

        $sequence_2 = { 85f6 7420 68???????? ffd7 }
            // n = 4, score = 1400
            //   85f6                 | test                esi, esi
            //   7420                 | je                  0x22
            //   68????????           |                     
            //   ffd7                 | call                edi

        $sequence_3 = { e8???????? 8b1d???????? 83c40c 6a00 56 ffd3 }
            // n = 6, score = 1400
            //   e8????????           |                     
            //   8b1d????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ffd3                 | call                ebx

        $sequence_4 = { 56 ffd3 85c0 7405 }
            // n = 4, score = 1400
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7

        $sequence_5 = { 51 e8???????? 83c40c 68???????? ffd7 03c0 50 }
            // n = 7, score = 1400
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax

        $sequence_6 = { ffd3 85c0 7405 6a02 56 ffd5 }
            // n = 6, score = 1400
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7
            //   6a02                 | push                2
            //   56                   | push                esi
            //   ffd5                 | call                ebp

        $sequence_7 = { 8d1446 52 e8???????? 83c40c }
            // n = 4, score = 1400
            //   8d1446               | lea                 edx, dword ptr [esi + eax*2]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_8 = { 740e 68???????? 50 ff15???????? ffd0 }
            // n = 5, score = 1400
            //   740e                 | je                  0x10
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ffd0                 | call                eax

        $sequence_9 = { 56 ffd3 8b2d???????? 85c0 }
            // n = 4, score = 1400
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   8b2d????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_10 = { 52 ffd6 03c0 50 }
            // n = 4, score = 1200
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax

        $sequence_11 = { 5e 85c0 7422 68???????? 50 }
            // n = 5, score = 900
            //   5e                   | pop                 esi
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_12 = { c3 57 6a00 6a00 6a00 6a02 }
            // n = 6, score = 900
            //   c3                   | ret                 
            //   57                   | push                edi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a02                 | push                2

        $sequence_13 = { ff15???????? ffd0 c705????????01000000 c705????????01000000 }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   ffd0                 | call                eax
            //   c705????????01000000     |     
            //   c705????????01000000     |     

        $sequence_14 = { 83ec08 68???????? ff15???????? 0fb7c0 6683f805 }
            // n = 5, score = 900
            //   83ec08               | sub                 esp, 8
            //   68????????           |                     
            //   ff15????????         |                     
            //   0fb7c0               | movzx               eax, ax
            //   6683f805             | cmp                 ax, 5

        $sequence_15 = { 0fb7c0 6683f805 7d09 b801000000 }
            // n = 4, score = 900
            //   0fb7c0               | movzx               eax, ax
            //   6683f805             | cmp                 ax, 5
            //   7d09                 | jge                 0xb
            //   b801000000           | mov                 eax, 1

        $sequence_16 = { ff15???????? 3db7000000 750e 56 ff15???????? 33c0 5e }
            // n = 7, score = 700
            //   ff15????????         |                     
            //   3db7000000           | cmp                 eax, 0xb7
            //   750e                 | jne                 0x10
            //   56                   | push                esi
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi

        $sequence_17 = { ff15???????? 8bf0 85f6 7415 68???????? }
            // n = 5, score = 700
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7415                 | je                  0x17
            //   68????????           |                     

        $sequence_18 = { 83c002 6685c9 75f5 8b0d???????? 2bc2 8b15???????? d1f8 }
            // n = 7, score = 600
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx
            //   75f5                 | jne                 0xfffffff7
            //   8b0d????????         |                     
            //   2bc2                 | sub                 eax, edx
            //   8b15????????         |                     
            //   d1f8                 | sar                 eax, 1

        $sequence_19 = { 8bf0 ff15???????? 3db7000000 751f 56 ff15???????? }
            // n = 6, score = 600
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   3db7000000           | cmp                 eax, 0xb7
            //   751f                 | jne                 0x21
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_20 = { 83c102 6685d2 75f5 2bce 8d1400 52 d1f9 }
            // n = 7, score = 600
            //   83c102               | add                 ecx, 2
            //   6685d2               | test                dx, dx
            //   75f5                 | jne                 0xfffffff7
            //   2bce                 | sub                 ecx, esi
            //   8d1400               | lea                 edx, dword ptr [eax + eax]
            //   52                   | push                edx
            //   d1f9                 | sar                 ecx, 1

        $sequence_21 = { ff15???????? 8bd8 8d4b01 51 e8???????? 83c404 }
            // n = 6, score = 500
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   8d4b01               | lea                 ecx, dword ptr [ebx + 1]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_22 = { 6685c9 75f5 2bc6 8d0c12 51 }
            // n = 5, score = 500
            //   6685c9               | test                cx, cx
            //   75f5                 | jne                 0xfffffff7
            //   2bc6                 | sub                 eax, esi
            //   8d0c12               | lea                 ecx, dword ptr [edx + edx]
            //   51                   | push                ecx

        $sequence_23 = { 50 e8???????? b8???????? 83c40c 8d5002 }
            // n = 5, score = 500
            //   50                   | push                eax
            //   e8????????           |                     
            //   b8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d5002               | lea                 edx, dword ptr [eax + 2]

        $sequence_24 = { d1f8 8d7102 8da42400000000 668b11 }
            // n = 4, score = 500
            //   d1f8                 | sar                 eax, 1
            //   8d7102               | lea                 esi, dword ptr [ecx + 2]
            //   8da42400000000       | lea                 esp, dword ptr [esp]
            //   668b11               | mov                 dx, word ptr [ecx]

        $sequence_25 = { 2bc7 8d0c12 51 d1f8 }
            // n = 4, score = 400
            //   2bc7                 | sub                 eax, edi
            //   8d0c12               | lea                 ecx, dword ptr [edx + edx]
            //   51                   | push                ecx
            //   d1f8                 | sar                 eax, 1

        $sequence_26 = { 8bd0 b8???????? 8d7002 8da42400000000 668b08 }
            // n = 5, score = 300
            //   8bd0                 | mov                 edx, eax
            //   b8????????           |                     
            //   8d7002               | lea                 esi, dword ptr [eax + 2]
            //   8da42400000000       | lea                 esp, dword ptr [esp]
            //   668b08               | mov                 cx, word ptr [eax]

        $sequence_27 = { 51 52 50 68???????? 8d542440 }
            // n = 5, score = 300
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   68????????           |                     
            //   8d542440             | lea                 edx, dword ptr [esp + 0x40]

        $sequence_28 = { 83c410 c3 3b0d???????? 7502 f3c3 }
            // n = 5, score = 300
            //   83c410               | add                 esp, 0x10
            //   c3                   | ret                 
            //   3b0d????????         |                     
            //   7502                 | jne                 4
            //   f3c3                 | ret                 

        $sequence_29 = { 50 68???????? 57 ffd6 03c7 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   68????????           |                     
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   03c7                 | add                 eax, edi

        $sequence_30 = { b9???????? d1f8 8d7102 668b11 83c102 }
            // n = 5, score = 300
            //   b9????????           |                     
            //   d1f8                 | sar                 eax, 1
            //   8d7102               | lea                 esi, dword ptr [ecx + 2]
            //   668b11               | mov                 dx, word ptr [ecx]
            //   83c102               | add                 ecx, 2

        $sequence_31 = { 6a00 6a00 6a00 8d4c2420 51 ff15???????? 85c0 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d4c2420             | lea                 ecx, dword ptr [esp + 0x20]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_32 = { 68???????? 33ff 57 57 ff15???????? 8bf0 }
            // n = 6, score = 300
            //   68????????           |                     
            //   33ff                 | xor                 edi, edi
            //   57                   | push                edi
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_33 = { 83c40c 68???????? ffd6 50 68???????? }
            // n = 5, score = 300
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_34 = { e8???????? 83c40c eb0d 6a00 6800020000 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb0d                 | jmp                 0xf
            //   6a00                 | push                0
            //   6800020000           | push                0x200

        $sequence_35 = { b9???????? 83c40c 8d5102 668b01 83c102 6685c0 75f5 }
            // n = 7, score = 200
            //   b9????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d5102               | lea                 edx, dword ptr [ecx + 2]
            //   668b01               | mov                 ax, word ptr [ecx]
            //   83c102               | add                 ecx, 2
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7

        $sequence_36 = { 668b02 83c202 6685c0 75f5 2bd6 8d0409 50 }
            // n = 7, score = 200
            //   668b02               | mov                 ax, word ptr [edx]
            //   83c202               | add                 edx, 2
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7
            //   2bd6                 | sub                 edx, esi
            //   8d0409               | lea                 eax, dword ptr [ecx + ecx]
            //   50                   | push                eax

        $sequence_37 = { 8be5 5d c3 56 6a00 57 ff15???????? }
            // n = 7, score = 200
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   56                   | push                esi
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_38 = { ffd5 85c0 7409 6a02 }
            // n = 4, score = 200
            //   ffd5                 | call                ebp
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   6a02                 | push                2

        $sequence_39 = { 8b08 8d55ec 52 8d55e8 52 50 ff511c }
            // n = 7, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d55ec               | lea                 edx, dword ptr [ebp - 0x14]
            //   52                   | push                edx
            //   8d55e8               | lea                 edx, dword ptr [ebp - 0x18]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff511c               | call                dword ptr [ecx + 0x1c]

        $sequence_40 = { 57 68???????? 57 e8???????? 8b7d1c }
            // n = 5, score = 100
            //   57                   | push                edi
            //   68????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b7d1c               | mov                 edi, dword ptr [ebp + 0x1c]

        $sequence_41 = { 33c0 8945e4 3d00010000 7d10 8a8c181d010000 888890da0110 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   3d00010000           | cmp                 eax, 0x100
            //   7d10                 | jge                 0x12
            //   8a8c181d010000       | mov                 cl, byte ptr [eax + ebx + 0x11d]
            //   888890da0110         | mov                 byte ptr [eax + 0x1001da90], cl

        $sequence_42 = { 6a17 59 8bfc 83ec5c 89758c }
            // n = 5, score = 100
            //   6a17                 | push                0x17
            //   59                   | pop                 ecx
            //   8bfc                 | mov                 edi, esp
            //   83ec5c               | sub                 esp, 0x5c
            //   89758c               | mov                 dword ptr [ebp - 0x74], esi

    condition:
        7 of them and filesize < 401408
}