rule win_wipbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.wipbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wipbot"
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
        $sequence_0 = { 8d4c2430 4c 8d442440 baff0f1f00 48 }
            // n = 5, score = 100
            //   8d4c2430             | lea                 ecx, [esp + 0x30]
            //   4c                   | dec                 esp
            //   8d442440             | lea                 eax, [esp + 0x40]
            //   baff0f1f00           | mov                 edx, 0x1f0fff
            //   48                   | dec                 eax

        $sequence_1 = { e8???????? 89f0 48 83c438 5b 5e 5f }
            // n = 7, score = 100
            //   e8????????           |                     
            //   89f0                 | mov                 eax, esi
            //   48                   | dec                 eax
            //   83c438               | add                 esp, 0x38
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_2 = { 29d4 eb70 45 8b6a04 4d 8d5a08 }
            // n = 6, score = 100
            //   29d4                 | sub                 esp, edx
            //   eb70                 | jmp                 0x72
            //   45                   | inc                 ebp
            //   8b6a04               | mov                 ebp, dword ptr [edx + 4]
            //   4d                   | dec                 ebp
            //   8d5a08               | lea                 ebx, [edx + 8]

        $sequence_3 = { 8b742454 44 8b5c2450 44 8b4c244c b911000000 31c0 }
            // n = 7, score = 100
            //   8b742454             | mov                 esi, dword ptr [esp + 0x54]
            //   44                   | inc                 esp
            //   8b5c2450             | mov                 ebx, dword ptr [esp + 0x50]
            //   44                   | inc                 esp
            //   8b4c244c             | mov                 ecx, dword ptr [esp + 0x4c]
            //   b911000000           | mov                 ecx, 0x11
            //   31c0                 | xor                 eax, eax

        $sequence_4 = { 53 81ec8c060000 e8???????? 85c0 0f84fb030000 8d9dd0f9ffff c744240804010000 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   81ec8c060000         | sub                 esp, 0x68c
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84fb030000         | je                  0x401
            //   8d9dd0f9ffff         | lea                 ebx, [ebp - 0x630]
            //   c744240804010000     | mov                 dword ptr [esp + 8], 0x104

        $sequence_5 = { 83ec28 48 85c9 48 89cb 7504 31c0 }
            // n = 7, score = 100
            //   83ec28               | sub                 esp, 0x28
            //   48                   | dec                 eax
            //   85c9                 | test                ecx, ecx
            //   48                   | dec                 eax
            //   89cb                 | mov                 ebx, ecx
            //   7504                 | jne                 6
            //   31c0                 | xor                 eax, eax

        $sequence_6 = { eb7d 48 894c2438 e8???????? 01c0 ba9ad65fb0 b98a758b1f }
            // n = 7, score = 100
            //   eb7d                 | jmp                 0x7f
            //   48                   | dec                 eax
            //   894c2438             | mov                 dword ptr [esp + 0x38], ecx
            //   e8????????           |                     
            //   01c0                 | add                 eax, eax
            //   ba9ad65fb0           | mov                 edx, 0xb05fd69a
            //   b98a758b1f           | mov                 ecx, 0x1f8b758a

        $sequence_7 = { eb58 85d2 89d0 74f6 8955f4 31d2 }
            // n = 6, score = 100
            //   eb58                 | jmp                 0x5a
            //   85d2                 | test                edx, edx
            //   89d0                 | mov                 eax, edx
            //   74f6                 | je                  0xfffffff8
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   31d2                 | xor                 edx, edx

        $sequence_8 = { 8d442468 48 8d4c246c c744242000000000 c744246800000000 }
            // n = 5, score = 100
            //   8d442468             | lea                 eax, [esp + 0x68]
            //   48                   | dec                 eax
            //   8d4c246c             | lea                 ecx, [esp + 0x6c]
            //   c744242000000000     | mov                 dword ptr [esp + 0x20], 0
            //   c744246800000000     | mov                 dword ptr [esp + 0x68], 0

        $sequence_9 = { 72f4 ebc8 8b5308 89f0 e8???????? 31c0 eb32 }
            // n = 7, score = 100
            //   72f4                 | jb                  0xfffffff6
            //   ebc8                 | jmp                 0xffffffca
            //   8b5308               | mov                 edx, dword ptr [ebx + 8]
            //   89f0                 | mov                 eax, esi
            //   e8????????           |                     
            //   31c0                 | xor                 eax, eax
            //   eb32                 | jmp                 0x34

    condition:
        7 of them and filesize < 253952
}