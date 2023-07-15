rule win_kimjongrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.kimjongrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kimjongrat"
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
        $sequence_0 = { e8???????? 83c404 85c0 7524 8b7d08 50 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7524                 | jne                 0x26
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_1 = { ff3438 e8???????? 8bc8 8a4514 24c0 83c404 f6d8 }
            // n = 7, score = 100
            //   ff3438               | push                dword ptr [eax + edi]
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   8a4514               | mov                 al, byte ptr [ebp + 0x14]
            //   24c0                 | and                 al, 0xc0
            //   83c404               | add                 esp, 4
            //   f6d8                 | neg                 al

        $sequence_2 = { 8b5f14 3b5e1c 0f878c000000 f6471810 0f8582000000 8b86a0000000 99 }
            // n = 7, score = 100
            //   8b5f14               | mov                 ebx, dword ptr [edi + 0x14]
            //   3b5e1c               | cmp                 ebx, dword ptr [esi + 0x1c]
            //   0f878c000000         | ja                  0x92
            //   f6471810             | test                byte ptr [edi + 0x18], 0x10
            //   0f8582000000         | jne                 0x88
            //   8b86a0000000         | mov                 eax, dword ptr [esi + 0xa0]
            //   99                   | cdq                 

        $sequence_3 = { 8b852ce5ffff 8b148580544b00 837c163800 7417 8a441634 8845f4 6a02 }
            // n = 7, score = 100
            //   8b852ce5ffff         | mov                 eax, dword ptr [ebp - 0x1ad4]
            //   8b148580544b00       | mov                 edx, dword ptr [eax*4 + 0x4b5480]
            //   837c163800           | cmp                 dword ptr [esi + edx + 0x38], 0
            //   7417                 | je                  0x19
            //   8a441634             | mov                 al, byte ptr [esi + edx + 0x34]
            //   8845f4               | mov                 byte ptr [ebp - 0xc], al
            //   6a02                 | push                2

        $sequence_4 = { f680f8464a0001 740a 035df8 895d08 3bd9 72ea 0faf7ddc }
            // n = 7, score = 100
            //   f680f8464a0001       | test                byte ptr [eax + 0x4a46f8], 1
            //   740a                 | je                  0xc
            //   035df8               | add                 ebx, dword ptr [ebp - 8]
            //   895d08               | mov                 dword ptr [ebp + 8], ebx
            //   3bd9                 | cmp                 ebx, ecx
            //   72ea                 | jb                  0xffffffec
            //   0faf7ddc             | imul                edi, dword ptr [ebp - 0x24]

        $sequence_5 = { f6462c20 751b 6afe ff36 ff75c4 ff75f8 ff761c }
            // n = 7, score = 100
            //   f6462c20             | test                byte ptr [esi + 0x2c], 0x20
            //   751b                 | jne                 0x1d
            //   6afe                 | push                -2
            //   ff36                 | push                dword ptr [esi]
            //   ff75c4               | push                dword ptr [ebp - 0x3c]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff761c               | push                dword ptr [esi + 0x1c]

        $sequence_6 = { e9???????? c6840d58d6ffff7a e9???????? c6840d58d6ffff72 e9???????? c6840d58d6ffff69 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c6840d58d6ffff7a     | mov                 byte ptr [ebp + ecx - 0x29a8], 0x7a
            //   e9????????           |                     
            //   c6840d58d6ffff72     | mov                 byte ptr [ebp + ecx - 0x29a8], 0x72
            //   e9????????           |                     
            //   c6840d58d6ffff69     | mov                 byte ptr [ebp + ecx - 0x29a8], 0x69
            //   e9????????           |                     

        $sequence_7 = { 83d200 52 50 e8???????? 5e 8be5 5d }
            // n = 7, score = 100
            //   83d200               | adc                 edx, 0
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_8 = { 0fb6c0 57 8945dc e8???????? 8b4ddc 8b55ec 0fb6c0 }
            // n = 7, score = 100
            //   0fb6c0               | movzx               eax, al
            //   57                   | push                edi
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   e8????????           |                     
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   0fb6c0               | movzx               eax, al

        $sequence_9 = { f6462c10 744b 56 ff75f0 e8???????? ff75b0 8bf0 }
            // n = 7, score = 100
            //   f6462c10             | test                byte ptr [esi + 0x2c], 0x10
            //   744b                 | je                  0x4d
            //   56                   | push                esi
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   ff75b0               | push                dword ptr [ebp - 0x50]
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 1572864
}