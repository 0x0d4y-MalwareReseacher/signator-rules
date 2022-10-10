rule win_mrac_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mrac."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mrac"
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
        $sequence_0 = { 3479 88842425100000 8a842404100000 e8???????? 8bc8 e8???????? c78424a414000074000000 }
            // n = 7, score = 200
            //   3479                 | xor                 al, 0x79
            //   88842425100000       | mov                 byte ptr [esp + 0x1025], al
            //   8a842404100000       | mov                 al, byte ptr [esp + 0x1004]
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   c78424a414000074000000     | mov    dword ptr [esp + 0x14a4], 0x74

        $sequence_1 = { 3465 8d8c2408120000 6a0f 8884241e120000 e8???????? 346e 8d8c2408120000 }
            // n = 7, score = 200
            //   3465                 | xor                 al, 0x65
            //   8d8c2408120000       | lea                 ecx, [esp + 0x1208]
            //   6a0f                 | push                0xf
            //   8884241e120000       | mov                 byte ptr [esp + 0x121e], al
            //   e8????????           |                     
            //   346e                 | xor                 al, 0x6e
            //   8d8c2408120000       | lea                 ecx, [esp + 0x1208]

        $sequence_2 = { c68424d811000055 c68424d911000057 c68424da11000057 c68424db1100005f c68424dc11000047 c68424dd11000048 c68424de1100001e }
            // n = 7, score = 200
            //   c68424d811000055     | mov                 byte ptr [esp + 0x11d8], 0x55
            //   c68424d911000057     | mov                 byte ptr [esp + 0x11d9], 0x57
            //   c68424da11000057     | mov                 byte ptr [esp + 0x11da], 0x57
            //   c68424db1100005f     | mov                 byte ptr [esp + 0x11db], 0x5f
            //   c68424dc11000047     | mov                 byte ptr [esp + 0x11dc], 0x47
            //   c68424dd11000048     | mov                 byte ptr [esp + 0x11dd], 0x48
            //   c68424de1100001e     | mov                 byte ptr [esp + 0x11de], 0x1e

        $sequence_3 = { 8b0c8d804b4500 8844392b 83fa03 7511 8b45fc 8b0c85804b4500 8a06 }
            // n = 7, score = 200
            //   8b0c8d804b4500       | mov                 ecx, dword ptr [ecx*4 + 0x454b80]
            //   8844392b             | mov                 byte ptr [ecx + edi + 0x2b], al
            //   83fa03               | cmp                 edx, 3
            //   7511                 | jne                 0x13
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b0c85804b4500       | mov                 ecx, dword ptr [eax*4 + 0x454b80]
            //   8a06                 | mov                 al, byte ptr [esi]

        $sequence_4 = { c78424f40c000036000000 e8???????? 346e 8d8c24f00c0000 6a01 888424f80c0000 e8???????? }
            // n = 7, score = 200
            //   c78424f40c000036000000     | mov    dword ptr [esp + 0xcf4], 0x36
            //   e8????????           |                     
            //   346e                 | xor                 al, 0x6e
            //   8d8c24f00c0000       | lea                 ecx, [esp + 0xcf0]
            //   6a01                 | push                1
            //   888424f80c0000       | mov                 byte ptr [esp + 0xcf8], al
            //   e8????????           |                     

        $sequence_5 = { 0452 8d8c24c4030000 6a77 888424db030000 e8???????? 0459 8d8c24c4030000 }
            // n = 7, score = 200
            //   0452                 | add                 al, 0x52
            //   8d8c24c4030000       | lea                 ecx, [esp + 0x3c4]
            //   6a77                 | push                0x77
            //   888424db030000       | mov                 byte ptr [esp + 0x3db], al
            //   e8????????           |                     
            //   0459                 | add                 al, 0x59
            //   8d8c24c4030000       | lea                 ecx, [esp + 0x3c4]

        $sequence_6 = { 8d8c2454090000 6a07 88842462090000 e8???????? 3470 8d8c2454090000 6a08 }
            // n = 7, score = 200
            //   8d8c2454090000       | lea                 ecx, [esp + 0x954]
            //   6a07                 | push                7
            //   88842462090000       | mov                 byte ptr [esp + 0x962], al
            //   e8????????           |                     
            //   3470                 | xor                 al, 0x70
            //   8d8c2454090000       | lea                 ecx, [esp + 0x954]
            //   6a08                 | push                8

        $sequence_7 = { 6a3b 888424bd030000 e8???????? 0476 8d8c24a8030000 6a3b 888424be030000 }
            // n = 7, score = 200
            //   6a3b                 | push                0x3b
            //   888424bd030000       | mov                 byte ptr [esp + 0x3bd], al
            //   e8????????           |                     
            //   0476                 | add                 al, 0x76
            //   8d8c24a8030000       | lea                 ecx, [esp + 0x3a8]
            //   6a3b                 | push                0x3b
            //   888424be030000       | mov                 byte ptr [esp + 0x3be], al

        $sequence_8 = { 88842473060000 e8???????? 3420 8d8c2464060000 6a09 88842474060000 e8???????? }
            // n = 7, score = 200
            //   88842473060000       | mov                 byte ptr [esp + 0x673], al
            //   e8????????           |                     
            //   3420                 | xor                 al, 0x20
            //   8d8c2464060000       | lea                 ecx, [esp + 0x664]
            //   6a09                 | push                9
            //   88842474060000       | mov                 byte ptr [esp + 0x674], al
            //   e8????????           |                     

        $sequence_9 = { c68424f108000000 e8???????? 8bc8 e8???????? c78424a80c00000f000000 8d8c24a80c0000 c68424ac0c000061 }
            // n = 7, score = 200
            //   c68424f108000000     | mov                 byte ptr [esp + 0x8f1], 0
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   c78424a80c00000f000000     | mov    dword ptr [esp + 0xca8], 0xf
            //   8d8c24a80c0000       | lea                 ecx, [esp + 0xca8]
            //   c68424ac0c000061     | mov                 byte ptr [esp + 0xcac], 0x61

    condition:
        7 of them and filesize < 745472
}