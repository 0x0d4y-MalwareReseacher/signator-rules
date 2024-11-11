rule win_minibus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.minibus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.minibus"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { c20400 57 c645f800 ff75f8 51 8bce e8???????? }
            // n = 7, score = 300
            //   c20400               | ret                 4
            //   57                   | push                edi
            //   c645f800             | mov                 byte ptr [ebp - 8], 0
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_1 = { c745b001000000 e8???????? 837f1408 8bc8 894db4 }
            // n = 5, score = 300
            //   c745b001000000       | mov                 dword ptr [ebp - 0x50], 1
            //   e8????????           |                     
            //   837f1408             | cmp                 dword ptr [edi + 0x14], 8
            //   8bc8                 | mov                 ecx, eax
            //   894db4               | mov                 dword ptr [ebp - 0x4c], ecx

        $sequence_2 = { 837df408 897dec 8d0446 8945fc 7263 8b3b }
            // n = 6, score = 300
            //   837df408             | cmp                 dword ptr [ebp - 0xc], 8
            //   897dec               | mov                 dword ptr [ebp - 0x14], edi
            //   8d0446               | lea                 eax, [esi + eax*2]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   7263                 | jb                  0x65
            //   8b3b                 | mov                 edi, dword ptr [ebx]

        $sequence_3 = { 7606 ff15???????? 51 52 e8???????? }
            // n = 5, score = 300
            //   7606                 | jbe                 8
            //   ff15????????         |                     
            //   51                   | push                ecx
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_4 = { 83fa03 7c16 0fb74304 83f85c 0f84cd000000 83f82f 0f84c4000000 }
            // n = 7, score = 300
            //   83fa03               | cmp                 edx, 3
            //   7c16                 | jl                  0x18
            //   0fb74304             | movzx               eax, word ptr [ebx + 4]
            //   83f85c               | cmp                 eax, 0x5c
            //   0f84cd000000         | je                  0xd3
            //   83f82f               | cmp                 eax, 0x2f
            //   0f84c4000000         | je                  0xca

        $sequence_5 = { 0f86bd000000 ebb1 85c9 7410 51 }
            // n = 5, score = 300
            //   0f86bd000000         | jbe                 0xc3
            //   ebb1                 | jmp                 0xffffffb3
            //   85c9                 | test                ecx, ecx
            //   7410                 | je                  0x12
            //   51                   | push                ecx

        $sequence_6 = { b800000080 83c023 50 e8???????? 83c404 85c0 0f84c7000000 }
            // n = 7, score = 300
            //   b800000080           | mov                 eax, 0x80000000
            //   83c023               | add                 eax, 0x23
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   0f84c7000000         | je                  0xcd

        $sequence_7 = { 720f 8d4823 3bc8 7641 }
            // n = 4, score = 300
            //   720f                 | jb                  0x11
            //   8d4823               | lea                 ecx, [eax + 0x23]
            //   3bc8                 | cmp                 ecx, eax
            //   7641                 | jbe                 0x43

        $sequence_8 = { 8d0c4d02000000 8bc2 81f900100000 7216 8b50fc 83c123 2bc2 }
            // n = 7, score = 300
            //   8d0c4d02000000       | lea                 ecx, [ecx*2 + 2]
            //   8bc2                 | mov                 eax, edx
            //   81f900100000         | cmp                 ecx, 0x1000
            //   7216                 | jb                  0x18
            //   8b50fc               | mov                 edx, dword ptr [eax - 4]
            //   83c123               | add                 ecx, 0x23
            //   2bc2                 | sub                 eax, edx

        $sequence_9 = { 0f87b1000000 c747140f000000 83fb10 7319 6a10 }
            // n = 5, score = 300
            //   0f87b1000000         | ja                  0xb7
            //   c747140f000000       | mov                 dword ptr [edi + 0x14], 0xf
            //   83fb10               | cmp                 ebx, 0x10
            //   7319                 | jae                 0x1b
            //   6a10                 | push                0x10

    condition:
        7 of them and filesize < 324608
}