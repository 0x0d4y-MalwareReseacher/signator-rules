rule win_badhatch_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.badhatch."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.badhatch"
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
        $sequence_0 = { 8b45f0 6a20 89461c 59 8d45cc 8818 40 }
            // n = 7, score = 100
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   6a20                 | push                0x20
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   59                   | pop                 ecx
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   8818                 | mov                 byte ptr [eax], bl
            //   40                   | inc                 eax

        $sequence_1 = { 8d45f0 50 ff7330 33f6 8975f0 8975f4 c745ec01000000 }
            // n = 7, score = 100
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   ff7330               | push                dword ptr [ebx + 0x30]
            //   33f6                 | xor                 esi, esi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   c745ec01000000       | mov                 dword ptr [ebp - 0x14], 1

        $sequence_2 = { 8b442410 53 e8???????? 59 85c0 0f85c2000000 c744240ce2000000 }
            // n = 7, score = 100
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   0f85c2000000         | jne                 0xc8
            //   c744240ce2000000     | mov                 dword ptr [esp + 0xc], 0xe2

        $sequence_3 = { ff750c e8???????? 83c428 83f8ff 0f8585000000 ff7508 ff15???????? }
            // n = 7, score = 100
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28
            //   83f8ff               | cmp                 eax, -1
            //   0f8585000000         | jne                 0x8b
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     

        $sequence_4 = { 89742418 397304 767a 8db3dc000000 ff750c 8b7efc ff36 }
            // n = 7, score = 100
            //   89742418             | mov                 dword ptr [esp + 0x18], esi
            //   397304               | cmp                 dword ptr [ebx + 4], esi
            //   767a                 | jbe                 0x7c
            //   8db3dc000000         | lea                 esi, [ebx + 0xdc]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8b7efc               | mov                 edi, dword ptr [esi - 4]
            //   ff36                 | push                dword ptr [esi]

        $sequence_5 = { 397ddc 740c ff75dc 57 ff35???????? }
            // n = 5, score = 100
            //   397ddc               | cmp                 dword ptr [ebp - 0x24], edi
            //   740c                 | je                  0xe
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   57                   | push                edi
            //   ff35????????         |                     

        $sequence_6 = { 83c410 8b36 85f6 75ca 83f801 7504 33c0 }
            // n = 7, score = 100
            //   83c410               | add                 esp, 0x10
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   85f6                 | test                esi, esi
            //   75ca                 | jne                 0xffffffcc
            //   83f801               | cmp                 eax, 1
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax

        $sequence_7 = { 8d85f0fbffff 50 68???????? ff750c e8???????? 83c410 3bdf }
            // n = 7, score = 100
            //   8d85f0fbffff         | lea                 eax, [ebp - 0x410]
            //   50                   | push                eax
            //   68????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   3bdf                 | cmp                 ebx, edi

        $sequence_8 = { 59 6a70 66894dd2 59 6a6c }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   6a70                 | push                0x70
            //   66894dd2             | mov                 word ptr [ebp - 0x2e], cx
            //   59                   | pop                 ecx
            //   6a6c                 | push                0x6c

        $sequence_9 = { 64a100000000 50 64892500000000 51 51 b894200000 e8???????? }
            // n = 7, score = 100
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   b894200000           | mov                 eax, 0x2094
            //   e8????????           |                     

    condition:
        7 of them and filesize < 156672
}