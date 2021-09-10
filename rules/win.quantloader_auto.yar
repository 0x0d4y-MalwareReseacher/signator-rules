rule win_quantloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.quantloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.quantloader"
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
        $sequence_0 = { 895c2408 89442404 c70424???????? e8???????? 89442404 c70424???????? e8???????? }
            // n = 7, score = 500
            //   895c2408             | mov                 dword ptr [esp + 8], ebx
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   c70424????????       |                     
            //   e8????????           |                     
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   c70424????????       |                     
            //   e8????????           |                     

        $sequence_1 = { c744240800020000 c744240400000000 c70424???????? e8???????? c744240800010000 c744240400000000 c70424???????? }
            // n = 7, score = 500
            //   c744240800020000     | mov                 dword ptr [esp + 8], 0x200
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c70424????????       |                     
            //   e8????????           |                     
            //   c744240800010000     | mov                 dword ptr [esp + 8], 0x100
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c70424????????       |                     

        $sequence_2 = { 55 89e5 83ec18 c70424???????? e8???????? 8b5508 }
            // n = 6, score = 500
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   83ec18               | sub                 esp, 0x18
            //   c70424????????       |                     
            //   e8????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]

        $sequence_3 = { c745fc0a000000 c605????????00 8b45fc 89442408 c7442404???????? }
            // n = 5, score = 500
            //   c745fc0a000000       | mov                 dword ptr [ebp - 4], 0xa
            //   c605????????00       |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   c7442404????????     |                     

        $sequence_4 = { 8b4508 890424 e8???????? 89442408 c744240405000000 }
            // n = 5, score = 500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   c744240405000000     | mov                 dword ptr [esp + 4], 5

        $sequence_5 = { 83ec08 8b4598 890424 e8???????? 83ec04 }
            // n = 5, score = 500
            //   83ec08               | sub                 esp, 8
            //   8b4598               | mov                 eax, dword ptr [ebp - 0x68]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4

        $sequence_6 = { 83ec04 c745f400000000 eb00 8b45f4 c9 }
            // n = 5, score = 500
            //   83ec04               | sub                 esp, 4
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   eb00                 | jmp                 2
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   c9                   | leave               

        $sequence_7 = { 8945f4 807dff00 7509 8b45f8 40 }
            // n = 5, score = 500
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   807dff00             | cmp                 byte ptr [ebp - 1], 0
            //   7509                 | jne                 0xb
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   40                   | inc                 eax

        $sequence_8 = { 84c0 75f1 5e 8bc6 }
            // n = 4, score = 100
            //   84c0                 | test                al, al
            //   75f1                 | jne                 0xfffffff3
            //   5e                   | pop                 esi
            //   8bc6                 | mov                 eax, esi

        $sequence_9 = { e8???????? 5f 5d c20c00 60 837d5400 740f }
            // n = 7, score = 100
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   60                   | pushal              
            //   837d5400             | cmp                 dword ptr [ebp + 0x54], 0
            //   740f                 | je                  0x11

        $sequence_10 = { 59 8b490c 8b490c 8b09 33c0 39411c 74f7 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   8b490c               | mov                 ecx, dword ptr [ecx + 0xc]
            //   8b490c               | mov                 ecx, dword ptr [ecx + 0xc]
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   33c0                 | xor                 eax, eax
            //   39411c               | cmp                 dword ptr [ecx + 0x1c], eax
            //   74f7                 | je                  0xfffffff9

        $sequence_11 = { 5f 5e 5b ebed 61 }
            // n = 5, score = 100
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   ebed                 | jmp                 0xffffffef
            //   61                   | popal               

        $sequence_12 = { 2bc8 51 8bc8 d1e9 83e904 }
            // n = 5, score = 100
            //   2bc8                 | sub                 ecx, eax
            //   51                   | push                ecx
            //   8bc8                 | mov                 ecx, eax
            //   d1e9                 | shr                 ecx, 1
            //   83e904               | sub                 ecx, 4

        $sequence_13 = { f3a5 64a118000000 8f402c 61 }
            // n = 4, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   64a118000000         | mov                 eax, dword ptr fs:[0x18]
            //   8f402c               | pop                 dword ptr [eax + 0x2c]
            //   61                   | popal               

        $sequence_14 = { ff7010 ff700c ff7008 ff5550 e8???????? 57 }
            // n = 6, score = 100
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   ff700c               | push                dword ptr [eax + 0xc]
            //   ff7008               | push                dword ptr [eax + 8]
            //   ff5550               | call                dword ptr [ebp + 0x50]
            //   e8????????           |                     
            //   57                   | push                edi

        $sequence_15 = { 85c0 741b a900000080 7504 8d440302 25ffffff7f 50 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   a900000080           | test                eax, 0x80000000
            //   7504                 | jne                 6
            //   8d440302             | lea                 eax, dword ptr [ebx + eax + 2]
            //   25ffffff7f           | and                 eax, 0x7fffffff
            //   50                   | push                eax

    condition:
        7 of them and filesize < 155648
}