rule win_moriagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.moriagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moriagent"
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
        $sequence_0 = { b802000000 eb05 b801000000 33ff }
            // n = 4, score = 200
            //   b802000000           | mov                 eax, 2
            //   eb05                 | jmp                 7
            //   b801000000           | mov                 eax, 1
            //   33ff                 | xor                 edi, edi

        $sequence_1 = { 8d8d84efffff e9???????? 8b542408 8d420c 8b8ab0eeffff }
            // n = 5, score = 100
            //   8d8d84efffff         | lea                 ecx, [ebp + 0x58]
            //   e9????????           |                     
            //   8b542408             | dec                 eax
            //   8d420c               | mov                 ebx, eax
            //   8b8ab0eeffff         | dec                 eax

        $sequence_2 = { e8???????? 488bd8 488d15b5630600 488bcf }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | dec                 eax
            //   488d15b5630600       | mov                 ecx, eax
            //   488bcf               | dec                 eax

        $sequence_3 = { 7202 8b12 8bca c78540ffffff00000000 c78544ffffff0f000000 c68530ffffff00 8d7101 }
            // n = 7, score = 100
            //   7202                 | dec                 eax
            //   8b12                 | mov                 ebx, eax
            //   8bca                 | dec                 eax
            //   c78540ffffff00000000     | lea    edx, [0x6adca]
            //   c78544ffffff0f000000     | dec    eax
            //   c68530ffffff00       | mov                 ecx, edi
            //   8d7101               | dec                 eax

        $sequence_4 = { 8d041e 2bfe 57 ff75fc 2bdf 894104 }
            // n = 6, score = 100
            //   8d041e               | mov                 ebx, eax
            //   2bfe                 | dec                 eax
            //   57                   | lea                 edx, [0x6adca]
            //   ff75fc               | dec                 eax
            //   2bdf                 | mov                 ecx, edi
            //   894104               | dec                 eax

        $sequence_5 = { 8d47ff 880e 46 eb0c b802000000 }
            // n = 5, score = 100
            //   8d47ff               | dec                 eax
            //   880e                 | mov                 ebx, eax
            //   46                   | dec                 eax
            //   eb0c                 | lea                 edx, [0x539cc]
            //   b802000000           | dec                 eax

        $sequence_6 = { e8???????? 488bd8 488d15c4320500 488d8da0000000 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | dec                 eax
            //   488d15c4320500       | mov                 ecx, eax
            //   488d8da0000000       | dec                 eax

        $sequence_7 = { e8???????? 488bd8 488d15bb6d0500 488d4d28 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | lea                 edx, [0x663b5]
            //   488d15bb6d0500       | dec                 eax
            //   488d4d28             | mov                 ecx, edi

        $sequence_8 = { e8???????? 488bd8 488d15cdae0600 488bcf }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | lea                 edx, [0x532c4]
            //   488d15cdae0600       | dec                 eax
            //   488bcf               | lea                 ecx, [ebp + 0xa0]

        $sequence_9 = { e8???????? 488bd8 488d15cc390500 488d4d58 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | dec                 eax
            //   488d15cc390500       | mov                 ecx, eax
            //   488d4d58             | dec                 eax

        $sequence_10 = { 83fa10 0f82c6feffff 8b8d84efffff 42 }
            // n = 4, score = 100
            //   83fa10               | dec                 eax
            //   0f82c6feffff         | mov                 ecx, eax
            //   8b8d84efffff         | dec                 eax
            //   42                   | mov                 edx, ebx

        $sequence_11 = { 2bc1 83c0fc 83f81f 0f87a9020000 52 51 }
            // n = 6, score = 100
            //   2bc1                 | mov                 ebx, eax
            //   83c0fc               | dec                 eax
            //   83f81f               | lea                 edx, [0x6adca]
            //   0f87a9020000         | dec                 eax
            //   52                   | mov                 ecx, edi
            //   51                   | dec                 eax

        $sequence_12 = { e8???????? 488bd8 488d15b2780500 488d4d28 e8???????? }
            // n = 5, score = 100
            //   e8????????           |                     
            //   488bd8               | dec                 eax
            //   488d15b2780500       | mov                 ebx, eax
            //   488d4d28             | dec                 eax
            //   e8????????           |                     

        $sequence_13 = { 0f438d6cefffff 898dfceeffff 3bf8 731d 2bc7 50 8d0439 }
            // n = 7, score = 100
            //   0f438d6cefffff       | mov                 ecx, eax
            //   898dfceeffff         | dec                 eax
            //   3bf8                 | mov                 ebx, eax
            //   731d                 | dec                 eax
            //   2bc7                 | lea                 edx, [0x6adca]
            //   50                   | dec                 eax
            //   8d0439               | mov                 ecx, edi

        $sequence_14 = { e8???????? 488bd8 488d15caad0600 488bcf }
            // n = 4, score = 100
            //   e8????????           |                     
            //   488bd8               | lea                 edx, [0x56dbb]
            //   488d15caad0600       | dec                 eax
            //   488bcf               | lea                 ecx, [ebp + 0x28]

    condition:
        7 of them and filesize < 1347904
}