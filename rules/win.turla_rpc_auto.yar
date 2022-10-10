rule win_turla_rpc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.turla_rpc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.turla_rpc"
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
        $sequence_0 = { 66c745842130 c6458655 c744246838343939 66c744246c3a36 c644246e55 }
            // n = 5, score = 200
            //   66c745842130         | mov                 word ptr [ebp - 0x7c], 0x3021
            //   c6458655             | mov                 byte ptr [ebp - 0x7a], 0x55
            //   c744246838343939     | mov                 dword ptr [esp + 0x68], 0x39393438
            //   66c744246c3a36       | mov                 word ptr [esp + 0x6c], 0x363a
            //   c644246e55           | mov                 byte ptr [esp + 0x6e], 0x55

        $sequence_1 = { c6851e01000055 c7859000000016273034 c785940000002130013d c7859800000027303431 c6859c00000055 }
            // n = 5, score = 200
            //   c6851e01000055       | mov                 byte ptr [ebp + 0x11e], 0x55
            //   c7859000000016273034     | mov    dword ptr [ebp + 0x90], 0x34302716
            //   c785940000002130013d     | mov    dword ptr [ebp + 0x94], 0x3d013021
            //   c7859800000027303431     | mov    dword ptr [ebp + 0x98], 0x31343027
            //   c6859c00000055       | mov                 byte ptr [ebp + 0x9c], 0x55

        $sequence_2 = { c785e80000003a3b102d f30f7f85e0010000 660f6f05???????? f30f7f8580010000 660f6f05???????? 66c785ec0000000255 c785a0000000193a3431 }
            // n = 7, score = 200
            //   c785e80000003a3b102d     | mov    dword ptr [ebp + 0xe8], 0x2d103b3a
            //   f30f7f85e0010000     | movdqu              xmmword ptr [ebp + 0x1e0], xmm0
            //   660f6f05????????     |                     
            //   f30f7f8580010000     | movdqu              xmmword ptr [ebp + 0x180], xmm0
            //   660f6f05????????     |                     
            //   66c785ec0000000255     | mov    word ptr [ebp + 0xec], 0x5502
            //   c785a0000000193a3431     | mov    dword ptr [ebp + 0xa0], 0x31343a19

        $sequence_3 = { c744243833213039 66c744243c3955 c745803322273c 66c745842130 c6458655 }
            // n = 5, score = 200
            //   c744243833213039     | mov                 dword ptr [esp + 0x38], 0x39302133
            //   66c744243c3955       | mov                 word ptr [esp + 0x3c], 0x5539
            //   c745803322273c       | mov                 dword ptr [ebp - 0x80], 0x3c272233
            //   66c745842130         | mov                 word ptr [ebp - 0x7c], 0x3021
            //   c6458655             | mov                 byte ptr [ebp - 0x7a], 0x55

        $sequence_4 = { c644247e55 c745883336393a 66c7458c2630 c6458e55 c744245033273034 66c74424543155 c744243033273030 }
            // n = 7, score = 200
            //   c644247e55           | mov                 byte ptr [esp + 0x7e], 0x55
            //   c745883336393a       | mov                 dword ptr [ebp - 0x78], 0x3a393633
            //   66c7458c2630         | mov                 word ptr [ebp - 0x74], 0x3026
            //   c6458e55             | mov                 byte ptr [ebp - 0x72], 0x55
            //   c744245033273034     | mov                 dword ptr [esp + 0x50], 0x34302733
            //   66c74424543155       | mov                 word ptr [esp + 0x54], 0x5531
            //   c744243033273030     | mov                 dword ptr [esp + 0x30], 0x30302733

        $sequence_5 = { c745d430133c39 66c745d83055 c7852001000012302105 c78524010000273a3614 }
            // n = 4, score = 200
            //   c745d430133c39       | mov                 dword ptr [ebp - 0x2c], 0x393c1330
            //   66c745d83055         | mov                 word ptr [ebp - 0x28], 0x5530
            //   c7852001000012302105     | mov    dword ptr [ebp + 0x120], 0x5213012
            //   c78524010000273a3614     | mov    dword ptr [ebp + 0x124], 0x14363a27

        $sequence_6 = { c745b06970746f c745b472536163 66c745b86c00 ff15???????? }
            // n = 4, score = 200
            //   c745b06970746f       | mov                 dword ptr [ebp - 0x50], 0x6f747069
            //   c745b472536163       | mov                 dword ptr [ebp - 0x4c], 0x63615372
            //   66c745b86c00         | mov                 word ptr [ebp - 0x48], 0x6c
            //   ff15????????         |                     

        $sequence_7 = { c644243455 c744244033263030 66c74424443e55 c744243833213039 66c744243c3955 }
            // n = 5, score = 200
            //   c644243455           | mov                 byte ptr [esp + 0x34], 0x55
            //   c744244033263030     | mov                 dword ptr [esp + 0x40], 0x30302633
            //   66c74424443e55       | mov                 word ptr [esp + 0x44], 0x553e
            //   c744243833213039     | mov                 dword ptr [esp + 0x38], 0x39302133
            //   66c744243c3955       | mov                 word ptr [esp + 0x3c], 0x5539

        $sequence_8 = { c74554301d343b c7455831393055 c7456016273034 c745642130133c c7456839300255 }
            // n = 5, score = 200
            //   c74554301d343b       | mov                 dword ptr [ebp + 0x54], 0x3b341d30
            //   c7455831393055       | mov                 dword ptr [ebp + 0x58], 0x55303931
            //   c7456016273034       | mov                 dword ptr [ebp + 0x60], 0x34302716
            //   c745642130133c       | mov                 dword ptr [ebp + 0x64], 0x3c133021
            //   c7456839300255       | mov                 dword ptr [ebp + 0x68], 0x55023039

        $sequence_9 = { 8d45f4 c645f40d 50 8b8528e5ffff 8b0485d8860110 ff3401 ff15???????? }
            // n = 7, score = 100
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   c645f40d             | mov                 byte ptr [ebp - 0xc], 0xd
            //   50                   | push                eax
            //   8b8528e5ffff         | mov                 eax, dword ptr [ebp - 0x1ad8]
            //   8b0485d8860110       | mov                 eax, dword ptr [eax*4 + 0x100186d8]
            //   ff3401               | push                dword ptr [ecx + eax]
            //   ff15????????         |                     

        $sequence_10 = { 8bff 80b40568ffffff55 40 83f80d }
            // n = 4, score = 100
            //   8bff                 | mov                 edi, edi
            //   80b40568ffffff55     | xor                 byte ptr [ebp + eax - 0x98], 0x55
            //   40                   | inc                 eax
            //   83f80d               | cmp                 eax, 0xd

        $sequence_11 = { 72f2 33c0 8074058855 40 }
            // n = 4, score = 100
            //   72f2                 | jb                  0xfffffff4
            //   33c0                 | xor                 eax, eax
            //   8074058855           | xor                 byte ptr [ebp + eax - 0x78], 0x55
            //   40                   | inc                 eax

        $sequence_12 = { 85c0 751d 56 ff15???????? 5f 5e }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_13 = { 6a00 6800000080 57 8945ec ff15???????? 8bf0 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   6800000080           | push                0x80000000
            //   57                   | push                edi
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_14 = { c78534feffff46696e64 33c0 c78538feffff436c6f73 66c7853cfeffff6500 }
            // n = 4, score = 100
            //   c78534feffff46696e64     | mov    dword ptr [ebp - 0x1cc], 0x646e6946
            //   33c0                 | xor                 eax, eax
            //   c78538feffff436c6f73     | mov    dword ptr [ebp - 0x1c8], 0x736f6c43
            //   66c7853cfeffff6500     | mov    word ptr [ebp - 0x1c4], 0x65

        $sequence_15 = { 66c78584feffff6f63 c68586feffff00 c78590feffff66636c6f 66c78594feffff7365 c68596feffff00 c785b0feffff66726561 }
            // n = 6, score = 100
            //   66c78584feffff6f63     | mov    word ptr [ebp - 0x17c], 0x636f
            //   c68586feffff00       | mov                 byte ptr [ebp - 0x17a], 0
            //   c78590feffff66636c6f     | mov    dword ptr [ebp - 0x170], 0x6f6c6366
            //   66c78594feffff7365     | mov    word ptr [ebp - 0x16c], 0x6573
            //   c68596feffff00       | mov                 byte ptr [ebp - 0x16a], 0
            //   c785b0feffff66726561     | mov    dword ptr [ebp - 0x150], 0x61657266

    condition:
        7 of them and filesize < 311296
}