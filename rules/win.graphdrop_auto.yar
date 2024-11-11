rule win_graphdrop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.graphdrop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.graphdrop"
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
        $sequence_0 = { 52 4156 415e 5a }
            // n = 4, score = 300
            //   52                   | mov                 dword ptr [esp + 0x50], edx
            //   4156                 | inc                 esp
            //   415e                 | mov                 edx, edx
            //   5a                   | inc                 esp

        $sequence_1 = { 4155 49c7c501000000 4150 4152 415a }
            // n = 5, score = 300
            //   4155                 | movsx               edx, byte ptr [eax + ecx]
            //   49c7c501000000       | cmp                 edx, 0
            //   4150                 | inc                 ecx
            //   4152                 | setne               al
            //   415a                 | mov                 ecx, edx

        $sequence_2 = { 53 0f77 5b 90 }
            // n = 4, score = 300
            //   53                   | jbe                 0x1b69
            //   0f77                 | dec                 eax
            //   5b                   | mov                 ecx, dword ptr [ebp]
            //   90                   | mov                 edi, 1

        $sequence_3 = { 90 415f 90 415d }
            // n = 4, score = 300
            //   90                   | dec                 eax
            //   415f                 | lea                 ecx, [esp + 0x20]
            //   90                   | dec                 eax
            //   415d                 | lea                 edx, [eax + 0x30]

        $sequence_4 = { 49c7c501000000 4150 4152 415a 4158 }
            // n = 5, score = 300
            //   49c7c501000000       | movzx               eax, word ptr [esp + 0x20]
            //   4150                 | dec                 eax
            //   4152                 | lea                 edx, [esp + 0x30]
            //   415a                 | dec                 eax
            //   4158                 | mov                 edi, dword ptr [esp + 0x68]

        $sequence_5 = { 0f77 4157 90 415f }
            // n = 4, score = 300
            //   0f77                 | psrlq               mm5, 0x15
            //   4157                 | inc                 ecx
            //   90                   | push                eax
            //   415f                 | inc                 ecx

        $sequence_6 = { 415b 50 0f77 4155 }
            // n = 4, score = 300
            //   415b                 | psraw               mm3, 0x4c
            //   50                   | push                edx
            //   0f77                 | inc                 ecx
            //   4155                 | push                edx

        $sequence_7 = { 58 e9???????? 53 48c7c303000000 }
            // n = 4, score = 300
            //   58                   | mov                 eax, dword ptr [ebp - 0x30]
            //   e9????????           |                     
            //   53                   | dec                 eax
            //   48c7c303000000       | mov                 edx, dword ptr [ebp - 0x28]

        $sequence_8 = { 4155 49c7c501000000 4150 4152 415a 4158 }
            // n = 6, score = 300
            //   4155                 | mov                 eax, 0x3c
            //   49c7c501000000       | dec                 eax
            //   4150                 | lea                 ecx, [ebp + 0x78]
            //   4152                 | dec                 eax
            //   415a                 | lea                 ecx, [ebp + 0x38]
            //   4158                 | dec                 eax

        $sequence_9 = { 50 90 53 0f77 }
            // n = 4, score = 300
            //   50                   | mov                 edx, dword ptr [esp + 0x40]
            //   90                   | dec                 eax
            //   53                   | mov                 ecx, dword ptr [esp + 0x50]
            //   0f77                 | inc                 esp

    condition:
        7 of them and filesize < 4186112
}