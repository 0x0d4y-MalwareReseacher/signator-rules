rule win_powerduke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.powerduke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.powerduke"
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
        $sequence_0 = { 50 ff15???????? b9???????? 41 8d95fcfbffff 50 52 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   b9????????           |                     
            //   41                   | inc                 ecx
            //   8d95fcfbffff         | lea                 edx, [ebp - 0x404]
            //   50                   | push                eax
            //   52                   | push                edx

        $sequence_1 = { ffb5f8fbffff ff15???????? 58 c9 }
            // n = 4, score = 200
            //   ffb5f8fbffff         | push                dword ptr [ebp - 0x408]
            //   ff15????????         |                     
            //   58                   | pop                 eax
            //   c9                   | leave               

        $sequence_2 = { 6800300000 ff7518 6a00 ff15???????? 09c0 7419 }
            // n = 6, score = 200
            //   6800300000           | push                0x3000
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   09c0                 | or                  eax, eax
            //   7419                 | je                  0x1b

        $sequence_3 = { e8???????? 837df900 7448 c745f900000000 8d45e1 50 ff15???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   837df900             | cmp                 dword ptr [ebp - 7], 0
            //   7448                 | je                  0x4a
            //   c745f900000000       | mov                 dword ptr [ebp - 7], 0
            //   8d45e1               | lea                 eax, [ebp - 0x1f]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_4 = { eb0a b800000000 b9???????? 5e c9 }
            // n = 5, score = 200
            //   eb0a                 | jmp                 0xc
            //   b800000000           | mov                 eax, 0
            //   b9????????           |                     
            //   5e                   | pop                 esi
            //   c9                   | leave               

        $sequence_5 = { ac 66ad 663d2f2f 0f8579010000 }
            // n = 4, score = 200
            //   ac                   | lodsb               al, byte ptr [esi]
            //   66ad                 | lodsw               ax, word ptr [esi]
            //   663d2f2f             | cmp                 ax, 0x2f2f
            //   0f8579010000         | jne                 0x17f

        $sequence_6 = { 7435 837ddc00 742f ff75dc 8f05???????? }
            // n = 5, score = 200
            //   7435                 | je                  0x37
            //   837ddc00             | cmp                 dword ptr [ebp - 0x24], 0
            //   742f                 | je                  0x31
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   8f05????????         |                     

        $sequence_7 = { 89f7 e8???????? 837df900 7448 c745f900000000 8d45e1 }
            // n = 6, score = 200
            //   89f7                 | mov                 edi, esi
            //   e8????????           |                     
            //   837df900             | cmp                 dword ptr [ebp - 7], 0
            //   7448                 | je                  0x4a
            //   c745f900000000       | mov                 dword ptr [ebp - 7], 0
            //   8d45e1               | lea                 eax, [ebp - 0x1f]

        $sequence_8 = { 757f 8db5fcefffff 8d4dfc 51 56 6a00 }
            // n = 6, score = 200
            //   757f                 | jne                 0x81
            //   8db5fcefffff         | lea                 esi, [ebp - 0x1004]
            //   8d4dfc               | lea                 ecx, [ebp - 4]
            //   51                   | push                ecx
            //   56                   | push                esi
            //   6a00                 | push                0

        $sequence_9 = { ff15???????? c745fc01000000 eb11 c745d001000000 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   eb11                 | jmp                 0x13
            //   c745d001000000       | mov                 dword ptr [ebp - 0x30], 1

    condition:
        7 of them and filesize < 57344
}