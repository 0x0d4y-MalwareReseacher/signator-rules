rule win_moriya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.moriya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moriya"
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
        $sequence_0 = { 48894500 e8???????? 250000ffff 488d4d80 3d00000006 0f83b4000000 }
            // n = 6, score = 100
            //   48894500             | lea                 edx, [ebp - 0x20]
            //   e8????????           |                     
            //   250000ffff           | and                 dword ptr [ebp - 0x14], 0
            //   488d4d80             | dec                 esp
            //   3d00000006           | lea                 eax, [0xfdd]
            //   0f83b4000000         | xor                 ecx, ecx

        $sequence_1 = { 8b4f10 8d81fffeffff 83f801 7608 }
            // n = 4, score = 100
            //   8b4f10               | dec                 ecx
            //   8d81fffeffff         | cmp                 eax, eax
            //   83f801               | jne                 0x2ab
            //   7608                 | dec                 esp

        $sequence_2 = { 488d14c500000000 4903d5 498bc9 e8???????? 4b8d0c64 0f57c0 33c0 }
            // n = 7, score = 100
            //   488d14c500000000     | mov                 edx, dword ptr [edi + 8]
            //   4903d5               | dec                 eax
            //   498bc9               | mov                 ecx, esi
            //   e8????????           |                     
            //   4b8d0c64             | dec                 eax
            //   0f57c0               | lea                 edx, [esp + 0x24]
            //   33c0                 | dec                 eax

        $sequence_3 = { 790c 4c8d0581100000 e9???????? 4c8d05a5100000 }
            // n = 4, score = 100
            //   790c                 | mov                 dword ptr [ebx + 0x90], eax
            //   4c8d0581100000       | dec                 eax
            //   e9????????           |                     
            //   4c8d05a5100000       | lea                 ecx, [0x22a1]

        $sequence_4 = { c785a800000000010000 f30f7f45b0 488985b0000000 e8???????? 8bd8 }
            // n = 5, score = 100
            //   c785a800000000010000     | dec    eax
            //   f30f7f45b0           | mov                 ecx, ebp
            //   488985b0000000       | dec                 eax
            //   e8????????           |                     
            //   8bd8                 | mov                 dword ptr [esp + 0x20], eax

        $sequence_5 = { 4885c0 747c 4889442450 ba14000000 488928 }
            // n = 5, score = 100
            //   4885c0               | and                 dword ptr [esp + 0x20], 0
            //   747c                 | dec                 eax
            //   4889442450           | mov                 ecx, ebx
            //   ba14000000           | mov                 byte ptr [esp + 0x28], 0
            //   488928               | inc                 ecx

        $sequence_6 = { 75f6 488b15???????? 488b4f18 e8???????? 488b05???????? }
            // n = 5, score = 100
            //   75f6                 | inc                 esp
            //   488b15????????       |                     
            //   488b4f18             | mov                 esi, ebx
            //   e8????????           |                     
            //   488b05????????       |                     

        $sequence_7 = { 4d03cd 410fb7410c 0fb6c8 c1e108 c1e808 0bc8 }
            // n = 6, score = 100
            //   4d03cd               | dec                 eax
            //   410fb7410c           | mov                 ecx, edi
            //   0fb6c8               | mov                 edi, 0xc000000d
            //   c1e108               | jmp                 0x124
            //   c1e808               | dec                 eax
            //   0bc8                 | mov                 edx, dword ptr [ebx + 0x18]

        $sequence_8 = { 488d542458 488b4e20 ff15???????? 90 8bd3 }
            // n = 5, score = 100
            //   488d542458           | dec                 eax
            //   488b4e20             | mov                 eax, 0xaaaaaaab
            //   ff15????????         |                     
            //   90                   | stosb               byte ptr es:[edi], al
            //   8bd3                 | stosb               byte ptr es:[edi], al

        $sequence_9 = { 418bce 4885c0 7509 4c8d05b60f0000 eba3 }
            // n = 5, score = 100
            //   418bce               | dec                 eax
            //   4885c0               | mov                 dword ptr [ebx + 0x38], eax
            //   7509                 | dec                 eax
            //   4c8d05b60f0000       | mov                 dword ptr [ebx + 0x40], edi
            //   eba3                 | cmp                 byte ptr [ebx + 1], 0

    condition:
        7 of them and filesize < 58368
}