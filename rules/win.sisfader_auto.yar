rule win_sisfader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.sisfader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sisfader"
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
        $sequence_0 = { e8???????? 85c0 b91d000000 0f44d9 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   b91d000000           | mov                 ecx, 0x1d
            //   0f44d9               | cmove               ebx, ecx

        $sequence_1 = { 85c9 741f 33c0 85c9 7419 }
            // n = 5, score = 300
            //   85c9                 | test                ecx, ecx
            //   741f                 | je                  0x21
            //   33c0                 | xor                 eax, eax
            //   85c9                 | test                ecx, ecx
            //   7419                 | je                  0x1b

        $sequence_2 = { 52 50 51 57 894c2424 }
            // n = 5, score = 200
            //   52                   | push                edx
            //   50                   | push                eax
            //   51                   | push                ecx
            //   57                   | push                edi
            //   894c2424             | mov                 dword ptr [esp + 0x24], ecx

        $sequence_3 = { 837c245000 7405 e9???????? 83bc248000000000 }
            // n = 4, score = 200
            //   837c245000           | cmp                 dword ptr [esp + 0x50], 0
            //   7405                 | je                  7
            //   e9????????           |                     
            //   83bc248000000000     | cmp                 dword ptr [esp + 0x80], 0

        $sequence_4 = { ba08020000 0f114014 c7400856120000 89580c c700aaeeddff 33c0 }
            // n = 6, score = 200
            //   ba08020000           | mov                 edx, 0x208
            //   0f114014             | movups              xmmword ptr [eax + 0x14], xmm0
            //   c7400856120000       | mov                 dword ptr [eax + 8], 0x1256
            //   89580c               | mov                 dword ptr [eax + 0xc], ebx
            //   c700aaeeddff         | mov                 dword ptr [eax], 0xffddeeaa
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { ff15???????? eb2e 8b4dfc c7411001000000 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   eb2e                 | jmp                 0x30
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   c7411001000000       | mov                 dword ptr [ecx + 0x10], 1

        $sequence_6 = { ff15???????? 8945f8 837df800 7402 eb5b 837d0800 751f }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7402                 | je                  4
            //   eb5b                 | jmp                 0x5d
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   751f                 | jne                 0x21

        $sequence_7 = { 33d2 2bd8 6690 8d4c2410 03ca 8a01 }
            // n = 6, score = 200
            //   33d2                 | xor                 edx, edx
            //   2bd8                 | sub                 ebx, eax
            //   6690                 | nop                 
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   03ca                 | add                 ecx, edx
            //   8a01                 | mov                 al, byte ptr [ecx]

        $sequence_8 = { 50 6a03 6a00 8b4d14 51 8b55fc 52 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   51                   | push                ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx

        $sequence_9 = { 66837c246c2e 7518 0fb74c246e 6685c9 }
            // n = 4, score = 200
            //   66837c246c2e         | cmp                 word ptr [esp + 0x6c], 0x2e
            //   7518                 | jne                 0x1a
            //   0fb74c246e           | movzx               ecx, word ptr [esp + 0x6e]
            //   6685c9               | test                cx, cx

        $sequence_10 = { 8d8d94fdffff 895de8 51 50 }
            // n = 4, score = 200
            //   8d8d94fdffff         | lea                 ecx, [ebp - 0x26c]
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_11 = { 33c0 0f8579ffffff 837dfc00 740a 8b4dfc 51 }
            // n = 6, score = 200
            //   33c0                 | xor                 eax, eax
            //   0f8579ffffff         | jne                 0xffffff7f
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   740a                 | je                  0xc
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx

        $sequence_12 = { 8bec c705????????10000000 8b4508 a3???????? c705????????07000000 8b4d0c 890d???????? }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   c705????????10000000     |     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   a3????????           |                     
            //   c705????????07000000     |     
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   890d????????         |                     

        $sequence_13 = { 83c414 8945d4 8b4df8 8b5154 52 8b45ec 50 }
            // n = 7, score = 200
            //   83c414               | add                 esp, 0x14
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8b5154               | mov                 edx, dword ptr [ecx + 0x54]
            //   52                   | push                edx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax

        $sequence_14 = { c705????????07000000 8b442438 8905???????? c705????????00000000 8b442440 8905???????? }
            // n = 6, score = 200
            //   c705????????07000000     |     
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   8905????????         |                     
            //   c705????????00000000     |     
            //   8b442440             | mov                 eax, dword ptr [esp + 0x40]
            //   8905????????         |                     

        $sequence_15 = { 0f11442454 c744245061090000 e8???????? 85c0 }
            // n = 4, score = 200
            //   0f11442454           | movups              xmmword ptr [esp + 0x54], xmm0
            //   c744245061090000     | mov                 dword ptr [esp + 0x50], 0x961
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_16 = { c745f000000000 c745fc00000000 c745f400000000 6a00 8d45fc 50 6a00 }
            // n = 7, score = 200
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_17 = { c705????????10000000 8b442430 8905???????? c705????????07000000 8b442438 8905???????? }
            // n = 6, score = 200
            //   c705????????10000000     |     
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   8905????????         |                     
            //   c705????????07000000     |     
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   8905????????         |                     

        $sequence_18 = { c700aaeeddff c74008010f0000 0f1086f0000000 c7400410000000 c7400c00000000 0f114014 }
            // n = 6, score = 200
            //   c700aaeeddff         | mov                 dword ptr [eax], 0xffddeeaa
            //   c74008010f0000       | mov                 dword ptr [eax + 8], 0xf01
            //   0f1086f0000000       | movups              xmm0, xmmword ptr [esi + 0xf0]
            //   c7400410000000       | mov                 dword ptr [eax + 4], 0x10
            //   c7400c00000000       | mov                 dword ptr [eax + 0xc], 0
            //   0f114014             | movups              xmmword ptr [eax + 0x14], xmm0

        $sequence_19 = { 837c245000 7402 eb12 c744245401000000 33c0 85c0 0f850fffffff }
            // n = 7, score = 200
            //   837c245000           | cmp                 dword ptr [esp + 0x50], 0
            //   7402                 | je                  4
            //   eb12                 | jmp                 0x14
            //   c744245401000000     | mov                 dword ptr [esp + 0x54], 1
            //   33c0                 | xor                 eax, eax
            //   85c0                 | test                eax, eax
            //   0f850fffffff         | jne                 0xffffff15

        $sequence_20 = { e8???????? b90e000000 ff15???????? 33c0 e9???????? e9???????? ff15???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   b90e000000           | mov                 ecx, 0xe
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e9????????           |                     
            //   ff15????????         |                     

        $sequence_21 = { 57 0fb7832c010000 8955fc 6685c0 740b }
            // n = 5, score = 200
            //   57                   | push                edi
            //   0fb7832c010000       | movzx               eax, word ptr [ebx + 0x12c]
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   6685c0               | test                ax, ax
            //   740b                 | je                  0xd

        $sequence_22 = { 53 0f11442414 8d4c2414 0f1087f0000000 0f11442424 e8???????? 83c404 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   0f11442414           | movups              xmmword ptr [esp + 0x14], xmm0
            //   8d4c2414             | lea                 ecx, [esp + 0x14]
            //   0f1087f0000000       | movups              xmm0, xmmword ptr [edi + 0xf0]
            //   0f11442424           | movups              xmmword ptr [esp + 0x24], xmm0
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_23 = { 8b4d0c 894dec 8b55ec 8b02 8945f4 8b4de8 8b11 }
            // n = 7, score = 200
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   8b11                 | mov                 edx, dword ptr [ecx]

        $sequence_24 = { 751b 0fb78dae010000 6685c9 7411 6683f92e 7509 }
            // n = 6, score = 200
            //   751b                 | jne                 0x1d
            //   0fb78dae010000       | movzx               ecx, word ptr [ebp + 0x1ae]
            //   6685c9               | test                cx, cx
            //   7411                 | je                  0x13
            //   6683f92e             | cmp                 cx, 0x2e
            //   7509                 | jne                 0xb

        $sequence_25 = { 837c242004 7479 837c242005 0f8480000000 }
            // n = 4, score = 200
            //   837c242004           | cmp                 dword ptr [esp + 0x20], 4
            //   7479                 | je                  0x7b
            //   837c242005           | cmp                 dword ptr [esp + 0x20], 5
            //   0f8480000000         | je                  0x86

        $sequence_26 = { e8???????? 85c0 7590 b81d000000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7590                 | jne                 0xffffff92
            //   b81d000000           | mov                 eax, 0x1d

        $sequence_27 = { 33d2 b904000000 e8???????? 33c0 }
            // n = 4, score = 200
            //   33d2                 | xor                 edx, edx
            //   b904000000           | mov                 ecx, 4
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax

        $sequence_28 = { c745d051120000 8945d4 0f1145dc e8???????? 83c404 }
            // n = 5, score = 200
            //   c745d051120000       | mov                 dword ptr [ebp - 0x30], 0x1251
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   0f1145dc             | movups              xmmword ptr [ebp - 0x24], xmm0
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_29 = { 837c242001 7425 837c242002 7441 837c242003 745d }
            // n = 6, score = 200
            //   837c242001           | cmp                 dword ptr [esp + 0x20], 1
            //   7425                 | je                  0x27
            //   837c242002           | cmp                 dword ptr [esp + 0x20], 2
            //   7441                 | je                  0x43
            //   837c242003           | cmp                 dword ptr [esp + 0x20], 3
            //   745d                 | je                  0x5f

    condition:
        7 of them and filesize < 417792
}