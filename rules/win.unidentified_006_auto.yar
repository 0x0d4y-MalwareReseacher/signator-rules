rule win_unidentified_006_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.unidentified_006."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_006"
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
        $sequence_0 = { e8???????? 894708 4e 668b45dc }
            // n = 4, score = 100
            //   e8????????           |                     
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   4e                   | dec                 esi
            //   668b45dc             | mov                 ax, word ptr [ebp - 0x24]

        $sequence_1 = { 0f853bffffff eb11 b301 85ff 7407 57 }
            // n = 6, score = 100
            //   0f853bffffff         | jne                 0xffffff41
            //   eb11                 | jmp                 0x13
            //   b301                 | mov                 bl, 1
            //   85ff                 | test                edi, edi
            //   7407                 | je                  9
            //   57                   | push                edi

        $sequence_2 = { 85f6 7438 ff75f4 57 56 e8???????? }
            // n = 6, score = 100
            //   85f6                 | test                esi, esi
            //   7438                 | je                  0x3a
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   57                   | push                edi
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_3 = { 8975e8 668945ec e8???????? 84c0 7508 }
            // n = 5, score = 100
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7508                 | jne                 0xa

        $sequence_4 = { 33c0 51 8d4de0 8975e0 8975e4 8975e8 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   51                   | push                ecx
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi

        $sequence_5 = { 0f84be000000 ff75fc e8???????? 59 8bf8 895df4 8d45f4 }
            // n = 7, score = 100
            //   0f84be000000         | je                  0xc4
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bf8                 | mov                 edi, eax
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_6 = { 8bf0 8975f4 85f6 0f84bb000000 33c0 }
            // n = 5, score = 100
            //   8bf0                 | mov                 esi, eax
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   85f6                 | test                esi, esi
            //   0f84bb000000         | je                  0xc1
            //   33c0                 | xor                 eax, eax

        $sequence_7 = { 8975e8 668945ec e8???????? 84c0 7508 6a05 }
            // n = 6, score = 100
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7508                 | jne                 0xa
            //   6a05                 | push                5

        $sequence_8 = { 56 ff75ec ff75e4 53 ff15???????? }
            // n = 5, score = 100
            //   56                   | push                esi
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_9 = { 6a04 5f 33c9 897dfc }
            // n = 4, score = 100
            //   6a04                 | push                4
            //   5f                   | pop                 edi
            //   33c9                 | xor                 ecx, ecx
            //   897dfc               | mov                 dword ptr [ebp - 4], edi

    condition:
        7 of them and filesize < 40960
}