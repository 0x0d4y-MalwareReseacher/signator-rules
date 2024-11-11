rule win_spyder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.spyder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spyder"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 488d1587a10000 488d0d68a10000 e8???????? 488d1584a10000 488d0d75a10000 e8???????? }
            // n = 6, score = 500
            //   488d1587a10000       | lea                 eax, [0x93ca]
            //   488d0d68a10000       | cmp                 byte ptr [esp + 0x98], cl
            //   e8????????           |                     
            //   488d1584a10000       | sete                cl
            //   488d0d75a10000       | dec                 eax
            //   e8????????           |                     

        $sequence_1 = { ff5330 ffc6 4883c708 3b7318 7cdf 488b7c2438 488b4b10 }
            // n = 7, score = 500
            //   ff5330               | dec                 eax
            //   ffc6                 | mov                 eax, dword ptr [ebx]
            //   4883c708             | dec                 eax
            //   3b7318               | test                eax, eax
            //   7cdf                 | je                  0xc
            //   488b7c2438           | call                eax
            //   488b4b10             | dec                 eax

        $sequence_2 = { 4c8b4638 498bcc 0fb7d0 4985c6 }
            // n = 4, score = 500
            //   4c8b4638             | dec                 esp
            //   498bcc               | mov                 eax, dword ptr [esi + 0x38]
            //   0fb7d0               | dec                 ecx
            //   4985c6               | mov                 ecx, esp

        $sequence_3 = { 488d0525160000 488d0d6e210000 488905???????? 488d0500160000 48890d???????? 488905???????? 488d05f3150000 }
            // n = 7, score = 500
            //   488d0525160000       | jbe                 0x4d
            //   488d0d6e210000       | dec                 ecx
            //   488905????????       |                     
            //   488d0500160000       | mov                 ecx, ebp
            //   48890d????????       |                     
            //   488905????????       |                     
            //   488d05f3150000       | dec                 esp

        $sequence_4 = { 48ffc0 4883f83c 7647 498bcd e8???????? 4c8d05478a0000 41b903000000 }
            // n = 7, score = 500
            //   48ffc0               | lea                 edx, [0xa184]
            //   4883f83c             | dec                 eax
            //   7647                 | lea                 ecx, [0xa175]
            //   498bcd               | dec                 eax
            //   e8????????           |                     
            //   4c8d05478a0000       | lea                 edi, [0x9360]
            //   41b903000000         | jmp                 0x10

        $sequence_5 = { 488d3d60930000 eb0e 488b03 4885c0 7402 ffd0 }
            // n = 6, score = 500
            //   488d3d60930000       | add                 ebx, edx
            //   eb0e                 | dec                 eax
            //   488b03               | lea                 edx, [0xa187]
            //   4885c0               | dec                 eax
            //   7402                 | lea                 ecx, [0xa168]
            //   ffd0                 | dec                 eax

        $sequence_6 = { 488bc8 ff15???????? 488d15c05e0000 488bce 488905???????? ff15???????? }
            // n = 6, score = 500
            //   488bc8               | inc                 eax
            //   ff15????????         |                     
            //   488d15c05e0000       | dec                 eax
            //   488bce               | cmp                 eax, 0x3c
            //   488905????????       |                     
            //   ff15????????         |                     

        $sequence_7 = { 4c8d05ca930000 388c2498000000 0f94c1 4803da }
            // n = 4, score = 500
            //   4c8d05ca930000       | movzx               edx, ax
            //   388c2498000000       | dec                 ecx
            //   0f94c1               | test                esi, eax
            //   4803da               | dec                 esp

        $sequence_8 = { 51 e8???????? 8dbc2494050000 83c9ff 33c0 83c40c }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8dbc2494050000       | lea                 edi, [esp + 0x594]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   83c40c               | add                 esp, 0xc

        $sequence_9 = { 8dbc24ad050000 889c24ac050000 f3ab 66ab aa }
            // n = 5, score = 100
            //   8dbc24ad050000       | lea                 edi, [esp + 0x5ad]
            //   889c24ac050000       | mov                 byte ptr [esp + 0x5ac], bl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al

        $sequence_10 = { 8ac8 80e920 ebe0 80a00049091000 }
            // n = 4, score = 100
            //   8ac8                 | mov                 cl, al
            //   80e920               | sub                 cl, 0x20
            //   ebe0                 | jmp                 0xffffffe2
            //   80a00049091000       | and                 byte ptr [eax + 0x10094900], 0

        $sequence_11 = { 8d8424900d0000 57 50 56 895c2430 }
            // n = 5, score = 100
            //   8d8424900d0000       | lea                 eax, [esp + 0xd90]
            //   57                   | push                edi
            //   50                   | push                eax
            //   56                   | push                esi
            //   895c2430             | mov                 dword ptr [esp + 0x30], ebx

        $sequence_12 = { f2ae f7d1 2bf9 682b010000 8bf7 8be9 8bfa }
            // n = 7, score = 100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   2bf9                 | sub                 edi, ecx
            //   682b010000           | push                0x12b
            //   8bf7                 | mov                 esi, edi
            //   8be9                 | mov                 ebp, ecx
            //   8bfa                 | mov                 edi, edx

        $sequence_13 = { ff15???????? 8d54241c 53 52 8d8424900d0000 57 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   53                   | push                ebx
            //   52                   | push                edx
            //   8d8424900d0000       | lea                 eax, [esp + 0xd90]
            //   57                   | push                edi

        $sequence_14 = { 8dbc24a9000000 889c24a8000000 f3ab 66ab 83c424 aa }
            // n = 6, score = 100
            //   8dbc24a9000000       | lea                 edi, [esp + 0xa9]
            //   889c24a8000000       | mov                 byte ptr [esp + 0xa8], bl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   83c424               | add                 esp, 0x24
            //   aa                   | stosb               byte ptr es:[edi], al

        $sequence_15 = { 8bc3 c1f805 8d3c85204b0910 8bc3 83e01f }
            // n = 5, score = 100
            //   8bc3                 | mov                 eax, ebx
            //   c1f805               | sar                 eax, 5
            //   8d3c85204b0910       | lea                 edi, [eax*4 + 0x10094b20]
            //   8bc3                 | mov                 eax, ebx
            //   83e01f               | and                 eax, 0x1f

    condition:
        7 of them and filesize < 1458176
}