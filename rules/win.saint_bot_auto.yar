rule win_saint_bot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.saint_bot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.saint_bot"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { e8???????? 68???????? 56 57 e8???????? ff75e8 56 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   68????????           |                     
            //   56                   | push                esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   56                   | push                esi

        $sequence_1 = { 8d85a8fbffff 50 e8???????? 68???????? 53 8d85a8fbffff 50 }
            // n = 7, score = 100
            //   8d85a8fbffff         | lea                 eax, [ebp - 0x458]
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   53                   | push                ebx
            //   8d85a8fbffff         | lea                 eax, [ebp - 0x458]
            //   50                   | push                eax

        $sequence_2 = { 59 85c0 6a01 58 0f45f0 47 3b7dfc }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   6a01                 | push                1
            //   58                   | pop                 eax
            //   0f45f0               | cmovne              esi, eax
            //   47                   | inc                 edi
            //   3b7dfc               | cmp                 edi, dword ptr [ebp - 4]

        $sequence_3 = { 57 6a02 e8???????? 8b3d???????? 59 68c8000000 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   6a02                 | push                2
            //   e8????????           |                     
            //   8b3d????????         |                     
            //   59                   | pop                 ecx
            //   68c8000000           | push                0xc8

        $sequence_4 = { ff15???????? 57 50 ff15???????? eb14 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   eb14                 | jmp                 0x16

        $sequence_5 = { 8bf0 8d45f8 50 6aff 6a2e ff750c }
            // n = 6, score = 100
            //   8bf0                 | mov                 esi, eax
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   6a2e                 | push                0x2e
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_6 = { ffd7 ff75f4 a3???????? 53 ffd7 ff75f8 }
            // n = 6, score = 100
            //   ffd7                 | call                edi
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   a3????????           |                     
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_7 = { ff75f0 ffd6 ff75ec ffd6 6afa 68???????? e8???????? }
            // n = 7, score = 100
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ffd6                 | call                esi
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ffd6                 | call                esi
            //   6afa                 | push                -6
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_8 = { 69c8e8030000 0fb745e6 03c8 51 }
            // n = 4, score = 100
            //   69c8e8030000         | imul                ecx, eax, 0x3e8
            //   0fb745e6             | movzx               eax, word ptr [ebp - 0x1a]
            //   03c8                 | add                 ecx, eax
            //   51                   | push                ecx

        $sequence_9 = { 85c0 7839 8b45fc 3d19040000 742a }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   7839                 | js                  0x3b
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3d19040000           | cmp                 eax, 0x419
            //   742a                 | je                  0x2c

    condition:
        7 of them and filesize < 93184
}