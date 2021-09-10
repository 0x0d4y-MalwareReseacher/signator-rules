rule win_netwire_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.netwire."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.netwire"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { c744240c00000000 c744240800000000 c744240400000000 c7042420000000 }
            // n = 4, score = 1100
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042420000000       | mov                 dword ptr [esp], 0x20

        $sequence_1 = { a3???????? c7042440000000 e8???????? 84c0 }
            // n = 4, score = 1100
            //   a3????????           |                     
            //   c7042440000000       | mov                 dword ptr [esp], 0x40
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_2 = { c744241480000000 c744241004000000 c744240c00000000 c744240801000000 c744240400000040 }
            // n = 5, score = 1100
            //   c744241480000000     | mov                 dword ptr [esp + 0x14], 0x80
            //   c744241004000000     | mov                 dword ptr [esp + 0x10], 4
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240801000000     | mov                 dword ptr [esp + 8], 1
            //   c744240400000040     | mov                 dword ptr [esp + 4], 0x40000000

        $sequence_3 = { e8???????? c7042449000000 e8???????? c7042446000000 e8???????? c7042400000000 }
            // n = 6, score = 1100
            //   e8????????           |                     
            //   c7042449000000       | mov                 dword ptr [esp], 0x49
            //   e8????????           |                     
            //   c7042446000000       | mov                 dword ptr [esp], 0x46
            //   e8????????           |                     
            //   c7042400000000       | mov                 dword ptr [esp], 0

        $sequence_4 = { c70424???????? e8???????? a3???????? e9???????? c705????????00000000 e9???????? }
            // n = 6, score = 1100
            //   c70424????????       |                     
            //   e8????????           |                     
            //   a3????????           |                     
            //   e9????????           |                     
            //   c705????????00000000     |     
            //   e9????????           |                     

        $sequence_5 = { e8???????? c7442410000000f0 c744240c01000000 c744240800000000 c744240400000000 c70424???????? e8???????? }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   c7442410000000f0     | mov                 dword ptr [esp + 0x10], 0xf0000000
            //   c744240c01000000     | mov                 dword ptr [esp + 0xc], 1
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c70424????????       |                     
            //   e8????????           |                     

        $sequence_6 = { c7442404???????? c70424???????? e8???????? c7442408???????? c7442404???????? c70424???????? }
            // n = 6, score = 1100
            //   c7442404????????     |                     
            //   c70424????????       |                     
            //   e8????????           |                     
            //   c7442408????????     |                     
            //   c7442404????????     |                     
            //   c70424????????       |                     

        $sequence_7 = { c744240800000000 c744240400000000 c7042410000000 e8???????? }
            // n = 4, score = 1100
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042410000000       | mov                 dword ptr [esp], 0x10
            //   e8????????           |                     

        $sequence_8 = { c744240c00000000 c744240800000000 c744240400000000 c7042408000000 e8???????? 83ec14 }
            // n = 6, score = 1100
            //   c744240c00000000     | mov                 dword ptr [esp + 0xc], 0
            //   c744240800000000     | mov                 dword ptr [esp + 8], 0
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042408000000       | mov                 dword ptr [esp], 8
            //   e8????????           |                     
            //   83ec14               | sub                 esp, 0x14

        $sequence_9 = { e8???????? c704244a000000 e8???????? c7042446000000 e8???????? }
            // n = 5, score = 1100
            //   e8????????           |                     
            //   c704244a000000       | mov                 dword ptr [esp], 0x4a
            //   e8????????           |                     
            //   c7042446000000       | mov                 dword ptr [esp], 0x46
            //   e8????????           |                     

    condition:
        7 of them and filesize < 401408
}