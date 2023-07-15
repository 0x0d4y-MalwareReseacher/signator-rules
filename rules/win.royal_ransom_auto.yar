rule win_royal_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.royal_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.royal_ransom"
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
        $sequence_0 = { e8???????? 834f5404 488d05f53ee4ff 488b5c2430 488987b0020000 b801000000 4883c420 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   834f5404             | mov                 eax, 0x1e6
            //   488d05f53ee4ff       | dec                 eax
            //   488b5c2430           | mov                 ecx, dword ptr [ebx + 0x38]
            //   488987b0020000       | inc                 ecx
            //   b801000000           | mov                 eax, 0x1e6
            //   4883c420             | dec                 eax

        $sequence_1 = { b820000000 e8???????? 482be0 488bda 488bf1 488bcb 488d15e89a1100 }
            // n = 7, score = 100
            //   b820000000           | dec                 eax
            //   e8????????           |                     
            //   482be0               | lea                 ecx, [0x13be42]
            //   488bda               | jmp                 0x1c59
            //   488bf1               | dec                 esp
            //   488bcb               | lea                 eax, [0x162c77]
            //   488d15e89a1100       | mov                 edx, 0x28f

        $sequence_2 = { e8???????? 4c8d05dea70d00 ba2f010000 488d0df2a70d00 e8???????? 4533c0 baae000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4c8d05dea70d00       | dec                 eax
            //   ba2f010000           | lea                 edx, [0x15ce09]
            //   488d0df2a70d00       | dec                 eax
            //   e8????????           |                     
            //   4533c0               | mov                 ecx, ebx
            //   baae000000           | dec                 eax

        $sequence_3 = { e8???????? 482be0 85d2 488d050ffe1600 488d3d14fe1600 418bd0 480f45f8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   482be0               | test                eax, eax
            //   85d2                 | jne                 0x65d
            //   488d050ffe1600       | dec                 esp
            //   488d3d14fe1600       | lea                 eax, [0xe6472]
            //   418bd0               | mov                 edx, 0x416
            //   480f45f8             | dec                 eax

        $sequence_4 = { e8???????? 488bc8 4885c0 752f 41b920000000 488d0575010000 488d154e061400 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488bc8               | inc                 ebp
            //   4885c0               | test                edi, edi
            //   752f                 | inc                 ecx
            //   41b920000000         | cmp                 esi, 0x40
            //   488d0575010000       | je                  0x1d95
            //   488d154e061400       | dec                 eax

        $sequence_5 = { 8bcf e9???????? 4c8b45e0 4533c9 488b55e8 e8???????? 488bf0 }
            // n = 7, score = 100
            //   8bcf                 | lea                 eax, [eax - 2]
            //   e9????????           |                     
            //   4c8b45e0             | cmp                 eax, 6
            //   4533c9               | ja                  0x1cf1
            //   488b55e8             | mov                 eax, 0xf
            //   e8????????           |                     
            //   488bf0               | inc                 ecx

        $sequence_6 = { 448bf5 4d85ff 0f8502010000 e8???????? 4c8d05e0461400 ba27010000 488d0d84461400 }
            // n = 7, score = 100
            //   448bf5               | je                  0x1bb4
            //   4d85ff               | dec                 eax
            //   0f8502010000         | mov                 edx, dword ptr [edi + 0xd0]
            //   e8????????           |                     
            //   4c8d05e0461400       | dec                 eax
            //   ba27010000           | lea                 edx, [0x12bb3e]
            //   488d0d84461400       | dec                 eax

        $sequence_7 = { 85c0 0f8531030000 4c396368 7527 e8???????? 4c8d05e11e1500 badc000000 }
            // n = 7, score = 100
            //   85c0                 | dec                 eax
            //   0f8531030000         | lea                 ecx, [0xe94c8]
            //   4c396368             | mov                 eax, dword ptr [esp + 0x34]
            //   7527                 | dec                 esp
            //   e8????????           |                     
            //   4c8d05e11e1500       | lea                 eax, [0xfa1bc]
            //   badc000000           | mov                 edx, 0xae

        $sequence_8 = { 7534 4181e700000f00 74b6 4181ff00000100 0f8537ffffff 4c8d0da7e20a00 458bc4 }
            // n = 7, score = 100
            //   7534                 | test                eax, eax
            //   4181e700000f00       | jne                 0x64a
            //   74b6                 | dec                 esp
            //   4181ff00000100       | lea                 eax, [0xfea1a]
            //   0f8537ffffff         | dec                 eax
            //   4c8d0da7e20a00       | mov                 ebp, eax
            //   458bc4               | dec                 eax

        $sequence_9 = { e8???????? 4c8d053fd91300 bab7000000 488d0dfbd81300 e8???????? ba8c000000 4533c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4c8d053fd91300       | arpl                bx, dx
            //   bab7000000           | shr                 ebx, 0x1f
            //   488d0dfbd81300       | inc                 ecx
            //   e8????????           |                     
            //   ba8c000000           | mov                 eax, 0x113
            //   4533c0               | dec                 eax

    condition:
        7 of them and filesize < 6235136
}