rule win_darkshell_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.darkshell."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkshell"
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
        $sequence_0 = { 8b55f8 85d2 7412 8b4638 03d1 }
            // n = 5, score = 300
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   85d2                 | test                edx, edx
            //   7412                 | je                  0x14
            //   8b4638               | mov                 eax, dword ptr [esi + 0x38]
            //   03d1                 | add                 edx, ecx

        $sequence_1 = { b801000000 c3 33c0 c3 8b442404 6681384d5a }
            // n = 6, score = 300
            //   b801000000           | mov                 eax, 1
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   6681384d5a           | cmp                 word ptr [eax], 0x5a4d

        $sequence_2 = { 52 684be12200 50 ff15???????? 85c0 7410 ff15???????? }
            // n = 7, score = 300
            //   52                   | push                edx
            //   684be12200           | push                0x22e14b
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7410                 | je                  0x12
            //   ff15????????         |                     

        $sequence_3 = { 3bcb 721a 8d54241c 89442414 52 }
            // n = 5, score = 300
            //   3bcb                 | cmp                 ecx, ebx
            //   721a                 | jb                  0x1c
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   52                   | push                edx

        $sequence_4 = { 81c4f4030000 c3 33c0 5e }
            // n = 4, score = 300
            //   81c4f4030000         | add                 esp, 0x3f4
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi

        $sequence_5 = { 50 ff15???????? 8b96a4000000 8b9c249c000000 8b07 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b96a4000000         | mov                 edx, dword ptr [esi + 0xa4]
            //   8b9c249c000000       | mov                 ebx, dword ptr [esp + 0x9c]
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_6 = { 8b511c 5d 2bc2 5b 83c410 }
            // n = 5, score = 300
            //   8b511c               | mov                 edx, dword ptr [ecx + 0x1c]
            //   5d                   | pop                 ebp
            //   2bc2                 | sub                 eax, edx
            //   5b                   | pop                 ebx
            //   83c410               | add                 esp, 0x10

        $sequence_7 = { 83c40c 8b503c 03c2 8907 05f8000000 }
            // n = 5, score = 300
            //   83c40c               | add                 esp, 0xc
            //   8b503c               | mov                 edx, dword ptr [eax + 0x3c]
            //   03c2                 | add                 eax, edx
            //   8907                 | mov                 dword ptr [edi], eax
            //   05f8000000           | add                 eax, 0xf8

        $sequence_8 = { 8b5138 52 50 eb11 8b07 8b5038 }
            // n = 6, score = 300
            //   8b5138               | mov                 edx, dword ptr [ecx + 0x38]
            //   52                   | push                edx
            //   50                   | push                eax
            //   eb11                 | jmp                 0x13
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8b5038               | mov                 edx, dword ptr [eax + 0x38]

        $sequence_9 = { 767a 668b07 8bc8 81e100f00000 6681f90030 752f 8b4c2410 }
            // n = 7, score = 300
            //   767a                 | jbe                 0x7c
            //   668b07               | mov                 ax, word ptr [edi]
            //   8bc8                 | mov                 ecx, eax
            //   81e100f00000         | and                 ecx, 0xf000
            //   6681f90030           | cmp                 cx, 0x3000
            //   752f                 | jne                 0x31
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]

    condition:
        7 of them and filesize < 344064
}