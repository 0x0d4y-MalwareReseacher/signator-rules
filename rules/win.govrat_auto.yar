rule win_govrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.govrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.govrat"
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
        $sequence_0 = { 8bfa 03f1 c1ef08 03fe 8b7508 0fb7347e 8bfa }
            // n = 7, score = 200
            //   8bfa                 | mov                 edi, edx
            //   03f1                 | add                 esi, ecx
            //   c1ef08               | shr                 edi, 8
            //   03fe                 | add                 edi, esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   0fb7347e             | movzx               esi, word ptr [esi + edi*2]
            //   8bfa                 | mov                 edi, edx

        $sequence_1 = { 33f6 33ff 897dfc 3b1cfd187d4300 7409 47 897dfc }
            // n = 7, score = 200
            //   33f6                 | xor                 esi, esi
            //   33ff                 | xor                 edi, edi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   3b1cfd187d4300       | cmp                 ebx, dword ptr [edi*8 + 0x437d18]
            //   7409                 | je                  0xb
            //   47                   | inc                 edi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi

        $sequence_2 = { 85c0 7505 e9???????? 832600 33c0 c3 e9???????? }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   e9????????           |                     
            //   832600               | and                 dword ptr [esi], 0
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   e9????????           |                     

        $sequence_3 = { 015f10 8bc3 83571400 5f 5e 5b c20400 }
            // n = 7, score = 200
            //   015f10               | add                 dword ptr [edi + 0x10], ebx
            //   8bc3                 | mov                 eax, ebx
            //   83571400             | adc                 dword ptr [edi + 0x14], 0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c20400               | ret                 4

        $sequence_4 = { 33f1 33f9 8b4df4 c1ee04 8bb4b3a00e0300 c1ef04 03b4bba00e0300 }
            // n = 7, score = 200
            //   33f1                 | xor                 esi, ecx
            //   33f9                 | xor                 edi, ecx
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   c1ee04               | shr                 esi, 4
            //   8bb4b3a00e0300       | mov                 esi, dword ptr [ebx + esi*4 + 0x30ea0]
            //   c1ef04               | shr                 edi, 4
            //   03b4bba00e0300       | add                 esi, dword ptr [ebx + edi*4 + 0x30ea0]

        $sequence_5 = { 8365fc00 6a00 8d45fc 50 ff7510 8b4508 ff750c }
            // n = 7, score = 200
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_6 = { 51 53 53 8d8da0fbffff 51 50 8d85e4fcffff }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   8d8da0fbffff         | lea                 ecx, [ebp - 0x460]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   8d85e4fcffff         | lea                 eax, [ebp - 0x31c]

        $sequence_7 = { 7466 3b7dc4 7361 6aff 8d4701 50 8d45b0 }
            // n = 7, score = 200
            //   7466                 | je                  0x68
            //   3b7dc4               | cmp                 edi, dword ptr [ebp - 0x3c]
            //   7361                 | jae                 0x63
            //   6aff                 | push                -1
            //   8d4701               | lea                 eax, [edi + 1]
            //   50                   | push                eax
            //   8d45b0               | lea                 eax, [ebp - 0x50]

        $sequence_8 = { 5b c9 c21000 832600 393d???????? 7708 3b3d???????? }
            // n = 7, score = 200
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c21000               | ret                 0x10
            //   832600               | and                 dword ptr [esi], 0
            //   393d????????         |                     
            //   7708                 | ja                  0xa
            //   3b3d????????         |                     

        $sequence_9 = { 895f18 895f1c 895f20 895f08 e8???????? 8bf0 59 }
            // n = 7, score = 200
            //   895f18               | mov                 dword ptr [edi + 0x18], ebx
            //   895f1c               | mov                 dword ptr [edi + 0x1c], ebx
            //   895f20               | mov                 dword ptr [edi + 0x20], ebx
            //   895f08               | mov                 dword ptr [edi + 8], ebx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 761856
}