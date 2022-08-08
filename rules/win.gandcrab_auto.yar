rule win_gandcrab_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.gandcrab."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gandcrab"
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
        $sequence_0 = { 03c3 8d5e04 03d8 837f3c00 741b }
            // n = 5, score = 2100
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f3c00             | cmp                 dword ptr [edi + 0x3c], 0
            //   741b                 | je                  0x1d

        $sequence_1 = { 03d8 837f3000 741b ff7738 ff15???????? ff7734 }
            // n = 6, score = 2100
            //   03d8                 | add                 ebx, eax
            //   837f3000             | cmp                 dword ptr [edi + 0x30], 0
            //   741b                 | je                  0x1d
            //   ff7738               | push                dword ptr [edi + 0x38]
            //   ff15????????         |                     
            //   ff7734               | push                dword ptr [edi + 0x34]

        $sequence_2 = { 03d8 837f2400 741b ff772c ff15???????? ff7728 }
            // n = 6, score = 2100
            //   03d8                 | add                 ebx, eax
            //   837f2400             | cmp                 dword ptr [edi + 0x24], 0
            //   741b                 | je                  0x1d
            //   ff772c               | push                dword ptr [edi + 0x2c]
            //   ff15????????         |                     
            //   ff7728               | push                dword ptr [edi + 0x28]

        $sequence_3 = { ff15???????? ff7728 8bf0 ff15???????? 03c3 8d5e04 }
            // n = 6, score = 2100
            //   ff15????????         |                     
            //   ff7728               | push                dword ptr [edi + 0x28]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]

        $sequence_4 = { 03d8 837f5400 741b ff775c ff15???????? ff7758 8bf0 }
            // n = 7, score = 2100
            //   03d8                 | add                 ebx, eax
            //   837f5400             | cmp                 dword ptr [edi + 0x54], 0
            //   741b                 | je                  0x1d
            //   ff775c               | push                dword ptr [edi + 0x5c]
            //   ff15????????         |                     
            //   ff7758               | push                dword ptr [edi + 0x58]
            //   8bf0                 | mov                 esi, eax

        $sequence_5 = { 8bf0 ff15???????? 03c3 8d5e04 03d8 83bf8000000000 }
            // n = 6, score = 2100
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   83bf8000000000       | cmp                 dword ptr [edi + 0x80], 0

        $sequence_6 = { ff7778 8bf0 ff15???????? 03c3 8d5e04 03d8 83bf8000000000 }
            // n = 7, score = 2100
            //   ff7778               | push                dword ptr [edi + 0x78]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   83bf8000000000       | cmp                 dword ptr [edi + 0x80], 0

        $sequence_7 = { ff15???????? 03c3 8d5e04 03d8 837f4800 741b ff7750 }
            // n = 7, score = 2100
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f4800             | cmp                 dword ptr [edi + 0x48], 0
            //   741b                 | je                  0x1d
            //   ff7750               | push                dword ptr [edi + 0x50]

        $sequence_8 = { ff15???????? ff7778 8bf0 ff15???????? 03c3 }
            // n = 5, score = 2100
            //   ff15????????         |                     
            //   ff7778               | push                dword ptr [edi + 0x78]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx

        $sequence_9 = { 8d5e04 03d8 837f4800 741b ff7750 ff15???????? ff774c }
            // n = 7, score = 2100
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f4800             | cmp                 dword ptr [edi + 0x48], 0
            //   741b                 | je                  0x1d
            //   ff7750               | push                dword ptr [edi + 0x50]
            //   ff15????????         |                     
            //   ff774c               | push                dword ptr [edi + 0x4c]

    condition:
        7 of them and filesize < 1024000
}