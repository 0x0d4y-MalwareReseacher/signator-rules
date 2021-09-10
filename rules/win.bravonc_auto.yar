rule win_bravonc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.bravonc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bravonc"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { ff7604 ff5024 85c0 7c04 33c0 eb11 }
            // n = 6, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   ff5024               | call                dword ptr [eax + 0x24]
            //   85c0                 | test                eax, eax
            //   7c04                 | jl                  6
            //   33c0                 | xor                 eax, eax
            //   eb11                 | jmp                 0x13

        $sequence_1 = { 56 e8???????? 83c40c 85c0 740c 47 83c610 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   740c                 | je                  0xe
            //   47                   | inc                 edi
            //   83c610               | add                 esi, 0x10

        $sequence_2 = { 8b06 8d8d00ffffff 6a04 51 ff7604 8bce ff5024 }
            // n = 7, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d8d00ffffff         | lea                 ecx, dword ptr [ebp - 0x100]
            //   6a04                 | push                4
            //   51                   | push                ecx
            //   ff7604               | push                dword ptr [esi + 4]
            //   8bce                 | mov                 ecx, esi
            //   ff5024               | call                dword ptr [eax + 0x24]

        $sequence_3 = { 33481c 334810 51 e8???????? 8b8ec0000000 53 89411c }
            // n = 7, score = 100
            //   33481c               | xor                 ecx, dword ptr [eax + 0x1c]
            //   334810               | xor                 ecx, dword ptr [eax + 0x10]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b8ec0000000         | mov                 ecx, dword ptr [esi + 0xc0]
            //   53                   | push                ebx
            //   89411c               | mov                 dword ptr [ecx + 0x1c], eax

        $sequence_4 = { 8d45ee 6a01 50 8bcf 895dfc e8???????? }
            // n = 6, score = 100
            //   8d45ee               | lea                 eax, dword ptr [ebp - 0x12]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   e8????????           |                     

        $sequence_5 = { a840 0f84e5000000 a820 0f84dd020000 c70307000000 ebc8 8b4308 }
            // n = 7, score = 100
            //   a840                 | test                al, 0x40
            //   0f84e5000000         | je                  0xeb
            //   a820                 | test                al, 0x20
            //   0f84dd020000         | je                  0x2e3
            //   c70307000000         | mov                 dword ptr [ebx], 7
            //   ebc8                 | jmp                 0xffffffca
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]

        $sequence_6 = { 8b45f8 2b45f4 3b4628 7f51 8b4d0c 8b06 2bcf }
            // n = 7, score = 100
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   2b45f4               | sub                 eax, dword ptr [ebp - 0xc]
            //   3b4628               | cmp                 eax, dword ptr [esi + 0x28]
            //   7f51                 | jg                  0x53
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   2bcf                 | sub                 ecx, edi

        $sequence_7 = { 8906 8d8584feffff 50 8d8580fdffff 50 }
            // n = 5, score = 100
            //   8906                 | mov                 dword ptr [esi], eax
            //   8d8584feffff         | lea                 eax, dword ptr [ebp - 0x17c]
            //   50                   | push                eax
            //   8d8580fdffff         | lea                 eax, dword ptr [ebp - 0x280]
            //   50                   | push                eax

        $sequence_8 = { 7c41 bbec130000 8b45f4 895df8 2bc7 3bc3 7f03 }
            // n = 7, score = 100
            //   7c41                 | jl                  0x43
            //   bbec130000           | mov                 ebx, 0x13ec
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   2bc7                 | sub                 eax, edi
            //   3bc3                 | cmp                 eax, ebx
            //   7f03                 | jg                  5

        $sequence_9 = { 85ff 7e20 ff7514 8bce 6a01 57 ff750c }
            // n = 7, score = 100
            //   85ff                 | test                edi, edi
            //   7e20                 | jle                 0x22
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   8bce                 | mov                 ecx, esi
            //   6a01                 | push                1
            //   57                   | push                edi
            //   ff750c               | push                dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 131072
}