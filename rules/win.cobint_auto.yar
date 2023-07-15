rule win_cobint_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.cobint."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cobint"
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
        $sequence_0 = { 8906 8b3d???????? 8bd7 391a }
            // n = 4, score = 400
            //   8906                 | mov                 dword ptr [esi], eax
            //   8b3d????????         |                     
            //   8bd7                 | mov                 edx, edi
            //   391a                 | cmp                 dword ptr [edx], ebx

        $sequence_1 = { 83c420 5f c3 55 8bec 83ec40 }
            // n = 6, score = 400
            //   83c420               | add                 esp, 0x20
            //   5f                   | pop                 edi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec40               | sub                 esp, 0x40

        $sequence_2 = { bb00400000 53 57 56 8b35???????? }
            // n = 5, score = 400
            //   bb00400000           | mov                 ebx, 0x4000
            //   53                   | push                ebx
            //   57                   | push                edi
            //   56                   | push                esi
            //   8b35????????         |                     

        $sequence_3 = { 83c410 33c0 50 50 57 68???????? }
            // n = 6, score = 400
            //   83c410               | add                 esp, 0x10
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   50                   | push                eax
            //   57                   | push                edi
            //   68????????           |                     

        $sequence_4 = { 8b1c31 83e804 83f804 0f8cd3000000 8b543104 }
            // n = 5, score = 400
            //   8b1c31               | mov                 ebx, dword ptr [ecx + esi]
            //   83e804               | sub                 eax, 4
            //   83f804               | cmp                 eax, 4
            //   0f8cd3000000         | jl                  0xd9
            //   8b543104             | mov                 edx, dword ptr [ecx + esi + 4]

        $sequence_5 = { 215df8 8d45f8 50 8d45f4 c745f404000000 50 8d4508 }
            // n = 7, score = 400
            //   215df8               | and                 dword ptr [ebp - 8], ebx
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   c745f404000000       | mov                 dword ptr [ebp - 0xc], 4
            //   50                   | push                eax
            //   8d4508               | lea                 eax, [ebp + 8]

        $sequence_6 = { 83f820 7cf3 eb07 8bf0 c1e604 03f2 57 }
            // n = 7, score = 400
            //   83f820               | cmp                 eax, 0x20
            //   7cf3                 | jl                  0xfffffff5
            //   eb07                 | jmp                 9
            //   8bf0                 | mov                 esi, eax
            //   c1e604               | shl                 esi, 4
            //   03f2                 | add                 esi, edx
            //   57                   | push                edi

        $sequence_7 = { 6a0a 5a 52 eb04 6a02 }
            // n = 5, score = 400
            //   6a0a                 | push                0xa
            //   5a                   | pop                 edx
            //   52                   | push                edx
            //   eb04                 | jmp                 6
            //   6a02                 | push                2

        $sequence_8 = { 90 bdfd807c90 90 90 90 90 90 }
            // n = 7, score = 200
            //   90                   | nop                 
            //   bdfd807c90           | mov                 ebp, 0x907c80fd
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 

        $sequence_9 = { 7cd7 9b 807c909090 90 90 90 }
            // n = 6, score = 200
            //   7cd7                 | jl                  0xffffffd9
            //   9b                   | wait                
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 

        $sequence_10 = { 8bcf 0fb6c0 c1c108 03c7 }
            // n = 4, score = 200
            //   8bcf                 | mov                 ecx, edi
            //   0fb6c0               | movzx               eax, al
            //   c1c108               | rol                 ecx, 8
            //   03c7                 | add                 eax, edi

        $sequence_11 = { b301 885dff 84db 0f8477fdffff 5f 5e }
            // n = 6, score = 200
            //   b301                 | mov                 bl, 1
            //   885dff               | mov                 byte ptr [ebp - 1], bl
            //   84db                 | test                bl, bl
            //   0f8477fdffff         | je                  0xfffffd7d
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_12 = { ffd6 8bd8 895db4 85db 0f8487010000 }
            // n = 5, score = 200
            //   ffd6                 | call                esi
            //   8bd8                 | mov                 ebx, eax
            //   895db4               | mov                 dword ptr [ebp - 0x4c], ebx
            //   85db                 | test                ebx, ebx
            //   0f8487010000         | je                  0x18d

        $sequence_13 = { e8???????? 8bf0 8d8524feffff 50 ffd7 ba96dc0257 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8d8524feffff         | lea                 eax, [ebp - 0x1dc]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   ba96dc0257           | mov                 edx, 0x5702dc96

        $sequence_14 = { 90 e10b 96 7c90 }
            // n = 4, score = 200
            //   90                   | nop                 
            //   e10b                 | loope               0xd
            //   96                   | xchg                eax, esi
            //   7c90                 | jl                  0xffffff92

        $sequence_15 = { 90 90 749b 807ce19a80 7c90 }
            // n = 5, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   749b                 | je                  0xffffff9d
            //   807ce19a80           | cmp                 byte ptr [ecx - 0x66], 0x80
            //   7c90                 | jl                  0xffffff92

        $sequence_16 = { 037dec 8d45ec 50 b800a80000 2bc7 50 }
            // n = 6, score = 200
            //   037dec               | add                 edi, dword ptr [ebp - 0x14]
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   b800a80000           | mov                 eax, 0xa800
            //   2bc7                 | sub                 eax, edi
            //   50                   | push                eax

        $sequence_17 = { 8b5508 0355f0 8a45ec 8802 eb0b }
            // n = 5, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0355f0               | add                 edx, dword ptr [ebp - 0x10]
            //   8a45ec               | mov                 al, byte ptr [ebp - 0x14]
            //   8802                 | mov                 byte ptr [edx], al
            //   eb0b                 | jmp                 0xd

        $sequence_18 = { 8802 eb0b 8b4d08 034df0 8a55ed }
            // n = 5, score = 200
            //   8802                 | mov                 byte ptr [edx], al
            //   eb0b                 | jmp                 0xd
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   034df0               | add                 ecx, dword ptr [ebp - 0x10]
            //   8a55ed               | mov                 dl, byte ptr [ebp - 0x13]

        $sequence_19 = { 8bcf e8???????? ba94681a06 8945e4 8bcf e8???????? }
            // n = 6, score = 200
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   ba94681a06           | mov                 edx, 0x61a6894
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_20 = { 90 90 bffc807c28 1a807c170e81 7cd7 9b 807c909090 }
            // n = 7, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   bffc807c28           | mov                 edi, 0x287c80fc
            //   1a807c170e81         | sbb                 al, byte ptr [eax - 0x7ef1e884]
            //   7cd7                 | jl                  0xffffffd9
            //   9b                   | wait                
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90

        $sequence_21 = { 58 83c005 c3 31b7807c30ae 807c909090 }
            // n = 5, score = 200
            //   58                   | pop                 eax
            //   83c005               | add                 eax, 5
            //   c3                   | ret                 
            //   31b7807c30ae         | xor                 dword ptr [edi - 0x51cf8380], esi
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90

        $sequence_22 = { 8802 42 46 83e603 84c0 }
            // n = 5, score = 200
            //   8802                 | mov                 byte ptr [edx], al
            //   42                   | inc                 edx
            //   46                   | inc                 esi
            //   83e603               | and                 esi, 3
            //   84c0                 | test                al, al

        $sequence_23 = { 8945f8 51 6800a80000 56 53 }
            // n = 5, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   51                   | push                ecx
            //   6800a80000           | push                0xa800
            //   56                   | push                esi
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 65536
}