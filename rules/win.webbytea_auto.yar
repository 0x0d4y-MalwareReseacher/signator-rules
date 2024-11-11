rule win_webbytea_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.webbytea."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webbytea"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { c68424f100000072 c68424f200000065 c68424f300000061 c68424f400000074 }
            // n = 4, score = 300
            //   c68424f100000072     | mov                 eax, 0x72
            //   c68424f200000065     | mov                 word ptr [esp + 0xc6], ax
            //   c68424f300000061     | mov                 eax, 0x72
            //   c68424f400000074     | mov                 word ptr [esp + 0xc6], ax

        $sequence_1 = { ff15???????? 85c0 7444 41b904000000 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   85c0                 | mov                 byte ptr [esp + 0x124], 0x54
            //   7444                 | mov                 byte ptr [esp + 0x125], 0x68
            //   41b904000000         | mov                 byte ptr [esp + 0x222], 0x65

        $sequence_2 = { 8901 488d542430 488b4c2420 ff15???????? }
            // n = 4, score = 300
            //   8901                 | mov                 word ptr [esp + 0x7a], ax
            //   488d542430           | mov                 eax, 0x4d
            //   488b4c2420           | mov                 word ptr [esp + 0x78], ax
            //   ff15????????         |                     

        $sequence_3 = { c7042400000000 eb08 8b0424 ffc0 890424 8b442438 }
            // n = 6, score = 300
            //   c7042400000000       | lea                 eax, [0x847c]
            //   eb08                 | dec                 eax
            //   8b0424               | mov                 ecx, ebp
            //   ffc0                 | cmp                 dword ptr [eax], 0
            //   890424               | je                  0x45b
            //   8b442438             | dec                 eax

        $sequence_4 = { ffc0 488b8c2488020000 8901 488d542430 488b4c2420 ff15???????? 85c0 }
            // n = 7, score = 300
            //   ffc0                 | mov                 eax, 0x69
            //   488b8c2488020000     | mov                 word ptr [esp + 0x98], ax
            //   8901                 | mov                 eax, 0x6e
            //   488d542430           | mov                 word ptr [esp + 0x9a], ax
            //   488b4c2420           | mov                 eax, 0x64
            //   ff15????????         |                     
            //   85c0                 | mov                 eax, 0x57

        $sequence_5 = { 8b00 ffc0 488b8c2488020000 8901 488d542430 488b4c2420 }
            // n = 6, score = 300
            //   8b00                 | lea                 ebx, [0x102a3]
            //   ffc0                 | jmp                 0x392
            //   488b8c2488020000     | dec                 eax
            //   8901                 | lea                 ebx, [0x234ae]
            //   488d542430           | inc                 ecx
            //   488b4c2420           | mov                 eax, 0x104

        $sequence_6 = { 8b542438 891481 488b842488020000 8b00 ffc0 488b8c2488020000 8901 }
            // n = 7, score = 300
            //   8b542438             | inc                 ebp
            //   891481               | xor                 eax, eax
            //   488b842488020000     | dec                 eax
            //   8b00                 | lea                 edx, [esp + 0x30]
            //   ffc0                 | dec                 eax
            //   488b8c2488020000     | lea                 eax, [esp + 0x314]
            //   8901                 | dec                 eax

        $sequence_7 = { ffc0 488b8c2488020000 8901 488d542430 488b4c2420 ff15???????? }
            // n = 6, score = 300
            //   ffc0                 | dec                 eax
            //   488b8c2488020000     | mov                 ecx, dword ptr [esp + 0x70]
            //   8901                 | idiv                dword ptr [ecx + 4]
            //   488d542430           | mov                 eax, edx
            //   488b4c2420           | cmp                 eax, 4
            //   ff15????????         |                     

        $sequence_8 = { 4803c8 488bc1 48c744243000000000 c744242800000000 }
            // n = 4, score = 300
            //   4803c8               | dec                 eax
            //   488bc1               | mov                 ecx, dword ptr [esp + 0x40]
            //   48c744243000000000     | inc    ecx
            //   c744242800000000     | mov                 ecx, 0x3000

        $sequence_9 = { ffc0 890424 8b442438 390424 }
            // n = 4, score = 300
            //   ffc0                 | mov                 byte ptr [esp + 0x433], 0
            //   890424               | mov                 byte ptr [esp + 0x4f8], 0x56
            //   8b442438             | mov                 byte ptr [esp + 0x4f9], 0x69
            //   390424               | mov                 byte ptr [esp + 0x133], 0x43

    condition:
        7 of them and filesize < 552960
}