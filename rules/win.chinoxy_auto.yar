rule win_chinoxy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.chinoxy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chinoxy"
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
        $sequence_0 = { c644241a61 c644241b64 c644241c52 c644241e73 884c241f c644242075 }
            // n = 6, score = 100
            //   c644241a61           | mov                 byte ptr [esp + 0x1a], 0x61
            //   c644241b64           | mov                 byte ptr [esp + 0x1b], 0x64
            //   c644241c52           | mov                 byte ptr [esp + 0x1c], 0x52
            //   c644241e73           | mov                 byte ptr [esp + 0x1e], 0x73
            //   884c241f             | mov                 byte ptr [esp + 0x1f], cl
            //   c644242075           | mov                 byte ptr [esp + 0x20], 0x75

        $sequence_1 = { 884c2443 c644244473 c644244500 ffd7 8b7c2460 8bf0 bb64040000 }
            // n = 7, score = 100
            //   884c2443             | mov                 byte ptr [esp + 0x43], cl
            //   c644244473           | mov                 byte ptr [esp + 0x44], 0x73
            //   c644244500           | mov                 byte ptr [esp + 0x45], 0
            //   ffd7                 | call                edi
            //   8b7c2460             | mov                 edi, dword ptr [esp + 0x60]
            //   8bf0                 | mov                 esi, eax
            //   bb64040000           | mov                 ebx, 0x464

        $sequence_2 = { 89864c200000 895e38 899e50200000 c706???????? 885e3c 66895e48 }
            // n = 6, score = 100
            //   89864c200000         | mov                 dword ptr [esi + 0x204c], eax
            //   895e38               | mov                 dword ptr [esi + 0x38], ebx
            //   899e50200000         | mov                 dword ptr [esi + 0x2050], ebx
            //   c706????????         |                     
            //   885e3c               | mov                 byte ptr [esi + 0x3c], bl
            //   66895e48             | mov                 word ptr [esi + 0x48], bx

        $sequence_3 = { 56 ffd7 83c408 85c0 7502 8bc5 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   8bc5                 | mov                 eax, ebp

        $sequence_4 = { c644241002 e8???????? 8d8ed47e0100 c644241001 e8???????? }
            // n = 5, score = 100
            //   c644241002           | mov                 byte ptr [esp + 0x10], 2
            //   e8????????           |                     
            //   8d8ed47e0100         | lea                 ecx, [esi + 0x17ed4]
            //   c644241001           | mov                 byte ptr [esp + 0x10], 1
            //   e8????????           |                     

        $sequence_5 = { 0f94c3 8b461c 53 2bc8 6a00 51 }
            // n = 6, score = 100
            //   0f94c3               | sete                bl
            //   8b461c               | mov                 eax, dword ptr [esi + 0x1c]
            //   53                   | push                ebx
            //   2bc8                 | sub                 ecx, eax
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_6 = { 894a10 8bc1 c1e902 f3a5 8bc8 }
            // n = 5, score = 100
            //   894a10               | mov                 dword ptr [edx + 0x10], ecx
            //   8bc1                 | mov                 eax, ecx
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax

        $sequence_7 = { 53 56 8b742410 57 85f6 894c240c }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]
            //   57                   | push                edi
            //   85f6                 | test                esi, esi
            //   894c240c             | mov                 dword ptr [esp + 0xc], ecx

        $sequence_8 = { 56 85c0 8bf1 740b c7462801000000 5e c20400 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   85c0                 | test                eax, eax
            //   8bf1                 | mov                 esi, ecx
            //   740b                 | je                  0xd
            //   c7462801000000       | mov                 dword ptr [esi + 0x28], 1
            //   5e                   | pop                 esi
            //   c20400               | ret                 4

        $sequence_9 = { 5b c20400 8b4f04 8b07 49 83f927 }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   c20400               | ret                 4
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   49                   | dec                 ecx
            //   83f927               | cmp                 ecx, 0x27

    condition:
        7 of them and filesize < 1138688
}