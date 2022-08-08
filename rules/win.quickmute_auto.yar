rule win_quickmute_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.quickmute."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.quickmute"
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
        $sequence_0 = { c745d403000000 c745d8701c4000 897ddc 897de0 8975e4 ff15???????? }
            // n = 6, score = 100
            //   c745d403000000       | mov                 dword ptr [ebp - 0x2c], 3
            //   c745d8701c4000       | mov                 dword ptr [ebp - 0x28], 0x401c70
            //   897ddc               | mov                 dword ptr [ebp - 0x24], edi
            //   897de0               | mov                 dword ptr [ebp - 0x20], edi
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   ff15????????         |                     

        $sequence_1 = { a3???????? c78520ffffff73777072 c78524ffffff696e7466 889d28ffffff }
            // n = 4, score = 100
            //   a3????????           |                     
            //   c78520ffffff73777072     | mov    dword ptr [ebp - 0xe0], 0x72707773
            //   c78524ffffff696e7466     | mov    dword ptr [ebp - 0xdc], 0x66746e69
            //   889d28ffffff         | mov                 byte ptr [ebp - 0xd8], bl

        $sequence_2 = { 8b0e 51 ff15???????? c70600000000 b801000000 5b }
            // n = 6, score = 100
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   c70600000000         | mov                 dword ptr [esi], 0
            //   b801000000           | mov                 eax, 1
            //   5b                   | pop                 ebx

        $sequence_3 = { 8b75fc 85f6 740c 56 ff15???????? 8b4d08 }
            // n = 6, score = 100
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   85f6                 | test                esi, esi
            //   740c                 | je                  0xe
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_4 = { 52 56 8d8578fdffff 68???????? 50 }
            // n = 5, score = 100
            //   52                   | push                edx
            //   56                   | push                esi
            //   8d8578fdffff         | lea                 eax, [ebp - 0x288]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_5 = { 7d10 8a8c181d010000 888898c84000 40 ebe6 }
            // n = 5, score = 100
            //   7d10                 | jge                 0x12
            //   8a8c181d010000       | mov                 cl, byte ptr [eax + ebx + 0x11d]
            //   888898c84000         | mov                 byte ptr [eax + 0x40c898], cl
            //   40                   | inc                 eax
            //   ebe6                 | jmp                 0xffffffe8

        $sequence_6 = { c78574ffffff77363450 66c78578ffffff726f c6857affffff63 889d7bffffff 66c7857cffffff7373 c6857effffff00 750f }
            // n = 7, score = 100
            //   c78574ffffff77363450     | mov    dword ptr [ebp - 0x8c], 0x50343677
            //   66c78578ffffff726f     | mov    word ptr [ebp - 0x88], 0x6f72
            //   c6857affffff63       | mov                 byte ptr [ebp - 0x86], 0x63
            //   889d7bffffff         | mov                 byte ptr [ebp - 0x85], bl
            //   66c7857cffffff7373     | mov    word ptr [ebp - 0x84], 0x7373
            //   c6857effffff00       | mov                 byte ptr [ebp - 0x82], 0
            //   750f                 | jne                 0x11

        $sequence_7 = { ff15???????? 6800100000 8d8d78edffff 53 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6800100000           | push                0x1000
            //   8d8d78edffff         | lea                 ecx, [ebp - 0x1288]
            //   53                   | push                ebx

        $sequence_8 = { 8b5dd0 ebab c745e47c914000 817de480914000 7311 8b45e4 }
            // n = 6, score = 100
            //   8b5dd0               | mov                 ebx, dword ptr [ebp - 0x30]
            //   ebab                 | jmp                 0xffffffad
            //   c745e47c914000       | mov                 dword ptr [ebp - 0x1c], 0x40917c
            //   817de480914000       | cmp                 dword ptr [ebp - 0x1c], 0x409180
            //   7311                 | jae                 0x13
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]

        $sequence_9 = { 8d8520fbffff 50 68???????? eb6c }
            // n = 4, score = 100
            //   8d8520fbffff         | lea                 eax, [ebp - 0x4e0]
            //   50                   | push                eax
            //   68????????           |                     
            //   eb6c                 | jmp                 0x6e

    condition:
        7 of them and filesize < 146432
}