rule win_snatch_loader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.snatch_loader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.snatch_loader"
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
        $sequence_0 = { a1???????? 56 8bf1 85c0 751d }
            // n = 5, score = 600
            //   a1????????           |                     
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f

        $sequence_1 = { 8975fc 66397102 740b 42 }
            // n = 4, score = 600
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   66397102             | cmp                 word ptr [ecx + 2], si
            //   740b                 | je                  0xd
            //   42                   | inc                 edx

        $sequence_2 = { 33d2 85c9 5e 0f45c2 8be5 5d }
            // n = 6, score = 600
            //   33d2                 | xor                 edx, edx
            //   85c9                 | test                ecx, ecx
            //   5e                   | pop                 esi
            //   0f45c2               | cmovne              eax, edx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_3 = { 8d4dfc 51 53 53 56 ffd0 }
            // n = 6, score = 600
            //   8d4dfc               | lea                 ecx, [ebp - 4]
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ffd0                 | call                eax

        $sequence_4 = { 56 33f6 8bd9 57 85c0 7522 6a02 }
            // n = 7, score = 600
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   8bd9                 | mov                 ebx, ecx
            //   57                   | push                edi
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24
            //   6a02                 | push                2

        $sequence_5 = { 53 bb00040000 56 8bcb }
            // n = 4, score = 600
            //   53                   | push                ebx
            //   bb00040000           | mov                 ebx, 0x400
            //   56                   | push                esi
            //   8bcb                 | mov                 ecx, ebx

        $sequence_6 = { ffd0 85c0 8bce 0f457dfc }
            // n = 4, score = 600
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   8bce                 | mov                 ecx, esi
            //   0f457dfc             | cmovne              edi, dword ptr [ebp - 4]

        $sequence_7 = { 8bc8 e8???????? a3???????? 85c0 7505 8b7dfc eb04 }
            // n = 7, score = 600
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   eb04                 | jmp                 6

        $sequence_8 = { e8???????? 8945f8 0bc0 7440 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   0bc0                 | or                  eax, eax
            //   7440                 | je                  0x42

        $sequence_9 = { 57 56 8b36 56 8b33 33c0 }
            // n = 6, score = 500
            //   57                   | push                edi
            //   56                   | push                esi
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   56                   | push                esi
            //   8b33                 | mov                 esi, dword ptr [ebx]
            //   33c0                 | xor                 eax, eax

        $sequence_10 = { 3b45fc 773b 8b750c 8b7d10 037508 }
            // n = 5, score = 500
            //   3b45fc               | cmp                 eax, dword ptr [ebp - 4]
            //   773b                 | ja                  0x3d
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   037508               | add                 esi, dword ptr [ebp + 8]

        $sequence_11 = { 2b5df8 33d2 33c9 8a0431 0ac0 741f }
            // n = 6, score = 500
            //   2b5df8               | sub                 ebx, dword ptr [ebp - 8]
            //   33d2                 | xor                 edx, edx
            //   33c9                 | xor                 ecx, ecx
            //   8a0431               | mov                 al, byte ptr [ecx + esi]
            //   0ac0                 | or                  al, al
            //   741f                 | je                  0x21

        $sequence_12 = { 6a00 ff750c ff7508 6a00 6a00 e8???????? 8945fc }
            // n = 7, score = 500
            //   6a00                 | push                0
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_13 = { 0ac0 741f 3a0439 7514 }
            // n = 4, score = 500
            //   0ac0                 | or                  al, al
            //   741f                 | je                  0x21
            //   3a0439               | cmp                 al, byte ptr [ecx + edi]
            //   7514                 | jne                 0x16

        $sequence_14 = { 57 56 33db 6a04 6800300000 }
            // n = 5, score = 500
            //   57                   | push                edi
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   6a04                 | push                4
            //   6800300000           | push                0x3000

        $sequence_15 = { c9 c20c00 42 46 3bf3 76d8 }
            // n = 6, score = 500
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   42                   | inc                 edx
            //   46                   | inc                 esi
            //   3bf3                 | cmp                 esi, ebx
            //   76d8                 | jbe                 0xffffffda

    condition:
        7 of them and filesize < 262144
}