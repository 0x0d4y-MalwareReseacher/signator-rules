rule win_onhat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.onhat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.onhat"
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
        $sequence_0 = { 57 89442418 e8???????? 8bf8 83c408 85ff }
            // n = 6, score = 200
            //   57                   | push                edi
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c408               | add                 esp, 8
            //   85ff                 | test                edi, edi

        $sequence_1 = { 57 8b7c2418 6685f6 742e 8bc6 6a00 }
            // n = 6, score = 200
            //   57                   | push                edi
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   6685f6               | test                si, si
            //   742e                 | je                  0x30
            //   8bc6                 | mov                 eax, esi
            //   6a00                 | push                0

        $sequence_2 = { 51 33d2 33c9 8ad4 8a4c2422 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   33d2                 | xor                 edx, edx
            //   33c9                 | xor                 ecx, ecx
            //   8ad4                 | mov                 dl, ah
            //   8a4c2422             | mov                 cl, byte ptr [esp + 0x22]

        $sequence_3 = { c68424a501000044 c68424a601000044 c68424a701000052 888c24a8010000 c68424a901000020 889424aa010000 c68424ac01000073 }
            // n = 7, score = 200
            //   c68424a501000044     | mov                 byte ptr [esp + 0x1a5], 0x44
            //   c68424a601000044     | mov                 byte ptr [esp + 0x1a6], 0x44
            //   c68424a701000052     | mov                 byte ptr [esp + 0x1a7], 0x52
            //   888c24a8010000       | mov                 byte ptr [esp + 0x1a8], cl
            //   c68424a901000020     | mov                 byte ptr [esp + 0x1a9], 0x20
            //   889424aa010000       | mov                 byte ptr [esp + 0x1aa], dl
            //   c68424ac01000073     | mov                 byte ptr [esp + 0x1ac], 0x73

        $sequence_4 = { 8d542410 52 56 e8???????? 85c0 7509 5f }
            // n = 7, score = 200
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   52                   | push                edx
            //   56                   | push                esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7509                 | jne                 0xb
            //   5f                   | pop                 edi

        $sequence_5 = { c644242c5d c644242d2e c644242e0a c644242f00 }
            // n = 4, score = 200
            //   c644242c5d           | mov                 byte ptr [esp + 0x2c], 0x5d
            //   c644242d2e           | mov                 byte ptr [esp + 0x2d], 0x2e
            //   c644242e0a           | mov                 byte ptr [esp + 0x2e], 0xa
            //   c644242f00           | mov                 byte ptr [esp + 0x2f], 0

        $sequence_6 = { 8d842498000000 52 50 c644241c4f c644241d4e c644241e54 c644241f41 }
            // n = 7, score = 200
            //   8d842498000000       | lea                 eax, [esp + 0x98]
            //   52                   | push                edx
            //   50                   | push                eax
            //   c644241c4f           | mov                 byte ptr [esp + 0x1c], 0x4f
            //   c644241d4e           | mov                 byte ptr [esp + 0x1d], 0x4e
            //   c644241e54           | mov                 byte ptr [esp + 0x1e], 0x54
            //   c644241f41           | mov                 byte ptr [esp + 0x1f], 0x41

        $sequence_7 = { 890d???????? 5b c3 8b048e 8a10 }
            // n = 5, score = 200
            //   890d????????         |                     
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   8b048e               | mov                 eax, dword ptr [esi + ecx*4]
            //   8a10                 | mov                 dl, byte ptr [eax]

        $sequence_8 = { 8dbc2481020000 c684248002000000 f3ab 8b4c2440 8d542478 66ab }
            // n = 6, score = 200
            //   8dbc2481020000       | lea                 edi, [esp + 0x281]
            //   c684248002000000     | mov                 byte ptr [esp + 0x280], 0
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8b4c2440             | mov                 ecx, dword ptr [esp + 0x40]
            //   8d542478             | lea                 edx, [esp + 0x78]
            //   66ab                 | stosw               word ptr es:[edi], ax

        $sequence_9 = { 81e1ffff0000 c68424e00000004f aa 51 8d842404020000 }
            // n = 5, score = 200
            //   81e1ffff0000         | and                 ecx, 0xffff
            //   c68424e00000004f     | mov                 byte ptr [esp + 0xe0], 0x4f
            //   aa                   | stosb               byte ptr es:[edi], al
            //   51                   | push                ecx
            //   8d842404020000       | lea                 eax, [esp + 0x204]

    condition:
        7 of them and filesize < 57344
}