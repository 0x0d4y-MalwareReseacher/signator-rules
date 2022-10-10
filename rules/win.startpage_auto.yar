rule win_startpage_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.startpage."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.startpage"
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
        $sequence_0 = { e8???????? 8b5dcc 8b45c8 3bf8 0f8524fdffff b001 8b4df4 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b5dcc               | mov                 ebx, dword ptr [ebp - 0x34]
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   3bf8                 | cmp                 edi, eax
            //   0f8524fdffff         | jne                 0xfffffd2a
            //   b001                 | mov                 al, 1
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { 6a01 56 ff15???????? e8???????? 50 8d4d80 e8???????? }
            // n = 7, score = 200
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff15????????         |                     
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4d80               | lea                 ecx, [ebp - 0x80]
            //   e8????????           |                     

        $sequence_2 = { 7473 83f82c 7407 b857000780 5f c3 a1???????? }
            // n = 7, score = 200
            //   7473                 | je                  0x75
            //   83f82c               | cmp                 eax, 0x2c
            //   7407                 | je                  9
            //   b857000780           | mov                 eax, 0x80070057
            //   5f                   | pop                 edi
            //   c3                   | ret                 
            //   a1????????           |                     

        $sequence_3 = { ff7610 8b08 8b01 ff5008 56 e8???????? }
            // n = 6, score = 200
            //   ff7610               | push                dword ptr [esi + 0x10]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff5008               | call                dword ptr [eax + 8]
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_4 = { 760e 50 8d8de8deffff e8???????? eb2f 8db5ecdeffff 89b5e8deffff }
            // n = 7, score = 200
            //   760e                 | jbe                 0x10
            //   50                   | push                eax
            //   8d8de8deffff         | lea                 ecx, [ebp - 0x2118]
            //   e8????????           |                     
            //   eb2f                 | jmp                 0x31
            //   8db5ecdeffff         | lea                 esi, [ebp - 0x2114]
            //   89b5e8deffff         | mov                 dword ptr [ebp - 0x2118], esi

        $sequence_5 = { c7473038fa4400 c7473428f94400 c74738e8f44400 c7473c8cf64400 c74740b0f54400 c7474840f84400 c7474c38f64400 }
            // n = 7, score = 200
            //   c7473038fa4400       | mov                 dword ptr [edi + 0x30], 0x44fa38
            //   c7473428f94400       | mov                 dword ptr [edi + 0x34], 0x44f928
            //   c74738e8f44400       | mov                 dword ptr [edi + 0x38], 0x44f4e8
            //   c7473c8cf64400       | mov                 dword ptr [edi + 0x3c], 0x44f68c
            //   c74740b0f54400       | mov                 dword ptr [edi + 0x40], 0x44f5b0
            //   c7474840f84400       | mov                 dword ptr [edi + 0x48], 0x44f840
            //   c7474c38f64400       | mov                 dword ptr [edi + 0x4c], 0x44f638

        $sequence_6 = { 8bf9 8d7718 56 ff7704 ffd3 8d45ec 0f57c0 }
            // n = 7, score = 200
            //   8bf9                 | mov                 edi, ecx
            //   8d7718               | lea                 esi, [edi + 0x18]
            //   56                   | push                esi
            //   ff7704               | push                dword ptr [edi + 4]
            //   ffd3                 | call                ebx
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   0f57c0               | xorps               xmm0, xmm0

        $sequence_7 = { 7458 a1???????? 8d4f08 8bd7 8b39 8901 a1???????? }
            // n = 7, score = 200
            //   7458                 | je                  0x5a
            //   a1????????           |                     
            //   8d4f08               | lea                 ecx, [edi + 8]
            //   8bd7                 | mov                 edx, edi
            //   8b39                 | mov                 edi, dword ptr [ecx]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   a1????????           |                     

        $sequence_8 = { 33c0 6a06 59 f3ab a1???????? 885e44 895e04 }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   6a06                 | push                6
            //   59                   | pop                 ecx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   a1????????           |                     
            //   885e44               | mov                 byte ptr [esi + 0x44], bl
            //   895e04               | mov                 dword ptr [esi + 4], ebx

        $sequence_9 = { c70300000000 c7430400000000 c7430800000000 e9???????? c745c000000000 c745c400000000 c745c800000000 }
            // n = 7, score = 200
            //   c70300000000         | mov                 dword ptr [ebx], 0
            //   c7430400000000       | mov                 dword ptr [ebx + 4], 0
            //   c7430800000000       | mov                 dword ptr [ebx + 8], 0
            //   e9????????           |                     
            //   c745c000000000       | mov                 dword ptr [ebp - 0x40], 0
            //   c745c400000000       | mov                 dword ptr [ebp - 0x3c], 0
            //   c745c800000000       | mov                 dword ptr [ebp - 0x38], 0

    condition:
        7 of them and filesize < 2277376
}