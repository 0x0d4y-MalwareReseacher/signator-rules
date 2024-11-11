rule win_rincux_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.rincux."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rincux"
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
        $sequence_0 = { 8bce 52 e8???????? 8bf8 8d8424d0040000 50 8bce }
            // n = 7, score = 200
            //   8bce                 | mov                 ecx, esi
            //   52                   | push                edx
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   8d8424d0040000       | lea                 eax, [esp + 0x4d0]
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi

        $sequence_1 = { 7348 e9???????? 8b4c2458 8b6c2414 c7411880730210 c7001d000000 eb2c }
            // n = 7, score = 200
            //   7348                 | jae                 0x4a
            //   e9????????           |                     
            //   8b4c2458             | mov                 ecx, dword ptr [esp + 0x58]
            //   8b6c2414             | mov                 ebp, dword ptr [esp + 0x14]
            //   c7411880730210       | mov                 dword ptr [ecx + 0x18], 0x10027380
            //   c7001d000000         | mov                 dword ptr [eax], 0x1d
            //   eb2c                 | jmp                 0x2e

        $sequence_2 = { 83ff07 6810010000 752a e8???????? 83c404 89442418 85c0 }
            // n = 7, score = 200
            //   83ff07               | cmp                 edi, 7
            //   6810010000           | push                0x110
            //   752a                 | jne                 0x2c
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   85c0                 | test                eax, eax

        $sequence_3 = { 7e5d 8b4518 89442410 eb04 8b5c2418 8b4c2410 }
            // n = 6, score = 200
            //   7e5d                 | jle                 0x5f
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   eb04                 | jmp                 6
            //   8b5c2418             | mov                 ebx, dword ptr [esp + 0x18]
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]

        $sequence_4 = { 83fd03 7330 85ff 0f840e0c0000 33c9 8b442410 }
            // n = 6, score = 200
            //   83fd03               | cmp                 ebp, 3
            //   7330                 | jae                 0x32
            //   85ff                 | test                edi, edi
            //   0f840e0c0000         | je                  0xc14
            //   33c9                 | xor                 ecx, ecx
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]

        $sequence_5 = { e8???????? 8d4c2400 c784247c010000ffffffff e8???????? }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8d4c2400             | lea                 ecx, [esp]
            //   c784247c010000ffffffff     | mov    dword ptr [esp + 0x17c], 0xffffffff
            //   e8????????           |                     

        $sequence_6 = { 8bca 83e103 f3a4 8dbc2438040000 83c9ff f2ae f7d1 }
            // n = 7, score = 200
            //   8bca                 | mov                 ecx, edx
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8dbc2438040000       | lea                 edi, [esp + 0x438]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_7 = { c1ea08 89500c 8b4310 f6c402 7425 8b442410 8d4c2424 }
            // n = 7, score = 200
            //   c1ea08               | shr                 edx, 8
            //   89500c               | mov                 dword ptr [eax + 0xc], edx
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   f6c402               | test                ah, 2
            //   7425                 | je                  0x27
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8d4c2424             | lea                 ecx, [esp + 0x24]

        $sequence_8 = { c7856cfdffff18000000 e8???????? 8bce e8???????? 33c0 8b4df4 }
            // n = 6, score = 200
            //   c7856cfdffff18000000     | mov    dword ptr [ebp - 0x294], 0x18
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_9 = { ffd7 8d84246c030000 6804010000 50 ffd3 8d8c246c030000 68???????? }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   8d84246c030000       | lea                 eax, [esp + 0x36c]
            //   6804010000           | push                0x104
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8d8c246c030000       | lea                 ecx, [esp + 0x36c]
            //   68????????           |                     

    condition:
        7 of them and filesize < 392192
}