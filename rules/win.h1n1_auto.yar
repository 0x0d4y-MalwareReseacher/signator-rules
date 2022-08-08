rule win_h1n1_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.h1n1."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.h1n1"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 33c0 2d8b8c9a8d ab 3546414b16 ab }
            // n = 5, score = 400
            //   33c0                 | xor                 eax, eax
            //   2d8b8c9a8d           | sub                 eax, 0x8d9a8c8b
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   3546414b16           | xor                 eax, 0x164b4146
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_1 = { 03d5 8b5a20 03dd 33c9 57 }
            // n = 5, score = 400
            //   03d5                 | add                 edx, ebp
            //   8b5a20               | mov                 ebx, dword ptr [edx + 0x20]
            //   03dd                 | add                 ebx, ebp
            //   33c9                 | xor                 ecx, ecx
            //   57                   | push                edi

        $sequence_2 = { 58 ffd0 58 0bc0 }
            // n = 4, score = 400
            //   58                   | pop                 eax
            //   ffd0                 | call                eax
            //   58                   | pop                 eax
            //   0bc0                 | or                  eax, eax

        $sequence_3 = { 58 ffd0 0bc0 7446 8b00 3d00200000 7307 }
            // n = 7, score = 400
            //   58                   | pop                 eax
            //   ffd0                 | call                eax
            //   0bc0                 | or                  eax, eax
            //   7446                 | je                  0x48
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   3d00200000           | cmp                 eax, 0x2000
            //   7307                 | jae                 9

        $sequence_4 = { 83bdecfeffff01 7505 bb07000000 93 5b c9 }
            // n = 6, score = 400
            //   83bdecfeffff01       | cmp                 dword ptr [ebp - 0x114], 1
            //   7505                 | jne                 7
            //   bb07000000           | mov                 ebx, 7
            //   93                   | xchg                eax, ebx
            //   5b                   | pop                 ebx
            //   c9                   | leave               

        $sequence_5 = { 0bc0 0f8496000000 68???????? ff35???????? 58 ffd0 }
            // n = 6, score = 400
            //   0bc0                 | or                  eax, eax
            //   0f8496000000         | je                  0x9c
            //   68????????           |                     
            //   ff35????????         |                     
            //   58                   | pop                 eax
            //   ffd0                 | call                eax

        $sequence_6 = { 52 57 51 8b7df4 }
            // n = 4, score = 400
            //   52                   | push                edx
            //   57                   | push                edi
            //   51                   | push                ecx
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]

        $sequence_7 = { 0f8406020000 6a00 6a00 6a00 683f000f00 }
            // n = 5, score = 400
            //   0f8406020000         | je                  0x20c
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   683f000f00           | push                0xf003f

        $sequence_8 = { e8???????? 68f8020000 6800800010 56 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   68f8020000           | push                0x2f8
            //   6800800010           | push                0x10008000
            //   56                   | push                esi

        $sequence_9 = { 57 ff750c 33db 68d0600010 6880000000 50 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   33db                 | xor                 ebx, ebx
            //   68d0600010           | push                0x100060d0
            //   6880000000           | push                0x80
            //   50                   | push                eax

        $sequence_10 = { 42 b9c0850010 8b01 c1e81e 3301 }
            // n = 5, score = 100
            //   42                   | inc                 edx
            //   b9c0850010           | mov                 ecx, 0x100085c0
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   c1e81e               | shr                 eax, 0x1e
            //   3301                 | xor                 eax, dword ptr [ecx]

        $sequence_11 = { 8d842460050000 57 50 e8???????? 68f4600010 }
            // n = 5, score = 100
            //   8d842460050000       | lea                 eax, [esp + 0x560]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   68f4600010           | push                0x100060f4

        $sequence_12 = { 42 890c95bc850010 81fae3000000 7cc4 81fa6f020000 7d35 57 }
            // n = 7, score = 100
            //   42                   | inc                 edx
            //   890c95bc850010       | mov                 dword ptr [edx*4 + 0x100085bc], ecx
            //   81fae3000000         | cmp                 edx, 0xe3
            //   7cc4                 | jl                  0xffffffc6
            //   81fa6f020000         | cmp                 edx, 0x26f
            //   7d35                 | jge                 0x37
            //   57                   | push                edi

        $sequence_13 = { 330c8500850010 330d???????? 890d???????? 8b0cb5c0850010 8bc1 }
            // n = 5, score = 100
            //   330c8500850010       | xor                 ecx, dword ptr [eax*4 + 0x10008500]
            //   330d????????         |                     
            //   890d????????         |                     
            //   8b0cb5c0850010       | mov                 ecx, dword ptr [esi*4 + 0x100085c0]
            //   8bc1                 | mov                 eax, ecx

        $sequence_14 = { 85ff 7440 56 8bf3 6a04 8d8614850010 }
            // n = 6, score = 100
            //   85ff                 | test                edi, edi
            //   7440                 | je                  0x42
            //   56                   | push                esi
            //   8bf3                 | mov                 esi, ebx
            //   6a04                 | push                4
            //   8d8614850010         | lea                 eax, [esi + 0x10008514]

        $sequence_15 = { b8606e0010 0f44c1 50 ff742434 ff15???????? 8bf0 85f6 }
            // n = 7, score = 100
            //   b8606e0010           | mov                 eax, 0x10006e60
            //   0f44c1               | cmove               eax, ecx
            //   50                   | push                eax
            //   ff742434             | push                dword ptr [esp + 0x34]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

    condition:
        7 of them and filesize < 172032
}