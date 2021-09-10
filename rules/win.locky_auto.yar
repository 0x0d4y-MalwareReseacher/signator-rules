rule win_locky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.locky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.locky"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 3b0d???????? 7505 e8???????? 6bf61c }
            // n = 4, score = 2100
            //   3b0d????????         |                     
            //   7505                 | jne                 7
            //   e8????????           |                     
            //   6bf61c               | imul                esi, esi, 0x1c

        $sequence_1 = { 8d45d4 6880000000 50 ff15???????? }
            // n = 4, score = 2100
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]
            //   6880000000           | push                0x80
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { 72ef 8bfb 8975fc eb1b 8b461c }
            // n = 5, score = 2100
            //   72ef                 | jb                  0xfffffff1
            //   8bfb                 | mov                 edi, ebx
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   eb1b                 | jmp                 0x1d
            //   8b461c               | mov                 eax, dword ptr [esi + 0x1c]

        $sequence_3 = { 32db 50 ff15???????? 8ac3 5b }
            // n = 5, score = 2100
            //   32db                 | xor                 bl, bl
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8ac3                 | mov                 al, bl
            //   5b                   | pop                 ebx

        $sequence_4 = { 72ed 3b5d10 7314 8b4e1c 8b431c 3bc8 7c0a }
            // n = 7, score = 2100
            //   72ed                 | jb                  0xffffffef
            //   3b5d10               | cmp                 ebx, dword ptr [ebp + 0x10]
            //   7314                 | jae                 0x16
            //   8b4e1c               | mov                 ecx, dword ptr [esi + 0x1c]
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]
            //   3bc8                 | cmp                 ecx, eax
            //   7c0a                 | jl                  0xc

        $sequence_5 = { 3b05???????? 751e 68???????? 8d45ec }
            // n = 4, score = 2100
            //   3b05????????         |                     
            //   751e                 | jne                 0x20
            //   68????????           |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]

        $sequence_6 = { 6a1c 99 5b f7fb 8bd8 85c9 }
            // n = 6, score = 2100
            //   6a1c                 | push                0x1c
            //   99                   | cdq                 
            //   5b                   | pop                 ebx
            //   f7fb                 | idiv                ebx
            //   8bd8                 | mov                 ebx, eax
            //   85c9                 | test                ecx, ecx

        $sequence_7 = { 8bc6 c3 8b00 85c0 7409 }
            // n = 5, score = 2100
            //   8bc6                 | mov                 eax, esi
            //   c3                   | ret                 
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb

        $sequence_8 = { 03d3 5b c21000 e9???????? 8bff }
            // n = 5, score = 1400
            //   03d3                 | add                 edx, ebx
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   e9????????           |                     
            //   8bff                 | mov                 edi, edi

        $sequence_9 = { 50 90 e9???????? 90 53 90 }
            // n = 6, score = 700
            //   50                   | push                eax
            //   90                   | nop                 
            //   e9????????           |                     
            //   90                   | nop                 
            //   53                   | push                ebx
            //   90                   | nop                 

        $sequence_10 = { 51 e9???????? 90 8d3f }
            // n = 4, score = 700
            //   51                   | push                ecx
            //   e9????????           |                     
            //   90                   | nop                 
            //   8d3f                 | lea                 edi, dword ptr [edi]

        $sequence_11 = { 50 90 e9???????? 8d3f 90 e9???????? }
            // n = 6, score = 700
            //   50                   | push                eax
            //   90                   | nop                 
            //   e9????????           |                     
            //   8d3f                 | lea                 edi, dword ptr [edi]
            //   90                   | nop                 
            //   e9????????           |                     

        $sequence_12 = { 55 e9???????? 8d6d00 90 }
            // n = 4, score = 700
            //   55                   | push                ebp
            //   e9????????           |                     
            //   8d6d00               | lea                 ebp, dword ptr [ebp]
            //   90                   | nop                 

        $sequence_13 = { 58 e9???????? 8d36 e9???????? }
            // n = 4, score = 700
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   8d36                 | lea                 esi, dword ptr [esi]
            //   e9????????           |                     

    condition:
        7 of them and filesize < 1122304
}