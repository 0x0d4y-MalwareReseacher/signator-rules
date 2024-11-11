rule win_unidentified_031_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.unidentified_031."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_031"
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
        $sequence_0 = { 7403 50 ffd7 ff36 ffd7 5f 832600 }
            // n = 7, score = 100
            //   7403                 | je                  5
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   ff36                 | push                dword ptr [esi]
            //   ffd7                 | call                edi
            //   5f                   | pop                 edi
            //   832600               | and                 dword ptr [esi], 0

        $sequence_1 = { 8b45ec 0504020000 50 ffd6 6a6b e8???????? 50 }
            // n = 7, score = 100
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   0504020000           | add                 eax, 0x204
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   6a6b                 | push                0x6b
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_2 = { 8bf8 83c410 85ff 0f84b2000000 85db 0f84a6000000 ff742414 }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   83c410               | add                 esp, 0x10
            //   85ff                 | test                edi, edi
            //   0f84b2000000         | je                  0xb8
            //   85db                 | test                ebx, ebx
            //   0f84a6000000         | je                  0xac
            //   ff742414             | push                dword ptr [esp + 0x14]

        $sequence_3 = { 8b13 83c410 52 68???????? ff15???????? 8bd0 8d4dc4 }
            // n = 7, score = 100
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   83c410               | add                 esp, 0x10
            //   52                   | push                edx
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax
            //   8d4dc4               | lea                 ecx, [ebp - 0x3c]

        $sequence_4 = { 51 6808200000 ff15???????? 8985fcfeffff 8d95fcfeffff 8d45cc 52 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   6808200000           | push                0x2008
            //   ff15????????         |                     
            //   8985fcfeffff         | mov                 dword ptr [ebp - 0x104], eax
            //   8d95fcfeffff         | lea                 edx, [ebp - 0x104]
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   52                   | push                edx

        $sequence_5 = { 6805e9e3a9 6a05 8b0401 8b4dcc 50 8b45d0 51 }
            // n = 7, score = 100
            //   6805e9e3a9           | push                0xa9e3e905
            //   6a05                 | push                5
            //   8b0401               | mov                 eax, dword ptr [ecx + eax]
            //   8b4dcc               | mov                 ecx, dword ptr [ebp - 0x34]
            //   50                   | push                eax
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   51                   | push                ecx

        $sequence_6 = { ff75e0 ff15???????? 59 59 85c0 0f8505010000 ff75e0 }
            // n = 7, score = 100
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   0f8505010000         | jne                 0x10b
            //   ff75e0               | push                dword ptr [ebp - 0x20]

        $sequence_7 = { 2bf8 83ff40 0f87a0000000 8b8d74ffffff 8d4701 50 8b8570ffffff }
            // n = 7, score = 100
            //   2bf8                 | sub                 edi, eax
            //   83ff40               | cmp                 edi, 0x40
            //   0f87a0000000         | ja                  0xa6
            //   8b8d74ffffff         | mov                 ecx, dword ptr [ebp - 0x8c]
            //   8d4701               | lea                 eax, [edi + 1]
            //   50                   | push                eax
            //   8b8570ffffff         | mov                 eax, dword ptr [ebp - 0x90]

        $sequence_8 = { 898dd0fdffff 52 8d8d08ffffff 50 51 899dd8fdffff 899dc8fdffff }
            // n = 7, score = 100
            //   898dd0fdffff         | mov                 dword ptr [ebp - 0x230], ecx
            //   52                   | push                edx
            //   8d8d08ffffff         | lea                 ecx, [ebp - 0xf8]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   899dd8fdffff         | mov                 dword ptr [ebp - 0x228], ebx
            //   899dc8fdffff         | mov                 dword ptr [ebp - 0x238], ebx

        $sequence_9 = { 74a3 837dd400 755d ff75d0 8b45cc 8b4de4 ff75d8 }
            // n = 7, score = 100
            //   74a3                 | je                  0xffffffa5
            //   837dd400             | cmp                 dword ptr [ebp - 0x2c], 0
            //   755d                 | jne                 0x5f
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   ff75d8               | push                dword ptr [ebp - 0x28]

    condition:
        7 of them and filesize < 1998848
}