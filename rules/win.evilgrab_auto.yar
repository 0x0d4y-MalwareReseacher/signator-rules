rule win_evilgrab_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.evilgrab."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.evilgrab"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { f7d1 49 51 8d85c0d2ffff 50 eb2f 6aaa }
            // n = 7, score = 200
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   51                   | push                ecx
            //   8d85c0d2ffff         | lea                 eax, [ebp - 0x2d40]
            //   50                   | push                eax
            //   eb2f                 | jmp                 0x31
            //   6aaa                 | push                -0x56

        $sequence_1 = { 6a26 53 f3ab 50 ff15???????? bf???????? 83c9ff }
            // n = 7, score = 200
            //   6a26                 | push                0x26
            //   53                   | push                ebx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   50                   | push                eax
            //   ff15????????         |                     
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_2 = { 68???????? 50 ff15???????? 8b7c2440 57 ffd5 }
            // n = 6, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b7c2440             | mov                 edi, dword ptr [esp + 0x40]
            //   57                   | push                edi
            //   ffd5                 | call                ebp

        $sequence_3 = { c60600 e8???????? 8b4c2410 83f8ff 8901 7507 5f }
            // n = 7, score = 200
            //   c60600               | mov                 byte ptr [esi], 0
            //   e8????????           |                     
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   83f8ff               | cmp                 eax, -1
            //   8901                 | mov                 dword ptr [ecx], eax
            //   7507                 | jne                 9
            //   5f                   | pop                 edi

        $sequence_4 = { 50 683f000f00 6a00 8d8d44fcffff 51 6801000080 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   683f000f00           | push                0xf003f
            //   6a00                 | push                0
            //   8d8d44fcffff         | lea                 ecx, [ebp - 0x3bc]
            //   51                   | push                ecx
            //   6801000080           | push                0x80000001

        $sequence_5 = { 8bcb e8???????? 84c0 8b7338 7510 8b55d8 2bf2 }
            // n = 7, score = 200
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   8b7338               | mov                 esi, dword ptr [ebx + 0x38]
            //   7510                 | jne                 0x12
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   2bf2                 | sub                 esi, edx

        $sequence_6 = { 8b442418 50 6a40 ff15???????? 8b542418 8d4c2420 }
            // n = 6, score = 200
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   8d4c2420             | lea                 ecx, [esp + 0x20]

        $sequence_7 = { e9???????? 68???????? 8dbdecefffff 83c9ff 33c0 f2ae f7d1 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   68????????           |                     
            //   8dbdecefffff         | lea                 edi, [ebp - 0x1014]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_8 = { ff15???????? 8944241c b904010000 33c0 8dbc2484030000 f3ab b900040000 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   b904010000           | mov                 ecx, 0x104
            //   33c0                 | xor                 eax, eax
            //   8dbc2484030000       | lea                 edi, [esp + 0x384]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   b900040000           | mov                 ecx, 0x400

        $sequence_9 = { 8bca 83e103 f3a4 8bc2 8db4051aebffff 89b5fcadffff 8b06 }
            // n = 7, score = 200
            //   8bca                 | mov                 ecx, edx
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8bc2                 | mov                 eax, edx
            //   8db4051aebffff       | lea                 esi, [ebp + eax - 0x14e6]
            //   89b5fcadffff         | mov                 dword ptr [ebp - 0x5204], esi
            //   8b06                 | mov                 eax, dword ptr [esi]

    condition:
        7 of them and filesize < 327680
}