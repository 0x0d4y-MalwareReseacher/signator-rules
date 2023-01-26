rule win_sword_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.sword."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sword"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 7578 8d942484020000 6a5c 52 }
            // n = 4, score = 100
            //   7578                 | jne                 0x7a
            //   8d942484020000       | lea                 edx, [esp + 0x284]
            //   6a5c                 | push                0x5c
            //   52                   | push                edx

        $sequence_1 = { ff15???????? 8b8c2434000100 50 8b84243c000100 8d542424 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   8b8c2434000100       | mov                 ecx, dword ptr [esp + 0x10034]
            //   50                   | push                eax
            //   8b84243c000100       | mov                 eax, dword ptr [esp + 0x1003c]
            //   8d542424             | lea                 edx, [esp + 0x24]

        $sequence_2 = { 6a3a 52 c60000 e8???????? 8bf8 }
            // n = 5, score = 100
            //   6a3a                 | push                0x3a
            //   52                   | push                edx
            //   c60000               | mov                 byte ptr [eax], 0
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_3 = { eb17 8a83e19f4000 2420 3c20 7509 0fb683e09e4000 eb02 }
            // n = 7, score = 100
            //   eb17                 | jmp                 0x19
            //   8a83e19f4000         | mov                 al, byte ptr [ebx + 0x409fe1]
            //   2420                 | and                 al, 0x20
            //   3c20                 | cmp                 al, 0x20
            //   7509                 | jne                 0xb
            //   0fb683e09e4000       | movzx               eax, byte ptr [ebx + 0x409ee0]
            //   eb02                 | jmp                 4

        $sequence_4 = { c3 8bc8 83e01f c1f905 8b0c8d00a14000 8a44c104 }
            // n = 6, score = 100
            //   c3                   | ret                 
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d00a14000       | mov                 ecx, dword ptr [ecx*4 + 0x40a100]
            //   8a44c104             | mov                 al, byte ptr [ecx + eax*8 + 4]

        $sequence_5 = { 77c8 bf???????? 83c9ff 33c0 f2ae f7d1 }
            // n = 6, score = 100
            //   77c8                 | ja                  0xffffffca
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_6 = { 8bd1 8bf7 8b7c2410 50 c1e902 f3a5 8bca }
            // n = 7, score = 100
            //   8bd1                 | mov                 edx, ecx
            //   8bf7                 | mov                 esi, edi
            //   8b7c2410             | mov                 edi, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bca                 | mov                 ecx, edx

        $sequence_7 = { 8b7d08 8d05a49e4000 83780800 753b b0ff }
            // n = 5, score = 100
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8d05a49e4000         | lea                 eax, [0x409ea4]
            //   83780800             | cmp                 dword ptr [eax + 8], 0
            //   753b                 | jne                 0x3d
            //   b0ff                 | mov                 al, 0xff

        $sequence_8 = { f2ae f7d1 49 bf???????? 894c2414 83c9ff }
            // n = 6, score = 100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   bf????????           |                     
            //   894c2414             | mov                 dword ptr [esp + 0x14], ecx
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_9 = { f7d1 49 83f903 77c8 bf???????? }
            // n = 5, score = 100
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   83f903               | cmp                 ecx, 3
            //   77c8                 | ja                  0xffffffca
            //   bf????????           |                     

    condition:
        7 of them and filesize < 106496
}