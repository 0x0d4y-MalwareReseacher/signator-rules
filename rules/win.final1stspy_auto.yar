rule win_final1stspy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.final1stspy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.final1stspy"
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
        $sequence_0 = { 660ffcc2 660fefc3 0f11040f 0f10440f10 660ffcc8 660fefcb }
            // n = 6, score = 300
            //   660ffcc2             | paddb               xmm0, xmm2
            //   660fefc3             | pxor                xmm0, xmm3
            //   0f11040f             | movups              xmmword ptr [edi + ecx], xmm0
            //   0f10440f10           | movups              xmm0, xmmword ptr [edi + ecx + 0x10]
            //   660ffcc8             | paddb               xmm1, xmm0
            //   660fefcb             | pxor                xmm1, xmm3

        $sequence_1 = { 8b45f8 2bf0 56 50 e8???????? }
            // n = 5, score = 300
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   2bf0                 | sub                 esi, eax
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { 41 3bce 7cef 8bc7 5f 5e }
            // n = 6, score = 300
            //   41                   | inc                 ecx
            //   3bce                 | cmp                 ecx, esi
            //   7cef                 | jl                  0xfffffff1
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_3 = { 7412 8a5801 40 84db 75f4 5f }
            // n = 6, score = 300
            //   7412                 | je                  0x14
            //   8a5801               | mov                 bl, byte ptr [eax + 1]
            //   40                   | inc                 eax
            //   84db                 | test                bl, bl
            //   75f4                 | jne                 0xfffffff6
            //   5f                   | pop                 edi

        $sequence_4 = { 3bca 7cd4 3bce 7d11 8a1439 }
            // n = 5, score = 300
            //   3bca                 | cmp                 ecx, edx
            //   7cd4                 | jl                  0xffffffd6
            //   3bce                 | cmp                 ecx, esi
            //   7d11                 | jge                 0x13
            //   8a1439               | mov                 dl, byte ptr [ecx + edi]

        $sequence_5 = { 8bc2 c1f810 8806 46 }
            // n = 4, score = 300
            //   8bc2                 | mov                 eax, edx
            //   c1f810               | sar                 eax, 0x10
            //   8806                 | mov                 byte ptr [esi], al
            //   46                   | inc                 esi

        $sequence_6 = { eb2b b8???????? 8acb 6690 3acd 7412 8a4801 }
            // n = 7, score = 300
            //   eb2b                 | jmp                 0x2d
            //   b8????????           |                     
            //   8acb                 | mov                 cl, bl
            //   6690                 | nop                 
            //   3acd                 | cmp                 cl, ch
            //   7412                 | je                  0x14
            //   8a4801               | mov                 cl, byte ptr [eax + 1]

        $sequence_7 = { 81cf00feffff 47 33f6 85ff 7e0a }
            // n = 5, score = 300
            //   81cf00feffff         | or                  edi, 0xfffffe00
            //   47                   | inc                 edi
            //   33f6                 | xor                 esi, esi
            //   85ff                 | test                edi, edi
            //   7e0a                 | jle                 0xc

        $sequence_8 = { 660fefc3 0f11040f 0f10440f10 660ffcc8 660fefcb 0f114c0f10 83c120 }
            // n = 7, score = 300
            //   660fefc3             | pxor                xmm0, xmm3
            //   0f11040f             | movups              xmmword ptr [edi + ecx], xmm0
            //   0f10440f10           | movups              xmm0, xmmword ptr [edi + ecx + 0x10]
            //   660ffcc8             | paddb               xmm1, xmm0
            //   660fefcb             | pxor                xmm1, xmm3
            //   0f114c0f10           | movups              xmmword ptr [edi + ecx + 0x10], xmm1
            //   83c120               | add                 ecx, 0x20

        $sequence_9 = { 85ff 7594 b8???????? 6690 3ad9 }
            // n = 5, score = 300
            //   85ff                 | test                edi, edi
            //   7594                 | jne                 0xffffff96
            //   b8????????           |                     
            //   6690                 | nop                 
            //   3ad9                 | cmp                 bl, cl

    condition:
        7 of them and filesize < 557056
}