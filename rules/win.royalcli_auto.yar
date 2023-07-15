rule win_royalcli_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.royalcli."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.royalcli"
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
        $sequence_0 = { 8bd1 c1fa05 c1e006 030495c04b4100 eb05 b8???????? f6400420 }
            // n = 7, score = 100
            //   8bd1                 | mov                 edx, ecx
            //   c1fa05               | sar                 edx, 5
            //   c1e006               | shl                 eax, 6
            //   030495c04b4100       | add                 eax, dword ptr [edx*4 + 0x414bc0]
            //   eb05                 | jmp                 7
            //   b8????????           |                     
            //   f6400420             | test                byte ptr [eax + 4], 0x20

        $sequence_1 = { 8bf0 83feff 0f8492000000 85f6 0f848a000000 }
            // n = 5, score = 100
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1
            //   0f8492000000         | je                  0x98
            //   85f6                 | test                esi, esi
            //   0f848a000000         | je                  0x90

        $sequence_2 = { 8945fc 56 57 8bf9 8bc2 89bdfcfeffff 8d7001 }
            // n = 7, score = 100
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8bc2                 | mov                 eax, edx
            //   89bdfcfeffff         | mov                 dword ptr [ebp - 0x104], edi
            //   8d7001               | lea                 esi, [eax + 1]

        $sequence_3 = { 56 6820010000 6a01 57 e8???????? 56 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   6820010000           | push                0x120
            //   6a01                 | push                1
            //   57                   | push                edi
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_4 = { 8be5 5d c3 8d45f0 50 6a00 }
            // n = 6, score = 100
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_5 = { 8955f4 66894df8 ff15???????? 8bf0 83feff 0f84f9000000 }
            // n = 6, score = 100
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   66894df8             | mov                 word ptr [ebp - 8], cx
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1
            //   0f84f9000000         | je                  0xff

        $sequence_6 = { 85c0 0f88bc000000 8b854cf7ffff 8b08 8d9550f7ffff 52 50 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f88bc000000         | js                  0xc2
            //   8b854cf7ffff         | mov                 eax, dword ptr [ebp - 0x8b4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d9550f7ffff         | lea                 edx, [ebp - 0x8b0]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_7 = { 8b3c06 3b38 7508 83e904 83c004 ebec ff45e4 }
            // n = 7, score = 100
            //   8b3c06               | mov                 edi, dword ptr [esi + eax]
            //   3b38                 | cmp                 edi, dword ptr [eax]
            //   7508                 | jne                 0xa
            //   83e904               | sub                 ecx, 4
            //   83c004               | add                 eax, 4
            //   ebec                 | jmp                 0xffffffee
            //   ff45e4               | inc                 dword ptr [ebp - 0x1c]

        $sequence_8 = { 5b 8be5 5d c3 c604313d }
            // n = 5, score = 100
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   c604313d             | mov                 byte ptr [ecx + esi], 0x3d

        $sequence_9 = { 0f8ea4000000 8b00 8945f8 90 b856555555 }
            // n = 5, score = 100
            //   0f8ea4000000         | jle                 0xaa
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   90                   | nop                 
            //   b856555555           | mov                 eax, 0x55555556

    condition:
        7 of them and filesize < 204800
}