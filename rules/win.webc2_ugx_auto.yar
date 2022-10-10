rule win_webc2_ugx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.webc2_ugx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_ugx"
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
        $sequence_0 = { e8???????? 6a01 6a10 57 68420d0000 56 56 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a01                 | push                1
            //   6a10                 | push                0x10
            //   57                   | push                edi
            //   68420d0000           | push                0xd42
            //   56                   | push                esi
            //   56                   | push                esi

        $sequence_1 = { ff55c0 57 ff55f8 ff55e8 ff7508 81c6a0060000 }
            // n = 6, score = 100
            //   ff55c0               | call                dword ptr [ebp - 0x40]
            //   57                   | push                edi
            //   ff55f8               | call                dword ptr [ebp - 8]
            //   ff55e8               | call                dword ptr [ebp - 0x18]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   81c6a0060000         | add                 esi, 0x6a0

        $sequence_2 = { 55 50 6a05 ff16 ebe2 5f 5e }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   50                   | push                eax
            //   6a05                 | push                5
            //   ff16                 | call                dword ptr [esi]
            //   ebe2                 | jmp                 0xffffffe4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_3 = { 7508 ff5508 ff75f8 eb2d ff5508 8d8584f9ffff 57 }
            // n = 7, score = 100
            //   7508                 | jne                 0xa
            //   ff5508               | call                dword ptr [ebp + 8]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   eb2d                 | jmp                 0x2f
            //   ff5508               | call                dword ptr [ebp + 8]
            //   8d8584f9ffff         | lea                 eax, [ebp - 0x67c]
            //   57                   | push                edi

        $sequence_4 = { c78570ffffff01000000 8d85e0fbffff 50 6804010000 ff55c0 8d86d8040000 }
            // n = 6, score = 100
            //   c78570ffffff01000000     | mov    dword ptr [ebp - 0x90], 1
            //   8d85e0fbffff         | lea                 eax, [ebp - 0x420]
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   ff55c0               | call                dword ptr [ebp - 0x40]
            //   8d86d8040000         | lea                 eax, [esi + 0x4d8]

        $sequence_5 = { 3bc3 8945e4 0f84d9020000 8d867e0c0000 50 57 }
            // n = 6, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   0f84d9020000         | je                  0x2df
            //   8d867e0c0000         | lea                 eax, [esi + 0xc7e]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_6 = { ff55b4 6a20 58 8945d4 }
            // n = 4, score = 100
            //   ff55b4               | call                dword ptr [ebp - 0x4c]
            //   6a20                 | push                0x20
            //   58                   | pop                 eax
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_7 = { 83c003 59 50 8d85d8f9ffff }
            // n = 4, score = 100
            //   83c003               | add                 eax, 3
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   8d85d8f9ffff         | lea                 eax, [ebp - 0x628]

        $sequence_8 = { aa 8bbe04070000 895dfc 3bfb }
            // n = 4, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8bbe04070000         | mov                 edi, dword ptr [esi + 0x704]
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   3bfb                 | cmp                 edi, ebx

        $sequence_9 = { 897df8 7511 ffb6c0040000 6a01 56 ff55f4 }
            // n = 6, score = 100
            //   897df8               | mov                 dword ptr [ebp - 8], edi
            //   7511                 | jne                 0x13
            //   ffb6c0040000         | push                dword ptr [esi + 0x4c0]
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff55f4               | call                dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 57344
}