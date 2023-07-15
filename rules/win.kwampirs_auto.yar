rule win_kwampirs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.kwampirs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kwampirs"
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
        $sequence_0 = { 7512 8b07 50 e8???????? 83c404 891f }
            // n = 6, score = 800
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   891f                 | mov                 dword ptr [edi], ebx

        $sequence_1 = { b827000000 ba02000000 f7e2 0f90c1 f7d9 0bc8 }
            // n = 6, score = 800
            //   b827000000           | mov                 eax, 0x27
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl
            //   f7d9                 | neg                 ecx
            //   0bc8                 | or                  ecx, eax

        $sequence_2 = { b827000000 ba02000000 f7e2 0f90c1 }
            // n = 4, score = 800
            //   b827000000           | mov                 eax, 0x27
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl

        $sequence_3 = { 8bc3 d1e8 33c9 40 ba02000000 }
            // n = 5, score = 800
            //   8bc3                 | mov                 eax, ebx
            //   d1e8                 | shr                 eax, 1
            //   33c9                 | xor                 ecx, ecx
            //   40                   | inc                 eax
            //   ba02000000           | mov                 edx, 2

        $sequence_4 = { 81ec580c0000 a1???????? 33c5 8945f8 8b4508 53 }
            // n = 6, score = 800
            //   81ec580c0000         | sub                 esp, 0xc58
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   53                   | push                ebx

        $sequence_5 = { 83c418 85c0 7512 8b07 50 e8???????? 83c404 }
            // n = 7, score = 800
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_6 = { 50 ffd6 8b4dc4 51 ffd6 }
            // n = 5, score = 800
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b4dc4               | mov                 ecx, dword ptr [ebp - 0x3c]
            //   51                   | push                ecx
            //   ffd6                 | call                esi

        $sequence_7 = { 83c230 668955f4 33d2 668955f6 e8???????? }
            // n = 5, score = 800
            //   83c230               | add                 edx, 0x30
            //   668955f4             | mov                 word ptr [ebp - 0xc], dx
            //   33d2                 | xor                 edx, edx
            //   668955f6             | mov                 word ptr [ebp - 0xa], dx
            //   e8????????           |                     

        $sequence_8 = { 64a300000000 8965e8 8bf9 33db 3bfb }
            // n = 5, score = 800
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8965e8               | mov                 dword ptr [ebp - 0x18], esp
            //   8bf9                 | mov                 edi, ecx
            //   33db                 | xor                 ebx, ebx
            //   3bfb                 | cmp                 edi, ebx

        $sequence_9 = { 56 8b0f 51 e8???????? 83c418 85c0 7512 }
            // n = 7, score = 800
            //   56                   | push                esi
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14

    condition:
        7 of them and filesize < 2695168
}