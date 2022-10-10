rule win_gpcode_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.gpcode."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gpcode"
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
        $sequence_0 = { a1???????? a3???????? 6800001000 68???????? ff35???????? }
            // n = 5, score = 1400
            //   a1????????           |                     
            //   a3????????           |                     
            //   6800001000           | push                0x100000
            //   68????????           |                     
            //   ff35????????         |                     

        $sequence_1 = { 68???????? e8???????? 91 6a00 }
            // n = 4, score = 1400
            //   68????????           |                     
            //   e8????????           |                     
            //   91                   | xchg                eax, ecx
            //   6a00                 | push                0

        $sequence_2 = { e8???????? c705????????01000000 c3 55 }
            // n = 4, score = 1400
            //   e8????????           |                     
            //   c705????????01000000     |     
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_3 = { f7f1 8bc8 bb???????? 51 6a41 }
            // n = 5, score = 1100
            //   f7f1                 | div                 ecx
            //   8bc8                 | mov                 ecx, eax
            //   bb????????           |                     
            //   51                   | push                ecx
            //   6a41                 | push                0x41

        $sequence_4 = { 8945f8 85c0 7450 33c0 50 }
            // n = 5, score = 1100
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   85c0                 | test                eax, eax
            //   7450                 | je                  0x52
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax

        $sequence_5 = { 8b1d???????? 53 e8???????? 03d8 83c301 ff4d08 }
            // n = 6, score = 1100
            //   8b1d????????         |                     
            //   53                   | push                ebx
            //   e8????????           |                     
            //   03d8                 | add                 ebx, eax
            //   83c301               | add                 ebx, 1
            //   ff4d08               | dec                 dword ptr [ebp + 8]

        $sequence_6 = { 85c0 0f840d020000 a3???????? 68???????? ff35???????? e8???????? }
            // n = 6, score = 1100
            //   85c0                 | test                eax, eax
            //   0f840d020000         | je                  0x213
            //   a3????????           |                     
            //   68????????           |                     
            //   ff35????????         |                     
            //   e8????????           |                     

        $sequence_7 = { 2d???????? 50 8d85e8feffff 50 }
            // n = 4, score = 800
            //   2d????????           |                     
            //   50                   | push                eax
            //   8d85e8feffff         | lea                 eax, [ebp - 0x118]
            //   50                   | push                eax

        $sequence_8 = { 68???????? e8???????? 68???????? e8???????? c780????????5c2a0000 e8???????? 58 }
            // n = 7, score = 800
            //   68????????           |                     
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   c780????????5c2a0000     |     
            //   e8????????           |                     
            //   58                   | pop                 eax

        $sequence_9 = { e8???????? 0bc0 7505 5a 59 5b }
            // n = 6, score = 800
            //   e8????????           |                     
            //   0bc0                 | or                  eax, eax
            //   7505                 | jne                 7
            //   5a                   | pop                 edx
            //   59                   | pop                 ecx
            //   5b                   | pop                 ebx

        $sequence_10 = { 8b1d???????? 51 53 68???????? }
            // n = 4, score = 800
            //   8b1d????????         |                     
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_11 = { 0145f0 8b4df0 3b4d14 0f8263feffff }
            // n = 4, score = 100
            //   0145f0               | add                 dword ptr [ebp - 0x10], eax
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   3b4d14               | cmp                 ecx, dword ptr [ebp + 0x14]
            //   0f8263feffff         | jb                  0xfffffe69

        $sequence_12 = { 001438 eb06 80c107 000c38 }
            // n = 4, score = 100
            //   001438               | add                 byte ptr [eax + edi], dl
            //   eb06                 | jmp                 8
            //   80c107               | add                 cl, 7
            //   000c38               | add                 byte ptr [eax + edi], cl

        $sequence_13 = { 0106 eb94 55 8bec }
            // n = 4, score = 100
            //   0106                 | add                 dword ptr [esi], eax
            //   eb94                 | jmp                 0xffffff96
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_14 = { 0016 40 3bc3 72de }
            // n = 4, score = 100
            //   0016                 | add                 byte ptr [esi], dl
            //   40                   | inc                 eax
            //   3bc3                 | cmp                 eax, ebx
            //   72de                 | jb                  0xffffffe0

        $sequence_15 = { 000c38 40 3b45f8 72e3 }
            // n = 4, score = 100
            //   000c38               | add                 byte ptr [eax + edi], cl
            //   40                   | inc                 eax
            //   3b45f8               | cmp                 eax, dword ptr [ebp - 8]
            //   72e3                 | jb                  0xffffffe5

        $sequence_16 = { 0144240c 85f6 7fdd 33c0 }
            // n = 4, score = 100
            //   0144240c             | add                 dword ptr [esp + 0xc], eax
            //   85f6                 | test                esi, esi
            //   7fdd                 | jg                  0xffffffdf
            //   33c0                 | xor                 eax, eax

        $sequence_17 = { 000e eb08 02c9 b2f9 }
            // n = 4, score = 100
            //   000e                 | add                 byte ptr [esi], cl
            //   eb08                 | jmp                 0xa
            //   02c9                 | add                 cl, cl
            //   b2f9                 | mov                 dl, 0xf9

        $sequence_18 = { 0005???????? 0fb605???????? 8ad3 8d80b8fee014 }
            // n = 4, score = 100
            //   0005????????         |                     
            //   0fb605????????       |                     
            //   8ad3                 | mov                 dl, bl
            //   8d80b8fee014         | lea                 eax, [eax + 0x14e0feb8]

    condition:
        7 of them and filesize < 761856
}