rule win_moonwind_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.moonwind."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moonwind"
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
        $sequence_0 = { dd8568ffffff e8???????? 8945e8 e9???????? 8b5d08 8b1b 83c374 }
            // n = 7, score = 100
            //   dd8568ffffff         | fld                 qword ptr [ebp - 0x98]
            //   e8????????           |                     
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   e9????????           |                     
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8b1b                 | mov                 ebx, dword ptr [ebx]
            //   83c374               | add                 ebx, 0x74

        $sequence_1 = { ffd6 85c0 0f84b5120000 8b8424f0010000 2bc3 0f8411080000 48 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   0f84b5120000         | je                  0x12bb
            //   8b8424f0010000       | mov                 eax, dword ptr [esp + 0x1f0]
            //   2bc3                 | sub                 eax, ebx
            //   0f8411080000         | je                  0x817
            //   48                   | dec                 eax

        $sequence_2 = { 8b5df8 833b02 0f8405000000 e9???????? 8b5dfc 83c304 895df8 }
            // n = 7, score = 100
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   833b02               | cmp                 dword ptr [ebx], 2
            //   0f8405000000         | je                  0xb
            //   e9????????           |                     
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   83c304               | add                 ebx, 4
            //   895df8               | mov                 dword ptr [ebp - 8], ebx

        $sequence_3 = { 894c2454 75e4 8b442458 8b4c2444 8b542448 894c2424 85c0 }
            // n = 7, score = 100
            //   894c2454             | mov                 dword ptr [esp + 0x54], ecx
            //   75e4                 | jne                 0xffffffe6
            //   8b442458             | mov                 eax, dword ptr [esp + 0x58]
            //   8b4c2444             | mov                 ecx, dword ptr [esp + 0x44]
            //   8b542448             | mov                 edx, dword ptr [esp + 0x48]
            //   894c2424             | mov                 dword ptr [esp + 0x24], ecx
            //   85c0                 | test                eax, eax

        $sequence_4 = { 7508 33c0 8bfb f3ab eb06 8b30 }
            // n = 6, score = 100
            //   7508                 | jne                 0xa
            //   33c0                 | xor                 eax, eax
            //   8bfb                 | mov                 edi, ebx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   eb06                 | jmp                 8
            //   8b30                 | mov                 esi, dword ptr [eax]

        $sequence_5 = { db45f0 dd5dd4 dc65d4 dd5dcc dd45cc e8???????? 6801030080 }
            // n = 7, score = 100
            //   db45f0               | fild                dword ptr [ebp - 0x10]
            //   dd5dd4               | fstp                qword ptr [ebp - 0x2c]
            //   dc65d4               | fsub                qword ptr [ebp - 0x2c]
            //   dd5dcc               | fstp                qword ptr [ebp - 0x34]
            //   dd45cc               | fld                 qword ptr [ebp - 0x34]
            //   e8????????           |                     
            //   6801030080           | push                0x80000301

        $sequence_6 = { 8b442418 33d2 b914000000 e8???????? 5e 81c4d4000000 c20400 }
            // n = 7, score = 100
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   33d2                 | xor                 edx, edx
            //   b914000000           | mov                 ecx, 0x14
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   81c4d4000000         | add                 esp, 0xd4
            //   c20400               | ret                 4

        $sequence_7 = { 8b4c242c 50 51 8d442420 52 50 e8???????? }
            // n = 7, score = 100
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 6a00 6a00 56 53 ffd5 8b4c242c b801000000 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   53                   | push                ebx
            //   ffd5                 | call                ebp
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   b801000000           | mov                 eax, 1

        $sequence_9 = { 8d442444 52 50 55 56 e8???????? 8b4c2434 }
            // n = 7, score = 100
            //   8d442444             | lea                 eax, [esp + 0x44]
            //   52                   | push                edx
            //   50                   | push                eax
            //   55                   | push                ebp
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b4c2434             | mov                 ecx, dword ptr [esp + 0x34]

    condition:
        7 of them and filesize < 1417216
}