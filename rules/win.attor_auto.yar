rule win_attor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.attor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.attor"
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
        $sequence_0 = { 83f801 7411 3d81000000 740a }
            // n = 4, score = 400
            //   83f801               | cmp                 eax, 1
            //   7411                 | je                  0x13
            //   3d81000000           | cmp                 eax, 0x81
            //   740a                 | je                  0xc

        $sequence_1 = { 48894720 ff15???????? 85c0 7510 ff15???????? 4032ed 8bd8 }
            // n = 7, score = 300
            //   48894720             | mov                 ebp, edx
            //   ff15????????         |                     
            //   85c0                 | mov                 cl, 1
            //   7510                 | dec                 eax
            //   ff15????????         |                     
            //   4032ed               | mov                 ecx, dword ptr [esp + 0x40]
            //   8bd8                 | dec                 esp

        $sequence_2 = { 488b742460 48c784248000000000000000 7411 33c9 }
            // n = 4, score = 300
            //   488b742460           | mov                 eax, ebx
            //   48c784248000000000000000     | dec    eax
            //   7411                 | mov                 dword ptr [edi + 0x20], eax
            //   33c9                 | test                eax, eax

        $sequence_3 = { e8???????? 488b742458 4d85ed 7404 41895d00 418ac4 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   488b742458           | inc                 eax
            //   4d85ed               | xor                 ch, ch
            //   7404                 | dec                 eax
            //   41895d00             | mov                 eax, dword ptr [esp + 0x30]
            //   418ac4               | dec                 eax

        $sequence_4 = { b101 e8???????? 488b4c2440 4c8bc3 }
            // n = 4, score = 300
            //   b101                 | dec                 ecx
            //   e8????????           |                     
            //   488b4c2440           | mov                 edi, eax
            //   4c8bc3               | dec                 eax

        $sequence_5 = { 488b442430 48895c2430 488901 488b8c24a8000000 4885c9 7427 488b842490000000 }
            // n = 7, score = 300
            //   488b442430           | dec                 eax
            //   48895c2430           | mov                 esi, dword ptr [esp + 0x60]
            //   488901               | dec                 eax
            //   488b8c24a8000000     | mov                 dword ptr [esp + 0x80], 0
            //   4885c9               | je                  0x1f
            //   7427                 | xor                 ecx, ecx
            //   488b842490000000     | inc                 ecx

        $sequence_6 = { 488bcd e8???????? 488d942490000000 488d4c2438 }
            // n = 4, score = 300
            //   488bcd               | lea                 edx, [ecx + 1]
            //   e8????????           |                     
            //   488d942490000000     | test                eax, eax
            //   488d4c2438           | jne                 0x14

        $sequence_7 = { 57 4154 4883ec20 33f6 498bf8 488bea }
            // n = 6, score = 300
            //   57                   | push                edi
            //   4154                 | inc                 ecx
            //   4883ec20             | push                esp
            //   33f6                 | dec                 eax
            //   498bf8               | sub                 esp, 0x20
            //   488bea               | xor                 esi, esi

        $sequence_8 = { 83c40c 85c0 0f84ef000000 6a01 e8???????? }
            // n = 5, score = 200
            //   83c40c               | mov                 al, ah
            //   85c0                 | mov                 ebx, eax
            //   0f84ef000000         | jmp                 0x60
            //   6a01                 | dec                 eax
            //   e8????????           |                     

        $sequence_9 = { 8d4c2418 8d54241c 51 52 89442424 e8???????? 8b442420 }
            // n = 7, score = 200
            //   8d4c2418             | lea                 edx, [esp + 0x90]
            //   8d54241c             | dec                 eax
            //   51                   | lea                 ecx, [esp + 0x38]
            //   52                   | dec                 eax
            //   89442424             | mov                 esi, dword ptr [esp + 0x58]
            //   e8????????           |                     
            //   8b442420             | dec                 ebp

        $sequence_10 = { 740a 83f808 7405 83f811 }
            // n = 4, score = 200
            //   740a                 | dec                 eax
            //   83f808               | test                ecx, ecx
            //   7405                 | je                  0x3c
            //   83f811               | dec                 eax

        $sequence_11 = { 0f84bf010000 8b542438 8d7208 56 ff15???????? 89442434 8d442420 }
            // n = 7, score = 200
            //   0f84bf010000         | je                  0x21
            //   8b542438             | mov                 edx, dword ptr [eax + 4]
            //   8d7208               | mov                 ecx, dword ptr [eax]
            //   56                   | push                eax
            //   ff15????????         |                     
            //   89442434             | lea                 ecx, [esp + 0x18]
            //   8d442420             | lea                 edx, [esp + 0x1c]

        $sequence_12 = { 8b442430 8b4c2424 8b54241c 50 51 }
            // n = 5, score = 200
            //   8b442430             | test                ebp, ebp
            //   8b4c2424             | je                  9
            //   8b54241c             | inc                 ecx
            //   50                   | mov                 dword ptr [ebp], ebx
            //   51                   | inc                 ecx

        $sequence_13 = { 85c0 7456 8b442438 c745000c000000 3bc7 897d08 897504 }
            // n = 7, score = 200
            //   85c0                 | mov                 ecx, dword ptr [esp + 0xa0]
            //   7456                 | mov                 dword ptr [esi], 0x18
            //   8b442438             | mov                 dword ptr [esi + 0x10], ebx
            //   c745000c000000       | je                  0xc
            //   3bc7                 | cmp                 eax, 8
            //   897d08               | je                  0xa
            //   897504               | cmp                 eax, 0x11

        $sequence_14 = { 897c2418 8908 8b44243c 3bc7 }
            // n = 4, score = 200
            //   897c2418             | push                ecx
            //   8908                 | push                edx
            //   8b44243c             | mov                 dword ptr [esp + 0x24], eax
            //   3bc7                 | mov                 eax, dword ptr [esp + 0x20]

        $sequence_15 = { 741f 8b5004 8b08 50 }
            // n = 4, score = 200
            //   741f                 | mov                 eax, dword ptr [esp + 0x90]
            //   8b5004               | dec                 eax
            //   8b08                 | mov                 ecx, ebp
            //   50                   | dec                 eax

    condition:
        7 of them and filesize < 2023424
}