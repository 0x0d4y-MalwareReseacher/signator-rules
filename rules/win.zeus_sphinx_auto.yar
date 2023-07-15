rule win_zeus_sphinx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.zeus_sphinx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_sphinx"
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
        $sequence_0 = { 50 e8???????? 83c410 c7473400000000 51 51 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c7473400000000       | mov                 dword ptr [edi + 0x34], 0
            //   51                   | push                ecx
            //   51                   | push                ecx

        $sequence_1 = { 52 52 8b44241c 50 8b44244c }
            // n = 5, score = 400
            //   52                   | push                edx
            //   52                   | push                edx
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   50                   | push                eax
            //   8b44244c             | mov                 eax, dword ptr [esp + 0x4c]

        $sequence_2 = { 50 e8???????? 83c410 c78324020000ffffffff c7832802000000000000 5b }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c78324020000ffffffff     | mov    dword ptr [ebx + 0x224], 0xffffffff
            //   c7832802000000000000     | mov    dword ptr [ebx + 0x228], 0
            //   5b                   | pop                 ebx

        $sequence_3 = { 50 e8???????? 83c410 c745f0ffffffff 85c0 742c }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c745f0ffffffff       | mov                 dword ptr [ebp - 0x10], 0xffffffff
            //   85c0                 | test                eax, eax
            //   742c                 | je                  0x2e

        $sequence_4 = { 50 e8???????? 83c410 c785b8e7ffff00000000 85c0 0f8497000000 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c785b8e7ffff00000000     | mov    dword ptr [ebp - 0x1848], 0
            //   85c0                 | test                eax, eax
            //   0f8497000000         | je                  0x9d

        $sequence_5 = { 50 e8???????? 83c410 c78570ffffff00000000 85c0 7454 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c78570ffffff00000000     | mov    dword ptr [ebp - 0x90], 0
            //   85c0                 | test                eax, eax
            //   7454                 | je                  0x56

        $sequence_6 = { 50 e8???????? 83c410 c7462800000000 85db 0f848d000000 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c7462800000000       | mov                 dword ptr [esi + 0x28], 0
            //   85db                 | test                ebx, ebx
            //   0f848d000000         | je                  0x93

        $sequence_7 = { 50 e8???????? 83c410 c74604ffffffff 897508 8d65f4 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c74604ffffffff       | mov                 dword ptr [esi + 4], 0xffffffff
            //   897508               | mov                 dword ptr [ebp + 8], esi
            //   8d65f4               | lea                 esp, [ebp - 0xc]

        $sequence_8 = { 01fc eb98 035e14 8ade }
            // n = 4, score = 100
            //   01fc                 | add                 esp, edi
            //   eb98                 | jmp                 0xffffff9a
            //   035e14               | add                 ebx, dword ptr [esi + 0x14]
            //   8ade                 | mov                 bl, dh

        $sequence_9 = { 010d???????? 60 5a 98 }
            // n = 4, score = 100
            //   010d????????         |                     
            //   60                   | pushal              
            //   5a                   | pop                 edx
            //   98                   | cwde                

        $sequence_10 = { 0008 d7 9f b2d3 }
            // n = 4, score = 100
            //   0008                 | add                 byte ptr [eax], cl
            //   d7                   | xlatb               
            //   9f                   | lahf                
            //   b2d3                 | mov                 dl, 0xd3

        $sequence_11 = { 0162c9 cf 0c06 3c3e }
            // n = 4, score = 100
            //   0162c9               | add                 dword ptr [edx - 0x37], esp
            //   cf                   | iretd               
            //   0c06                 | or                  al, 6
            //   3c3e                 | cmp                 al, 0x3e

        $sequence_12 = { 0303 50 ff550c 8b3e }
            // n = 4, score = 100
            //   0303                 | add                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   ff550c               | call                dword ptr [ebp + 0xc]
            //   8b3e                 | mov                 edi, dword ptr [esi]

        $sequence_13 = { 010c02 3bf7 0f85f0f50000 e9???????? }
            // n = 4, score = 100
            //   010c02               | add                 dword ptr [edx + eax], ecx
            //   3bf7                 | cmp                 esi, edi
            //   0f85f0f50000         | jne                 0xf5f6
            //   e9????????           |                     

        $sequence_14 = { 020a 42 1af6 af }
            // n = 4, score = 100
            //   020a                 | add                 cl, byte ptr [edx]
            //   42                   | inc                 edx
            //   1af6                 | sbb                 dh, dh
            //   af                   | scasd               eax, dword ptr es:[edi]

        $sequence_15 = { 003b c09bdbe23ea11c 695600663ec700 de07 }
            // n = 4, score = 100
            //   003b                 | add                 byte ptr [ebx], bh
            //   c09bdbe23ea11c       | rcr                 byte ptr [ebx - 0x5ec11d25], 0x1c
            //   695600663ec700       | imul                edx, dword ptr [esi], 0xc73e66
            //   de07                 | fiadd               word ptr [edi]

    condition:
        7 of them and filesize < 3268608
}