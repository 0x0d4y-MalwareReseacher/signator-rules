rule win_gcman_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.gcman."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gcman"
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
        $sequence_0 = { 0375e0 01f2 81eaf4c71a02 c1c217 01ca 89d6 31ce }
            // n = 7, score = 100
            //   0375e0               | add                 esi, dword ptr [ebp - 0x20]
            //   01f2                 | add                 edx, esi
            //   81eaf4c71a02         | sub                 edx, 0x21ac7f4
            //   c1c217               | rol                 edx, 0x17
            //   01ca                 | add                 edx, ecx
            //   89d6                 | mov                 esi, edx
            //   31ce                 | xor                 esi, ecx

        $sequence_1 = { c1c214 01ca 89d6 31ce 21de 31ce 0375cc }
            // n = 7, score = 100
            //   c1c214               | rol                 edx, 0x14
            //   01ca                 | add                 edx, ecx
            //   89d6                 | mov                 esi, edx
            //   31ce                 | xor                 esi, ecx
            //   21de                 | and                 esi, ebx
            //   31ce                 | xor                 esi, ecx
            //   0375cc               | add                 esi, dword ptr [ebp - 0x34]

        $sequence_2 = { 83bd68ffffff02 0f94c0 0fb6c0 c9 c3 55 }
            // n = 6, score = 100
            //   83bd68ffffff02       | cmp                 dword ptr [ebp - 0x98], 2
            //   0f94c0               | sete                al
            //   0fb6c0               | movzx               eax, al
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_3 = { e8???????? 8d5008 8b45f0 8944240c }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8d5008               | lea                 edx, [eax + 8]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax

        $sequence_4 = { 8b45e8 890424 e8???????? 8945ec 8b45ec }
            // n = 5, score = 100
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]

        $sequence_5 = { 09de 31c6 0375c0 01f1 81e9ecbcfe5c }
            // n = 5, score = 100
            //   09de                 | or                  esi, ebx
            //   31c6                 | xor                 esi, eax
            //   0375c0               | add                 esi, dword ptr [ebp - 0x40]
            //   01f1                 | add                 ecx, esi
            //   81e9ecbcfe5c         | sub                 ecx, 0x5cfebcec

        $sequence_6 = { 890424 e8???????? c74424088a000000 c744240413000000 }
            // n = 4, score = 100
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   c74424088a000000     | mov                 dword ptr [esp + 8], 0x8a
            //   c744240413000000     | mov                 dword ptr [esp + 4], 0x13

        $sequence_7 = { 21de 31d6 0375e0 01f1 81e972bc8659 c1c111 }
            // n = 6, score = 100
            //   21de                 | and                 esi, ebx
            //   31d6                 | xor                 esi, edx
            //   0375e0               | add                 esi, dword ptr [ebp - 0x20]
            //   01f1                 | add                 ecx, esi
            //   81e972bc8659         | sub                 ecx, 0x5986bc72
            //   c1c111               | rol                 ecx, 0x11

        $sequence_8 = { 21c6 31de 0375b8 01f2 81ea38042c18 c1c214 }
            // n = 6, score = 100
            //   21c6                 | and                 esi, eax
            //   31de                 | xor                 esi, ebx
            //   0375b8               | add                 esi, dword ptr [ebp - 0x48]
            //   01f2                 | add                 edx, esi
            //   81ea38042c18         | sub                 edx, 0x182c0438
            //   c1c214               | rol                 edx, 0x14

        $sequence_9 = { 8d45ec ff00 803a00 7410 8b45ec 803820 75e9 }
            // n = 7, score = 100
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   ff00                 | inc                 dword ptr [eax]
            //   803a00               | cmp                 byte ptr [edx], 0
            //   7410                 | je                  0x12
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   803820               | cmp                 byte ptr [eax], 0x20
            //   75e9                 | jne                 0xffffffeb

    condition:
        7 of them and filesize < 81920
}