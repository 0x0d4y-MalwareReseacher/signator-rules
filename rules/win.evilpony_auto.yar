rule win_evilpony_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.evilpony."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.evilpony"
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
        $sequence_0 = { e8???????? 8945f0 8d45e4 50 ff7518 8bc3 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   8bc3                 | mov                 eax, ebx

        $sequence_1 = { 8bd8 ff15???????? 85c0 7414 53 8bd0 e8???????? }
            // n = 7, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   53                   | push                ebx
            //   8bd0                 | mov                 edx, eax
            //   e8????????           |                     

        $sequence_2 = { c1c105 2345b8 0bc2 0345bc }
            // n = 4, score = 200
            //   c1c105               | rol                 ecx, 5
            //   2345b8               | and                 eax, dword ptr [ebp - 0x48]
            //   0bc2                 | or                  eax, edx
            //   0345bc               | add                 eax, dword ptr [ebp - 0x44]

        $sequence_3 = { 8955a8 334dd4 334dc0 d1c1 894de0 8b4db0 334dac }
            // n = 7, score = 200
            //   8955a8               | mov                 dword ptr [ebp - 0x58], edx
            //   334dd4               | xor                 ecx, dword ptr [ebp - 0x2c]
            //   334dc0               | xor                 ecx, dword ptr [ebp - 0x40]
            //   d1c1                 | rol                 ecx, 1
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8b4db0               | mov                 ecx, dword ptr [ebp - 0x50]
            //   334dac               | xor                 ecx, dword ptr [ebp - 0x54]

        $sequence_4 = { 237db0 c1c305 337db4 03da 03fb c14db002 8955c4 }
            // n = 7, score = 200
            //   237db0               | and                 edi, dword ptr [ebp - 0x50]
            //   c1c305               | rol                 ebx, 5
            //   337db4               | xor                 edi, dword ptr [ebp - 0x4c]
            //   03da                 | add                 ebx, edx
            //   03fb                 | add                 edi, ebx
            //   c14db002             | ror                 dword ptr [ebp - 0x50], 2
            //   8955c4               | mov                 dword ptr [ebp - 0x3c], edx

        $sequence_5 = { 7429 ff35???????? 8b5df8 8b7dfc e8???????? 8b45fc 59 }
            // n = 7, score = 200
            //   7429                 | je                  0x2b
            //   ff35????????         |                     
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   59                   | pop                 ecx

        $sequence_6 = { 85c0 7405 8a45ff eb02 32c0 5f }
            // n = 6, score = 200
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7
            //   8a45ff               | mov                 al, byte ptr [ebp - 1]
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al
            //   5f                   | pop                 edi

        $sequence_7 = { e8???????? 8945f0 8d45e4 50 ff7518 8bc3 57 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   8bc3                 | mov                 eax, ebx
            //   57                   | push                edi

        $sequence_8 = { 33c0 50 6a01 50 ff7508 56 ff5114 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   56                   | push                esi
            //   ff5114               | call                dword ptr [ecx + 0x14]

        $sequence_9 = { 84c0 757c 397de4 7477 53 }
            // n = 5, score = 200
            //   84c0                 | test                al, al
            //   757c                 | jne                 0x7e
            //   397de4               | cmp                 dword ptr [ebp - 0x1c], edi
            //   7477                 | je                  0x79
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 147456
}