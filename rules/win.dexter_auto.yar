rule win_dexter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.dexter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dexter"
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
        $sequence_0 = { 85c0 7431 6aff 8b0d???????? 51 ff15???????? }
            // n = 6, score = 400
            //   85c0                 | test                eax, eax
            //   7431                 | je                  0x33
            //   6aff                 | push                -1
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_1 = { 6a00 6a00 8b4508 50 8b0d???????? 51 ff15???????? }
            // n = 7, score = 400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_2 = { 6a05 68???????? e8???????? 83c408 6a0a 6a00 }
            // n = 6, score = 400
            //   6a05                 | push                5
            //   68????????           |                     
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   6a0a                 | push                0xa
            //   6a00                 | push                0

        $sequence_3 = { eb17 837df400 7511 6a01 e8???????? }
            // n = 5, score = 400
            //   eb17                 | jmp                 0x19
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0
            //   7511                 | jne                 0x13
            //   6a01                 | push                1
            //   e8????????           |                     

        $sequence_4 = { 85c0 7507 b801000000 eb0d 8b4dfc 83c101 }
            // n = 6, score = 400
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   b801000000           | mov                 eax, 1
            //   eb0d                 | jmp                 0xf
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c101               | add                 ecx, 1

        $sequence_5 = { 83c40c 68???????? ff15???????? 6a00 6a00 6a00 6a00 }
            // n = 7, score = 400
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_6 = { 50 e8???????? 83c40c 8b0d???????? 034d0c 890d???????? }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b0d????????         |                     
            //   034d0c               | add                 ecx, dword ptr [ebp + 0xc]
            //   890d????????         |                     

        $sequence_7 = { 8945f8 68???????? ff15???????? 50 8b45fc }
            // n = 5, score = 400
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_8 = { ff15???????? 50 8b45fc 50 68???????? }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_9 = { 83c40c 034508 894508 8b5508 83c201 }
            // n = 5, score = 400
            //   83c40c               | add                 esp, 0xc
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83c201               | add                 edx, 1

    condition:
        7 of them and filesize < 98304
}