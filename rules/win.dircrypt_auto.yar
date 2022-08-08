rule win_dircrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.dircrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dircrypt"
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
        $sequence_0 = { 833d????????00 751a 68???????? e8???????? 05d2070000 50 }
            // n = 6, score = 900
            //   833d????????00       |                     
            //   751a                 | jne                 0x1c
            //   68????????           |                     
            //   e8????????           |                     
            //   05d2070000           | add                 eax, 0x7d2
            //   50                   | push                eax

        $sequence_1 = { 6a01 6a02 6a08 8d45e4 50 }
            // n = 5, score = 900
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   6a08                 | push                8
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax

        $sequence_2 = { ff15???????? a3???????? eb0a c705????????01000000 }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   a3????????           |                     
            //   eb0a                 | jmp                 0xc
            //   c705????????01000000     |     

        $sequence_3 = { 6801000080 e8???????? e8???????? e8???????? e8???????? }
            // n = 5, score = 900
            //   6801000080           | push                0x80000001
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_4 = { e8???????? 68???????? e8???????? 05d2070000 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   05d2070000           | add                 eax, 0x7d2

        $sequence_5 = { 7528 c705????????01000000 e8???????? e8???????? e8???????? e8???????? e8???????? }
            // n = 7, score = 900
            //   7528                 | jne                 0x2a
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_6 = { e8???????? 05d7070000 50 6a01 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   05d7070000           | add                 eax, 0x7d7
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_7 = { e8???????? 6a01 6a10 ff15???????? }
            // n = 4, score = 900
            //   e8????????           |                     
            //   6a01                 | push                1
            //   6a10                 | push                0x10
            //   ff15????????         |                     

        $sequence_8 = { 05d2070000 50 e8???????? a3???????? 6a13 }
            // n = 5, score = 900
            //   05d2070000           | add                 eax, 0x7d2
            //   50                   | push                eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   6a13                 | push                0x13

        $sequence_9 = { 7514 68???????? 68???????? e8???????? a3???????? 833d????????00 }
            // n = 6, score = 900
            //   7514                 | jne                 0x16
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   a3????????           |                     
            //   833d????????00       |                     

    condition:
        7 of them and filesize < 671744
}