rule win_ransoc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ransoc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ransoc"
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
        $sequence_0 = { 8d5f44 8d7320 8906 894604 894608 89460c }
            // n = 6, score = 300
            //   8d5f44               | lea                 ebx, [edi + 0x44]
            //   8d7320               | lea                 esi, [ebx + 0x20]
            //   8906                 | mov                 dword ptr [esi], eax
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   894608               | mov                 dword ptr [esi + 8], eax
            //   89460c               | mov                 dword ptr [esi + 0xc], eax

        $sequence_1 = { 8b742434 8974241c 7511 837c241400 0f85f2000000 897c2414 }
            // n = 6, score = 300
            //   8b742434             | mov                 esi, dword ptr [esp + 0x34]
            //   8974241c             | mov                 dword ptr [esp + 0x1c], esi
            //   7511                 | jne                 0x13
            //   837c241400           | cmp                 dword ptr [esp + 0x14], 0
            //   0f85f2000000         | jne                 0xf8
            //   897c2414             | mov                 dword ptr [esp + 0x14], edi

        $sequence_2 = { 85f6 758b 68???????? ff15???????? 8bc7 }
            // n = 5, score = 300
            //   85f6                 | test                esi, esi
            //   758b                 | jne                 0xffffff8d
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bc7                 | mov                 eax, edi

        $sequence_3 = { 7403 897a44 8b513c 897144 8b7238 89713c 3bf7 }
            // n = 7, score = 300
            //   7403                 | je                  5
            //   897a44               | mov                 dword ptr [edx + 0x44], edi
            //   8b513c               | mov                 edx, dword ptr [ecx + 0x3c]
            //   897144               | mov                 dword ptr [ecx + 0x44], esi
            //   8b7238               | mov                 esi, dword ptr [edx + 0x38]
            //   89713c               | mov                 dword ptr [ecx + 0x3c], esi
            //   3bf7                 | cmp                 esi, edi

        $sequence_4 = { 0bd3 89562c 8bd7 5f 8bce 5e }
            // n = 6, score = 300
            //   0bd3                 | or                  edx, ebx
            //   89562c               | mov                 dword ptr [esi + 0x2c], edx
            //   8bd7                 | mov                 edx, edi
            //   5f                   | pop                 edi
            //   8bce                 | mov                 ecx, esi
            //   5e                   | pop                 esi

        $sequence_5 = { 3d370200c0 7551 b875270000 c3 3d12a000c0 7f32 }
            // n = 6, score = 300
            //   3d370200c0           | cmp                 eax, 0xc0000237
            //   7551                 | jne                 0x53
            //   b875270000           | mov                 eax, 0x2775
            //   c3                   | ret                 
            //   3d12a000c0           | cmp                 eax, 0xc000a012
            //   7f32                 | jg                  0x34

        $sequence_6 = { e9???????? 8b4130 85c0 740f 8d9b00000000 8bc8 }
            // n = 6, score = 300
            //   e9????????           |                     
            //   8b4130               | mov                 eax, dword ptr [ecx + 0x30]
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11
            //   8d9b00000000         | lea                 ebx, [ebx]
            //   8bc8                 | mov                 ecx, eax

        $sequence_7 = { c3 8b4810 8b542408 890a 8b4014 }
            // n = 5, score = 300
            //   c3                   | ret                 
            //   8b4810               | mov                 ecx, dword ptr [eax + 0x10]
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b4014               | mov                 eax, dword ptr [eax + 0x14]

        $sequence_8 = { 8b7230 894e38 8b7138 897238 3bf7 7412 8b7138 }
            // n = 7, score = 300
            //   8b7230               | mov                 esi, dword ptr [edx + 0x30]
            //   894e38               | mov                 dword ptr [esi + 0x38], ecx
            //   8b7138               | mov                 esi, dword ptr [ecx + 0x38]
            //   897238               | mov                 dword ptr [edx + 0x38], esi
            //   3bf7                 | cmp                 esi, edi
            //   7412                 | je                  0x14
            //   8b7138               | mov                 esi, dword ptr [ecx + 0x38]

        $sequence_9 = { 8b7c240c 8d4718 6a01 50 e8???????? }
            // n = 5, score = 300
            //   8b7c240c             | mov                 edi, dword ptr [esp + 0xc]
            //   8d4718               | lea                 eax, [edi + 0x18]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 958464
}