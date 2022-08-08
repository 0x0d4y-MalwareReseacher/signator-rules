rule win_applejeus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.applejeus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.applejeus"
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
        $sequence_0 = { c745fc0d000000 8b4724 8b7710 8985dcf6ffff c785f0f6ffff00000000 c78574f4ffff00000000 c785ecf6ffff00000000 }
            // n = 7, score = 100
            //   c745fc0d000000       | mov                 dword ptr [ebp - 4], 0xd
            //   8b4724               | mov                 eax, dword ptr [edi + 0x24]
            //   8b7710               | mov                 esi, dword ptr [edi + 0x10]
            //   8985dcf6ffff         | mov                 dword ptr [ebp - 0x924], eax
            //   c785f0f6ffff00000000     | mov    dword ptr [ebp - 0x910], 0
            //   c78574f4ffff00000000     | mov    dword ptr [ebp - 0xb8c], 0
            //   c785ecf6ffff00000000     | mov    dword ptr [ebp - 0x914], 0

        $sequence_1 = { 8b85dcfcffff 042b 83f058 88850bfdffff 8b85dcfcffff 042c }
            // n = 6, score = 100
            //   8b85dcfcffff         | mov                 eax, dword ptr [ebp - 0x324]
            //   042b                 | add                 al, 0x2b
            //   83f058               | xor                 eax, 0x58
            //   88850bfdffff         | mov                 byte ptr [ebp - 0x2f5], al
            //   8b85dcfcffff         | mov                 eax, dword ptr [ebp - 0x324]
            //   042c                 | add                 al, 0x2c

        $sequence_2 = { c745a800000000 c745b400000000 c745ac00000000 6a08 c645fc05 e8???????? 8d4b08 }
            // n = 7, score = 100
            //   c745a800000000       | mov                 dword ptr [ebp - 0x58], 0
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   c745ac00000000       | mov                 dword ptr [ebp - 0x54], 0
            //   6a08                 | push                8
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   e8????????           |                     
            //   8d4b08               | lea                 ecx, [ebx + 8]

        $sequence_3 = { a1???????? 83c00a 668985d0ecffff 0fb705???????? 83c00a 668985d2ecffff a1???????? }
            // n = 7, score = 100
            //   a1????????           |                     
            //   83c00a               | add                 eax, 0xa
            //   668985d0ecffff       | mov                 word ptr [ebp - 0x1330], ax
            //   0fb705????????       |                     
            //   83c00a               | add                 eax, 0xa
            //   668985d2ecffff       | mov                 word ptr [ebp - 0x132e], ax
            //   a1????????           |                     

        $sequence_4 = { 8930 c7857cdeffff00000000 c7857cdeffff40030500 8b857cdeffff ff7734 35490f0000 35090c0000 }
            // n = 7, score = 100
            //   8930                 | mov                 dword ptr [eax], esi
            //   c7857cdeffff00000000     | mov    dword ptr [ebp - 0x2184], 0
            //   c7857cdeffff40030500     | mov    dword ptr [ebp - 0x2184], 0x50340
            //   8b857cdeffff         | mov                 eax, dword ptr [ebp - 0x2184]
            //   ff7734               | push                dword ptr [edi + 0x34]
            //   35490f0000           | xor                 eax, 0xf49
            //   35090c0000           | xor                 eax, 0xc09

        $sequence_5 = { 6a02 6a00 6a06 6800000060 8d85b8fdffff 50 ffd7 }
            // n = 7, score = 100
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a06                 | push                6
            //   6800000060           | push                0x60000000
            //   8d85b8fdffff         | lea                 eax, [ebp - 0x248]
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_6 = { c6850df5ffff62 c6850ef5ffff68 c6850ff5ffff66 c68510f5ffff30 c68511f5ffff79 c68512f5ffff2e c68513f5ffff79 }
            // n = 7, score = 100
            //   c6850df5ffff62       | mov                 byte ptr [ebp - 0xaf3], 0x62
            //   c6850ef5ffff68       | mov                 byte ptr [ebp - 0xaf2], 0x68
            //   c6850ff5ffff66       | mov                 byte ptr [ebp - 0xaf1], 0x66
            //   c68510f5ffff30       | mov                 byte ptr [ebp - 0xaf0], 0x30
            //   c68511f5ffff79       | mov                 byte ptr [ebp - 0xaef], 0x79
            //   c68512f5ffff2e       | mov                 byte ptr [ebp - 0xaee], 0x2e
            //   c68513f5ffff79       | mov                 byte ptr [ebp - 0xaed], 0x79

        $sequence_7 = { 0415 83f072 888531f6ffff 8b8518f6ffff 0416 83f074 888532f6ffff }
            // n = 7, score = 100
            //   0415                 | add                 al, 0x15
            //   83f072               | xor                 eax, 0x72
            //   888531f6ffff         | mov                 byte ptr [ebp - 0x9cf], al
            //   8b8518f6ffff         | mov                 eax, dword ptr [ebp - 0x9e8]
            //   0416                 | add                 al, 0x16
            //   83f074               | xor                 eax, 0x74
            //   888532f6ffff         | mov                 byte ptr [ebp - 0x9ce], al

        $sequence_8 = { 888575fcffff 8b8568fcffff 040a 83f020 888576fcffff 8b8568fcffff 040b }
            // n = 7, score = 100
            //   888575fcffff         | mov                 byte ptr [ebp - 0x38b], al
            //   8b8568fcffff         | mov                 eax, dword ptr [ebp - 0x398]
            //   040a                 | add                 al, 0xa
            //   83f020               | xor                 eax, 0x20
            //   888576fcffff         | mov                 byte ptr [ebp - 0x38a], al
            //   8b8568fcffff         | mov                 eax, dword ptr [ebp - 0x398]
            //   040b                 | add                 al, 0xb

        $sequence_9 = { 8b4dec 03c8 8d45ec 6a00 50 894dec 8d4104 }
            // n = 7, score = 100
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   03c8                 | add                 ecx, eax
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   8d4104               | lea                 eax, [ecx + 4]

    condition:
        7 of them and filesize < 1245184
}