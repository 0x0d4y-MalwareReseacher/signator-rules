rule win_isspace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.isspace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.isspace"
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
        $sequence_0 = { ff15???????? e9???????? 6a40 6a00 68???????? }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   e9????????           |                     
            //   6a40                 | push                0x40
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_1 = { 6a03 6a02 ff15???????? 894604 }
            // n = 4, score = 200
            //   6a03                 | push                3
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_2 = { 0570010000 50 56 ff15???????? }
            // n = 4, score = 200
            //   0570010000           | add                 eax, 0x170
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_3 = { c701???????? a1???????? 85c0 7409 50 e8???????? 83c404 }
            // n = 7, score = 200
            //   c701????????         |                     
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_4 = { 68???????? 68???????? 68???????? 53 ff15???????? 8bf0 }
            // n = 6, score = 200
            //   68????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_5 = { 6afe 68???????? 68???????? 64a100000000 50 81eca8000000 a1???????? }
            // n = 7, score = 200
            //   6afe                 | push                -2
            //   68????????           |                     
            //   68????????           |                     
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax
            //   81eca8000000         | sub                 esp, 0xa8
            //   a1????????           |                     

        $sequence_6 = { 8d45f0 64a300000000 8965e8 c745fc00000000 ff15???????? 3d04080000 }
            // n = 6, score = 200
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8965e8               | mov                 dword ptr [ebp - 0x18], esp
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   ff15????????         |                     
            //   3d04080000           | cmp                 eax, 0x804

        $sequence_7 = { 6a23 eb04 6a00 6a2b 68???????? }
            // n = 5, score = 200
            //   6a23                 | push                0x23
            //   eb04                 | jmp                 6
            //   6a00                 | push                0
            //   6a2b                 | push                0x2b
            //   68????????           |                     

    condition:
        7 of them and filesize < 434176
}