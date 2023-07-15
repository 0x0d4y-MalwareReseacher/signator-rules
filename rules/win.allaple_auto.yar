rule win_allaple_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.allaple."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.allaple"
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
        $sequence_0 = { 53 e8???????? 33ff 89bdfcfbffff 6800020000 8d8500feffff 50 }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   e8????????           |                     
            //   33ff                 | xor                 edi, edi
            //   89bdfcfbffff         | mov                 dword ptr [ebp - 0x404], edi
            //   6800020000           | push                0x200
            //   8d8500feffff         | lea                 eax, [ebp - 0x200]
            //   50                   | push                eax

        $sequence_1 = { e8???????? 83c40c 0305???????? 0345b0 05a1ebd96e 50 e8???????? }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0305????????         |                     
            //   0345b0               | add                 eax, dword ptr [ebp - 0x50]
            //   05a1ebd96e           | add                 eax, 0x6ed9eba1
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { eb2a 83c604 833e00 75eb 8b35???????? 81c700100000 }
            // n = 6, score = 300
            //   eb2a                 | jmp                 0x2c
            //   83c604               | add                 esi, 4
            //   833e00               | cmp                 dword ptr [esi], 0
            //   75eb                 | jne                 0xffffffed
            //   8b35????????         |                     
            //   81c700100000         | add                 edi, 0x1000

        $sequence_3 = { 5f c3 8bff 55 8bec 57 56 }
            // n = 7, score = 300
            //   5f                   | pop                 edi
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_4 = { 83c408 8d8d78ffffff 51 8d8538ffffff 50 e8???????? }
            // n = 6, score = 300
            //   83c408               | add                 esp, 8
            //   8d8d78ffffff         | lea                 ecx, [ebp - 0x88]
            //   51                   | push                ecx
            //   8d8538ffffff         | lea                 eax, [ebp - 0xc8]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 53 60 8b7d0c 8b7508 8b4e3c 03f1 0fb74606 }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   60                   | pushal              
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8b4e3c               | mov                 ecx, dword ptr [esi + 0x3c]
            //   03f1                 | add                 esi, ecx
            //   0fb74606             | movzx               eax, word ptr [esi + 6]

        $sequence_6 = { 8bca d3f8 8845d4 c745d80f000000 eb09 8b45d8 83e801 }
            // n = 7, score = 300
            //   8bca                 | mov                 ecx, edx
            //   d3f8                 | sar                 eax, cl
            //   8845d4               | mov                 byte ptr [ebp - 0x2c], al
            //   c745d80f000000       | mov                 dword ptr [ebp - 0x28], 0xf
            //   eb09                 | jmp                 0xb
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   83e801               | sub                 eax, 1

        $sequence_7 = { 83c704 8b75fc 2bfe 8b4d10 8939 }
            // n = 5, score = 300
            //   83c704               | add                 edi, 4
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   2bfe                 | sub                 edi, esi
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8939                 | mov                 dword ptr [ecx], edi

        $sequence_8 = { 53 e8???????? c70352414853 897b04 ff750c e8???????? }
            // n = 6, score = 300
            //   53                   | push                ebx
            //   e8????????           |                     
            //   c70352414853         | mov                 dword ptr [ebx], 0x53484152
            //   897b04               | mov                 dword ptr [ebx + 4], edi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     

        $sequence_9 = { 8b55e0 d1c2 8955e0 8b45f0 0345ec 038554ffffff 8b4ddc }
            // n = 7, score = 300
            //   8b55e0               | mov                 edx, dword ptr [ebp - 0x20]
            //   d1c2                 | rol                 edx, 1
            //   8955e0               | mov                 dword ptr [ebp - 0x20], edx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   0345ec               | add                 eax, dword ptr [ebp - 0x14]
            //   038554ffffff         | add                 eax, dword ptr [ebp - 0xac]
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]

    condition:
        7 of them and filesize < 253952
}