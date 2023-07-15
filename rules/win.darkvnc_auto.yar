rule win_darkvnc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.darkvnc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkvnc"
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
        $sequence_0 = { 83caff ff15???????? 488b8ba0010000 ff15???????? 4883a3a001000000 }
            // n = 5, score = 100
            //   83caff               | xor                 esp, esp
            //   ff15????????         |                     
            //   488b8ba0010000       | dec                 eax
            //   ff15????????         |                     
            //   4883a3a001000000     | mov                 ebx, eax

        $sequence_1 = { 488b8be8070000 83caff ff15???????? 488d55e0 488bcb e8???????? 488b8be8070000 }
            // n = 7, score = 100
            //   488b8be8070000       | dec                 eax
            //   83caff               | lea                 edx, [0x3ae07]
            //   ff15????????         |                     
            //   488d55e0             | dec                 eax
            //   488bcb               | lea                 ecx, [0x42a28]
            //   e8????????           |                     
            //   488b8be8070000       | jmp                 0x13e8

        $sequence_2 = { 4883ec58 488b442460 488b4010 4889442440 488b05???????? 4889442438 488b442460 }
            // n = 7, score = 100
            //   4883ec58             | xor                 edx, edx
            //   488b442460           | dec                 eax
            //   488b4010             | mov                 eax, dword ptr [esp + 0x68]
            //   4889442440           | dec                 eax
            //   488b05????????       |                     
            //   4889442438           | cmp                 dword ptr [eax + 0x10], 0
            //   488b442460           | je                  0x135f

        $sequence_3 = { 448d435c 488bce ff15???????? 4885c0 7505 488bc6 eb03 }
            // n = 7, score = 100
            //   448d435c             | cmp                 dword ptr [esp + 0x24], 0x40
            //   488bce               | je                  0x19d9
            //   ff15????????         |                     
            //   4885c0               | dec                 eax
            //   7505                 | mov                 dword ptr [eax + 0x28], ecx
            //   488bc6               | dec                 eax
            //   eb03                 | mov                 eax, dword ptr [esp + 0x90]

        $sequence_4 = { 0faf4b08 44894324 48c7431001000800 458d4801 c1e103 8bc1 99 }
            // n = 7, score = 100
            //   0faf4b08             | inc                 ebp
            //   44894324             | xor                 eax, eax
            //   48c7431001000800     | inc                 ecx
            //   458d4801             | cmp                 edi, 0x204
            //   c1e103               | inc                 ecx
            //   8bc1                 | lea                 eax, [eax + 0xb]
            //   99                   | inc                 esp

        $sequence_5 = { c744242880000000 ba00000080 498bcc c744242003000000 458d4107 ff15???????? }
            // n = 6, score = 100
            //   c744242880000000     | je                  0x6c5
            //   ba00000080           | cmp                 eax, 0xc0000023
            //   498bcc               | jne                 0x718
            //   c744242003000000     | mov                 ecx, dword ptr [esp + 0x58]
            //   458d4107             | cmp                 eax, 0x106
            //   ff15????????         |                     

        $sequence_6 = { 488b4840 ff15???????? 488b4508 4883b8e807000000 7420 488b4508 488b88e8070000 }
            // n = 7, score = 100
            //   488b4840             | inc                 esp
            //   ff15????????         |                     
            //   488b4508             | lea                 eax, [edx + 0xe]
            //   4883b8e807000000     | dec                 eax
            //   7420                 | mov                 ebx, eax
            //   488b4508             | dec                 eax
            //   488b88e8070000       | test                eax, eax

        $sequence_7 = { 4889442448 eb21 4c8b8424a8000000 488d1522460300 488b8c24a0000000 e8???????? 4889442448 }
            // n = 7, score = 100
            //   4889442448           | dec                 eax
            //   eb21                 | mov                 edx, dword ptr [esp + 0x68]
            //   4c8b8424a8000000     | dec                 eax
            //   488d1522460300       | mov                 eax, dword ptr [eax + 0x148]
            //   488b8c24a0000000     | dec                 eax
            //   e8????????           |                     
            //   4889442448           | cmp                 dword ptr [esp + 0x58], eax

        $sequence_8 = { 8801 418bc0 2404 488d4904 f6d8 1ac0 }
            // n = 6, score = 100
            //   8801                 | cmovg               ecx, eax
            //   418bc0               | cmp                 edi, ecx
            //   2404                 | cmovg               edi, ecx
            //   488d4904             | cmovg               ebx, esi
            //   f6d8                 | dec                 esp
            //   1ac0                 | add                 eax, ecx

        $sequence_9 = { 4c8d4d50 41b814000000 488bce e8???????? 85c0 7567 488b7d50 }
            // n = 7, score = 100
            //   4c8d4d50             | mov                 esi, edx
            //   41b814000000         | dec                 eax
            //   488bce               | mov                 ebx, ecx
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   7567                 | mov                 edx, ebx
            //   488b7d50             | push                edi

    condition:
        7 of them and filesize < 606208
}