rule win_yorekey_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.yorekey."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.yorekey"
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
        $sequence_0 = { 750a 85c0 7506 ff15???????? }
            // n = 4, score = 200
            //   750a                 | jne                 0xc
            //   85c0                 | test                eax, eax
            //   7506                 | jne                 8
            //   ff15????????         |                     

        $sequence_1 = { 897e70 c686c800000043 c6864b01000043 c74668f0104100 6a0d }
            // n = 5, score = 100
            //   897e70               | mov                 dword ptr [esi + 0x70], edi
            //   c686c800000043       | mov                 byte ptr [esi + 0xc8], 0x43
            //   c6864b01000043       | mov                 byte ptr [esi + 0x14b], 0x43
            //   c74668f0104100       | mov                 dword ptr [esi + 0x68], 0x4110f0
            //   6a0d                 | push                0xd

        $sequence_2 = { 83c40c 6a01 ff15???????? e9???????? e9???????? 8bff }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   e9????????           |                     
            //   e9????????           |                     
            //   8bff                 | mov                 edi, edi

        $sequence_3 = { c745ec00000000 e8???????? 68???????? 8d55dc 52 c745dc18d24000 }
            // n = 6, score = 100
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   e8????????           |                     
            //   68????????           |                     
            //   8d55dc               | lea                 edx, [ebp - 0x24]
            //   52                   | push                edx
            //   c745dc18d24000       | mov                 dword ptr [ebp - 0x24], 0x40d218

        $sequence_4 = { c78564ffffff04000000 89bd78ffffff 83fbff 0f842e020000 57 57 57 }
            // n = 7, score = 100
            //   c78564ffffff04000000     | mov    dword ptr [ebp - 0x9c], 4
            //   89bd78ffffff         | mov                 dword ptr [ebp - 0x88], edi
            //   83fbff               | cmp                 ebx, -1
            //   0f842e020000         | je                  0x234
            //   57                   | push                edi
            //   57                   | push                edi
            //   57                   | push                edi

        $sequence_5 = { 4885c0 7507 b801000000 eb64 488d442430 4c8d0551f0ffff }
            // n = 6, score = 100
            //   4885c0               | lea                 esi, [0x16eb2]
            //   7507                 | inc                 ecx
            //   b801000000           | mov                 eax, 0x104
            //   eb64                 | dec                 eax
            //   488d442430           | lea                 eax, [ebp + 0x740]
            //   4c8d0551f0ffff       | dec                 eax

        $sequence_6 = { 4889442440 488b05???????? 488d4c2440 4889442448 488b05???????? }
            // n = 5, score = 100
            //   4889442440           | dec                 eax
            //   488b05????????       |                     
            //   488d4c2440           | mov                 dword ptr [esp + 0x40], eax
            //   4889442448           | dec                 eax
            //   488b05????????       |                     

        $sequence_7 = { 59 59 8b7508 8d34f5d8194100 391e }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d34f5d8194100       | lea                 esi, [esi*8 + 0x4119d8]
            //   391e                 | cmp                 dword ptr [esi], ebx

        $sequence_8 = { 730d 488bd3 488bcf e8???????? }
            // n = 4, score = 100
            //   730d                 | lea                 ecx, [esp + 0x40]
            //   488bd3               | dec                 eax
            //   488bcf               | mov                 dword ptr [esp + 0x48], eax
            //   e8????????           |                     

        $sequence_9 = { 7406 33db 8bc3 eb31 ff15???????? 8bd8 }
            // n = 6, score = 100
            //   7406                 | je                  8
            //   33db                 | xor                 ebx, ebx
            //   8bc3                 | mov                 eax, ebx
            //   eb31                 | jmp                 0x33
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_10 = { 85c0 0f85bb010000 4c8d35b26e0100 41b804010000 668935???????? }
            // n = 5, score = 100
            //   85c0                 | jae                 0xf
            //   0f85bb010000         | dec                 eax
            //   4c8d35b26e0100       | mov                 edx, ebx
            //   41b804010000         | dec                 eax
            //   668935????????       |                     

        $sequence_11 = { 4883c310 48ffcd 75d4 488d1ddb170100 }
            // n = 4, score = 100
            //   4883c310             | or                  ebx, 0xffffffff
            //   48ffcd               | dec                 eax
            //   75d4                 | inc                 ebx
            //   488d1ddb170100       | cmp                 word ptr [eax + ebx*2], di

        $sequence_12 = { 8b15???????? 6a00 8d4c2418 51 53 }
            // n = 5, score = 100
            //   8b15????????         |                     
            //   6a00                 | push                0
            //   8d4c2418             | lea                 ecx, [esp + 0x18]
            //   51                   | push                ecx
            //   53                   | push                ebx

        $sequence_13 = { 6a00 8d542420 52 53 68???????? }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   8d542420             | lea                 edx, [esp + 0x20]
            //   52                   | push                edx
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_14 = { ff15???????? 488d8540070000 4883cbff 48ffc3 66393c58 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   488d8540070000       | mov                 ecx, edi
            //   4883cbff             | test                eax, eax
            //   48ffc3               | jne                 0x1c1
            //   66393c58             | dec                 esp

    condition:
        7 of them and filesize < 274432
}