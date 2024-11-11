rule win_nightclub_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.nightclub."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nightclub"
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
        $sequence_0 = { 56 8b7508 8b06 8b5020 57 8bf9 8b1f }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8b5020               | mov                 edx, dword ptr [eax + 0x20]
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8b1f                 | mov                 ebx, dword ptr [edi]

        $sequence_1 = { e8???????? 85c0 0f854e150000 8b8fb0000000 8d8557fcffff 50 51 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f854e150000         | jne                 0x1554
            //   8b8fb0000000         | mov                 ecx, dword ptr [edi + 0xb0]
            //   8d8557fcffff         | lea                 eax, [ebp - 0x3a9]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_2 = { 3bd7 0f83f7000000 8b5104 85d2 740a 8bc8 2bca }
            // n = 7, score = 100
            //   3bd7                 | cmp                 edx, edi
            //   0f83f7000000         | jae                 0xfd
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   85d2                 | test                edx, edx
            //   740a                 | je                  0xc
            //   8bc8                 | mov                 ecx, eax
            //   2bca                 | sub                 ecx, edx

        $sequence_3 = { ff15???????? 8b95ccfbffff 52 ffd3 8b85d0fbffff 50 ffd3 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b95ccfbffff         | mov                 edx, dword ptr [ebp - 0x434]
            //   52                   | push                edx
            //   ffd3                 | call                ebx
            //   8b85d0fbffff         | mov                 eax, dword ptr [ebp - 0x430]
            //   50                   | push                eax
            //   ffd3                 | call                ebx

        $sequence_4 = { 890a 8b10 8b4804 50 894a04 ffd7 8b450c }
            // n = 7, score = 100
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   50                   | push                eax
            //   894a04               | mov                 dword ptr [edx + 4], ecx
            //   ffd7                 | call                edi
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_5 = { 50 8d4de0 51 e8???????? 8b55e4 52 ffd7 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   52                   | push                edx
            //   ffd7                 | call                edi

        $sequence_6 = { 3b410c 7206 33c0 5d c20400 c6410401 8b4908 }
            // n = 7, score = 100
            //   3b410c               | cmp                 eax, dword ptr [ecx + 0xc]
            //   7206                 | jb                  8
            //   33c0                 | xor                 eax, eax
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   c6410401             | mov                 byte ptr [ecx + 4], 1
            //   8b4908               | mov                 ecx, dword ptr [ecx + 8]

        $sequence_7 = { 7415 8bff 85c0 7409 8b5510 668b12 668910 }
            // n = 7, score = 100
            //   7415                 | je                  0x17
            //   8bff                 | mov                 edi, edi
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   668b12               | mov                 dx, word ptr [edx]
            //   668910               | mov                 word ptr [eax], dx

        $sequence_8 = { 8d45f3 33f6 8975fc 50 8975e0 68???????? 8d4dcc }
            // n = 7, score = 100
            //   8d45f3               | lea                 eax, [ebp - 0xd]
            //   33f6                 | xor                 esi, esi
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   50                   | push                eax
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   68????????           |                     
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]

        $sequence_9 = { 72e6 b892010000 5f 5e 8b4df8 33cd e8???????? }
            // n = 7, score = 100
            //   72e6                 | jb                  0xffffffe8
            //   b892010000           | mov                 eax, 0x192
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   33cd                 | xor                 ecx, ebp
            //   e8????????           |                     

    condition:
        7 of them and filesize < 247808
}