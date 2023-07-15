rule win_unidentified_090_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.unidentified_090."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_090"
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
        $sequence_0 = { 81f22083b8ed 2401 0f44d1 8bc2 d1e8 8bc8 81f12083b8ed }
            // n = 7, score = 200
            //   81f22083b8ed         | push                0
            //   2401                 | push                dword ptr [ebp - 0x408]
            //   0f44d1               | lea                 eax, [ebp - 0x404]
            //   8bc2                 | push                dword ptr [esi + 0x24]
            //   d1e8                 | push                -1
            //   8bc8                 | push                eax
            //   81f12083b8ed         | push                0

        $sequence_1 = { 8bd0 81f22083b8ed 80e101 0f44d0 8bca d1e9 }
            // n = 6, score = 200
            //   8bd0                 | cmp                 ecx, 0x600
            //   81f22083b8ed         | jb                  0x1285
            //   80e101               | dec                 eax
            //   0f44d0               | lea                 ecx, [0x21005]
            //   8bca                 | dec                 eax
            //   d1e9                 | test                eax, eax

        $sequence_2 = { 81f22083b8ed 80e101 0f44d0 8bca d1e9 8bc1 352083b8ed }
            // n = 7, score = 200
            //   81f22083b8ed         | call                dword ptr [ebp - 0xc4]
            //   80e101               | test                eax, eax
            //   0f44d0               | jne                 0x14d
            //   8bca                 | push                0
            //   d1e9                 | push                edi
            //   8bc1                 | push                eax
            //   352083b8ed           | push                0

        $sequence_3 = { 80e101 0f44d0 8bca d1e9 8bc1 }
            // n = 5, score = 200
            //   80e101               | inc                 ebp
            //   0f44d0               | xor                 eax, eax
            //   8bca                 | dec                 esp
            //   d1e9                 | lea                 ecx, [ebp - 0x49]
            //   8bc1                 | inc                 ebp

        $sequence_4 = { 0f44d0 8bca d1e9 8bc1 }
            // n = 4, score = 200
            //   0f44d0               | lea                 eax, [ebp - 0x28]
            //   8bca                 | cmovae              eax, dword ptr [ebp - 0x28]
            //   d1e9                 | cmovb               edx, eax
            //   8bc1                 | mov                 dword ptr [ebp - 8], edx

        $sequence_5 = { 81f22083b8ed 80e101 0f44d0 8bca }
            // n = 4, score = 200
            //   81f22083b8ed         | push                dword ptr [esi + 0x28]
            //   80e101               | push                eax
            //   0f44d0               | push                4
            //   8bca                 | push                eax

        $sequence_6 = { 8bd1 81f22083b8ed 2401 0f44d1 8bc2 d1e8 8bc8 }
            // n = 7, score = 200
            //   8bd1                 | add                 ebx, dword ptr [ebp - 0xc88]
            //   81f22083b8ed         | xor                 edi, edi
            //   2401                 | cmp                 dword ptr [esi + 0x14], edi
            //   0f44d1               | jbe                 0x4ab
            //   8bc2                 | push                0
            //   d1e8                 | push                0
            //   8bc8                 | jne                 0x49e

        $sequence_7 = { 8bd1 81f22083b8ed 2401 0f44d1 8bc2 d1e8 }
            // n = 6, score = 200
            //   8bd1                 | jb                  0x12c9
            //   81f22083b8ed         | mov                 ecx, 0x263
            //   2401                 | mov                 esi, ebx
            //   0f44d1               | mov                 edi, eax
            //   8bc2                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   d1e8                 | cmp                 esi, 0x98c

        $sequence_8 = { 8bca d1e9 8bc1 352083b8ed }
            // n = 4, score = 200
            //   8bca                 | mov                 byte ptr [edx], cl
            //   d1e9                 | movzx               ecx, byte ptr [esp + 0x90]
            //   8bc1                 | dec                 esp
            //   352083b8ed           | lea                 eax, [0xcb09]

        $sequence_9 = { 81f22083b8ed 2401 0f44d1 8bc2 d1e8 8bc8 }
            // n = 6, score = 200
            //   81f22083b8ed         | jmp                 0x1b8
            //   2401                 | mov                 dword ptr [ebp - 0x69], eax
            //   0f44d1               | dec                 ebx
            //   8bc2                 | mov                 eax, dword ptr [edi + 0x32980]
            //   d1e8                 | dec                 esp
            //   8bc8                 | mov                 eax, dword ptr [ebp - 0x51]

    condition:
        7 of them and filesize < 839680
}