rule win_backswap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.backswap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.backswap"
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
        $sequence_0 = { 5b c9 c21000 83f0ff }
            // n = 4, score = 400
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c21000               | ret                 0x10
            //   83f0ff               | xor                 eax, 0xffffffff

        $sequence_1 = { 8a07 38d8 74f4 e8???????? 74ed 33c0 eb04 }
            // n = 7, score = 400
            //   8a07                 | mov                 al, byte ptr [edi]
            //   38d8                 | cmp                 al, bl
            //   74f4                 | je                  0xfffffff6
            //   e8????????           |                     
            //   74ed                 | je                  0xffffffef
            //   33c0                 | xor                 eax, eax
            //   eb04                 | jmp                 6

        $sequence_2 = { ff4508 8bfb 3bd3 0f8572ffffff 33c9 }
            // n = 5, score = 400
            //   ff4508               | inc                 dword ptr [ebp + 8]
            //   8bfb                 | mov                 edi, ebx
            //   3bd3                 | cmp                 edx, ebx
            //   0f8572ffffff         | jne                 0xffffff78
            //   33c9                 | xor                 ecx, ecx

        $sequence_3 = { 33c9 e9???????? b32a 397d14 7412 }
            // n = 5, score = 400
            //   33c9                 | xor                 ecx, ecx
            //   e9????????           |                     
            //   b32a                 | mov                 bl, 0x2a
            //   397d14               | cmp                 dword ptr [ebp + 0x14], edi
            //   7412                 | je                  0x14

        $sequence_4 = { 33c9 33d2 8bdf 4b eb1c 85c9 }
            // n = 6, score = 400
            //   33c9                 | xor                 ecx, ecx
            //   33d2                 | xor                 edx, edx
            //   8bdf                 | mov                 ebx, edi
            //   4b                   | dec                 ebx
            //   eb1c                 | jmp                 0x1e
            //   85c9                 | test                ecx, ecx

        $sequence_5 = { 7482 8b7508 ff4508 8bfb 3bd3 0f8572ffffff 33c9 }
            // n = 7, score = 400
            //   7482                 | je                  0xffffff84
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   ff4508               | inc                 dword ptr [ebp + 8]
            //   8bfb                 | mov                 edi, ebx
            //   3bd3                 | cmp                 edx, ebx
            //   0f8572ffffff         | jne                 0xffffff78
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { 3bd3 0f8572ffffff 33c9 e9???????? }
            // n = 4, score = 400
            //   3bd3                 | cmp                 edx, ebx
            //   0f8572ffffff         | jne                 0xffffff78
            //   33c9                 | xor                 ecx, ecx
            //   e9????????           |                     

        $sequence_7 = { 3a06 7482 8b7508 ff4508 8bfb }
            // n = 5, score = 400
            //   3a06                 | cmp                 al, byte ptr [esi]
            //   7482                 | je                  0xffffff84
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   ff4508               | inc                 dword ptr [ebp + 8]
            //   8bfb                 | mov                 edi, ebx

        $sequence_8 = { 8b750c 8b7d08 8b4d10 d1e9 f366a5 59 }
            // n = 6, score = 400
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   d1e9                 | shr                 ecx, 1
            //   f366a5               | rep movsw           word ptr es:[edi], word ptr [esi]
            //   59                   | pop                 ecx

        $sequence_9 = { 55 8bec 56 57 51 fc }
            // n = 6, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   56                   | push                esi
            //   57                   | push                edi
            //   51                   | push                ecx
            //   fc                   | cld                 

    condition:
        7 of them and filesize < 122880
}