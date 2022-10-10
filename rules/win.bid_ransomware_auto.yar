rule win_bid_ransomware_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.bid_ransomware."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bid_ransomware"
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
        $sequence_0 = { 8bec 81c4d4fdffff e8???????? 60 6a00 6a02 }
            // n = 6, score = 200
            //   8bec                 | mov                 ebp, esp
            //   81c4d4fdffff         | add                 esp, 0xfffffdd4
            //   e8????????           |                     
            //   60                   | pushal              
            //   6a00                 | push                0
            //   6a02                 | push                2

        $sequence_1 = { c9 c20800 55 8bec 83c4e4 60 8b4508 }
            // n = 7, score = 200
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83c4e4               | add                 esp, -0x1c
            //   60                   | pushal              
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_2 = { 6a00 e8???????? 59 6a00 6a00 ff75fc 51 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   51                   | push                ecx

        $sequence_3 = { e8???????? c9 c20400 c605????????79 6a01 6a00 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   c605????????79       |                     
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_4 = { 8d359f454000 56 ff7508 e8???????? 0bc0 7507 }
            // n = 6, score = 200
            //   8d359f454000         | lea                 esi, [0x40459f]
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   0bc0                 | or                  eax, eax
            //   7507                 | jne                 9

        $sequence_5 = { 8bec 83c4dc 837d0c00 7413 8d45dc 50 6a00 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   83c4dc               | add                 esp, -0x24
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7413                 | je                  0x15
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_6 = { 6a00 6a00 e8???????? ff75a8 }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   ff75a8               | push                dword ptr [ebp - 0x58]

        $sequence_7 = { 8945fc 6a00 8d45f8 50 68b2000000 }
            // n = 5, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   6a00                 | push                0
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   68b2000000           | push                0xb2

        $sequence_8 = { 8d8620800000 50 e8???????? b911400000 8b7d08 81c720800000 }
            // n = 6, score = 200
            //   8d8620800000         | lea                 eax, [esi + 0x8020]
            //   50                   | push                eax
            //   e8????????           |                     
            //   b911400000           | mov                 ecx, 0x4011
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   81c720800000         | add                 edi, 0x8020

        $sequence_9 = { 0bc0 750c 68c8000000 e8???????? ebe4 8945bc 8b4d08 }
            // n = 7, score = 200
            //   0bc0                 | or                  eax, eax
            //   750c                 | jne                 0xe
            //   68c8000000           | push                0xc8
            //   e8????????           |                     
            //   ebe4                 | jmp                 0xffffffe6
            //   8945bc               | mov                 dword ptr [ebp - 0x44], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 57344
}