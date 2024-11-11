rule win_domino_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.domino."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.domino"
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
        $sequence_0 = { 7514 66c7030209 e9???????? 66c7030208 }
            // n = 4, score = 200
            //   7514                 | lea                 eax, [esp + 0x20]
            //   66c7030209           | dec                 eax
            //   e9????????           |                     
            //   66c7030208           | lea                 eax, [esp + 0x70]

        $sequence_1 = { 448bc5 488bd6 488bf8 ff15???????? }
            // n = 4, score = 200
            //   448bc5               | add                 edi, eax
            //   488bd6               | dec                 eax
            //   488bf8               | add                 ebp, eax
            //   ff15????????         |                     

        $sequence_2 = { 84c0 750f 66c7030101 b802000000 e9???????? 488d942450010000 }
            // n = 6, score = 200
            //   84c0                 | jne                 0x425
            //   750f                 | dec                 eax
            //   66c7030101           | test                eax, eax
            //   b802000000           | jne                 0x45b
            //   e9????????           |                     
            //   488d942450010000     | mov                 word ptr [ebx], 0x902

        $sequence_3 = { ff15???????? eb34 ff15???????? 488bd7 b940000000 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   eb34                 | dec                 eax
            //   ff15????????         |                     
            //   488bd7               | mov                 edx, esi
            //   b940000000           | dec                 eax

        $sequence_4 = { 72ce 66c7030102 33c0 41c7042402000000 488b5c2458 }
            // n = 5, score = 200
            //   72ce                 | inc                 esp
            //   66c7030102           | movsx               eax, byte ptr [ebp - 0x39]
            //   33c0                 | dec                 eax
            //   41c7042402000000     | mov                 ecx, dword ptr [ebp - 0x49]
            //   488b5c2458           | dec                 eax

        $sequence_5 = { 56 57 4156 4883ec30 498bd8 4863f2 488bf9 }
            // n = 7, score = 200
            //   56                   | inc                 ecx
            //   57                   | mov                 edi, eax
            //   4156                 | push                ebp
            //   4883ec30             | push                edi
            //   498bd8               | inc                 ecx
            //   4863f2               | push                esi
            //   488bf9               | dec                 eax

        $sequence_6 = { ff15???????? 85c0 741a 488b4c2458 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   85c0                 | mov                 eax, 2
            //   741a                 | dec                 esp
            //   488b4c2458           | lea                 ecx, [esp + 0x60]

        $sequence_7 = { 4889442420 e8???????? 85c0 742e 33db }
            // n = 5, score = 200
            //   4889442420           | mov                 dword ptr [esp + 0x20], 0xf0000000
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   742e                 | je                  0xc80
            //   33db                 | mov                 dword ptr [esp + 0x20], 0xf0000000

        $sequence_8 = { 48896c2410 4889742420 57 4881ec60020000 }
            // n = 4, score = 200
            //   48896c2410           | cmp                 ecx, ebx
            //   4889742420           | jl                  0x3ba
            //   57                   | xor                 eax, eax
            //   4881ec60020000       | ret                 

        $sequence_9 = { 4c89742420 89757f ff15???????? f7d8 1bdb 235d7f }
            // n = 6, score = 200
            //   4c89742420           | mov                 eax, dword ptr [esp + 0x50]
            //   89757f               | dec                 ecx
            //   ff15????????         |                     
            //   f7d8                 | add                 esi, 4
            //   1bdb                 | inc                 eax
            //   235d7f               | dec                 eax

    condition:
        7 of them and filesize < 50176
}