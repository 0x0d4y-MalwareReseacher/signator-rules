rule win_doppelpaymer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.doppelpaymer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.doppelpaymer"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 80790264 751d 80790561 7517 }
            // n = 4, score = 700
            //   80790264             | cmp                 byte ptr [ecx + 2], 0x64
            //   751d                 | jne                 0x1f
            //   80790561             | cmp                 byte ptr [ecx + 5], 0x61
            //   7517                 | jne                 0x19

        $sequence_1 = { 80790600 7523 80790264 751d }
            // n = 4, score = 700
            //   80790600             | cmp                 byte ptr [ecx + 6], 0
            //   7523                 | jne                 0x25
            //   80790264             | cmp                 byte ptr [ecx + 2], 0x64
            //   751d                 | jne                 0x1f

        $sequence_2 = { e8???????? 8b08 e8???????? 3db6389096 }
            // n = 4, score = 700
            //   e8????????           |                     
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   e8????????           |                     
            //   3db6389096           | cmp                 eax, 0x969038b6

        $sequence_3 = { 80790561 7517 80790361 7511 80790474 750b }
            // n = 6, score = 700
            //   80790561             | cmp                 byte ptr [ecx + 5], 0x61
            //   7517                 | jne                 0x19
            //   80790361             | cmp                 byte ptr [ecx + 3], 0x61
            //   7511                 | jne                 0x13
            //   80790474             | cmp                 byte ptr [ecx + 4], 0x74
            //   750b                 | jne                 0xd

        $sequence_4 = { 83ec28 6800002002 6a00 6a01 }
            // n = 4, score = 700
            //   83ec28               | sub                 esp, 0x28
            //   6800002002           | push                0x2200000
            //   6a00                 | push                0
            //   6a01                 | push                1

        $sequence_5 = { baffffff7f 43 e8???????? 3bd8 }
            // n = 4, score = 700
            //   baffffff7f           | mov                 edx, 0x7fffffff
            //   43                   | inc                 ebx
            //   e8????????           |                     
            //   3bd8                 | cmp                 ebx, eax

        $sequence_6 = { 8d4c2414 e8???????? 8944243c c7042400000000 }
            // n = 4, score = 600
            //   8d4c2414             | lea                 ecx, [esp + 0x14]
            //   e8????????           |                     
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax
            //   c7042400000000       | mov                 dword ptr [esp], 0

        $sequence_7 = { 8d4c2414 e8???????? 84db 7551 8d0c24 }
            // n = 5, score = 600
            //   8d4c2414             | lea                 ecx, [esp + 0x14]
            //   e8????????           |                     
            //   84db                 | test                bl, bl
            //   7551                 | jne                 0x53
            //   8d0c24               | lea                 ecx, [esp]

        $sequence_8 = { 8b45dc 8b4854 8b55e8 891424 8b75ec 89742404 894c2408 }
            // n = 7, score = 100
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   8b4854               | mov                 ecx, dword ptr [eax + 0x54]
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   891424               | mov                 dword ptr [esp], edx
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   89742404             | mov                 dword ptr [esp + 4], esi
            //   894c2408             | mov                 dword ptr [esp + 8], ecx

        $sequence_9 = { 81c7f8034681 8b5824 89855cffffff 89d8 c1e81e 83e001 }
            // n = 6, score = 100
            //   81c7f8034681         | add                 edi, 0x814603f8
            //   8b5824               | mov                 ebx, dword ptr [eax + 0x24]
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   89d8                 | mov                 eax, ebx
            //   c1e81e               | shr                 eax, 0x1e
            //   83e001               | and                 eax, 1

        $sequence_10 = { 50 c745fc53284e72 8b45fc 3552284e72 83c404 5d }
            // n = 6, score = 100
            //   50                   | push                eax
            //   c745fc53284e72       | mov                 dword ptr [ebp - 4], 0x724e2853
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3552284e72           | xor                 eax, 0x724e2852
            //   83c404               | add                 esp, 4
            //   5d                   | pop                 ebp

        $sequence_11 = { c745ec25155e0b 8b713c 6689f7 662b55f2 }
            // n = 4, score = 100
            //   c745ec25155e0b       | mov                 dword ptr [ebp - 0x14], 0xb5e1525
            //   8b713c               | mov                 esi, dword ptr [ecx + 0x3c]
            //   6689f7               | mov                 di, si
            //   662b55f2             | sub                 dx, word ptr [ebp - 0xe]

        $sequence_12 = { c20400 3ad1 740c 80fa3f 7407 8bf7 8bc3 }
            // n = 7, score = 100
            //   c20400               | ret                 4
            //   3ad1                 | cmp                 dl, cl
            //   740c                 | je                  0xe
            //   80fa3f               | cmp                 dl, 0x3f
            //   7407                 | je                  9
            //   8bf7                 | mov                 esi, edi
            //   8bc3                 | mov                 eax, ebx

        $sequence_13 = { 83c418 5e 5d c3 8b45e8 8b4dec 8a55e7 }
            // n = 7, score = 100
            //   83c418               | add                 esp, 0x18
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8a55e7               | mov                 dl, byte ptr [ebp - 0x19]

        $sequence_14 = { 31c0 b958000000 8b559c 8b75b0 035604 8b7e50 }
            // n = 6, score = 100
            //   31c0                 | xor                 eax, eax
            //   b958000000           | mov                 ecx, 0x58
            //   8b559c               | mov                 edx, dword ptr [ebp - 0x64]
            //   8b75b0               | mov                 esi, dword ptr [ebp - 0x50]
            //   035604               | add                 edx, dword ptr [esi + 4]
            //   8b7e50               | mov                 edi, dword ptr [esi + 0x50]

        $sequence_15 = { f6c601 8b4dd4 8975cc 897dc8 895dc4 894dc0 0f85bc000000 }
            // n = 7, score = 100
            //   f6c601               | test                dh, 1
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   8975cc               | mov                 dword ptr [ebp - 0x34], esi
            //   897dc8               | mov                 dword ptr [ebp - 0x38], edi
            //   895dc4               | mov                 dword ptr [ebp - 0x3c], ebx
            //   894dc0               | mov                 dword ptr [ebp - 0x40], ecx
            //   0f85bc000000         | jne                 0xc2

        $sequence_16 = { c1eb1d 898554ffffff 8b45f0 3508fcb97e 21fb }
            // n = 5, score = 100
            //   c1eb1d               | shr                 ebx, 0x1d
            //   898554ffffff         | mov                 dword ptr [ebp - 0xac], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   3508fcb97e           | xor                 eax, 0x7eb9fc08
            //   21fb                 | and                 ebx, edi

        $sequence_17 = { c20400 53 6861c1a23d 689e81b24d }
            // n = 4, score = 100
            //   c20400               | ret                 4
            //   53                   | push                ebx
            //   6861c1a23d           | push                0x3da2c161
            //   689e81b24d           | push                0x4db2819e

    condition:
        7 of them and filesize < 7266304
}