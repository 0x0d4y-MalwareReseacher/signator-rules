rule win_gup_proxy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.gup_proxy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gup_proxy"
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
        $sequence_0 = { 8d442424 50 687e660480 57 }
            // n = 4, score = 100
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax
            //   687e660480           | push                0x8004667e
            //   57                   | push                edi

        $sequence_1 = { 8b4d08 33c0 3b0cc528804100 7427 40 }
            // n = 5, score = 100
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   33c0                 | xor                 eax, eax
            //   3b0cc528804100       | cmp                 ecx, dword ptr [eax*8 + 0x418028]
            //   7427                 | je                  0x29
            //   40                   | inc                 eax

        $sequence_2 = { 8b0c8d10974100 c644390400 85f6 740c 56 e8???????? 59 }
            // n = 7, score = 100
            //   8b0c8d10974100       | mov                 ecx, dword ptr [ecx*4 + 0x419710]
            //   c644390400           | mov                 byte ptr [ecx + edi + 4], 0
            //   85f6                 | test                esi, esi
            //   740c                 | je                  0xe
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_3 = { 83c10c 8b048510974100 03c1 50 }
            // n = 4, score = 100
            //   83c10c               | add                 ecx, 0xc
            //   8b048510974100       | mov                 eax, dword ptr [eax*4 + 0x419710]
            //   03c1                 | add                 eax, ecx
            //   50                   | push                eax

        $sequence_4 = { c7461000000000 837e1410 7204 8b0e eb02 8bce }
            // n = 6, score = 100
            //   c7461000000000       | mov                 dword ptr [esi + 0x10], 0
            //   837e1410             | cmp                 dword ptr [esi + 0x14], 0x10
            //   7204                 | jb                  6
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   eb02                 | jmp                 4
            //   8bce                 | mov                 ecx, esi

        $sequence_5 = { c1e706 8b0c8d10974100 c644390400 85f6 740c 56 e8???????? }
            // n = 7, score = 100
            //   c1e706               | shl                 edi, 6
            //   8b0c8d10974100       | mov                 ecx, dword ptr [ecx*4 + 0x419710]
            //   c644390400           | mov                 byte ptr [ecx + edi + 4], 0
            //   85f6                 | test                esi, esi
            //   740c                 | je                  0xe
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_6 = { c744245400000000 c644244400 720c ff74242c e8???????? 83c404 ff742414 }
            // n = 7, score = 100
            //   c744245400000000     | mov                 dword ptr [esp + 0x54], 0
            //   c644244400           | mov                 byte ptr [esp + 0x44], 0
            //   720c                 | jb                  0xe
            //   ff74242c             | push                dword ptr [esp + 0x2c]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ff742414             | push                dword ptr [esp + 0x14]

        $sequence_7 = { c74424580f000000 c744245400000000 c644244400 720c ff74242c }
            // n = 5, score = 100
            //   c74424580f000000     | mov                 dword ptr [esp + 0x58], 0xf
            //   c744245400000000     | mov                 dword ptr [esp + 0x54], 0
            //   c644244400           | mov                 byte ptr [esp + 0x44], 0
            //   720c                 | jb                  0xe
            //   ff74242c             | push                dword ptr [esp + 0x2c]

        $sequence_8 = { 894de4 83f905 7d10 668b444b0c 6689044d5c9f4100 41 }
            // n = 6, score = 100
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   83f905               | cmp                 ecx, 5
            //   7d10                 | jge                 0x12
            //   668b444b0c           | mov                 ax, word ptr [ebx + ecx*2 + 0xc]
            //   6689044d5c9f4100     | mov                 word ptr [ecx*2 + 0x419f5c], ax
            //   41                   | inc                 ecx

        $sequence_9 = { 03d8 0fb6420e 03c8 0fb6420d c1e108 }
            // n = 5, score = 100
            //   03d8                 | add                 ebx, eax
            //   0fb6420e             | movzx               eax, byte ptr [edx + 0xe]
            //   03c8                 | add                 ecx, eax
            //   0fb6420d             | movzx               eax, byte ptr [edx + 0xd]
            //   c1e108               | shl                 ecx, 8

    condition:
        7 of them and filesize < 247808
}