rule win_pss_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.pss."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pss"
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
        $sequence_0 = { 8d48fe e8???????? e9???????? 83f811 }
            // n = 4, score = 300
            //   8d48fe               | lea                 ecx, [eax - 2]
            //   e8????????           |                     
            //   e9????????           |                     
            //   83f811               | cmp                 eax, 0x11

        $sequence_1 = { 7437 ff15???????? 3de5030000 752a }
            // n = 4, score = 300
            //   7437                 | je                  0x39
            //   ff15????????         |                     
            //   3de5030000           | cmp                 eax, 0x3e5
            //   752a                 | jne                 0x2c

        $sequence_2 = { ff15???????? 83ceff 3bc6 7504 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   83ceff               | or                  esi, 0xffffffff
            //   3bc6                 | cmp                 eax, esi
            //   7504                 | jne                 6

        $sequence_3 = { 89742410 83feff 0f8413020000 33c0 }
            // n = 4, score = 200
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   83feff               | cmp                 esi, -1
            //   0f8413020000         | je                  0x219
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { e8???????? 83c40c 33c0 6808020000 668985e8fdffff 8d85eafdffff }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   33c0                 | xor                 eax, eax
            //   6808020000           | push                0x208
            //   668985e8fdffff       | mov                 word ptr [ebp - 0x218], ax
            //   8d85eafdffff         | lea                 eax, [ebp - 0x216]

        $sequence_5 = { 7407 50 ff15???????? 8b8638170210 85c0 7413 }
            // n = 6, score = 200
            //   7407                 | je                  9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b8638170210         | mov                 eax, dword ptr [esi + 0x10021738]
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15

        $sequence_6 = { 56 ff15???????? 5e 6a01 e8???????? c60001 99 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   6a01                 | push                1
            //   e8????????           |                     
            //   c60001               | mov                 byte ptr [eax], 1
            //   99                   | cdq                 

        $sequence_7 = { 894df8 894dfc 50 8d55dc }
            // n = 4, score = 200
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   50                   | push                eax
            //   8d55dc               | lea                 edx, [ebp - 0x24]

        $sequence_8 = { 4885c0 74bb 0fb7040f 6685c0 74b2 }
            // n = 5, score = 100
            //   4885c0               | dec                 eax
            //   74bb                 | mov                 eax, dword ptr [esp + 0x20]
            //   0fb7040f             | dec                 eax
            //   6685c0               | mov                 dword ptr [eax + 0x10], eax
            //   74b2                 | dec                 esp

        $sequence_9 = { 7504 33c0 eb19 4c8d442478 488d542438 }
            // n = 5, score = 100
            //   7504                 | mov                 dword ptr [esp + 0x28], esp
            //   33c0                 | dec                 eax
            //   eb19                 | test                eax, eax
            //   4c8d442478           | je                  0xffffffbd
            //   488d542438           | movzx               eax, word ptr [edi + ecx]

        $sequence_10 = { 84c0 400f95c7 eb6c 488b4b08 ba40771b00 e8???????? }
            // n = 6, score = 100
            //   84c0                 | test                al, al
            //   400f95c7             | inc                 eax
            //   eb6c                 | setne               bh
            //   488b4b08             | jmp                 0x6e
            //   ba40771b00           | dec                 eax
            //   e8????????           |                     

        $sequence_11 = { 488900 488b442420 48894010 4c89642428 }
            // n = 4, score = 100
            //   488900               | mov                 ecx, dword ptr [ebx + 8]
            //   488b442420           | mov                 edx, 0x1b7740
            //   48894010             | dec                 eax
            //   4c89642428           | mov                 dword ptr [eax], eax

        $sequence_12 = { 250000ff1f 3d00000700 7504 410fb7f8 }
            // n = 4, score = 100
            //   250000ff1f           | test                ax, ax
            //   3d00000700           | je                  0xffffffbd
            //   7504                 | jne                 6
            //   410fb7f8             | xor                 eax, eax

    condition:
        7 of them and filesize < 421888
}