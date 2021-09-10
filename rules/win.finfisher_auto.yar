rule win_finfisher_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.finfisher."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.finfisher"
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
        $sequence_0 = { 56 8d85d4fbffff 50 e8???????? }
            // n = 4, score = 200
            //   56                   | push                esi
            //   8d85d4fbffff         | lea                 eax, dword ptr [ebp - 0x42c]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_1 = { 57 56 8d85ccf9ffff 50 }
            // n = 4, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   8d85ccf9ffff         | lea                 eax, dword ptr [ebp - 0x634]
            //   50                   | push                eax

        $sequence_2 = { 68???????? 6804010000 8d85ccf9ffff 50 }
            // n = 4, score = 200
            //   68????????           |                     
            //   6804010000           | push                0x104
            //   8d85ccf9ffff         | lea                 eax, dword ptr [ebp - 0x634]
            //   50                   | push                eax

        $sequence_3 = { 0145d8 ebcc 8975e4 eb07 }
            // n = 4, score = 100
            //   0145d8               | add                 dword ptr [ebp - 0x28], eax
            //   ebcc                 | jmp                 0xffffffce
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   eb07                 | jmp                 9

        $sequence_4 = { 8d8445dcfdffff eb02 48 48 6683385c 898590f7ffff }
            // n = 6, score = 100
            //   8d8445dcfdffff       | lea                 eax, dword ptr [ebp + eax*2 - 0x224]
            //   eb02                 | jmp                 4
            //   48                   | dec                 eax
            //   48                   | dec                 eax
            //   6683385c             | cmp                 word ptr [eax], 0x5c
            //   898590f7ffff         | mov                 dword ptr [ebp - 0x870], eax

        $sequence_5 = { 8b8590f7ffff 66c7005c00 8d85c0f7ffff 50 8d85dcfdffff 50 }
            // n = 6, score = 100
            //   8b8590f7ffff         | mov                 eax, dword ptr [ebp - 0x870]
            //   66c7005c00           | mov                 word ptr [eax], 0x5c
            //   8d85c0f7ffff         | lea                 eax, dword ptr [ebp - 0x840]
            //   50                   | push                eax
            //   8d85dcfdffff         | lea                 eax, dword ptr [ebp - 0x224]
            //   50                   | push                eax

        $sequence_6 = { 0108 83500400 a1???????? 8380780300003c 83fbfd }
            // n = 5, score = 100
            //   0108                 | add                 dword ptr [eax], ecx
            //   83500400             | adc                 dword ptr [eax + 4], 0
            //   a1????????           |                     
            //   8380780300003c       | add                 dword ptr [eax + 0x378], 0x3c
            //   83fbfd               | cmp                 ebx, -3

        $sequence_7 = { 6a02 56 50 ff15???????? c745fcfeffffff }
            // n = 5, score = 100
            //   6a02                 | push                2
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   c745fcfeffffff       | mov                 dword ptr [ebp - 4], 0xfffffffe

        $sequence_8 = { 8d85d4fbffff 50 8d8570f7ffff 50 ff15???????? }
            // n = 5, score = 100
            //   8d85d4fbffff         | lea                 eax, dword ptr [ebp - 0x42c]
            //   50                   | push                eax
            //   8d8570f7ffff         | lea                 eax, dword ptr [ebp - 0x890]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_9 = { ff35???????? 8d45ec 50 ffd6 8b7508 8d45fc 50 }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_10 = { 011a 8b55f0 83450802 49 }
            // n = 4, score = 100
            //   011a                 | add                 dword ptr [edx], ebx
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   83450802             | add                 dword ptr [ebp + 8], 2
            //   49                   | dec                 ecx

        $sequence_11 = { 0118 8b45f0 83450802 4f }
            // n = 4, score = 100
            //   0118                 | add                 dword ptr [eax], ebx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83450802             | add                 dword ptr [ebp + 8], 2
            //   4f                   | dec                 edi

        $sequence_12 = { 0145d4 ebce 8975e4 eb07 }
            // n = 4, score = 100
            //   0145d4               | add                 dword ptr [ebp - 0x2c], eax
            //   ebce                 | jmp                 0xffffffd0
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   eb07                 | jmp                 9

    condition:
        7 of them and filesize < 262144
}