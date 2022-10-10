rule win_sword_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.sword."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sword"
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
        $sequence_0 = { eb0f 0fb6d2 f682e19f400004 7403 40 }
            // n = 5, score = 100
            //   eb0f                 | jmp                 0x11
            //   0fb6d2               | movzx               edx, dl
            //   f682e19f400004       | test                byte ptr [edx + 0x409fe1], 4
            //   7403                 | je                  5
            //   40                   | inc                 eax

        $sequence_1 = { 83e61f 8d1c8500a14000 c1e603 8b03 f644300401 7469 }
            // n = 6, score = 100
            //   83e61f               | and                 esi, 0x1f
            //   8d1c8500a14000       | lea                 ebx, [eax*4 + 0x40a100]
            //   c1e603               | shl                 esi, 3
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   f644300401           | test                byte ptr [eax + esi + 4], 1
            //   7469                 | je                  0x6b

        $sequence_2 = { 0f849f000000 8d8424940a0000 8d4c2428 50 51 ff15???????? 83f8ff }
            // n = 7, score = 100
            //   0f849f000000         | je                  0xa5
            //   8d8424940a0000       | lea                 eax, [esp + 0xa94]
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1

        $sequence_3 = { 6a00 6a00 6a00 7509 8d542414 6a04 52 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   7509                 | jne                 0xb
            //   8d542414             | lea                 edx, [esp + 0x14]
            //   6a04                 | push                4
            //   52                   | push                edx

        $sequence_4 = { 56 ff15???????? 8b542414 8b35???????? 52 ffd6 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   8b35????????         |                     
            //   52                   | push                edx
            //   ffd6                 | call                esi

        $sequence_5 = { 3bc3 7472 385c2428 0f849f000000 8d8424940a0000 8d4c2428 50 }
            // n = 7, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   7472                 | je                  0x74
            //   385c2428             | cmp                 byte ptr [esp + 0x28], bl
            //   0f849f000000         | je                  0xa5
            //   8d8424940a0000       | lea                 eax, [esp + 0xa94]
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   50                   | push                eax

        $sequence_6 = { 83f903 7638 8d7c2428 83c9ff 33c0 }
            // n = 5, score = 100
            //   83f903               | cmp                 ecx, 3
            //   7638                 | jbe                 0x3a
            //   8d7c2428             | lea                 edi, [esp + 0x28]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax

        $sequence_7 = { 52 50 ff15???????? 85c0 754d }
            // n = 5, score = 100
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   754d                 | jne                 0x4f

        $sequence_8 = { 83c9ff 33c0 f2ae f7d1 2bf9 8b44240c 8bd1 }
            // n = 7, score = 100
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   2bf9                 | sub                 edi, ecx
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   8bd1                 | mov                 edx, ecx

        $sequence_9 = { 83d8ff 3bc3 0f8495000000 8d8424940a0000 50 55 }
            // n = 6, score = 100
            //   83d8ff               | sbb                 eax, -1
            //   3bc3                 | cmp                 eax, ebx
            //   0f8495000000         | je                  0x9b
            //   8d8424940a0000       | lea                 eax, [esp + 0xa94]
            //   50                   | push                eax
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 106496
}