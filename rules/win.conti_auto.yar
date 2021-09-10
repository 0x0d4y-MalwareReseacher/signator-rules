rule win_conti_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.conti."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.conti"
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
        $sequence_0 = { 85c0 750f c705????????0b000000 e9???????? }
            // n = 4, score = 600
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0b000000     |     
            //   e9????????           |                     

        $sequence_1 = { 0fb6c0 2bc8 8d04c9 c1e002 }
            // n = 4, score = 500
            //   0fb6c0               | movzx               eax, al
            //   2bc8                 | sub                 ecx, eax
            //   8d04c9               | lea                 eax, dword ptr [ecx + ecx*8]
            //   c1e002               | shl                 eax, 2

        $sequence_2 = { 03c1 03c0 99 f7fb 8d427f }
            // n = 5, score = 500
            //   03c1                 | add                 eax, ecx
            //   03c0                 | add                 eax, eax
            //   99                   | cdq                 
            //   f7fb                 | idiv                ebx
            //   8d427f               | lea                 eax, dword ptr [edx + 0x7f]

        $sequence_3 = { 753f 53 bb0c000000 57 }
            // n = 4, score = 500
            //   753f                 | jne                 0x41
            //   53                   | push                ebx
            //   bb0c000000           | mov                 ebx, 0xc
            //   57                   | push                edi

        $sequence_4 = { 753f 53 bb0a000000 57 8d7e01 8d7375 }
            // n = 6, score = 500
            //   753f                 | jne                 0x41
            //   53                   | push                ebx
            //   bb0a000000           | mov                 ebx, 0xa
            //   57                   | push                edi
            //   8d7e01               | lea                 edi, dword ptr [esi + 1]
            //   8d7375               | lea                 esi, dword ptr [ebx + 0x75]

        $sequence_5 = { 803900 7533 53 56 57 }
            // n = 5, score = 500
            //   803900               | cmp                 byte ptr [ecx], 0
            //   7533                 | jne                 0x35
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_6 = { 56 8bf1 8975fc 803e00 }
            // n = 4, score = 500
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   803e00               | cmp                 byte ptr [esi], 0

        $sequence_7 = { 99 f7fb 8856ff 83ef01 75df }
            // n = 5, score = 500
            //   99                   | cdq                 
            //   f7fb                 | idiv                ebx
            //   8856ff               | mov                 byte ptr [esi - 1], dl
            //   83ef01               | sub                 edi, 1
            //   75df                 | jne                 0xffffffe1

        $sequence_8 = { 57 6a04 6800300000 6820005000 }
            // n = 4, score = 400
            //   57                   | push                edi
            //   6a04                 | push                4
            //   6800300000           | push                0x3000
            //   6820005000           | push                0x500020

        $sequence_9 = { 6a01 6810660000 ff7508 ff15???????? }
            // n = 4, score = 400
            //   6a01                 | push                1
            //   6810660000           | push                0x6610
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     

        $sequence_10 = { 6800100000 68???????? ff75f8 ff15???????? 85c0 7508 6a01 }
            // n = 7, score = 400
            //   6800100000           | push                0x1000
            //   68????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0xa
            //   6a01                 | push                1

        $sequence_11 = { 6aff ff75f0 ff15???????? ff75f4 ff15???????? }
            // n = 5, score = 400
            //   6aff                 | push                -1
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff15????????         |                     
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff15????????         |                     

        $sequence_12 = { 85c0 750f c705????????0a000000 e9???????? }
            // n = 4, score = 400
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0a000000     |     
            //   e9????????           |                     

        $sequence_13 = { ff75fc ff15???????? e9???????? 6800800000 6a00 }
            // n = 5, score = 400
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   e9????????           |                     
            //   6800800000           | push                0x8000
            //   6a00                 | push                0

        $sequence_14 = { 8bce e8???????? 8bb6007d0000 85f6 75ef 6aff 6a01 }
            // n = 7, score = 400
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8bb6007d0000         | mov                 esi, dword ptr [esi + 0x7d00]
            //   85f6                 | test                esi, esi
            //   75ef                 | jne                 0xfffffff1
            //   6aff                 | push                -1
            //   6a01                 | push                1

        $sequence_15 = { 7605 b800005000 6a00 8d4c2418 51 50 ff742424 }
            // n = 7, score = 400
            //   7605                 | jbe                 7
            //   b800005000           | mov                 eax, 0x500000
            //   6a00                 | push                0
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   ff742424             | push                dword ptr [esp + 0x24]

        $sequence_16 = { 7411 a801 740d 83f001 }
            // n = 4, score = 400
            //   7411                 | je                  0x13
            //   a801                 | test                al, 1
            //   740d                 | je                  0xf
            //   83f001               | xor                 eax, 1

        $sequence_17 = { 85c0 ba0d000000 0f44ca 890d???????? }
            // n = 4, score = 300
            //   85c0                 | test                eax, eax
            //   ba0d000000           | mov                 edx, 0xd
            //   0f44ca               | cmove               ecx, edx
            //   890d????????         |                     

        $sequence_18 = { 83c10b f7e9 c1fa02 8bc2 }
            // n = 4, score = 300
            //   83c10b               | add                 ecx, 0xb
            //   f7e9                 | imul                ecx
            //   c1fa02               | sar                 edx, 2
            //   8bc2                 | mov                 eax, edx

        $sequence_19 = { 83c00b 99 83c117 f7f9 }
            // n = 4, score = 300
            //   83c00b               | add                 eax, 0xb
            //   99                   | cdq                 
            //   83c117               | add                 ecx, 0x17
            //   f7f9                 | idiv                ecx

        $sequence_20 = { ffd0 8b0d???????? 85c0 ba0d000000 }
            // n = 4, score = 300
            //   ffd0                 | call                eax
            //   8b0d????????         |                     
            //   85c0                 | test                eax, eax
            //   ba0d000000           | mov                 edx, 0xd

        $sequence_21 = { ffd0 85c0 750f c705????????0c000000 }
            // n = 4, score = 300
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   c705????????0c000000     |     

        $sequence_22 = { 83c10b f7e9 03d1 c1fa06 8bc2 c1e81f }
            // n = 6, score = 300
            //   83c10b               | add                 ecx, 0xb
            //   f7e9                 | imul                ecx
            //   03d1                 | add                 edx, ecx
            //   c1fa06               | sar                 edx, 6
            //   8bc2                 | mov                 eax, edx
            //   c1e81f               | shr                 eax, 0x1f

    condition:
        7 of them and filesize < 520192
}