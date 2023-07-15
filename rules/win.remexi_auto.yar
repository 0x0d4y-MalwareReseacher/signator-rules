rule win_remexi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.remexi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.remexi"
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
        $sequence_0 = { 56 c706ffffffff e8???????? 83c404 }
            // n = 4, score = 300
            //   56                   | push                esi
            //   c706ffffffff         | mov                 dword ptr [esi], 0xffffffff
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_1 = { 6a10 8d4ddc 8bf0 51 56 ff15???????? }
            // n = 6, score = 200
            //   6a10                 | mov                 edx, dword ptr [ecx + 4]
            //   8d4ddc               | jne                 0x15
            //   8bf0                 | mov                 eax, dword ptr [ebp - 0x28]
            //   51                   | mov                 ecx, dword ptr [eax + 0x18]
            //   56                   | mov                 edx, dword ptr [ecx + 4]
            //   ff15????????         |                     

        $sequence_2 = { 8b5104 50 8955e0 ff15???????? }
            // n = 4, score = 200
            //   8b5104               | test                esi, esi
            //   50                   | jne                 0x15
            //   8955e0               | mov                 eax, dword ptr [ebp - 0x28]
            //   ff15????????         |                     

        $sequence_3 = { 6828010000 8d8dccfeffff 6a00 51 }
            // n = 4, score = 200
            //   6828010000           | imul                ebx
            //   8d8dccfeffff         | dec                 eax
            //   6a00                 | sar                 edx, 4
            //   51                   | dec                 eax

        $sequence_4 = { 52 6a00 68ffff1f00 ffd7 8bf0 }
            // n = 5, score = 200
            //   52                   | push                2
            //   6a00                 | push                0x10
            //   68ffff1f00           | lea                 ecx, [ebp - 0x24]
            //   ffd7                 | mov                 esi, eax
            //   8bf0                 | push                0x10

        $sequence_5 = { 68???????? 50 c705????????01000000 c705????????00000000 }
            // n = 4, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   c705????????01000000     |     
            //   c705????????00000000     |     

        $sequence_6 = { c705????????00000000 ff15???????? 8b0d???????? 51 }
            // n = 4, score = 200
            //   c705????????00000000     |     
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   51                   | push                ecx

        $sequence_7 = { 894708 6a01 89470c 57 }
            // n = 4, score = 200
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   6a01                 | push                1
            //   89470c               | mov                 dword ptr [edi + 0xc], eax
            //   57                   | push                edi

        $sequence_8 = { 6a02 ff15???????? 6a10 8d4ddc 8bf0 }
            // n = 5, score = 200
            //   6a02                 | mov                 ebx, dword ptr [esp + 0x30]
            //   ff15????????         |                     
            //   6a10                 | dec                 esp
            //   8d4ddc               | lea                 eax, [0x141f8]
            //   8bf0                 | dec                 ecx

        $sequence_9 = { c705????????ffffffff c705????????01000000 c705????????00000000 ffd6 83ffff }
            // n = 5, score = 200
            //   c705????????ffffffff     |     
            //   c705????????01000000     |     
            //   c705????????00000000     |     
            //   ffd6                 | call                esi
            //   83ffff               | cmp                 edi, -1

        $sequence_10 = { 8907 894704 894708 6a01 }
            // n = 4, score = 200
            //   8907                 | mov                 dword ptr [edi], eax
            //   894704               | mov                 dword ptr [edi + 4], eax
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   6a01                 | push                1

        $sequence_11 = { 56 6824000100 50 57 ff15???????? 8bf0 85f6 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   6824000100           | push                0x10024
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_12 = { 50 a3???????? c705????????02000000 890d???????? }
            // n = 4, score = 200
            //   50                   | push                eax
            //   a3????????           |                     
            //   c705????????02000000     |     
            //   890d????????         |                     

        $sequence_13 = { 7513 8b45d8 8b4818 8b5104 }
            // n = 4, score = 200
            //   7513                 | mov                 esi, eax
            //   8b45d8               | push                ecx
            //   8b4818               | push                2
            //   8b5104               | push                0x10

        $sequence_14 = { 6a00 6a02 c785ccfeffff28010000 ff15???????? }
            // n = 4, score = 200
            //   6a00                 | lea                 ecx, [ebp - 0x24]
            //   6a02                 | mov                 esi, eax
            //   c785ccfeffff28010000     | push    ecx
            //   ff15????????         |                     

        $sequence_15 = { e8???????? eb2b 83f8ff 7526 4c8d3555e70100 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   eb2b                 | mov                 dword ptr [esp + 8], ebx
            //   83f8ff               | dec                 eax
            //   7526                 | mov                 dword ptr [esp + 0x10], ebp
            //   4c8d3555e70100       | dec                 eax

        $sequence_16 = { 48ffc8 4883f8fd 7705 bf01000000 8bc7 488b5c2430 }
            // n = 6, score = 100
            //   48ffc8               | mov                 dword ptr [esp + 0x18], esi
            //   4883f8fd             | push                edi
            //   7705                 | dec                 eax
            //   bf01000000           | sub                 esp, 0x20
            //   8bc7                 | mov                 edi, 0x24
            //   488b5c2430           | dec                 eax

        $sequence_17 = { 48895c2408 48896c2410 4889742418 57 4883ec20 bf24000000 488d1d50280200 }
            // n = 7, score = 100
            //   48895c2408           | dec                 ecx
            //   48896c2410           | or                  esi, 0xffffffff
            //   4889742418           | dec                 eax
            //   57                   | mov                 edx, dword ptr [esp + 0x68]
            //   4883ec20             | dec                 eax
            //   bf24000000           | lea                 edx, [0x13483]
            //   488d1d50280200       | dec                 eax

        $sequence_18 = { 0f838d000000 482bde 498bc7 48f7eb 48c1fa04 }
            // n = 5, score = 100
            //   0f838d000000         | jmp                 0x2d
            //   482bde               | cmp                 eax, -1
            //   498bc7               | jne                 0x2b
            //   48f7eb               | dec                 esp
            //   48c1fa04             | lea                 esi, [0x1e755]

        $sequence_19 = { 4c8d05f8410100 498b0cc8 486bd258 c644110800 85db }
            // n = 5, score = 100
            //   4c8d05f8410100       | lea                 ebx, [0x22850]
            //   498b0cc8             | dec                 eax
            //   486bd258             | lea                 edx, [0x133ed]
            //   c644110800           | dec                 eax
            //   85db                 | mov                 ecx, ebx

        $sequence_20 = { ff15???????? 488d1583340100 488bcb 483305???????? }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   488d1583340100       | dec                 eax
            //   488bcb               | mov                 ebx, dword ptr [esp + 0x60]
            //   483305????????       |                     

        $sequence_21 = { 480f43c1 4c2bf0 488b5c2460 eb13 488b5c2460 4983ceff 488b542468 }
            // n = 7, score = 100
            //   480f43c1             | dec                 eax
            //   4c2bf0               | cmovae              eax, ecx
            //   488b5c2460           | dec                 esp
            //   eb13                 | sub                 esi, eax
            //   488b5c2460           | dec                 eax
            //   4983ceff             | mov                 ebx, dword ptr [esp + 0x60]
            //   488b542468           | jmp                 0x15

        $sequence_22 = { 488d15ed330100 483305???????? 488bcb 488905???????? ff15???????? }
            // n = 5, score = 100
            //   488d15ed330100       | mov                 ecx, ebx
            //   483305????????       |                     
            //   488bcb               | dec                 eax
            //   488905????????       |                     
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 614400
}