rule win_gandcrab_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.gandcrab."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gandcrab"
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
        $sequence_0 = { 837f6000 7403 83c314 837f7400 741b }
            // n = 5, score = 2100
            //   837f6000             | cmp                 dword ptr [edi + 0x60], 0
            //   7403                 | je                  5
            //   83c314               | add                 ebx, 0x14
            //   837f7400             | cmp                 dword ptr [edi + 0x74], 0
            //   741b                 | je                  0x1d

        $sequence_1 = { ff7720 ff15???????? ff771c 8bf0 }
            // n = 4, score = 2100
            //   ff7720               | push                dword ptr [edi + 0x20]
            //   ff15????????         |                     
            //   ff771c               | push                dword ptr [edi + 0x1c]
            //   8bf0                 | mov                 esi, eax

        $sequence_2 = { ff15???????? ff7728 8bf0 ff15???????? 03c3 8d5e04 }
            // n = 6, score = 2100
            //   ff15????????         |                     
            //   ff7728               | push                dword ptr [edi + 0x28]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]

        $sequence_3 = { 03c3 8d5e04 03d8 837f2400 741b }
            // n = 5, score = 2100
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f2400             | cmp                 dword ptr [edi + 0x24], 0
            //   741b                 | je                  0x1d

        $sequence_4 = { 56 ff15???????? 33c9 5f 66894c46fe 8bc6 5e }
            // n = 7, score = 2100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   33c9                 | xor                 ecx, ecx
            //   5f                   | pop                 edi
            //   66894c46fe           | mov                 word ptr [esi + eax*2 - 2], cx
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi

        $sequence_5 = { ff15???????? ff774c 8bf0 ff15???????? 03c3 8d5e04 03d8 }
            // n = 7, score = 2100
            //   ff15????????         |                     
            //   ff774c               | push                dword ptr [edi + 0x4c]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax

        $sequence_6 = { ff7744 ff15???????? ff7740 8bf0 ff15???????? }
            // n = 5, score = 2100
            //   ff7744               | push                dword ptr [edi + 0x44]
            //   ff15????????         |                     
            //   ff7740               | push                dword ptr [edi + 0x40]
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     

        $sequence_7 = { 741b ff777c ff15???????? ff7778 }
            // n = 4, score = 2100
            //   741b                 | je                  0x1d
            //   ff777c               | push                dword ptr [edi + 0x7c]
            //   ff15????????         |                     
            //   ff7778               | push                dword ptr [edi + 0x78]

        $sequence_8 = { ff15???????? 03c3 8d5e04 03d8 837f3000 }
            // n = 5, score = 2100
            //   ff15????????         |                     
            //   03c3                 | add                 eax, ebx
            //   8d5e04               | lea                 ebx, [esi + 4]
            //   03d8                 | add                 ebx, eax
            //   837f3000             | cmp                 dword ptr [edi + 0x30], 0

        $sequence_9 = { 7403 83c314 837f7400 741b ff777c ff15???????? }
            // n = 6, score = 2100
            //   7403                 | je                  5
            //   83c314               | add                 ebx, 0x14
            //   837f7400             | cmp                 dword ptr [edi + 0x74], 0
            //   741b                 | je                  0x1d
            //   ff777c               | push                dword ptr [edi + 0x7c]
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 1024000
}