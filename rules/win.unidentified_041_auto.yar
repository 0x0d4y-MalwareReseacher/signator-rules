rule win_unidentified_041_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.unidentified_041."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_041"
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
        $sequence_0 = { ff501c 83f8ff 7411 c6470400 c7442420ffffffff e9???????? c70700000000 }
            // n = 7, score = 200
            //   ff501c               | call                dword ptr [eax + 0x1c]
            //   83f8ff               | cmp                 eax, -1
            //   7411                 | je                  0x13
            //   c6470400             | mov                 byte ptr [edi + 4], 0
            //   c7442420ffffffff     | mov                 dword ptr [esp + 0x20], 0xffffffff
            //   e9????????           |                     
            //   c70700000000         | mov                 dword ptr [edi], 0

        $sequence_1 = { 6bc324 6bdf24 8945f4 03d9 8d3403 8bfb 3b7508 }
            // n = 7, score = 200
            //   6bc324               | imul                eax, ebx, 0x24
            //   6bdf24               | imul                ebx, edi, 0x24
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   03d9                 | add                 ebx, ecx
            //   8d3403               | lea                 esi, [ebx + eax]
            //   8bfb                 | mov                 edi, ebx
            //   3b7508               | cmp                 esi, dword ptr [ebp + 8]

        $sequence_2 = { c604010a 837e1410 897e10 0f8282010000 8b06 e9???????? 8b4e10 }
            // n = 7, score = 200
            //   c604010a             | mov                 byte ptr [ecx + eax], 0xa
            //   837e1410             | cmp                 dword ptr [esi + 0x14], 0x10
            //   897e10               | mov                 dword ptr [esi + 0x10], edi
            //   0f8282010000         | jb                  0x188
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   e9????????           |                     
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]

        $sequence_3 = { 7423 3daaaaaa0a 760a 68???????? e8???????? 50 8d4dc4 }
            // n = 7, score = 200
            //   7423                 | je                  0x25
            //   3daaaaaa0a           | cmp                 eax, 0xaaaaaaa
            //   760a                 | jbe                 0xc
            //   68????????           |                     
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4dc4               | lea                 ecx, [ebp - 0x3c]

        $sequence_4 = { 8d4d98 c645fc05 e8???????? 837de400 0f84be000000 8365ec00 }
            // n = 6, score = 200
            //   8d4d98               | lea                 ecx, [ebp - 0x68]
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   e8????????           |                     
            //   837de400             | cmp                 dword ptr [ebp - 0x1c], 0
            //   0f84be000000         | je                  0xc4
            //   8365ec00             | and                 dword ptr [ebp - 0x14], 0

        $sequence_5 = { ff30 ff75e4 ff75e0 e8???????? 8b45f0 83c418 2b06 }
            // n = 7, score = 200
            //   ff30                 | push                dword ptr [eax]
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   e8????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83c418               | add                 esp, 0x18
            //   2b06                 | sub                 eax, dword ptr [esi]

        $sequence_6 = { 50 8d4c2468 e8???????? 50 8d8c2484000000 e8???????? 56 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d4c2468             | lea                 ecx, [esp + 0x68]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d8c2484000000       | lea                 ecx, [esp + 0x84]
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_7 = { 8d85b8bfffff 899dc8bfffff 0f4385b8bfffff 33c9 668908 388d58bdffff 744b }
            // n = 7, score = 200
            //   8d85b8bfffff         | lea                 eax, [ebp - 0x4048]
            //   899dc8bfffff         | mov                 dword ptr [ebp - 0x4038], ebx
            //   0f4385b8bfffff       | cmovae              eax, dword ptr [ebp - 0x4048]
            //   33c9                 | xor                 ecx, ecx
            //   668908               | mov                 word ptr [eax], cx
            //   388d58bdffff         | cmp                 byte ptr [ebp - 0x42a8], cl
            //   744b                 | je                  0x4d

        $sequence_8 = { 8b742414 8d4c242c c684240801000005 e8???????? 8b4c2424 85c9 7413 }
            // n = 7, score = 200
            //   8b742414             | mov                 esi, dword ptr [esp + 0x14]
            //   8d4c242c             | lea                 ecx, [esp + 0x2c]
            //   c684240801000005     | mov                 byte ptr [esp + 0x108], 5
            //   e8????????           |                     
            //   8b4c2424             | mov                 ecx, dword ptr [esp + 0x24]
            //   85c9                 | test                ecx, ecx
            //   7413                 | je                  0x15

        $sequence_9 = { 58 6a03 668945b0 58 6a20 668945b2 58 }
            // n = 7, score = 200
            //   58                   | pop                 eax
            //   6a03                 | push                3
            //   668945b0             | mov                 word ptr [ebp - 0x50], ax
            //   58                   | pop                 eax
            //   6a20                 | push                0x20
            //   668945b2             | mov                 word ptr [ebp - 0x4e], ax
            //   58                   | pop                 eax

    condition:
        7 of them and filesize < 1097728
}