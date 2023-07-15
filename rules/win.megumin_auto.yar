rule win_megumin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.megumin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.megumin"
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
        $sequence_0 = { 66a1???????? 0f57c0 668907 33f6 660fd645e0 c745e800000000 66c745ec0000 }
            // n = 7, score = 200
            //   66a1????????         |                     
            //   0f57c0               | xorps               xmm0, xmm0
            //   668907               | mov                 word ptr [edi], ax
            //   33f6                 | xor                 esi, esi
            //   660fd645e0           | movq                qword ptr [ebp - 0x20], xmm0
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0
            //   66c745ec0000         | mov                 word ptr [ebp - 0x14], 0

        $sequence_1 = { 8b46a0 8b4004 c74430a07c7e4600 8b46a0 8b4804 8d41e8 8944319c }
            // n = 7, score = 200
            //   8b46a0               | mov                 eax, dword ptr [esi - 0x60]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   c74430a07c7e4600     | mov                 dword ptr [eax + esi - 0x60], 0x467e7c
            //   8b46a0               | mov                 eax, dword ptr [esi - 0x60]
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   8d41e8               | lea                 eax, [ecx - 0x18]
            //   8944319c             | mov                 dword ptr [ecx + esi - 0x64], eax

        $sequence_2 = { 7415 ff7508 8bc8 ff7704 ff37 e8???????? 8b470c }
            // n = 7, score = 200
            //   7415                 | je                  0x17
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8bc8                 | mov                 ecx, eax
            //   ff7704               | push                dword ptr [edi + 4]
            //   ff37                 | push                dword ptr [edi]
            //   e8????????           |                     
            //   8b470c               | mov                 eax, dword ptr [edi + 0xc]

        $sequence_3 = { 7426 8d8550ffffff 50 68???????? 8d4de4 e8???????? }
            // n = 6, score = 200
            //   7426                 | je                  0x28
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   e8????????           |                     

        $sequence_4 = { c745b400000000 8d4344 6803010000 ff75d0 6804010000 50 e8???????? }
            // n = 7, score = 200
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   8d4344               | lea                 eax, [ebx + 0x44]
            //   6803010000           | push                0x103
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   6804010000           | push                0x104
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 3bc6 742f 8bc8 e8???????? 0f1006 0f11851cffffff f30f7e4610 }
            // n = 7, score = 200
            //   3bc6                 | cmp                 eax, esi
            //   742f                 | je                  0x31
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   0f1006               | movups              xmm0, xmmword ptr [esi]
            //   0f11851cffffff       | movups              xmmword ptr [ebp - 0xe4], xmm0
            //   f30f7e4610           | movq                xmm0, qword ptr [esi + 0x10]

        $sequence_6 = { c1f902 8945fc 3bf1 0f860b010000 81feffffff3f 0f8735010000 8bd1 }
            // n = 7, score = 200
            //   c1f902               | sar                 ecx, 2
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   3bf1                 | cmp                 esi, ecx
            //   0f860b010000         | jbe                 0x111
            //   81feffffff3f         | cmp                 esi, 0x3fffffff
            //   0f8735010000         | ja                  0x13b
            //   8bd1                 | mov                 edx, ecx

        $sequence_7 = { 660fd64584 c7401000000000 c740140f000000 c60000 c645fc13 8b5588 8bc2 }
            // n = 7, score = 200
            //   660fd64584           | movq                qword ptr [ebp - 0x7c], xmm0
            //   c7401000000000       | mov                 dword ptr [eax + 0x10], 0
            //   c740140f000000       | mov                 dword ptr [eax + 0x14], 0xf
            //   c60000               | mov                 byte ptr [eax], 0
            //   c645fc13             | mov                 byte ptr [ebp - 4], 0x13
            //   8b5588               | mov                 edx, dword ptr [ebp - 0x78]
            //   8bc2                 | mov                 eax, edx

        $sequence_8 = { 8b8584fbffff 85c0 7502 33c0 33f6 83f802 0f8ec6030000 }
            // n = 7, score = 200
            //   8b8584fbffff         | mov                 eax, dword ptr [ebp - 0x47c]
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   33c0                 | xor                 eax, eax
            //   33f6                 | xor                 esi, esi
            //   83f802               | cmp                 eax, 2
            //   0f8ec6030000         | jle                 0x3cc

        $sequence_9 = { 755f 8ad8 8b462c 2500010000 7411 8b4630 6a5d }
            // n = 7, score = 200
            //   755f                 | jne                 0x61
            //   8ad8                 | mov                 bl, al
            //   8b462c               | mov                 eax, dword ptr [esi + 0x2c]
            //   2500010000           | and                 eax, 0x100
            //   7411                 | je                  0x13
            //   8b4630               | mov                 eax, dword ptr [esi + 0x30]
            //   6a5d                 | push                0x5d

    condition:
        7 of them and filesize < 1007616
}