rule win_dispcashbr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.dispcashbr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dispcashbr"
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
        $sequence_0 = { 890424 e8???????? 83ec08 c7442408d9ffffff c7442404???????? }
            // n = 5, score = 200
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408d9ffffff     | mov                 dword ptr [esp + 8], 0xffffffd9
            //   c7442404????????     |                     

        $sequence_1 = { 83ec04 c744240404000000 890424 e8???????? 83ec08 c7442408c8ffffff }
            // n = 6, score = 200
            //   83ec04               | sub                 esp, 4
            //   c744240404000000     | mov                 dword ptr [esp + 4], 4
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408c8ffffff     | mov                 dword ptr [esp + 8], 0xffffffc8

        $sequence_2 = { 83ec04 c744240404000000 890424 e8???????? 83ec08 c7442408d0ffffff }
            // n = 6, score = 200
            //   83ec04               | sub                 esp, 4
            //   c744240404000000     | mov                 dword ptr [esp + 4], 4
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408d0ffffff     | mov                 dword ptr [esp + 8], 0xffffffd0

        $sequence_3 = { e8???????? 83ec08 c7442408d0ffffff c7442404???????? a1???????? }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408d0ffffff     | mov                 dword ptr [esp + 8], 0xffffffd0
            //   c7442404????????     |                     
            //   a1????????           |                     

        $sequence_4 = { 890424 e8???????? 83ec08 c7442408d7ffffff c7442404???????? }
            // n = 5, score = 200
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408d7ffffff     | mov                 dword ptr [esp + 8], 0xffffffd7
            //   c7442404????????     |                     

        $sequence_5 = { e8???????? eb45 c70424f5ffffff e8???????? 83ec04 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   eb45                 | jmp                 0x47
            //   c70424f5ffffff       | mov                 dword ptr [esp], 0xfffffff5
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4

        $sequence_6 = { 890424 e8???????? 83ec08 c7442408f2ffffff c7442404???????? a1???????? 83c020 }
            // n = 7, score = 200
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408f2ffffff     | mov                 dword ptr [esp + 8], 0xfffffff2
            //   c7442404????????     |                     
            //   a1????????           |                     
            //   83c020               | add                 eax, 0x20

        $sequence_7 = { ffe0 a1???????? 83c020 8944240c c744240822000000 }
            // n = 5, score = 200
            //   ffe0                 | jmp                 eax
            //   a1????????           |                     
            //   83c020               | add                 eax, 0x20
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   c744240822000000     | mov                 dword ptr [esp + 8], 0x22

        $sequence_8 = { 83c00d c7442404???????? 890424 e8???????? }
            // n = 4, score = 200
            //   83c00d               | add                 eax, 0xd
            //   c7442404????????     |                     
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     

        $sequence_9 = { e8???????? 83ec04 c744240404000000 890424 e8???????? 83ec08 c7442408f1ffffff }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4
            //   c744240404000000     | mov                 dword ptr [esp + 4], 4
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   c7442408f1ffffff     | mov                 dword ptr [esp + 8], 0xfffffff1

    condition:
        7 of them and filesize < 123904
}