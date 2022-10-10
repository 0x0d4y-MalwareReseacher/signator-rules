rule win_lokipws_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.lokipws."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lokipws"
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
        $sequence_0 = { 837d0c00 7435 837d1400 7402 03ff }
            // n = 5, score = 300
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7435                 | je                  0x37
            //   837d1400             | cmp                 dword ptr [ebp + 0x14], 0
            //   7402                 | je                  4
            //   03ff                 | add                 edi, edi

        $sequence_1 = { c7851cfdffff48ffca75 c78520fdffffef488b45 c78524fdffffb04885c0 c78528fdffff7409488d c7852cfdffff4c247833 c78530fdffffd2ffd048 }
            // n = 6, score = 300
            //   c7851cfdffff48ffca75     | mov    dword ptr [ebp - 0x2e4], 0x75caff48
            //   c78520fdffffef488b45     | mov    dword ptr [ebp - 0x2e0], 0x458b48ef
            //   c78524fdffffb04885c0     | mov    dword ptr [ebp - 0x2dc], 0xc08548b0
            //   c78528fdffff7409488d     | mov    dword ptr [ebp - 0x2d8], 0x8d480974
            //   c7852cfdffff4c247833     | mov    dword ptr [ebp - 0x2d4], 0x3378244c
            //   c78530fdffffd2ffd048     | mov    dword ptr [ebp - 0x2d0], 0x48d0ffd2

        $sequence_2 = { 8bec 33c0 50 50 6876d610d6 50 e8???????? }
            // n = 7, score = 300
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   50                   | push                eax
            //   6876d610d6           | push                0xd610d676
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { c3 5d e9???????? 55 8bec 6a04 8d450c }
            // n = 7, score = 300
            //   c3                   | ret                 
            //   5d                   | pop                 ebp
            //   e9????????           |                     
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   6a04                 | push                4
            //   8d450c               | lea                 eax, [ebp + 0xc]

        $sequence_4 = { ff750c ff7508 e8???????? 59 59 8bf0 85f6 }
            // n = 7, score = 300
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_5 = { e8???????? 59 85c0 7449 57 e8???????? 8bf8 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7449                 | je                  0x4b
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_6 = { 5b 5d c3 55 8bec ff7510 ff7508 }
            // n = 7, score = 300
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_7 = { 66a5 be???????? 8dbdd0feffff f3a5 8bc8 33c0 66a5 }
            // n = 7, score = 300
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   be????????           |                     
            //   8dbdd0feffff         | lea                 edi, [ebp - 0x130]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   33c0                 | xor                 eax, eax
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]

        $sequence_8 = { 6a00 50 e8???????? 6a08 59 be???????? 8dbdccfeffff }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a08                 | push                8
            //   59                   | pop                 ecx
            //   be????????           |                     
            //   8dbdccfeffff         | lea                 edi, [ebp - 0x134]

        $sequence_9 = { 58 6a75 668945ec 58 6a65 668945ee 58 }
            // n = 7, score = 300
            //   58                   | pop                 eax
            //   6a75                 | push                0x75
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   58                   | pop                 eax
            //   6a65                 | push                0x65
            //   668945ee             | mov                 word ptr [ebp - 0x12], ax
            //   58                   | pop                 eax

    condition:
        7 of them and filesize < 1327104
}