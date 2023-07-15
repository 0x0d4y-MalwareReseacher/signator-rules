rule win_khrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.khrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.khrat"
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
        $sequence_0 = { 8d45fc 50 ff7510 ff750c ff7308 e8???????? }
            // n = 6, score = 100
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7308               | push                dword ptr [ebx + 8]
            //   e8????????           |                     

        $sequence_1 = { c745e401000000 c745e804000000 c745ecf85f0010 8d85a4fbffff 50 6a01 6a00 }
            // n = 7, score = 100
            //   c745e401000000       | mov                 dword ptr [ebp - 0x1c], 1
            //   c745e804000000       | mov                 dword ptr [ebp - 0x18], 4
            //   c745ecf85f0010       | mov                 dword ptr [ebp - 0x14], 0x10005ff8
            //   8d85a4fbffff         | lea                 eax, [ebp - 0x45c]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_2 = { 6a07 8d85d4f9ffff 50 ff35???????? }
            // n = 4, score = 100
            //   6a07                 | push                7
            //   8d85d4f9ffff         | lea                 eax, [ebp - 0x62c]
            //   50                   | push                eax
            //   ff35????????         |                     

        $sequence_3 = { ff35???????? e8???????? 6a00 6880000000 6a02 6a00 6a01 }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a01                 | push                1

        $sequence_4 = { 55 8bec 81c48cfbffff 8d1d10520010 8b4d08 6bc914 }
            // n = 6, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81c48cfbffff         | add                 esp, 0xfffffb8c
            //   8d1d10520010         | lea                 ebx, [0x10005210]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   6bc914               | imul                ecx, ecx, 0x14

        $sequence_5 = { e8???????? 50 57 e8???????? 6a05 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   6a05                 | push                5

        $sequence_6 = { 57 ffb594fbffff e8???????? eb08 c70300000000 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   ffb594fbffff         | push                dword ptr [ebp - 0x46c]
            //   e8????????           |                     
            //   eb08                 | jmp                 0xa
            //   c70300000000         | mov                 dword ptr [ebx], 0

        $sequence_7 = { 6a02 e8???????? 8985d0f9ffff 8d85d4fdffff 50 }
            // n = 5, score = 100
            //   6a02                 | push                2
            //   e8????????           |                     
            //   8985d0f9ffff         | mov                 dword ptr [ebp - 0x630], eax
            //   8d85d4fdffff         | lea                 eax, [ebp - 0x22c]
            //   50                   | push                eax

        $sequence_8 = { c60600 46 66ff4302 6a00 6a00 6801100000 6800040000 }
            // n = 7, score = 100
            //   c60600               | mov                 byte ptr [esi], 0
            //   46                   | inc                 esi
            //   66ff4302             | inc                 word ptr [ebx + 2]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6801100000           | push                0x1001
            //   6800040000           | push                0x400

        $sequence_9 = { 807b0500 0f85c4000000 807b0600 752f ff7307 8f05???????? }
            // n = 6, score = 100
            //   807b0500             | cmp                 byte ptr [ebx + 5], 0
            //   0f85c4000000         | jne                 0xca
            //   807b0600             | cmp                 byte ptr [ebx + 6], 0
            //   752f                 | jne                 0x31
            //   ff7307               | push                dword ptr [ebx + 7]
            //   8f05????????         |                     

    condition:
        7 of them and filesize < 57344
}