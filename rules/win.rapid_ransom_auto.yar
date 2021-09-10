rule win_rapid_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.rapid_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rapid_ransom"
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
        $sequence_0 = { 6801000004 6800a40000 ff75f8 ff15???????? }
            // n = 4, score = 300
            //   6801000004           | push                0x4000001
            //   6800a40000           | push                0xa400
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     

        $sequence_1 = { 7410 68???????? 56 ff15???????? 8b4c2438 85cf }
            // n = 6, score = 200
            //   7410                 | je                  0x12
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4c2438             | mov                 ecx, dword ptr [esp + 0x38]
            //   85cf                 | test                edi, ecx

        $sequence_2 = { 6800800000 6a00 56 ff15???????? 8a44240e 84c0 751d }
            // n = 7, score = 200
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8a44240e             | mov                 al, byte ptr [esp + 0xe]
            //   84c0                 | test                al, al
            //   751d                 | jne                 0x1f

        $sequence_3 = { 83c410 8a44240e 84c0 752f 384508 742a f6c110 }
            // n = 7, score = 200
            //   83c410               | add                 esp, 0x10
            //   8a44240e             | mov                 al, byte ptr [esp + 0xe]
            //   84c0                 | test                al, al
            //   752f                 | jne                 0x31
            //   384508               | cmp                 byte ptr [ebp + 8], al
            //   742a                 | je                  0x2c
            //   f6c110               | test                cl, 0x10

        $sequence_4 = { 6a00 6a00 ff75ec ff75e8 }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff75e8               | push                dword ptr [ebp - 0x18]

        $sequence_5 = { 8b4c2438 f6c110 7410 68???????? 56 }
            // n = 5, score = 200
            //   8b4c2438             | mov                 ecx, dword ptr [esp + 0x38]
            //   f6c110               | test                cl, 0x10
            //   7410                 | je                  0x12
            //   68????????           |                     
            //   56                   | push                esi

        $sequence_6 = { ff15???????? 56 8ad8 ff15???????? 56 ff15???????? 5f }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   56                   | push                esi
            //   8ad8                 | mov                 bl, al
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5f                   | pop                 edi

        $sequence_7 = { 6a00 ff75f0 ff75f8 ff15???????? }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     

        $sequence_8 = { 8bce e8???????? 8b0d???????? 8b75ec 50 894dd8 8d45d8 }
            // n = 7, score = 200
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   894dd8               | mov                 dword ptr [ebp - 0x28], ecx
            //   8d45d8               | lea                 eax, dword ptr [ebp - 0x28]

        $sequence_9 = { 68???????? 6a00 68a7000000 6a01 e8???????? }
            // n = 5, score = 200
            //   68????????           |                     
            //   6a00                 | push                0
            //   68a7000000           | push                0xa7
            //   6a01                 | push                1
            //   e8????????           |                     

        $sequence_10 = { e8???????? 83c404 89442410 85c0 7413 53 8bd8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15
            //   53                   | push                ebx
            //   8bd8                 | mov                 ebx, eax

        $sequence_11 = { c645f200 8d4de8 e8???????? 8b55b4 8bd8 8b4dd4 }
            // n = 6, score = 100
            //   c645f200             | mov                 byte ptr [ebp - 0xe], 0
            //   8d4de8               | lea                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   8b55b4               | mov                 edx, dword ptr [ebp - 0x4c]
            //   8bd8                 | mov                 ebx, eax
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]

        $sequence_12 = { 8845d5 8b45b0 895db8 c745d801000000 8b0485e8d04100 8945d0 81f9e9fd0000 }
            // n = 7, score = 100
            //   8845d5               | mov                 byte ptr [ebp - 0x2b], al
            //   8b45b0               | mov                 eax, dword ptr [ebp - 0x50]
            //   895db8               | mov                 dword ptr [ebp - 0x48], ebx
            //   c745d801000000       | mov                 dword ptr [ebp - 0x28], 1
            //   8b0485e8d04100       | mov                 eax, dword ptr [eax*4 + 0x41d0e8]
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   81f9e9fd0000         | cmp                 ecx, 0xfde9

        $sequence_13 = { 5e 8bc3 c6041900 5b 8be5 5d }
            // n = 6, score = 100
            //   5e                   | pop                 esi
            //   8bc3                 | mov                 eax, ebx
            //   c6041900             | mov                 byte ptr [ecx + ebx], 0
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_14 = { 57 8d1c85e0ce4100 8b03 90 }
            // n = 4, score = 100
            //   57                   | push                edi
            //   8d1c85e0ce4100       | lea                 ebx, dword ptr [eax*4 + 0x41cee0]
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   90                   | nop                 

    condition:
        7 of them and filesize < 286720
}