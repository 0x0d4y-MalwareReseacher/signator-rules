rule win_bhunt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.bhunt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bhunt"
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
        $sequence_0 = { ff75fc 8bf8 ff75f8 ff7610 ffd3 3bc7 0f85b4010000 }
            // n = 7, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   8bf8                 | mov                 edi, eax
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff7610               | push                dword ptr [esi + 0x10]
            //   ffd3                 | call                ebx
            //   3bc7                 | cmp                 eax, edi
            //   0f85b4010000         | jne                 0x1ba

        $sequence_1 = { f6d6 894504 9c f6d6 8f442500 d2d2 8dbffcffffff }
            // n = 7, score = 100
            //   f6d6                 | not                 dh
            //   894504               | mov                 dword ptr [ebp + 4], eax
            //   9c                   | pushfd              
            //   f6d6                 | not                 dh
            //   8f442500             | pop                 dword ptr [ebp]
            //   d2d2                 | rcl                 dl, cl
            //   8dbffcffffff         | lea                 edi, [edi - 4]

        $sequence_2 = { 8bbf2fff1500 8bda c6c72b 8dbfea4c4f03 8bdf 66bf1025 0f4dff }
            // n = 7, score = 100
            //   8bbf2fff1500         | mov                 edi, dword ptr [edi + 0x15ff2f]
            //   8bda                 | mov                 ebx, edx
            //   c6c72b               | mov                 bh, 0x2b
            //   8dbfea4c4f03         | lea                 edi, [edi + 0x34f4cea]
            //   8bdf                 | mov                 ebx, edi
            //   66bf1025             | mov                 di, 0x2510
            //   0f4dff               | cmovge              edi, edi

        $sequence_3 = { f6d9 6698 80c1b6 80f1eb 33c6 8ae0 80c153 }
            // n = 7, score = 100
            //   f6d9                 | neg                 cl
            //   6698                 | cbw                 
            //   80c1b6               | add                 cl, 0xb6
            //   80f1eb               | xor                 cl, 0xeb
            //   33c6                 | xor                 eax, esi
            //   8ae0                 | mov                 ah, al
            //   80c153               | add                 cl, 0x53

        $sequence_4 = { f5 f7d2 f8 f7c4175b257c 0fca 81eaa44d113b 81fde2287969 }
            // n = 7, score = 100
            //   f5                   | cmc                 
            //   f7d2                 | not                 edx
            //   f8                   | clc                 
            //   f7c4175b257c         | test                esp, 0x7c255b17
            //   0fca                 | bswap               edx
            //   81eaa44d113b         | sub                 edx, 0x3b114da4
            //   81fde2287969         | cmp                 ebp, 0x697928e2

        $sequence_5 = { 89b42420010000 8b742424 8bde c1cb0d 8bfe c1c70a 33df }
            // n = 7, score = 100
            //   89b42420010000       | mov                 dword ptr [esp + 0x120], esi
            //   8b742424             | mov                 esi, dword ptr [esp + 0x24]
            //   8bde                 | mov                 ebx, esi
            //   c1cb0d               | ror                 ebx, 0xd
            //   8bfe                 | mov                 edi, esi
            //   c1c70a               | rol                 edi, 0xa
            //   33df                 | xor                 ebx, edi

        $sequence_6 = { 85de 81e6ff000000 f7c43c449e30 81fd40568d14 8b34b54cdd7500 81f93968b112 66f7c63a12 }
            // n = 7, score = 100
            //   85de                 | test                esi, ebx
            //   81e6ff000000         | and                 esi, 0xff
            //   f7c43c449e30         | test                esp, 0x309e443c
            //   81fd40568d14         | cmp                 ebp, 0x148d5640
            //   8b34b54cdd7500       | mov                 esi, dword ptr [esi*4 + 0x75dd4c]
            //   81f93968b112         | cmp                 ecx, 0x12b16839
            //   66f7c63a12           | test                si, 0x123a

        $sequence_7 = { 50 e8???????? 85c0 75b0 47 3bbe14030000 7ce3 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   75b0                 | jne                 0xffffffb2
            //   47                   | inc                 edi
            //   3bbe14030000         | cmp                 edi, dword ptr [esi + 0x314]
            //   7ce3                 | jl                  0xffffffe5

        $sequence_8 = { 89442500 3bce 660f4ed6 8dbffcffffff 660fabd2 33d0 8b17 }
            // n = 7, score = 100
            //   89442500             | mov                 dword ptr [ebp], eax
            //   3bce                 | cmp                 ecx, esi
            //   660f4ed6             | cmovle              dx, si
            //   8dbffcffffff         | lea                 edi, [edi - 4]
            //   660fabd2             | bts                 dx, dx
            //   33d0                 | xor                 edx, eax
            //   8b17                 | mov                 edx, dword ptr [edi]

        $sequence_9 = { f8 6685f0 8d92030ca03f f9 84ed f7d2 f5 }
            // n = 7, score = 100
            //   f8                   | clc                 
            //   6685f0               | test                ax, si
            //   8d92030ca03f         | lea                 edx, [edx + 0x3fa00c03]
            //   f9                   | stc                 
            //   84ed                 | test                ch, ch
            //   f7d2                 | not                 edx
            //   f5                   | cmc                 

    condition:
        7 of them and filesize < 19161088
}