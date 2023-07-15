rule win_shakti_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.shakti."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shakti"
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
        $sequence_0 = { ff55e4 8945d8 8b45f8 8b4854 894de0 8b55c0 8955cc }
            // n = 7, score = 500
            //   ff55e4               | call                dword ptr [ebp - 0x1c]
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4854               | mov                 ecx, dword ptr [eax + 0x54]
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x40]
            //   8955cc               | mov                 dword ptr [ebp - 0x34], edx

        $sequence_1 = { 8b02 2500000080 7454 8b4dc0 8b55c0 03513c 8955d0 }
            // n = 7, score = 500
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   2500000080           | and                 eax, 0x80000000
            //   7454                 | je                  0x56
            //   8b4dc0               | mov                 ecx, dword ptr [ebp - 0x40]
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x40]
            //   03513c               | add                 edx, dword ptr [ecx + 0x3c]
            //   8955d0               | mov                 dword ptr [ebp - 0x30], edx

        $sequence_2 = { 8b45d0 83c078 8945ec 8b4dec 8b55c0 }
            // n = 5, score = 500
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   83c078               | add                 eax, 0x78
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x40]

        $sequence_3 = { 8b55d0 8b45d8 03421c 8945c4 8b4dd4 0fb711 8b45c4 }
            // n = 7, score = 500
            //   8b55d0               | mov                 edx, dword ptr [ebp - 0x30]
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   03421c               | add                 eax, dword ptr [edx + 0x1c]
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   0fb711               | movzx               edx, word ptr [ecx]
            //   8b45c4               | mov                 eax, dword ptr [ebp - 0x3c]

        $sequence_4 = { 83c278 8955ec 8b45ec 8b4dd8 0308 }
            // n = 5, score = 500
            //   83c278               | add                 edx, 0x78
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   0308                 | add                 ecx, dword ptr [eax]

        $sequence_5 = { 0308 894de4 668b55c8 6683ea01 668955c8 8b45ec 83c004 }
            // n = 7, score = 500
            //   0308                 | add                 ecx, dword ptr [eax]
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   668b55c8             | mov                 dx, word ptr [ebp - 0x38]
            //   6683ea01             | sub                 dx, 1
            //   668955c8             | mov                 word ptr [ebp - 0x38], dx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   83c004               | add                 eax, 4

        $sequence_6 = { 8945e0 8b4de0 833900 0f84a1000000 837df000 7460 8b55f0 }
            // n = 7, score = 500
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   833900               | cmp                 dword ptr [ecx], 0
            //   0f84a1000000         | je                  0xa7
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0
            //   7460                 | je                  0x62
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]

        $sequence_7 = { c1c90d 894dbc 8b55b8 0fbe02 0345bc }
            // n = 5, score = 500
            //   c1c90d               | ror                 ecx, 0xd
            //   894dbc               | mov                 dword ptr [ebp - 0x44], ecx
            //   8b55b8               | mov                 edx, dword ptr [ebp - 0x48]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   0345bc               | add                 eax, dword ptr [ebp - 0x44]

        $sequence_8 = { ffd3 ff75fc 8935???????? e8???????? 59 33c0 }
            // n = 6, score = 400
            //   ffd3                 | call                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   8935????????         |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { ff75f4 8b35???????? ffd6 53 }
            // n = 4, score = 400
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   53                   | push                ebx

        $sequence_10 = { 43 3b5c2418 72de 5f 5e }
            // n = 5, score = 400
            //   43                   | inc                 ebx
            //   3b5c2418             | cmp                 ebx, dword ptr [esp + 0x18]
            //   72de                 | jb                  0xffffffe0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_11 = { e9???????? 57 53 50 ff15???????? 6a40 8bf8 }
            // n = 7, score = 400
            //   e9????????           |                     
            //   57                   | push                edi
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a40                 | push                0x40
            //   8bf8                 | mov                 edi, eax

        $sequence_12 = { 0fb6c0 eb12 8b45e0 8a802ca84000 08443b1d }
            // n = 5, score = 400
            //   0fb6c0               | movzx               eax, al
            //   eb12                 | jmp                 0x14
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8a802ca84000         | mov                 al, byte ptr [eax + 0x40a82c]
            //   08443b1d             | or                  byte ptr [ebx + edi + 0x1d], al

        $sequence_13 = { e8???????? ff7584 ff7588 ff7598 ff759c e8???????? }
            // n = 6, score = 400
            //   e8????????           |                     
            //   ff7584               | push                dword ptr [ebp - 0x7c]
            //   ff7588               | push                dword ptr [ebp - 0x78]
            //   ff7598               | push                dword ptr [ebp - 0x68]
            //   ff759c               | push                dword ptr [ebp - 0x64]
            //   e8????????           |                     

        $sequence_14 = { 50 890d???????? ff15???????? 837dd400 a1???????? 7423 c700b8000000 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   890d????????         |                     
            //   ff15????????         |                     
            //   837dd400             | cmp                 dword ptr [ebp - 0x2c], 0
            //   a1????????           |                     
            //   7423                 | je                  0x25
            //   c700b8000000         | mov                 dword ptr [eax], 0xb8

        $sequence_15 = { e8???????? 894610 897008 8b4610 eb2c 837e0c00 7523 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   894610               | mov                 dword ptr [esi + 0x10], eax
            //   897008               | mov                 dword ptr [eax + 8], esi
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   eb2c                 | jmp                 0x2e
            //   837e0c00             | cmp                 dword ptr [esi + 0xc], 0
            //   7523                 | jne                 0x25

    condition:
        7 of them and filesize < 191488
}