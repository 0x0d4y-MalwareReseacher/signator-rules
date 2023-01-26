rule win_applejeus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.applejeus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.applejeus"
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
        $sequence_0 = { c745fc00000000 c745fcc70c0000 8b4dfc 8b4608 81f1490f0000 81f18e030000 }
            // n = 6, score = 100
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c745fcc70c0000       | mov                 dword ptr [ebp - 4], 0xcc7
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   81f1490f0000         | xor                 ecx, 0xf49
            //   81f18e030000         | xor                 ecx, 0x38e

        $sequence_1 = { 0424 83f03b 8885b0e8ffff 8b8588e8ffff 0425 83f020 8885b1e8ffff }
            // n = 7, score = 100
            //   0424                 | add                 al, 0x24
            //   83f03b               | xor                 eax, 0x3b
            //   8885b0e8ffff         | mov                 byte ptr [ebp - 0x1750], al
            //   8b8588e8ffff         | mov                 eax, dword ptr [ebp - 0x1778]
            //   0425                 | add                 al, 0x25
            //   83f020               | xor                 eax, 0x20
            //   8885b1e8ffff         | mov                 byte ptr [ebp - 0x174f], al

        $sequence_2 = { 0402 83f072 888556fcffff 8b8550fcffff 0403 83f04e }
            // n = 6, score = 100
            //   0402                 | add                 al, 2
            //   83f072               | xor                 eax, 0x72
            //   888556fcffff         | mov                 byte ptr [ebp - 0x3aa], al
            //   8b8550fcffff         | mov                 eax, dword ptr [ebp - 0x3b0]
            //   0403                 | add                 al, 3
            //   83f04e               | xor                 eax, 0x4e

        $sequence_3 = { c745fcf4070000 8b75fc 8b4808 81f6490f0000 8b4004 81f6ba080000 }
            // n = 6, score = 100
            //   c745fcf4070000       | mov                 dword ptr [ebp - 4], 0x7f4
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]
            //   81f6490f0000         | xor                 esi, 0xf49
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   81f6ba080000         | xor                 esi, 0x8ba

        $sequence_4 = { c68424d500000057 c68424d60000007f c68424d70000006e c68424d80000005b c68424d90000005f c68424da00000050 c68424db00000068 }
            // n = 7, score = 100
            //   c68424d500000057     | mov                 byte ptr [esp + 0xd5], 0x57
            //   c68424d60000007f     | mov                 byte ptr [esp + 0xd6], 0x7f
            //   c68424d70000006e     | mov                 byte ptr [esp + 0xd7], 0x6e
            //   c68424d80000005b     | mov                 byte ptr [esp + 0xd8], 0x5b
            //   c68424d90000005f     | mov                 byte ptr [esp + 0xd9], 0x5f
            //   c68424da00000050     | mov                 byte ptr [esp + 0xda], 0x50
            //   c68424db00000068     | mov                 byte ptr [esp + 0xdb], 0x68

        $sequence_5 = { 57 6889020000 53 8d4da8 e8???????? 8b75ac 8d4db8 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   6889020000           | push                0x289
            //   53                   | push                ebx
            //   8d4da8               | lea                 ecx, [ebp - 0x58]
            //   e8????????           |                     
            //   8b75ac               | mov                 esi, dword ptr [ebp - 0x54]
            //   8d4db8               | lea                 ecx, [ebp - 0x48]

        $sequence_6 = { 85c0 7460 8b7dd4 03c2 8d5f04 8945c0 8d5708 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7460                 | je                  0x62
            //   8b7dd4               | mov                 edi, dword ptr [ebp - 0x2c]
            //   03c2                 | add                 eax, edx
            //   8d5f04               | lea                 ebx, [edi + 4]
            //   8945c0               | mov                 dword ptr [ebp - 0x40], eax
            //   8d5708               | lea                 edx, [edi + 8]

        $sequence_7 = { 6a0b 8bf0 ff15???????? 69c867010000 57 }
            // n = 5, score = 100
            //   6a0b                 | push                0xb
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   69c867010000         | imul                ecx, eax, 0x167
            //   57                   | push                edi

        $sequence_8 = { 8b8598fbffff 0410 83f06d 8885acfbffff 8b8598fbffff 0411 83f065 }
            // n = 7, score = 100
            //   8b8598fbffff         | mov                 eax, dword ptr [ebp - 0x468]
            //   0410                 | add                 al, 0x10
            //   83f06d               | xor                 eax, 0x6d
            //   8885acfbffff         | mov                 byte ptr [ebp - 0x454], al
            //   8b8598fbffff         | mov                 eax, dword ptr [ebp - 0x468]
            //   0411                 | add                 al, 0x11
            //   83f065               | xor                 eax, 0x65

        $sequence_9 = { 8b8518ffffff 040c 83f078 888528ffffff 8b8518ffffff 040d 83f06d }
            // n = 7, score = 100
            //   8b8518ffffff         | mov                 eax, dword ptr [ebp - 0xe8]
            //   040c                 | add                 al, 0xc
            //   83f078               | xor                 eax, 0x78
            //   888528ffffff         | mov                 byte ptr [ebp - 0xd8], al
            //   8b8518ffffff         | mov                 eax, dword ptr [ebp - 0xe8]
            //   040d                 | add                 al, 0xd
            //   83f06d               | xor                 eax, 0x6d

    condition:
        7 of them and filesize < 1245184
}