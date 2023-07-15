rule win_netwire_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.netwire."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.netwire"
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
        $sequence_0 = { c744241000000000 c744240c00000000 c744240800000000 c744240400000000 c7042410000000 }
            // n = 5, score = 1200
            //   c744241000000000     | mov                 dword ptr [esp + 0x10], 0
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042410000000       | mov                 dword ptr [esp], 0x10

        $sequence_1 = { e8???????? c7042400000000 e8???????? c7042402000000 }
            // n = 4, score = 1200
            //   e8????????           |                     
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   e8????????           |                     
            //   c7042402000000       | mov                 dword ptr [esp], 2

        $sequence_2 = { 890424 e8???????? e8???????? e8???????? e8???????? c7042400000000 e8???????? }
            // n = 7, score = 1200
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   e8????????           |                     

        $sequence_3 = { c744241004000000 c744240c00000000 c744240801000000 c744240400000040 }
            // n = 4, score = 1200
            //   c744241004000000     | mov                 dword ptr [esp + 0x10], 4
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240801000000     | mov                 dword ptr [esp + 8], 1
            //   c744240400000040     | mov                 dword ptr [esp + 4], 0x40000000

        $sequence_4 = { e8???????? c704244a000000 e8???????? c7042446000000 e8???????? c7042449000000 }
            // n = 6, score = 1200
            //   e8????????           |                     
            //   c704244a000000       | mov                 dword ptr [esp], 0x4a
            //   e8????????           |                     
            //   c7042446000000       | mov                 dword ptr [esp], 0x46
            //   e8????????           |                     
            //   c7042449000000       | mov                 dword ptr [esp], 0x49

        $sequence_5 = { c744240c00000000 c744240800000000 c744240400000000 c7042420000000 }
            // n = 4, score = 1200
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042420000000       | mov                 dword ptr [esp], 0x20

        $sequence_6 = { c744242c00000000 c744242800000000 c744242400000000 c7442420fdffffff c744241c00000000 c744241800000000 c744241400000000 }
            // n = 7, score = 1200
            //   c744242c00000000     | mov                 dword ptr [esp + 0x2c], 0
            //   c744242800000000     | mov                 dword ptr [esp + 0x28], 0
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c7442420fdffffff     | mov                 dword ptr [esp + 0x20], 0xfffffffd
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0

        $sequence_7 = { c7042449000000 e8???????? c7042446000000 e8???????? }
            // n = 4, score = 1200
            //   c7042449000000       | mov                 dword ptr [esp], 0x49
            //   e8????????           |                     
            //   c7042446000000       | mov                 dword ptr [esp], 0x46
            //   e8????????           |                     

        $sequence_8 = { c70424???????? e8???????? a3???????? e9???????? c705????????00000000 e9???????? }
            // n = 6, score = 1200
            //   c70424????????       |                     
            //   e8????????           |                     
            //   a3????????           |                     
            //   e9????????           |                     
            //   c705????????00000000     |     
            //   e9????????           |                     

        $sequence_9 = { c744242800000000 c744242400000000 c7442420fdffffff c744241c00000000 }
            // n = 4, score = 1200
            //   c744242800000000     | mov                 dword ptr [esp + 0x28], 0
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c7442420fdffffff     | mov                 dword ptr [esp + 0x20], 0xfffffffd
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0

    condition:
        7 of them and filesize < 416768
}