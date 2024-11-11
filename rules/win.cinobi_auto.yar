rule win_cinobi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.cinobi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cinobi"
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
        $sequence_0 = { c9 c3 55 8bec 51 e8???????? 58 }
            // n = 7, score = 200
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   e8????????           |                     
            //   58                   | pop                 eax

        $sequence_1 = { c9 c3 0fb6d2 0fb6c1 }
            // n = 4, score = 100
            //   c9                   | leave               
            //   c3                   | ret                 
            //   0fb6d2               | movzx               edx, dl
            //   0fb6c1               | movzx               eax, cl

        $sequence_2 = { 8b45c0 ff705f 8b45c0 ff706b ff75dc }
            // n = 5, score = 100
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]
            //   ff705f               | push                dword ptr [eax + 0x5f]
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]
            //   ff706b               | push                dword ptr [eax + 0x6b]
            //   ff75dc               | push                dword ptr [ebp - 0x24]

        $sequence_3 = { ff7067 ff75dc e8???????? 83c40c 8b4dc0 }
            // n = 5, score = 100
            //   ff7067               | push                dword ptr [eax + 0x67]
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b4dc0               | mov                 ecx, dword ptr [ebp - 0x40]

        $sequence_4 = { 8d75e8 8945e4 e8???????? 59 84c0 0f8493000000 8b45ec }
            // n = 7, score = 100
            //   8d75e8               | lea                 esi, [ebp - 0x18]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f8493000000         | je                  0x99
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]

        $sequence_5 = { 57 ff565f 8986f7000000 8d86a9030000 50 57 ff565f }
            // n = 7, score = 100
            //   57                   | push                edi
            //   ff565f               | call                dword ptr [esi + 0x5f]
            //   8986f7000000         | mov                 dword ptr [esi + 0xf7], eax
            //   8d86a9030000         | lea                 eax, [esi + 0x3a9]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff565f               | call                dword ptr [esi + 0x5f]

        $sequence_6 = { 59 84c0 751a 57 ff96b3000000 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   751a                 | jne                 0x1c
            //   57                   | push                edi
            //   ff96b3000000         | call                dword ptr [esi + 0xb3]

        $sequence_7 = { 668945aa 8b85a8faffff 660fbe4025 668945ac 8b85a8faffff 660fbe4001 }
            // n = 6, score = 100
            //   668945aa             | mov                 word ptr [ebp - 0x56], ax
            //   8b85a8faffff         | mov                 eax, dword ptr [ebp - 0x558]
            //   660fbe4025           | movsx               ax, byte ptr [eax + 0x25]
            //   668945ac             | mov                 word ptr [ebp - 0x54], ax
            //   8b85a8faffff         | mov                 eax, dword ptr [ebp - 0x558]
            //   660fbe4001           | movsx               ax, byte ptr [eax + 1]

        $sequence_8 = { 50 ff93a3000000 8d45cc 50 8bc7 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   ff93a3000000         | call                dword ptr [ebx + 0xa3]
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   50                   | push                eax
            //   8bc7                 | mov                 eax, edi

        $sequence_9 = { 6689855afbffff 8b45f8 660fbe403a 6689855cfbffff 8b45f8 }
            // n = 5, score = 100
            //   6689855afbffff       | mov                 word ptr [ebp - 0x4a6], ax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   660fbe403a           | movsx               ax, byte ptr [eax + 0x3a]
            //   6689855cfbffff       | mov                 word ptr [ebp - 0x4a4], ax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_10 = { 88842450010000 8a4646 88842451010000 8a460b }
            // n = 4, score = 100
            //   88842450010000       | mov                 byte ptr [esp + 0x150], al
            //   8a4646               | mov                 al, byte ptr [esi + 0x46]
            //   88842451010000       | mov                 byte ptr [esp + 0x151], al
            //   8a460b               | mov                 al, byte ptr [esi + 0xb]

        $sequence_11 = { 8b45c0 8a4034 8845c9 8b45c0 }
            // n = 4, score = 100
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]
            //   8a4034               | mov                 al, byte ptr [eax + 0x34]
            //   8845c9               | mov                 byte ptr [ebp - 0x37], al
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]

        $sequence_12 = { 8b45f4 ff9083000000 32c0 eb61 }
            // n = 4, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   ff9083000000         | call                dword ptr [eax + 0x83]
            //   32c0                 | xor                 al, al
            //   eb61                 | jmp                 0x63

        $sequence_13 = { 8b45f4 ff9083000000 b001 c9 }
            // n = 4, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   ff9083000000         | call                dword ptr [eax + 0x83]
            //   b001                 | mov                 al, 1
            //   c9                   | leave               

        $sequence_14 = { ffb683000000 57 e8???????? ff765f 898683000000 }
            // n = 5, score = 100
            //   ffb683000000         | push                dword ptr [esi + 0x83]
            //   57                   | push                edi
            //   e8????????           |                     
            //   ff765f               | push                dword ptr [esi + 0x5f]
            //   898683000000         | mov                 dword ptr [esi + 0x83], eax

    condition:
        7 of them and filesize < 32768
}