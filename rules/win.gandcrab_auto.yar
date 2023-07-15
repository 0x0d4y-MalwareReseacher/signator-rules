rule win_gandcrab_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.gandcrab."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gandcrab"
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
        $sequence_0 = { ff15???????? 03c3 8d5e04 03d8 837f6000 }
            // n = 5, score = 2100
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f6000             | cmp                 dword ptr [edi + 0x60], 0

        $sequence_1 = { 741b ff775c ff15???????? ff7758 8bf0 ff15???????? }
            // n = 6, score = 2100
            //   741b                 | je                  0x1d
            //   ff775c               | push                dword ptr [edi + 0x5c]
            //   ff15????????         |                     
            //   ff7758               | push                dword ptr [edi + 0x58]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     

        $sequence_2 = { 66894c46fe 8bc6 5e 5b }
            // n = 4, score = 2100
            //   66894c46fe           | mov                 word ptr [esi + eax*2 - 2], cx
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_3 = { 03d8 837f3c00 741b ff7744 ff15???????? ff7740 }
            // n = 6, score = 2100
            //   03d8                 | add                 ebx, eax
            //   837f3c00             | cmp                 dword ptr [edi + 0x3c], 0
            //   741b                 | je                  0x1d
            //   ff7744               | push                dword ptr [edi + 0x44]
            //   ff15????????         |                     
            //   ff7740               | push                dword ptr [edi + 0x40]

        $sequence_4 = { ff7744 ff15???????? ff7740 8bf0 ff15???????? 03c3 }
            // n = 6, score = 2100
            //   ff7744               | push                dword ptr [edi + 0x44]
            //   ff15????????         |                     
            //   ff7740               | push                dword ptr [edi + 0x40]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx

        $sequence_5 = { ff7778 8bf0 ff15???????? 03c3 8d5e04 }
            // n = 5, score = 2100
            //   ff7778               | push                dword ptr [edi + 0x78]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]

        $sequence_6 = { ff15???????? ff7728 8bf0 ff15???????? 03c3 8d5e04 }
            // n = 6, score = 2100
            //   ff15????????         |                     
            //   ff7728               | push                dword ptr [edi + 0x28]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]

        $sequence_7 = { ff7738 ff15???????? ff7734 8bf0 ff15???????? }
            // n = 5, score = 2100
            //   ff7738               | push                dword ptr [edi + 0x38]
            //   ff15????????         |                     
            //   ff7734               | push                dword ptr [edi + 0x34]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     

        $sequence_8 = { 8bf0 ff15???????? 03c3 8d5e04 03d8 837f6000 }
            // n = 6, score = 2100
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f6000             | cmp                 dword ptr [edi + 0x60], 0

        $sequence_9 = { 03d8 837f3000 741b ff7738 ff15???????? ff7734 8bf0 }
            // n = 7, score = 2100
            //   03d8                 | add                 ebx, eax
            //   837f3000             | cmp                 dword ptr [edi + 0x30], 0
            //   741b                 | je                  0x1d
            //   ff7738               | push                dword ptr [edi + 0x38]
            //   ff15????????         |                     
            //   ff7734               | push                dword ptr [edi + 0x34]
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 1024000
}