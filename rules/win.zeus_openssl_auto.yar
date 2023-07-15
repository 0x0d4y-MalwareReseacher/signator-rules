rule win_zeus_openssl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.zeus_openssl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_openssl"
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
        $sequence_0 = { ba10000000 83fb0a 0f8fed000000 0fb7b0c20a0000 2bd6 8975e4 3bca }
            // n = 7, score = 1300
            //   ba10000000           | mov                 edx, 0x10
            //   83fb0a               | cmp                 ebx, 0xa
            //   0f8fed000000         | jg                  0xf3
            //   0fb7b0c20a0000       | movzx               esi, word ptr [eax + 0xac2]
            //   2bd6                 | sub                 edx, esi
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   3bca                 | cmp                 ecx, edx

        $sequence_1 = { 660184513c0b0000 660107 83ee02 85f6 7fc4 8b75f8 }
            // n = 6, score = 1300
            //   660184513c0b0000     | add                 word ptr [ecx + edx*2 + 0xb3c], ax
            //   660107               | add                 word ptr [edi], ax
            //   83ee02               | sub                 esi, 2
            //   85f6                 | test                esi, esi
            //   7fc4                 | jg                  0xffffffc6
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]

        $sequence_2 = { 8b5dfc 2bf1 8b7df4 8bc8 c1e908 0fb6c9 018fc41b0000 }
            // n = 7, score = 1300
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   2bf1                 | sub                 esi, ecx
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   8bc8                 | mov                 ecx, eax
            //   c1e908               | shr                 ecx, 8
            //   0fb6c9               | movzx               ecx, cl
            //   018fc41b0000         | add                 dword ptr [edi + 0x1bc4], ecx

        $sequence_3 = { 66d3ef 83c0f5 6689beb8160000 eb11 8b4508 48 66d3e0 }
            // n = 7, score = 1300
            //   66d3ef               | shr                 di, cl
            //   83c0f5               | add                 eax, -0xb
            //   6689beb8160000       | mov                 word ptr [esi + 0x16b8], di
            //   eb11                 | jmp                 0x13
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   48                   | dec                 eax
            //   66d3e0               | shl                 ax, cl

        $sequence_4 = { 5b 8bcf e8???????? eb0f 6a09 }
            // n = 5, score = 1300
            //   5b                   | pop                 ebx
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   eb0f                 | jmp                 0x11
            //   6a09                 | push                9

        $sequence_5 = { 0f8580010000 8d43f8 83f807 0f8774010000 83f909 }
            // n = 5, score = 1300
            //   0f8580010000         | jne                 0x186
            //   8d43f8               | lea                 eax, [ebx - 8]
            //   83f807               | cmp                 eax, 7
            //   0f8774010000         | ja                  0x17a
            //   83f909               | cmp                 ecx, 9

        $sequence_6 = { 85d2 0f95c0 83caff 8d4df0 }
            // n = 4, score = 1300
            //   85d2                 | test                edx, edx
            //   0f95c0               | setne               al
            //   83caff               | or                  edx, 0xffffffff
            //   8d4df0               | lea                 ecx, [ebp - 0x10]

        $sequence_7 = { f6c520 7407 814a1800900000 5e a810 }
            // n = 5, score = 1300
            //   f6c520               | test                ch, 0x20
            //   7407                 | je                  9
            //   814a1800900000       | or                  dword ptr [edx + 0x18], 0x9000
            //   5e                   | pop                 esi
            //   a810                 | test                al, 0x10

        $sequence_8 = { f645fb01 7523 fec8 eb22 8a45fc c645f001 }
            // n = 6, score = 1300
            //   f645fb01             | test                byte ptr [ebp - 5], 1
            //   7523                 | jne                 0x25
            //   fec8                 | dec                 al
            //   eb22                 | jmp                 0x24
            //   8a45fc               | mov                 al, byte ptr [ebp - 4]
            //   c645f001             | mov                 byte ptr [ebp - 0x10], 1

        $sequence_9 = { 8b55f4 8bc6 2b45c0 3bd0 0f860d010000 8bca 2bc8 }
            // n = 7, score = 1300
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8bc6                 | mov                 eax, esi
            //   2b45c0               | sub                 eax, dword ptr [ebp - 0x40]
            //   3bd0                 | cmp                 edx, eax
            //   0f860d010000         | jbe                 0x113
            //   8bca                 | mov                 ecx, edx
            //   2bc8                 | sub                 ecx, eax

    condition:
        7 of them and filesize < 4546560
}