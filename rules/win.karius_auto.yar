rule win_karius_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.karius."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.karius"
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
        $sequence_0 = { 0f8492000000 458b4320 458b5324 33ed }
            // n = 4, score = 400
            //   0f8492000000         | test                eax, eax
            //   458b4320             | je                  0x2d
            //   458b5324             | dec                 eax
            //   33ed                 | sub                 edx, ecx

        $sequence_1 = { 0f849d000000 41837b1400 0f8492000000 458b4320 }
            // n = 4, score = 400
            //   0f849d000000         | inc                 ecx
            //   41837b1400           | mov                 eax, 0x8000
            //   0f8492000000         | xor                 edx, edx
            //   458b4320             | inc                 ecx

        $sequence_2 = { 448bcd 85db 0f8477000000 8bb424b0000000 }
            // n = 4, score = 400
            //   448bcd               | inc                 ecx
            //   85db                 | mov                 ebx, dword ptr [ebx + 0x18]
            //   0f8477000000         | mov                 esi, dword ptr [esp + 0xb0]
            //   8bb424b0000000       | inc                 ecx

        $sequence_3 = { 0f8477000000 8bb424b0000000 418b10 8bcd 4903d6 }
            // n = 5, score = 400
            //   0f8477000000         | xor                 edx, edx
            //   8bb424b0000000       | inc                 ecx
            //   418b10               | mov                 eax, 0x8000
            //   8bcd                 | xor                 edx, edx
            //   4903d6               | xor                 edx, edx

        $sequence_4 = { 458b9f88000000 4d03de 418b5b18 85db 0f849d000000 }
            // n = 5, score = 400
            //   458b9f88000000       | inc                 ecx
            //   4d03de               | mov                 edx, dword ptr [eax]
            //   418b5b18             | mov                 ecx, ebp
            //   85db                 | mov                 edx, edi
            //   0f849d000000         | dec                 ecx

        $sequence_5 = { 8bd7 498bce ffd3 4183bf8c00000000 }
            // n = 4, score = 400
            //   8bd7                 | mov                 ebx, dword ptr [edi + 0x88]
            //   498bce               | dec                 ebp
            //   ffd3                 | add                 ebx, esi
            //   4183bf8c00000000     | inc                 ecx

        $sequence_6 = { 488b05???????? 4885c0 7512 ff15???????? 488905???????? 4885c0 }
            // n = 6, score = 400
            //   488b05????????       |                     
            //   4885c0               | inc                 esp
            //   7512                 | lea                 ecx, [edx - 0x3c]
            //   ff15????????         |                     
            //   488905????????       |                     
            //   4885c0               | ret                 

        $sequence_7 = { ffd3 4183bf8c00000000 0f84b3000000 458b9f88000000 4d03de }
            // n = 5, score = 400
            //   ffd3                 | movzx               eax, byte ptr [edx + ecx]
            //   4183bf8c00000000     | dec                 ebp
            //   0f84b3000000         | lea                 ecx, [ecx + 1]
            //   458b9f88000000       | inc                 ecx
            //   4d03de               | mov                 byte ptr [ecx - 1], al

        $sequence_8 = { c3 85c0 7505 e8???????? b801000000 }
            // n = 5, score = 400
            //   c3                   | ret                 
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   e8????????           |                     
            //   b801000000           | mov                 eax, 1

        $sequence_9 = { 488bcb ff15???????? 488bdf 4885ff 758d }
            // n = 5, score = 300
            //   488bcb               | mov                 eax, 0x8000
            //   ff15????????         |                     
            //   488bdf               | test                dword ptr [ebx + 0x18], 0x200
            //   4885ff               | jne                 0x2a
            //   758d                 | dec                 eax

        $sequence_10 = { 803f2e 752c 8a4701 3c30 }
            // n = 4, score = 300
            //   803f2e               | cmp                 byte ptr [edi], 0x2e
            //   752c                 | jne                 0x2e
            //   8a4701               | mov                 al, byte ptr [edi + 1]
            //   3c30                 | cmp                 al, 0x30

        $sequence_11 = { 5e 894d0c 5d e9???????? 8b4510 5e }
            // n = 6, score = 300
            //   5e                   | pop                 esi
            //   894d0c               | mov                 dword ptr [ebp + 0xc], ecx
            //   5d                   | pop                 ebp
            //   e9????????           |                     
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   5e                   | pop                 esi

        $sequence_12 = { 742d 4885d2 7428 4c8bc9 }
            // n = 4, score = 300
            //   742d                 | sub                 esp, 0x20
            //   4885d2               | dec                 eax
            //   7428                 | mov                 ebx, ecx
            //   4c8bc9               | dec                 eax

        $sequence_13 = { 8a17 41 0fbec2 83c09e 894dfc }
            // n = 5, score = 300
            //   8a17                 | mov                 dl, byte ptr [edi]
            //   41                   | inc                 ecx
            //   0fbec2               | movsx               eax, dl
            //   83c09e               | add                 eax, -0x62
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_14 = { 482bd1 6666660f1f840000000000 420fb6040a 4d8d4901 418841ff 41ffc8 75ee }
            // n = 7, score = 300
            //   482bd1               | jne                 0x33
            //   6666660f1f840000000000     | dec    eax
            //   420fb6040a           | mov                 ecx, dword ptr [ebx + 0x10]
            //   4d8d4901             | dec                 eax
            //   418841ff             | sub                 edx, ecx
            //   41ffc8               | nop                 word ptr [eax + eax]
            //   75ee                 | inc                 edx

        $sequence_15 = { 48897c2430 66660f1f840000000000 f7431800010000 488b3b 752e 488b4b10 }
            // n = 6, score = 300
            //   48897c2430           | dec                 eax
            //   66660f1f840000000000     | mov    dword ptr [esp + 0x30], edi
            //   f7431800010000       | nop                 word ptr [eax + eax]
            //   488b3b               | test                dword ptr [ebx + 0x18], 0x100
            //   752e                 | dec                 eax
            //   488b4b10             | mov                 edi, dword ptr [ebx]

        $sequence_16 = { 7405 f60001 7502 33c0 }
            // n = 4, score = 300
            //   7405                 | je                  7
            //   f60001               | test                byte ptr [eax], 1
            //   7502                 | jne                 4
            //   33c0                 | xor                 eax, eax

        $sequence_17 = { 46 740d 8a06 84c0 7407 3c20 }
            // n = 6, score = 300
            //   46                   | dec                 eax
            //   740d                 | mov                 ecx, ebx
            //   8a06                 | dec                 eax
            //   84c0                 | mov                 ebx, edi
            //   7407                 | dec                 eax
            //   3c20                 | test                edi, edi

        $sequence_18 = { 84e4 7515 8d4bbf 80f919 }
            // n = 4, score = 300
            //   84e4                 | test                ah, ah
            //   7515                 | jne                 0x17
            //   8d4bbf               | lea                 ecx, [ebx - 0x41]
            //   80f919               | cmp                 cl, 0x19

        $sequence_19 = { 33d2 41b800800000 ff15???????? 33d2 41b800800000 488bcb }
            // n = 6, score = 300
            //   33d2                 | dec                 eax
            //   41b800800000         | sub                 esp, 0x20
            //   ff15????????         |                     
            //   33d2                 | dec                 eax
            //   41b800800000         | mov                 ebx, ecx
            //   488bcb               | nop                 word ptr [eax + eax]

        $sequence_20 = { ff15???????? f7431800020000 7517 488b4b38 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   f7431800020000       | movzx               eax, byte ptr [edx + ecx]
            //   7517                 | dec                 ebp
            //   488b4b38             | lea                 ecx, [ecx + 1]

        $sequence_21 = { 4885c9 0f8494000000 53 4883ec20 488bd9 }
            // n = 5, score = 300
            //   4885c9               | inc                 ecx
            //   0f8494000000         | mov                 eax, 0x8000
            //   53                   | je                  0x10
            //   4883ec20             | xor                 edx, edx
            //   488bd9               | inc                 ecx

        $sequence_22 = { 740f 8b45fc 03c2 3bc3 8a6514 }
            // n = 5, score = 300
            //   740f                 | je                  0x11
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03c2                 | add                 eax, edx
            //   3bc3                 | cmp                 eax, ebx
            //   8a6514               | mov                 ah, byte ptr [ebp + 0x14]

        $sequence_23 = { 85d2 0f8418010000 8d820028ffff 3dff030000 }
            // n = 4, score = 300
            //   85d2                 | test                edx, edx
            //   0f8418010000         | je                  0x11e
            //   8d820028ffff         | lea                 eax, [edx - 0xd800]
            //   3dff030000           | cmp                 eax, 0x3ff

        $sequence_24 = { 0fbec0 47 83e830 89450c db450c 8a07 d9ca }
            // n = 7, score = 300
            //   0fbec0               | jne                 0xffffffa0
            //   47                   | xor                 edx, edx
            //   83e830               | inc                 ecx
            //   89450c               | mov                 eax, 0x8000
            //   db450c               | test                dword ptr [ebx + 0x18], 0x200
            //   8a07                 | dec                 eax
            //   d9ca                 | test                edx, edx

        $sequence_25 = { 7517 488b4b38 4885c9 740e 33d2 41b800800000 ff15???????? }
            // n = 7, score = 300
            //   7517                 | inc                 ecx
            //   488b4b38             | mov                 byte ptr [ecx - 1], al
            //   4885c9               | inc                 ecx
            //   740e                 | dec                 eax
            //   33d2                 | jne                 0xfffffff3
            //   41b800800000         | test                dword ptr [ebx + 0x18], 0x200
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 434176
}