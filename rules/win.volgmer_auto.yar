rule win_volgmer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.volgmer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.volgmer"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 4533c0 498bd5 33c9 c744242800000008 }
            // n = 4, score = 200
            //   4533c0               | inc                 ebp
            //   498bd5               | xor                 eax, eax
            //   33c9                 | dec                 ecx
            //   c744242800000008     | mov                 edx, ebp

        $sequence_1 = { 0f298d100c0000 668985200c0000 e8???????? 0f2805???????? 488d8d270d0000 0f280d???????? }
            // n = 6, score = 200
            //   0f298d100c0000       | mov                 dword ptr [esp + 0x58], edi
            //   668985200c0000       | inc                 esp
            //   e8????????           |                     
            //   0f2805????????       |                     
            //   488d8d270d0000       | mov                 dword ptr [esp + 0x5c], ebp
            //   0f280d????????       |                     

        $sequence_2 = { 33ed bb01000000 896c2424 448bf7 85db }
            // n = 5, score = 200
            //   33ed                 | mov                 word ptr [ebp + 0x190], di
            //   bb01000000           | dec                 eax
            //   896c2424             | lea                 ecx, [esp + 0x44]
            //   448bf7               | xor                 edx, edx
            //   85db                 | inc                 ecx

        $sequence_3 = { 488bcb ff542468 8bc6 4c8bb42448180000 4c8ba42488180000 }
            // n = 5, score = 200
            //   488bcb               | dec                 eax
            //   ff542468             | mov                 ecx, ebx
            //   8bc6                 | mov                 esi, edi
            //   4c8bb42448180000     | mov                 dword ptr [esp + 0x48], edi
            //   4c8ba42488180000     | mov                 dword ptr [esp + 0x4c], edi

        $sequence_4 = { e8???????? e8???????? e8???????? c705????????04000000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   c705????????04000000     |     

        $sequence_5 = { 85c0 0f84b2000000 458bc7 498bd6 488bcb e8???????? }
            // n = 6, score = 200
            //   85c0                 | dec                 ecx
            //   0f84b2000000         | or                  esp, 0xffffffff
            //   458bc7               | dec                 ecx
            //   498bd6               | mov                 ecx, esi
            //   488bcb               | mov                 ebx, edi
            //   e8????????           |                     

        $sequence_6 = { 4489742420 440fb7c6 488d9550030000 488d8d60040000 }
            // n = 4, score = 200
            //   4489742420           | inc                 ebp
            //   440fb7c6             | lea                 eax, [ebp + 5]
            //   488d9550030000       | dec                 eax
            //   488d8d60040000       | lea                 edx, [esp + 0x40]

        $sequence_7 = { 4489742420 448bc5 488bce 85c0 742f }
            // n = 5, score = 200
            //   4489742420           | mov                 eax, 0x24c
            //   448bc5               | push                ecx
            //   488bce               | mov                 ecx, dword ptr [esp + 0x28]
            //   85c0                 | push                0
            //   742f                 | push                0

        $sequence_8 = { 41b802010000 e8???????? 33d2 c7453078292e4c }
            // n = 4, score = 200
            //   41b802010000         | mov                 eax, 0x301
            //   e8????????           |                     
            //   33d2                 | dec                 eax
            //   c7453078292e4c       | lea                 edx, [0x1e622]

        $sequence_9 = { 0fb6840dd0060000 88840de0070000 488d4901 84c0 75e9 }
            // n = 5, score = 200
            //   0fb6840dd0060000     | dec                 eax
            //   88840de0070000       | lea                 edx, [0x1e5b0]
            //   488d4901             | je                  0xa5
            //   84c0                 | cmp                 byte ptr [ebp - 0x69], 0x17
            //   75e9                 | jne                 0x9f

        $sequence_10 = { e8???????? 483b3d???????? 741a 488d0535e30000 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   483b3d????????       |                     
            //   741a                 | dec                 eax
            //   488d0535e30000       | mov                 ecx, edi

        $sequence_11 = { 7417 8b85d0f3ffff 85c0 740d 6a00 ffb5d4f3ffff 50 }
            // n = 7, score = 100
            //   7417                 | dec                 eax
            //   8b85d0f3ffff         | mov                 ecx, esi
            //   85c0                 | test                eax, eax
            //   740d                 | je                  0x39
            //   6a00                 | dec                 eax
            //   ffb5d4f3ffff         | mov                 dword ptr [esp + 8], ebx
            //   50                   | dec                 eax

        $sequence_12 = { 8bf7 897c2448 897c244c 897c2458 44896c245c }
            // n = 5, score = 100
            //   8bf7                 | dec                 eax
            //   897c2448             | add                 esp, 0x150
            //   897c244c             | inc                 ecx
            //   897c2458             | pop                 ebp
            //   44896c245c           | pop                 ebx

        $sequence_13 = { e8???????? 4585ed 7417 0fb7555b }
            // n = 4, score = 100
            //   e8????????           |                     
            //   4585ed               | xor                 ecx, ecx
            //   7417                 | mov                 dword ptr [esp + 0x28], 0x8000000
            //   0fb7555b             | inc                 ebp

        $sequence_14 = { eb0e c74634047b6e00 c7463806000000 c6463c00 5f }
            // n = 5, score = 100
            //   eb0e                 | mov                 edx, dword ptr [esp + 0x10]
            //   c74634047b6e00       | lea                 edx, [esp + 0x44]
            //   c7463806000000       | push                edx
            //   c6463c00             | test                eax, eax
            //   5f                   | je                  0x82

        $sequence_15 = { 56 e8???????? 6800010000 8d8318020000 6a00 50 }
            // n = 6, score = 100
            //   56                   | mov                 dword ptr [esp + 0x10], ebp
            //   e8????????           |                     
            //   6800010000           | dec                 eax
            //   8d8318020000         | mov                 dword ptr [esp + 0x20], esi
            //   6a00                 | push                edi
            //   50                   | mov                 eax, 0x25e0

        $sequence_16 = { e8???????? 4881c448010000 415f 415e 415d 5e }
            // n = 6, score = 100
            //   e8????????           |                     
            //   4881c448010000       | lea                 eax, [ebp + 0x78]
            //   415f                 | xor                 edx, edx
            //   415e                 | dec                 eax
            //   415d                 | mov                 ecx, edi
            //   5e                   | xor                 edx, edx

        $sequence_17 = { c745e0f8ba6e00 e9???????? c745e0e4ba6e00 e9???????? c745dc02000000 c745e0e4ba6e00 8b4508 }
            // n = 7, score = 100
            //   c745e0f8ba6e00       | test                eax, eax
            //   e9????????           |                     
            //   c745e0e4ba6e00       | jne                 0xf
            //   e9????????           |                     
            //   c745dc02000000       | mov                 dword ptr [esp + 0x14], eax
            //   c745e0e4ba6e00       | jmp                 7
            //   8b4508               | mov                 esi, 0xffffff9e

        $sequence_18 = { c745e4e47d6e00 8945d4 83e302 8945d8 8945e8 8945f8 8b4508 }
            // n = 7, score = 100
            //   c745e4e47d6e00       | mov                 ecx, ebx
            //   8945d4               | call                dword ptr [esp + 0x68]
            //   83e302               | mov                 eax, esi
            //   8945d8               | dec                 esp
            //   8945e8               | mov                 esi, dword ptr [esp + 0x1848]
            //   8945f8               | dec                 esp
            //   8b4508               | mov                 esp, dword ptr [esp + 0x1888]

        $sequence_19 = { c1f906 6bd730 8b0c8d80f16e00 c644112800 85f6 740c }
            // n = 6, score = 100
            //   c1f906               | jne                 0xfffffff8
            //   6bd730               | inc                 ecx
            //   8b0c8d80f16e00       | mov                 eax, 0x102
            //   c644112800           | xor                 edx, edx
            //   85f6                 | mov                 dword ptr [ebp + 0x30], 0x4c2e2978
            //   740c                 | dec                 eax

        $sequence_20 = { 458d4505 488d542440 4983ccff 498bce }
            // n = 4, score = 100
            //   458d4505             | dec                 eax
            //   488d542440           | add                 esp, 0x250
            //   4983ccff             | pop                 ebx
            //   498bce               | ret                 

        $sequence_21 = { 83c40c 8bcb e8???????? 8dbb18030000 57 8d85c8feffff 50 }
            // n = 7, score = 100
            //   83c40c               | mov                 dword ptr [ebp - 0x20], 0x6ebaf8
            //   8bcb                 | mov                 dword ptr [ebp - 0x20], 0x6ebae4
            //   e8????????           |                     
            //   8dbb18030000         | mov                 dword ptr [ebp - 0x24], 2
            //   57                   | mov                 dword ptr [ebp - 0x20], 0x6ebae4
            //   8d85c8feffff         | mov                 eax, dword ptr [ebp + 8]
            //   50                   | jmp                 0x10

        $sequence_22 = { 4803c8 0fb6442450 6603d2 0fb7da f6d0 89542430 }
            // n = 6, score = 100
            //   4803c8               | inc                 ecx
            //   0fb6442450           | pop                 esi
            //   6603d2               | inc                 ecx
            //   0fb7da               | pop                 ebp
            //   f6d0                 | pop                 esi
            //   89542430             | dec                 eax

        $sequence_23 = { 6bc930 53 56 8b048580f16e00 33db 8b7508 57 }
            // n = 7, score = 100
            //   6bc930               | movzx               eax, si
            //   53                   | dec                 eax
            //   56                   | lea                 edx, [ebp + 0x350]
            //   8b048580f16e00       | dec                 eax
            //   33db                 | lea                 ecx, [ebp + 0x460]
            //   8b7508               | test                eax, eax
            //   57                   | je                  0xb8

        $sequence_24 = { c783240f000010000000 0f1106 0f1f4000 880438 40 }
            // n = 5, score = 100
            //   c783240f000010000000     | dec    eax
            //   0f1106               | cmp                 edi, esi
            //   0f1f4000             | jl                  0xffffffc4
            //   880438               | dec                 esp
            //   40                   | mov                 esi, dword ptr [esp + 0x48]

        $sequence_25 = { e8???????? 488d15b6e50100 488bcb 488905???????? e8???????? 488d15b0e50100 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   488d15b6e50100       | add                 esp, 0x148
            //   488bcb               | inc                 ecx
            //   488905????????       |                     
            //   e8????????           |                     
            //   488d15b0e50100       | pop                 edi

        $sequence_26 = { 53 57 ff15???????? 85c0 750a ff15???????? 89442414 }
            // n = 7, score = 100
            //   53                   | mov                 dword ptr [ebp + 0x29], eax
            //   57                   | jne                 0x110
            //   ff15????????         |                     
            //   85c0                 | dec                 ecx
            //   750a                 | lea                 ecx, [esp + 0x10]
            //   ff15????????         |                     
            //   89442414             | dec                 esp

        $sequence_27 = { 0f850a010000 498d4c2410 4c8d442458 488d542458 }
            // n = 4, score = 100
            //   0f850a010000         | dec                 eax
            //   498d4c2410           | add                 esp, 0x148
            //   4c8d442458           | inc                 ecx
            //   488d542458           | pop                 edi

        $sequence_28 = { 7413 668908 83c002 4a 75ee 83e802 66c7000000 }
            // n = 7, score = 100
            //   7413                 | dec                 eax
            //   668908               | mov                 dword ptr [ebp + 0x11], eax
            //   83c002               | dec                 eax
            //   4a                   | mov                 dword ptr [ebp + 0x19], eax
            //   75ee                 | dec                 eax
            //   83e802               | mov                 dword ptr [ebp + 0x21], eax
            //   66c7000000           | dec                 eax

        $sequence_29 = { 8d542444 68???????? 52 ff15???????? 85c0 747e 8d442444 }
            // n = 7, score = 100
            //   8d542444             | dec                 eax
            //   68????????           |                     
            //   52                   | add                 ecx, eax
            //   ff15????????         |                     
            //   85c0                 | movzx               eax, byte ptr [esp + 0x50]
            //   747e                 | add                 dx, dx
            //   8d442444             | movzx               ebx, dx

        $sequence_30 = { 57 e8???????? 8bf0 83c408 85f6 7518 397310 }
            // n = 7, score = 100
            //   57                   | mov                 dword ptr [esi + 0x34], 0x6e7b04
            //   e8????????           |                     
            //   8bf0                 | mov                 dword ptr [esi + 0x38], 6
            //   83c408               | mov                 byte ptr [esi + 0x3c], 0
            //   85f6                 | pop                 edi
            //   7518                 | sar                 eax, 6
            //   397310               | imul                ecx, ecx, 0x30

        $sequence_31 = { 8d8318030000 6a00 50 e8???????? 6800080000 8d831c040000 6a00 }
            // n = 7, score = 100
            //   8d8318030000         | mov                 esi, edi
            //   6a00                 | test                ebx, ebx
            //   50                   | inc                 esp
            //   e8????????           |                     
            //   6800080000           | mov                 dword ptr [esp + 0x20], esi
            //   8d831c040000         | inc                 esp
            //   6a00                 | mov                 eax, ebp

        $sequence_32 = { eb1a 8d45fc 50 8b04bd80f16e00 }
            // n = 4, score = 100
            //   eb1a                 | inc                 ebp
            //   8d45fc               | mov                 eax, edi
            //   50                   | dec                 ecx
            //   8b04bd80f16e00       | mov                 edx, esi

        $sequence_33 = { e8???????? 458d4578 33d2 488bcf }
            // n = 4, score = 100
            //   e8????????           |                     
            //   458d4578             | dec                 ebp
            //   33d2                 | mov                 eax, ebp
            //   488bcf               | inc                 ebp

        $sequence_34 = { 8a2f 33c0 668945e8 8b45d4 886de5 8b148580f16e00 8a4c1a2d }
            // n = 7, score = 100
            //   8a2f                 | movaps              xmmword ptr [ebp + 0xc10], xmm1
            //   33c0                 | mov                 word ptr [ebp + 0xc20], ax
            //   668945e8             | dec                 eax
            //   8b45d4               | lea                 ecx, [ebp + 0xd27]
            //   886de5               | inc                 esp
            //   8b148580f16e00       | mov                 dword ptr [esp + 0x20], esi
            //   8a4c1a2d             | inc                 esp

        $sequence_35 = { e8???????? eb05 be9effffff 8b542410 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   eb05                 | lea                 eax, [esp + 0x58]
            //   be9effffff           | dec                 eax
            //   8b542410             | lea                 edx, [esp + 0x58]

        $sequence_36 = { 51 8b4c2428 e8???????? 6a00 6a00 }
            // n = 5, score = 100
            //   51                   | dec                 ecx
            //   8b4c2428             | mov                 edx, ebp
            //   e8????????           |                     
            //   6a00                 | xor                 ecx, ecx
            //   6a00                 | mov                 dword ptr [esp + 0x28], 0x8000000

        $sequence_37 = { 0f849f000000 807d9717 0f8595000000 b801030000 }
            // n = 4, score = 100
            //   0f849f000000         | inc                 ecx
            //   807d9717             | pop                 esi
            //   0f8595000000         | inc                 ecx
            //   b801030000           | pop                 ebp

        $sequence_38 = { 4883c702 48894511 48894519 48894521 48894529 }
            // n = 5, score = 100
            //   4883c702             | lea                 eax, [0xe335]
            //   48894511             | dec                 eax
            //   48894519             | cmp                 edi, eax
            //   48894521             | je                  0x1c
            //   48894529             | cmp                 dword ptr [edi], 0

        $sequence_39 = { e8???????? 6800040000 8985ccf5ffff 0f57c0 8d85d0f9ffff c645d000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   6800040000           | mov                 eax, dword ptr [eax*4 + 0x6ef180]
            //   8985ccf5ffff         | movzx               eax, byte ptr [eax + ecx + 0x28]
            //   0f57c0               | and                 eax, 0x40
            //   8d85d0f9ffff         | pop                 ebp
            //   c645d000             | imul                ecx, ecx, 0x30

        $sequence_40 = { 8bc8 83e03f c1f906 6bc030 03048d80f17300 50 }
            // n = 6, score = 100
            //   8bc8                 | dec                 esp
            //   83e03f               | mov                 esp, dword ptr [esp + 0x40]
            //   c1f906               | inc                 edx
            //   6bc030               | lea                 eax, [ebx + edi]
            //   03048d80f17300       | dec                 eax
            //   50                   | mov                 ebx, dword ptr [esp + 0x50]

        $sequence_41 = { 761d 68204e0000 ff15???????? a1???????? }
            // n = 4, score = 100
            //   761d                 | dec                 eax
            //   68204e0000           | add                 edi, 2
            //   ff15????????         |                     
            //   a1????????           |                     

        $sequence_42 = { c1f806 6bc930 8b048580f16e00 0fb6440828 83e040 5d }
            // n = 6, score = 100
            //   c1f806               | lea                 eax, [esp + 0x44]
            //   6bc930               | add                 esp, 0x230
            //   8b048580f16e00       | ret                 
            //   0fb6440828           | lea                 ecx, [esp + 0xc]
            //   83e040               | mov                 dword ptr [esp + 0xc], 0x22c
            //   5d                   | push                ecx

        $sequence_43 = { e8???????? 4881c450010000 415d 5b }
            // n = 4, score = 100
            //   e8????????           |                     
            //   4881c450010000       | dec                 eax
            //   415d                 | lea                 eax, [0xe335]
            //   5b                   | dec                 eax

    condition:
        7 of them and filesize < 393216
}