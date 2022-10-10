rule win_buzus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.buzus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buzus"
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
        $sequence_0 = { 68???????? ffd7 85c0 0f84a0090000 ff36 68???????? }
            // n = 6, score = 100
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   0f84a0090000         | je                  0x9a6
            //   ff36                 | push                dword ptr [esi]
            //   68????????           |                     

        $sequence_1 = { 8b85b0feffff 8a00 3a05???????? 7564 8b5d0c 8b4d10 }
            // n = 6, score = 100
            //   8b85b0feffff         | mov                 eax, dword ptr [ebp - 0x150]
            //   8a00                 | mov                 al, byte ptr [eax]
            //   3a05????????         |                     
            //   7564                 | jne                 0x66
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]

        $sequence_2 = { 57 8d45fc 53 8b35???????? 50 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   53                   | push                ebx
            //   8b35????????         |                     
            //   50                   | push                eax

        $sequence_3 = { ff15???????? 83f80a 0f8eaa050000 80bd9defffff00 0f859d050000 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   83f80a               | cmp                 eax, 0xa
            //   0f8eaa050000         | jle                 0x5b0
            //   80bd9defffff00       | cmp                 byte ptr [ebp - 0x1063], 0
            //   0f859d050000         | jne                 0x5a3

        $sequence_4 = { 8d85fcfeffff 50 6804010000 ff7508 ff15???????? 83c40c }
            // n = 6, score = 100
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { 59 59 0fbe4d6f 3bcf 7cdd e9???????? 895ddc }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   0fbe4d6f             | movsx               ecx, byte ptr [ebp + 0x6f]
            //   3bcf                 | cmp                 ecx, edi
            //   7cdd                 | jl                  0xffffffdf
            //   e9????????           |                     
            //   895ddc               | mov                 dword ptr [ebp - 0x24], ebx

        $sequence_6 = { 8b7c2418 bd???????? 894c2410 55 57 ffd3 8bf0 }
            // n = 7, score = 100
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   bd????????           |                     
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx
            //   55                   | push                ebp
            //   57                   | push                edi
            //   ffd3                 | call                ebx
            //   8bf0                 | mov                 esi, eax

        $sequence_7 = { 8dbd14ffffff f3a5 6a01 8b35???????? 5f }
            // n = 5, score = 100
            //   8dbd14ffffff         | lea                 edi, [ebp - 0xec]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   6a01                 | push                1
            //   8b35????????         |                     
            //   5f                   | pop                 edi

        $sequence_8 = { 59 85c0 59 747e 6a02 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   747e                 | je                  0x80
            //   6a02                 | push                2

        $sequence_9 = { 68???????? 33ff 8975f0 8975f4 8975f8 ff15???????? 85c0 }
            // n = 7, score = 100
            //   68????????           |                     
            //   33ff                 | xor                 edi, edi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 679936
}