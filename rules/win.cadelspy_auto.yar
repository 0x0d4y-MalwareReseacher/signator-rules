rule win_cadelspy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.cadelspy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cadelspy"
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
        $sequence_0 = { eb11 8b0e 8b49f8 ff7508 03c9 }
            // n = 5, score = 100
            //   eb11                 | jmp                 0x13
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8b49f8               | mov                 ecx, dword ptr [ecx - 8]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   03c9                 | add                 ecx, ecx

        $sequence_1 = { 59 85c0 7513 57 8bce e8???????? 59 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7513                 | jne                 0x15
            //   57                   | push                edi
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_2 = { 51 3b7dfc 7714 8d0c78 51 }
            // n = 5, score = 100
            //   51                   | push                ecx
            //   3b7dfc               | cmp                 edi, dword ptr [ebp - 4]
            //   7714                 | ja                  0x16
            //   8d0c78               | lea                 ecx, [eax + edi*2]
            //   51                   | push                ecx

        $sequence_3 = { 3bd0 7d17 668b1c4b 663b1c553c0b0110 }
            // n = 4, score = 100
            //   3bd0                 | cmp                 edx, eax
            //   7d17                 | jge                 0x19
            //   668b1c4b             | mov                 bx, word ptr [ebx + ecx*2]
            //   663b1c553c0b0110     | cmp                 bx, word ptr [edx*2 + 0x10010b3c]

        $sequence_4 = { 8d85eef0ffff 53 50 e8???????? }
            // n = 4, score = 100
            //   8d85eef0ffff         | lea                 eax, [ebp - 0xf12]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 8bc8 c1f905 8d1c8d004c0110 8bf0 83e61f c1e606 }
            // n = 6, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   8d1c8d004c0110       | lea                 ebx, [ecx*4 + 0x10014c00]
            //   8bf0                 | mov                 esi, eax
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6

        $sequence_6 = { 8d85ecf0ffff 50 68???????? 53 e8???????? }
            // n = 5, score = 100
            //   8d85ecf0ffff         | lea                 eax, [ebp - 0xf14]
            //   50                   | push                eax
            //   68????????           |                     
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_7 = { e8???????? ff7580 8d4584 6a01 53 50 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   ff7580               | push                dword ptr [ebp - 0x80]
            //   8d4584               | lea                 eax, [ebp - 0x7c]
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_8 = { 57 ff15???????? 83f8ff 7413 39742424 770d 50 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   7413                 | je                  0x15
            //   39742424             | cmp                 dword ptr [esp + 0x24], esi
            //   770d                 | ja                  0xf
            //   50                   | push                eax

        $sequence_9 = { 5b 5d c20800 6a04 b8???????? e8???????? 8b06 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6a04                 | push                4
            //   b8????????           |                     
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]

    condition:
        7 of them and filesize < 204800
}