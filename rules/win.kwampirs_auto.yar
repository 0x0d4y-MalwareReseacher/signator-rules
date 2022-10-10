rule win_kwampirs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.kwampirs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kwampirs"
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
        $sequence_0 = { ba02000000 f7e2 0f90c1 53 56 57 }
            // n = 6, score = 800
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_1 = { 8b0f 51 e8???????? 83c418 85c0 7512 8b07 }
            // n = 7, score = 800
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_2 = { c745fcfeffffff e8???????? b001 8b4df0 }
            // n = 4, score = 800
            //   c745fcfeffffff       | mov                 dword ptr [ebp - 4], 0xfffffffe
            //   e8????????           |                     
            //   b001                 | mov                 al, 1
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]

        $sequence_3 = { 81ec580c0000 a1???????? 33c5 8945f8 8b4508 53 }
            // n = 6, score = 800
            //   81ec580c0000         | sub                 esp, 0xc58
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   53                   | push                ebx

        $sequence_4 = { e8???????? 83c418 85c0 7512 8b07 }
            // n = 5, score = 800
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_5 = { 391f 0f95c0 8b4df0 64890d00000000 }
            // n = 4, score = 800
            //   391f                 | cmp                 dword ptr [edi], ebx
            //   0f95c0               | setne               al
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx

        $sequence_6 = { 85c0 7512 8b07 50 e8???????? 83c404 891f }
            // n = 7, score = 800
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   891f                 | mov                 dword ptr [edi], ebx

        $sequence_7 = { 50 8d8dbcf3ffff 51 ff15???????? }
            // n = 4, score = 800
            //   50                   | push                eax
            //   8d8dbcf3ffff         | lea                 ecx, [ebp - 0xc44]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_8 = { 55 8bec 81ec580c0000 a1???????? 33c5 8945f8 }
            // n = 6, score = 800
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec580c0000         | sub                 esp, 0xc58
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_9 = { e8???????? b001 8b4df0 64890d00000000 59 5f }
            // n = 6, score = 800
            //   e8????????           |                     
            //   b001                 | mov                 al, 1
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 2695168
}