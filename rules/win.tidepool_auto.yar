rule win_tidepool_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.tidepool."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tidepool"
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
        $sequence_0 = { 6a00 50 8b08 ff91a4000000 }
            // n = 4, score = 1000
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff91a4000000         | call                dword ptr [ecx + 0xa4]

        $sequence_1 = { 5e 5b 8b8d00030000 33cd e8???????? }
            // n = 5, score = 1000
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8b8d00030000         | mov                 ecx, dword ptr [ebp + 0x300]
            //   33cd                 | xor                 ecx, ebp
            //   e8????????           |                     

        $sequence_2 = { c20400 80790800 c701???????? 740e 8b4904 }
            // n = 5, score = 1000
            //   c20400               | ret                 4
            //   80790800             | cmp                 byte ptr [ecx + 8], 0
            //   c701????????         |                     
            //   740e                 | je                  0x10
            //   8b4904               | mov                 ecx, dword ptr [ecx + 4]

        $sequence_3 = { e8???????? 83c404 8bc6 5e c20400 80790800 }
            // n = 6, score = 1000
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   80790800             | cmp                 byte ptr [ecx + 8], 0

        $sequence_4 = { 6800000040 8d4500 50 ff15???????? }
            // n = 4, score = 900
            //   6800000040           | push                0x40000000
            //   8d4500               | lea                 eax, dword ptr [ebp]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_5 = { e8???????? 83c40c 803d????????37 7518 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   803d????????37       |                     
            //   7518                 | jne                 0x1a

        $sequence_6 = { 2bc8 83e906 51 83c006 }
            // n = 4, score = 900
            //   2bc8                 | sub                 ecx, eax
            //   83e906               | sub                 ecx, 6
            //   51                   | push                ecx
            //   83c006               | add                 eax, 6

        $sequence_7 = { 33db 53 6a02 8bf1 }
            // n = 4, score = 900
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx
            //   6a02                 | push                2
            //   8bf1                 | mov                 esi, ecx

        $sequence_8 = { 51 83c006 50 6a02 }
            // n = 4, score = 900
            //   51                   | push                ecx
            //   83c006               | add                 eax, 6
            //   50                   | push                eax
            //   6a02                 | push                2

        $sequence_9 = { 8b08 ff91a4000000 8b4654 6a01 50 }
            // n = 5, score = 800
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff91a4000000         | call                dword ptr [ecx + 0xa4]
            //   8b4654               | mov                 eax, dword ptr [esi + 0x54]
            //   6a01                 | push                1
            //   50                   | push                eax

        $sequence_10 = { 40 49 75f9 b8???????? b900000400 }
            // n = 5, score = 800
            //   40                   | inc                 eax
            //   49                   | dec                 ecx
            //   75f9                 | jne                 0xfffffffb
            //   b8????????           |                     
            //   b900000400           | mov                 ecx, 0x40000

        $sequence_11 = { 50 6802020000 ff15???????? 68???????? ff15???????? 8bf8 }
            // n = 6, score = 800
            //   50                   | push                eax
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_12 = { 6810270000 ff15???????? 8b45ec 8b08 }
            // n = 4, score = 800
            //   6810270000           | push                0x2710
            //   ff15????????         |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_13 = { 75f9 b8???????? b900000400 c60000 40 49 }
            // n = 6, score = 800
            //   75f9                 | jne                 0xfffffffb
            //   b8????????           |                     
            //   b900000400           | mov                 ecx, 0x40000
            //   c60000               | mov                 byte ptr [eax], 0
            //   40                   | inc                 eax
            //   49                   | dec                 ecx

        $sequence_14 = { 681f000200 56 68???????? 6801000080 }
            // n = 4, score = 800
            //   681f000200           | push                0x2001f
            //   56                   | push                esi
            //   68????????           |                     
            //   6801000080           | push                0x80000001

        $sequence_15 = { 8bf1 e8???????? 8b4654 6a00 }
            // n = 4, score = 800
            //   8bf1                 | mov                 esi, ecx
            //   e8????????           |                     
            //   8b4654               | mov                 eax, dword ptr [esi + 0x54]
            //   6a00                 | push                0

        $sequence_16 = { 7509 8b4654 50 8b08 ff5138 47 83ff14 }
            // n = 7, score = 800
            //   7509                 | jne                 0xb
            //   8b4654               | mov                 eax, dword ptr [esi + 0x54]
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5138               | call                dword ptr [ecx + 0x38]
            //   47                   | inc                 edi
            //   83ff14               | cmp                 edi, 0x14

        $sequence_17 = { 52 50 ff91d0000000 33ff 8b4654 }
            // n = 5, score = 800
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff91d0000000         | call                dword ptr [ecx + 0xd0]
            //   33ff                 | xor                 edi, edi
            //   8b4654               | mov                 eax, dword ptr [esi + 0x54]

        $sequence_18 = { e8???????? 68???????? 68???????? 68???????? 8d4500 }
            // n = 5, score = 800
            //   e8????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   8d4500               | lea                 eax, dword ptr [ebp]

        $sequence_19 = { e8???????? 68???????? 8d8500040000 50 }
            // n = 4, score = 600
            //   e8????????           |                     
            //   68????????           |                     
            //   8d8500040000         | lea                 eax, dword ptr [ebp + 0x400]
            //   50                   | push                eax

        $sequence_20 = { 83e103 c1e104 83e00f 0bc1 83f83f b910000000 be???????? }
            // n = 7, score = 600
            //   83e103               | and                 ecx, 3
            //   c1e104               | shl                 ecx, 4
            //   83e00f               | and                 eax, 0xf
            //   0bc1                 | or                  eax, ecx
            //   83f83f               | cmp                 eax, 0x3f
            //   b910000000           | mov                 ecx, 0x10
            //   be????????           |                     

        $sequence_21 = { ff75ec ff15???????? 8b35???????? 6a04 }
            // n = 4, score = 400
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   6a04                 | push                4

        $sequence_22 = { 57 56 c745f401000000 e8???????? 33db c7042400020000 }
            // n = 6, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   c745f401000000       | mov                 dword ptr [ebp - 0xc], 1
            //   e8????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   c7042400020000       | mov                 dword ptr [esp], 0x200

        $sequence_23 = { 8906 e8???????? 8b7d10 59 85c0 8907 7507 }
            // n = 7, score = 200
            //   8906                 | mov                 dword ptr [esi], eax
            //   e8????????           |                     
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   8907                 | mov                 dword ptr [edi], eax
            //   7507                 | jne                 9

        $sequence_24 = { ff75f8 ff75e4 ff75fc ff15???????? 85c0 }
            // n = 5, score = 200
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_25 = { 33d2 56 57 8955fc 8b7508 }
            // n = 5, score = 200
            //   33d2                 | xor                 edx, edx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_26 = { 50 ffd7 8d45e4 50 ffd7 8d45a4 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8d45a4               | lea                 eax, dword ptr [ebp - 0x5c]

        $sequence_27 = { 66ab 8b35???????? 6a64 ff35???????? 895dfc aa }
            // n = 6, score = 200
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   8b35????????         |                     
            //   6a64                 | push                0x64
            //   ff35????????         |                     
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   aa                   | stosb               byte ptr es:[edi], al

    condition:
        7 of them and filesize < 1998848
}