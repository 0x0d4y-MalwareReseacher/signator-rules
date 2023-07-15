rule win_httpbrowser_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.httpbrowser."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.httpbrowser"
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
        $sequence_0 = { 8d8de8fdffff 51 c785ecfdffff00010000 89bdf0fdffff ffd0 }
            // n = 5, score = 200
            //   8d8de8fdffff         | lea                 ecx, [ebp - 0x218]
            //   51                   | push                ecx
            //   c785ecfdffff00010000     | mov    dword ptr [ebp - 0x214], 0x100
            //   89bdf0fdffff         | mov                 dword ptr [ebp - 0x210], edi
            //   ffd0                 | call                eax

        $sequence_1 = { 56 53 ff15???????? 3bc7 7415 33ff }
            // n = 6, score = 200
            //   56                   | push                esi
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   3bc7                 | cmp                 eax, edi
            //   7415                 | je                  0x17
            //   33ff                 | xor                 edi, edi

        $sequence_2 = { 83c40c 33c0 56 66898578fbffff }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   33c0                 | xor                 eax, eax
            //   56                   | push                esi
            //   66898578fbffff       | mov                 word ptr [ebp - 0x488], ax

        $sequence_3 = { 3bfe 7e0d 56 ffb5f4fdffff ff15???????? ffb5f4fdffff ff15???????? }
            // n = 7, score = 200
            //   3bfe                 | cmp                 edi, esi
            //   7e0d                 | jle                 0xf
            //   56                   | push                esi
            //   ffb5f4fdffff         | push                dword ptr [ebp - 0x20c]
            //   ff15????????         |                     
            //   ffb5f4fdffff         | push                dword ptr [ebp - 0x20c]
            //   ff15????????         |                     

        $sequence_4 = { 50 89b598fdffff e8???????? 33c0 89b5e4fdffff }
            // n = 5, score = 200
            //   50                   | push                eax
            //   89b598fdffff         | mov                 dword ptr [ebp - 0x268], esi
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   89b5e4fdffff         | mov                 dword ptr [ebp - 0x21c], esi

        $sequence_5 = { 48 48 0f841e030000 83e80d 0f8428030000 2df0000000 741d }
            // n = 7, score = 200
            //   48                   | dec                 eax
            //   48                   | dec                 eax
            //   0f841e030000         | je                  0x324
            //   83e80d               | sub                 eax, 0xd
            //   0f8428030000         | je                  0x32e
            //   2df0000000           | sub                 eax, 0xf0
            //   741d                 | je                  0x1f

        $sequence_6 = { ffb5c4fcffff ff95b8fcffff 3b85bcfcffff 0f857f020000 833e01 }
            // n = 5, score = 200
            //   ffb5c4fcffff         | push                dword ptr [ebp - 0x33c]
            //   ff95b8fcffff         | call                dword ptr [ebp - 0x348]
            //   3b85bcfcffff         | cmp                 eax, dword ptr [ebp - 0x344]
            //   0f857f020000         | jne                 0x285
            //   833e01               | cmp                 dword ptr [esi], 1

        $sequence_7 = { 50 8d85c855ffff 50 ffd6 68???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8d85c855ffff         | lea                 eax, [ebp - 0xaa38]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     

        $sequence_8 = { 8bde c1fa05 83e31f 8b149500644100 f644da0480 7428 8bd1 }
            // n = 7, score = 100
            //   8bde                 | mov                 ebx, esi
            //   c1fa05               | sar                 edx, 5
            //   83e31f               | and                 ebx, 0x1f
            //   8b149500644100       | mov                 edx, dword ptr [edx*4 + 0x416400]
            //   f644da0480           | test                byte ptr [edx + ebx*8 + 4], 0x80
            //   7428                 | je                  0x2a
            //   8bd1                 | mov                 edx, ecx

        $sequence_9 = { 56 b8???????? 7415 8d3449 8d34b5f8254100 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   b8????????           |                     
            //   7415                 | je                  0x17
            //   8d3449               | lea                 esi, [ecx + ecx*2]
            //   8d34b5f8254100       | lea                 esi, [esi*4 + 0x4125f8]

        $sequence_10 = { 85c0 0f849c040000 8b4df8 8d45fc 50 }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   0f849c040000         | je                  0x4a2
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

        $sequence_11 = { 56 a3???????? e8???????? 68ca13d31c 56 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   a3????????           |                     
            //   e8????????           |                     
            //   68ca13d31c           | push                0x1cd313ca
            //   56                   | push                esi

        $sequence_12 = { c7420400000000 50 55 8bec 9c 6841061504 }
            // n = 6, score = 100
            //   c7420400000000       | mov                 dword ptr [edx + 4], 0
            //   50                   | push                eax
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   9c                   | pushfd              
            //   6841061504           | push                0x4150641

        $sequence_13 = { 66899514fdffff f3ab 66ab 8d8514fdffff 682c010000 50 }
            // n = 6, score = 100
            //   66899514fdffff       | mov                 word ptr [ebp - 0x2ec], dx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   8d8514fdffff         | lea                 eax, [ebp - 0x2ec]
            //   682c010000           | push                0x12c
            //   50                   | push                eax

        $sequence_14 = { 745c 8bce 33c0 8bfa c1e902 f3ab }
            // n = 6, score = 100
            //   745c                 | je                  0x5e
            //   8bce                 | mov                 ecx, esi
            //   33c0                 | xor                 eax, eax
            //   8bfa                 | mov                 edi, edx
            //   c1e902               | shr                 ecx, 2
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_15 = { 760a c705????????16000000 c3 8b442404 3b05???????? 7203 33c0 }
            // n = 7, score = 100
            //   760a                 | jbe                 0xc
            //   c705????????16000000     |     
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   3b05????????         |                     
            //   7203                 | jb                  5
            //   33c0                 | xor                 eax, eax

    condition:
        7 of them and filesize < 188416
}