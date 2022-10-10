rule win_blackenergy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.blackenergy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackenergy"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 6a00 6a01 ff36 8d4604 50 6a07 6a01 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   ff36                 | push                dword ptr [esi]
            //   8d4604               | lea                 eax, [esi + 4]
            //   50                   | push                eax
            //   6a07                 | push                7
            //   6a01                 | push                1

        $sequence_1 = { 83c704 bb01000000 eb02 03d8 8bc2 e9???????? 8bd0 }
            // n = 7, score = 200
            //   83c704               | add                 edi, 4
            //   bb01000000           | mov                 ebx, 1
            //   eb02                 | jmp                 4
            //   03d8                 | add                 ebx, eax
            //   8bc2                 | mov                 eax, edx
            //   e9????????           |                     
            //   8bd0                 | mov                 edx, eax

        $sequence_2 = { 56 57 8bbc1880000000 03fb eb64 }
            // n = 5, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bbc1880000000       | mov                 edi, dword ptr [eax + ebx + 0x80]
            //   03fb                 | add                 edi, ebx
            //   eb64                 | jmp                 0x66

        $sequence_3 = { 6bc028 53 8b5c08e4 03da 8b4408e0 }
            // n = 5, score = 200
            //   6bc028               | imul                eax, eax, 0x28
            //   53                   | push                ebx
            //   8b5c08e4             | mov                 ebx, dword ptr [eax + ecx - 0x1c]
            //   03da                 | add                 ebx, edx
            //   8b4408e0             | mov                 eax, dword ptr [eax + ecx - 0x20]

        $sequence_4 = { 689a05052d 46 6a02 895de8 8975e4 e8???????? 8d4de4 }
            // n = 7, score = 200
            //   689a05052d           | push                0x2d05059a
            //   46                   | inc                 esi
            //   6a02                 | push                2
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   e8????????           |                     
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]

        $sequence_5 = { e8???????? 8b7510 50 6a40 8906 ff15???????? 8bf8 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   8906                 | mov                 dword ptr [esi], eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_6 = { 83ec3c 8365fc00 8365f800 8d45f8 50 ff750c }
            // n = 6, score = 200
            //   83ec3c               | sub                 esp, 0x3c
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   8365f800             | and                 dword ptr [ebp - 8], 0
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_7 = { ff15???????? 5e 5b a3???????? 57 85c0 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   a3????????           |                     
            //   57                   | push                edi
            //   85c0                 | test                eax, eax

        $sequence_8 = { 57 ffd6 eb1b 0fb6c9 }
            // n = 4, score = 200
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   eb1b                 | jmp                 0x1d
            //   0fb6c9               | movzx               ecx, cl

        $sequence_9 = { 51 68???????? 50 ff15???????? 83c410 5f c9 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   5f                   | pop                 edi
            //   c9                   | leave               

    condition:
        7 of them and filesize < 98304
}