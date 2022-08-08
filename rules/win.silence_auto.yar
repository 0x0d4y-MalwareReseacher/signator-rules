rule win_silence_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.silence."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.silence"
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
        $sequence_0 = { 50 6a00 6a00 68???????? c745fc00000000 }
            // n = 5, score = 1800
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0

        $sequence_1 = { cc 8325????????00 c3 6a08 68???????? e8???????? e8???????? }
            // n = 7, score = 1800
            //   cc                   | int3                
            //   8325????????00       |                     
            //   c3                   | ret                 
            //   6a08                 | push                8
            //   68????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_2 = { 40 84c9 75f4 eb05 }
            // n = 4, score = 1800
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f4                 | jne                 0xfffffff6
            //   eb05                 | jmp                 7

        $sequence_3 = { 50 683f020f00 6a00 68???????? 6801000080 ff15???????? 68???????? }
            // n = 7, score = 1700
            //   50                   | push                eax
            //   683f020f00           | push                0xf023f
            //   6a00                 | push                0
            //   68????????           |                     
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_4 = { 6801000080 ff15???????? 56 8d85f8feffff }
            // n = 4, score = 1600
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   56                   | push                esi
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]

        $sequence_5 = { ff15???????? 6a00 6800000004 6a00 6a00 }
            // n = 5, score = 1600
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6800000004           | push                0x4000000
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_6 = { 68???????? ffd6 8b45fc 85c0 }
            // n = 4, score = 1600
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   85c0                 | test                eax, eax

        $sequence_7 = { 46 56 8d85f8feffff 50 }
            // n = 4, score = 1600
            //   46                   | inc                 esi
            //   56                   | push                esi
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]
            //   50                   | push                eax

        $sequence_8 = { 3b0d???????? 7502 f3c3 e9???????? e8???????? e9???????? }
            // n = 6, score = 1600
            //   3b0d????????         |                     
            //   7502                 | jne                 4
            //   f3c3                 | ret                 
            //   e9????????           |                     
            //   e8????????           |                     
            //   e9????????           |                     

        $sequence_9 = { 84c9 75f4 eb0d 803800 7408 8a5a01 42 }
            // n = 7, score = 1400
            //   84c9                 | test                cl, cl
            //   75f4                 | jne                 0xfffffff6
            //   eb0d                 | jmp                 0xf
            //   803800               | cmp                 byte ptr [eax], 0
            //   7408                 | je                  0xa
            //   8a5a01               | mov                 bl, byte ptr [edx + 1]
            //   42                   | inc                 edx

        $sequence_10 = { 8bd8 68???????? 53 ff15???????? 6a00 6a00 }
            // n = 6, score = 1400
            //   8bd8                 | mov                 ebx, eax
            //   68????????           |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_11 = { 55 8bec 51 56 8b35???????? 6a00 6a00 }
            // n = 7, score = 1400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   56                   | push                esi
            //   8b35????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_12 = { 6a00 6a00 8bf8 6a00 57 ff15???????? 8d45fc }
            // n = 7, score = 1400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8bf8                 | mov                 edi, eax
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_13 = { 8bc6 5e 5b 5d c3 c60200 }
            // n = 6, score = 1400
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   c60200               | mov                 byte ptr [edx], 0

        $sequence_14 = { 3acb 740a 8a4801 40 }
            // n = 4, score = 1400
            //   3acb                 | cmp                 cl, bl
            //   740a                 | je                  0xc
            //   8a4801               | mov                 cl, byte ptr [eax + 1]
            //   40                   | inc                 eax

        $sequence_15 = { 50 6800080000 8d85bcf7ffff 50 56 ff15???????? 8b85b8f7ffff }
            // n = 7, score = 1200
            //   50                   | push                eax
            //   6800080000           | push                0x800
            //   8d85bcf7ffff         | lea                 eax, [ebp - 0x844]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b85b8f7ffff         | mov                 eax, dword ptr [ebp - 0x848]

        $sequence_16 = { ff15???????? 8b85b8f7ffff 85c0 75b6 }
            // n = 4, score = 1200
            //   ff15????????         |                     
            //   8b85b8f7ffff         | mov                 eax, dword ptr [ebp - 0x848]
            //   85c0                 | test                eax, eax
            //   75b6                 | jne                 0xffffffb8

        $sequence_17 = { 8b01 52 8d95f0fdffff 52 ff10 }
            // n = 5, score = 1100
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   52                   | push                edx
            //   8d95f0fdffff         | lea                 edx, [ebp - 0x210]
            //   52                   | push                edx
            //   ff10                 | call                dword ptr [eax]

        $sequence_18 = { e8???????? ff37 8b35???????? ffd6 }
            // n = 4, score = 1100
            //   e8????????           |                     
            //   ff37                 | push                dword ptr [edi]
            //   8b35????????         |                     
            //   ffd6                 | call                esi

        $sequence_19 = { 895ef8 897ef0 5b 5f 5e }
            // n = 5, score = 1100
            //   895ef8               | mov                 dword ptr [esi - 8], ebx
            //   897ef0               | mov                 dword ptr [esi - 0x10], edi
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_20 = { 8d8dfcfbffff 51 ffb5f0fbffff 8bcb ff5038 }
            // n = 5, score = 1100
            //   8d8dfcfbffff         | lea                 ecx, [ebp - 0x404]
            //   51                   | push                ecx
            //   ffb5f0fbffff         | push                dword ptr [ebp - 0x410]
            //   8bcb                 | mov                 ecx, ebx
            //   ff5038               | call                dword ptr [eax + 0x38]

        $sequence_21 = { 8b35???????? ffd6 ff7704 ffd6 ff770c }
            // n = 5, score = 1100
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   ff7704               | push                dword ptr [edi + 4]
            //   ffd6                 | call                esi
            //   ff770c               | push                dword ptr [edi + 0xc]

        $sequence_22 = { 8b85ecfbffff 85c0 7404 3bc6 }
            // n = 4, score = 1100
            //   8b85ecfbffff         | mov                 eax, dword ptr [ebp - 0x414]
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   3bc6                 | cmp                 eax, esi

        $sequence_23 = { 8bcf ff5210 8b17 8bcf ff5208 }
            // n = 5, score = 1100
            //   8bcf                 | mov                 ecx, edi
            //   ff5210               | call                dword ptr [edx + 0x10]
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8bcf                 | mov                 ecx, edi
            //   ff5208               | call                dword ptr [edx + 8]

        $sequence_24 = { e8???????? ff76f8 e8???????? 83c41c 895ef8 897ef0 }
            // n = 6, score = 1100
            //   e8????????           |                     
            //   ff76f8               | push                dword ptr [esi - 8]
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   895ef8               | mov                 dword ptr [esi - 8], ebx
            //   897ef0               | mov                 dword ptr [esi - 0x10], edi

        $sequence_25 = { c705????????00000000 c705????????04000000 ff15???????? 85c0 750b 68???????? ff15???????? }
            // n = 7, score = 400
            //   c705????????00000000     |     
            //   c705????????04000000     |     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750b                 | jne                 0xd
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_26 = { 55 8bec ff4d08 755d 833d????????04 }
            // n = 5, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   ff4d08               | dec                 dword ptr [ebp + 8]
            //   755d                 | jne                 0x5f
            //   833d????????04       |                     

        $sequence_27 = { c705????????00000000 c705????????00000000 c705????????00000000 ffd3 8b3d???????? 85c0 }
            // n = 6, score = 400
            //   c705????????00000000     |     
            //   c705????????00000000     |     
            //   c705????????00000000     |     
            //   ffd3                 | call                ebx
            //   8b3d????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_28 = { ff15???????? 68c0d40100 ff15???????? e9???????? }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   68c0d40100           | push                0x1d4c0
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_29 = { 8b3d???????? 85c0 7507 68???????? ffd7 6a00 }
            // n = 6, score = 400
            //   8b3d????????         |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   6a00                 | push                0

        $sequence_30 = { ff15???????? c20800 53 8b1d???????? }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   c20800               | ret                 8
            //   53                   | push                ebx
            //   8b1d????????         |                     

        $sequence_31 = { ff15???????? a3???????? 85c0 750e 68???????? ff15???????? c20800 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   750e                 | jne                 0x10
            //   68????????           |                     
            //   ff15????????         |                     
            //   c20800               | ret                 8

        $sequence_32 = { 53 8b1d???????? 57 0f57c0 }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   57                   | push                edi
            //   0f57c0               | xorps               xmm0, xmm0

        $sequence_33 = { 7206 83c8ff 5e 5d c3 }
            // n = 5, score = 300
            //   7206                 | jb                  8
            //   83c8ff               | or                  eax, 0xffffffff
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_34 = { 0305???????? a3???????? 8b15???????? 8b4de8 d3e2 3b55e8 750c }
            // n = 7, score = 100
            //   0305????????         |                     
            //   a3????????           |                     
            //   8b15????????         |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   d3e2                 | shl                 edx, cl
            //   3b55e8               | cmp                 edx, dword ptr [ebp - 0x18]
            //   750c                 | jne                 0xe

        $sequence_35 = { eb0a c7855cffffff01000000 8b0d???????? 338d5cffffff 890d???????? 0fbe55ff }
            // n = 6, score = 100
            //   eb0a                 | jmp                 0xc
            //   c7855cffffff01000000     | mov    dword ptr [ebp - 0xa4], 1
            //   8b0d????????         |                     
            //   338d5cffffff         | xor                 ecx, dword ptr [ebp - 0xa4]
            //   890d????????         |                     
            //   0fbe55ff             | movsx               edx, byte ptr [ebp - 1]

        $sequence_36 = { 23d1 8815???????? ebc1 0fbe4df8 2b4de4 a1???????? d3e8 }
            // n = 7, score = 100
            //   23d1                 | and                 edx, ecx
            //   8815????????         |                     
            //   ebc1                 | jmp                 0xffffffc3
            //   0fbe4df8             | movsx               ecx, byte ptr [ebp - 8]
            //   2b4de4               | sub                 ecx, dword ptr [ebp - 0x1c]
            //   a1????????           |                     
            //   d3e8                 | shr                 eax, cl

        $sequence_37 = { 6a00 68???????? ff15???????? 8945e8 68???????? 8b4de8 51 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   68????????           |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx

        $sequence_38 = { c785dcfeffff00000000 0fbe4dfe 8b15???????? 2bd1 0b95dcfeffff 8915???????? }
            // n = 6, score = 100
            //   c785dcfeffff00000000     | mov    dword ptr [ebp - 0x124], 0
            //   0fbe4dfe             | movsx               ecx, byte ptr [ebp - 2]
            //   8b15????????         |                     
            //   2bd1                 | sub                 edx, ecx
            //   0b95dcfeffff         | or                  edx, dword ptr [ebp - 0x124]
            //   8915????????         |                     

        $sequence_39 = { 8915???????? 0fb605???????? 0fbf4df4 d3e0 0fbe4dfe d3e0 0fb60d???????? }
            // n = 7, score = 100
            //   8915????????         |                     
            //   0fb605????????       |                     
            //   0fbf4df4             | movsx               ecx, word ptr [ebp - 0xc]
            //   d3e0                 | shl                 eax, cl
            //   0fbe4dfe             | movsx               ecx, byte ptr [ebp - 2]
            //   d3e0                 | shl                 eax, cl
            //   0fb60d????????       |                     

    condition:
        7 of them and filesize < 70128640
}