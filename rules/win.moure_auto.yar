rule win_moure_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.moure."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moure"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 97 c10081 e000 0000 0081c0f8ffff ff2b e058 }
            // n = 7, score = 100
            //   97                   | xchg                eax, edi
            //   c10081               | rol                 dword ptr [eax], 0x81
            //   e000                 | loopne              2
            //   0000                 | add                 byte ptr [eax], al
            //   0081c0f8ffff         | add                 byte ptr [ecx - 0x740], al
            //   ff2b                 | ljmp                [ebx]
            //   e058                 | loopne              0x5a

        $sequence_1 = { 83c40c 85c0 7504 33c0 eb2e 8906 }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb2e                 | jmp                 0x30
            //   8906                 | mov                 dword ptr [esi], eax

        $sequence_2 = { 33dd 5b 8d533c 51 c1c939 33cc 59 }
            // n = 7, score = 100
            //   33dd                 | xor                 ebx, ebp
            //   5b                   | pop                 ebx
            //   8d533c               | lea                 edx, [ebx + 0x3c]
            //   51                   | push                ecx
            //   c1c939               | ror                 ecx, 0x39
            //   33cc                 | xor                 ecx, esp
            //   59                   | pop                 ecx

        $sequence_3 = { 5a 8945e8 57 53 e8???????? a7 }
            // n = 6, score = 100
            //   5a                   | pop                 edx
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   57                   | push                edi
            //   53                   | push                ebx
            //   e8????????           |                     
            //   a7                   | cmpsd               dword ptr [esi], dword ptr es:[edi]

        $sequence_4 = { 83ec58 53 56 33f6 57 8975f8 397508 }
            // n = 7, score = 100
            //   83ec58               | sub                 esp, 0x58
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   57                   | push                edi
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   397508               | cmp                 dword ptr [ebp + 8], esi

        $sequence_5 = { 47 8705???????? 00bf35b8bf55 a4 254000c935 b8cdc58cbb }
            // n = 6, score = 100
            //   47                   | inc                 edi
            //   8705????????         |                     
            //   00bf35b8bf55         | add                 byte ptr [edi + 0x55bfb835], bh
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   254000c935           | and                 eax, 0x35c90040
            //   b8cdc58cbb           | mov                 eax, 0xbb8cc5cd

        $sequence_6 = { 7505 8b45c8 eb0a 8b45ec c745f000000080 837df000 }
            // n = 6, score = 100
            //   7505                 | jne                 7
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   eb0a                 | jmp                 0xc
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   c745f000000080       | mov                 dword ptr [ebp - 0x10], 0x80000000
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0

        $sequence_7 = { 33d7 51 81c9ffffffff 41 }
            // n = 4, score = 100
            //   33d7                 | xor                 edx, edi
            //   51                   | push                ecx
            //   81c9ffffffff         | or                  ecx, 0xffffffff
            //   41                   | inc                 ecx

        $sequence_8 = { 56 e8???????? 8b7000 008a8bcccccc 00e5 d88bccccccbd d7 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b7000               | mov                 esi, dword ptr [eax]
            //   008a8bcccccc         | add                 byte ptr [edx - 0x33333375], cl
            //   00e5                 | add                 ch, ah
            //   d88bccccccbd         | fmul                dword ptr [ebx - 0x42333334]
            //   d7                   | xlatb               

        $sequence_9 = { 00cd c5bcbebfbf1086 c5bcbebfbf00bf 55 }
            // n = 4, score = 100
            //   00cd                 | add                 ch, cl
            //   c5bcbebfbf1086       | lds                 edi, ptr [esi + edi*4 - 0x79ef4041]
            //   c5bcbebfbf00bf       | lds                 edi, ptr [esi + edi*4 - 0x40ff4041]
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 188416
}