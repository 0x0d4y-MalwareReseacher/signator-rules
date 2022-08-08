rule win_laziok_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.laziok."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.laziok"
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
        $sequence_0 = { 68???????? 6a00 6a0c a3???????? e8???????? }
            // n = 5, score = 900
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a0c                 | push                0xc
            //   a3????????           |                     
            //   e8????????           |                     

        $sequence_1 = { 85ff 741f 6a00 6a00 }
            // n = 4, score = 900
            //   85ff                 | test                edi, edi
            //   741f                 | je                  0x21
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_2 = { ff35???????? e8???????? 8bf0 8d4608 }
            // n = 4, score = 900
            //   ff35????????         |                     
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8d4608               | lea                 eax, [esi + 8]

        $sequence_3 = { 5e 5b c20c00 8b08 }
            // n = 4, score = 900
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c20c00               | ret                 0xc
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_4 = { 56 57 ff74240c 33f6 ff35???????? e8???????? }
            // n = 6, score = 900
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   33f6                 | xor                 esi, esi
            //   ff35????????         |                     
            //   e8????????           |                     

        $sequence_5 = { 7513 6a00 ff7510 ff750c ff7608 }
            // n = 5, score = 900
            //   7513                 | jne                 0x15
            //   6a00                 | push                0
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7608               | push                dword ptr [esi + 8]

        $sequence_6 = { e8???????? c7461401000000 c7460c00000000 8b5e0c 8b7c2418 }
            // n = 5, score = 900
            //   e8????????           |                     
            //   c7461401000000       | mov                 dword ptr [esi + 0x14], 1
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   8b5e0c               | mov                 ebx, dword ptr [esi + 0xc]
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]

        $sequence_7 = { 8bf8 39742410 741b ff742410 ff15???????? 8bf0 }
            // n = 6, score = 900
            //   8bf8                 | mov                 edi, eax
            //   39742410             | cmp                 dword ptr [esp + 0x10], esi
            //   741b                 | je                  0x1d
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 688128
}