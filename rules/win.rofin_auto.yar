rule win_rofin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.rofin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rofin"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 6a01 8bcb e8???????? 8b442428 }
            // n = 4, score = 100
            //   6a01                 | push                1
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]

        $sequence_1 = { 837c241801 7407 33db e9???????? 6a00 6a00 56 }
            // n = 7, score = 100
            //   837c241801           | cmp                 dword ptr [esp + 0x18], 1
            //   7407                 | je                  9
            //   33db                 | xor                 ebx, ebx
            //   e9????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi

        $sequence_2 = { 8d5594 52 8d4614 50 6a00 6a00 6a00 }
            // n = 7, score = 100
            //   8d5594               | lea                 edx, dword ptr [ebp - 0x6c]
            //   52                   | push                edx
            //   8d4614               | lea                 eax, dword ptr [esi + 0x14]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_3 = { 0f83aff9ffff 8b3d???????? 68e8030000 ffd7 8b6c245c 8b5c2464 e9???????? }
            // n = 7, score = 100
            //   0f83aff9ffff         | jae                 0xfffff9b5
            //   8b3d????????         |                     
            //   68e8030000           | push                0x3e8
            //   ffd7                 | call                edi
            //   8b6c245c             | mov                 ebp, dword ptr [esp + 0x5c]
            //   8b5c2464             | mov                 ebx, dword ptr [esp + 0x64]
            //   e9????????           |                     

        $sequence_4 = { 746d 6f 6e 2e7379 7300 56 68b2050100 }
            // n = 7, score = 100
            //   746d                 | je                  0x6f
            //   6f                   | outsd               dx, dword ptr [esi]
            //   6e                   | outsb               dx, byte ptr [esi]
            //   2e7379               | jae                 0x7c
            //   7300                 | jae                 2
            //   56                   | push                esi
            //   68b2050100           | push                0x105b2

        $sequence_5 = { 51 52 ff15???????? 8b442430 8d4c2410 50 }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]
            //   50                   | push                eax

        $sequence_6 = { 8b842498000000 8d4c2424 6a6a 51 8984248e000000 c744243400000000 e8???????? }
            // n = 7, score = 100
            //   8b842498000000       | mov                 eax, dword ptr [esp + 0x98]
            //   8d4c2424             | lea                 ecx, dword ptr [esp + 0x24]
            //   6a6a                 | push                0x6a
            //   51                   | push                ecx
            //   8984248e000000       | mov                 dword ptr [esp + 0x8e], eax
            //   c744243400000000     | mov                 dword ptr [esp + 0x34], 0
            //   e8????????           |                     

        $sequence_7 = { 833d????????00 740c e8???????? eb05 bf0d0000c0 83661c00 32d2 }
            // n = 7, score = 100
            //   833d????????00       |                     
            //   740c                 | je                  0xe
            //   e8????????           |                     
            //   eb05                 | jmp                 7
            //   bf0d0000c0           | mov                 edi, 0xc000000d
            //   83661c00             | and                 dword ptr [esi + 0x1c], 0
            //   32d2                 | xor                 dl, dl

        $sequence_8 = { 6a00 53 e8???????? 85c0 7407 33c0 5b }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx

        $sequence_9 = { eb01 53 ff9770030000 eb82 837df800 74f1 }
            // n = 6, score = 100
            //   eb01                 | jmp                 3
            //   53                   | push                ebx
            //   ff9770030000         | call                dword ptr [edi + 0x370]
            //   eb82                 | jmp                 0xffffff84
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   74f1                 | je                  0xfffffff3

    condition:
        7 of them and filesize < 409600
}