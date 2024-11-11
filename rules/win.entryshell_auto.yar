rule win_entryshell_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.entryshell."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.entryshell"
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
        $sequence_0 = { 8b0e 3b0c85f4542501 7417 8b4d08 a1???????? 858150030000 7507 }
            // n = 7, score = 100
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   3b0c85f4542501       | cmp                 ecx, dword ptr [eax*4 + 0x12554f4]
            //   7417                 | je                  0x19
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   a1????????           |                     
            //   858150030000         | test                dword ptr [ecx + 0x350], eax
            //   7507                 | jne                 9

        $sequence_1 = { 02410b 02c0 02410c 02c0 02410d 02c0 02410e }
            // n = 7, score = 100
            //   02410b               | add                 al, byte ptr [ecx + 0xb]
            //   02c0                 | add                 al, al
            //   02410c               | add                 al, byte ptr [ecx + 0xc]
            //   02c0                 | add                 al, al
            //   02410d               | add                 al, byte ptr [ecx + 0xd]
            //   02c0                 | add                 al, al
            //   02410e               | add                 al, byte ptr [ecx + 0xe]

        $sequence_2 = { 84c9 742b 8d7e01 8a07 8bf7 0fb6d0 8bdf }
            // n = 7, score = 100
            //   84c9                 | test                cl, cl
            //   742b                 | je                  0x2d
            //   8d7e01               | lea                 edi, [esi + 1]
            //   8a07                 | mov                 al, byte ptr [edi]
            //   8bf7                 | mov                 esi, edi
            //   0fb6d0               | movzx               edx, al
            //   8bdf                 | mov                 ebx, edi

        $sequence_3 = { 8b35???????? 8bd6 c1e208 8d8290e72501 8bc8 89442420 }
            // n = 6, score = 100
            //   8b35????????         |                     
            //   8bd6                 | mov                 edx, esi
            //   c1e208               | shl                 edx, 8
            //   8d8290e72501         | lea                 eax, [edx + 0x125e790]
            //   8bc8                 | mov                 ecx, eax
            //   89442420             | mov                 dword ptr [esp + 0x20], eax

        $sequence_4 = { 83c40c 68???????? 6800010000 68???????? e8???????? 83c40c 807c241400 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   6800010000           | push                0x100
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   807c241400           | cmp                 byte ptr [esp + 0x14], 0

        $sequence_5 = { 51 50 e8???????? 83c410 b001 5f 5e }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   b001                 | mov                 al, 1
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_6 = { 6800080000 50 ff35???????? ff15???????? 85c0 0f8eb2010000 8d85d0efffff }
            // n = 7, score = 100
            //   6800080000           | push                0x800
            //   50                   | push                eax
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8eb2010000         | jle                 0x1b8
            //   8d85d0efffff         | lea                 eax, [ebp - 0x1030]

        $sequence_7 = { 85c0 0f85fb000000 8db5b8f7ffff 0f1f4000 8d85b8efffff 803e00 7438 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f85fb000000         | jne                 0x101
            //   8db5b8f7ffff         | lea                 esi, [ebp - 0x848]
            //   0f1f4000             | nop                 dword ptr [eax]
            //   8d85b8efffff         | lea                 eax, [ebp - 0x1048]
            //   803e00               | cmp                 byte ptr [esi], 0
            //   7438                 | je                  0x3a

        $sequence_8 = { 89540f24 8bd6 8b048578512501 8945ec 8b4dec 33ff }
            // n = 6, score = 100
            //   89540f24             | mov                 dword ptr [edi + ecx + 0x24], edx
            //   8bd6                 | mov                 edx, esi
            //   8b048578512501       | mov                 eax, dword ptr [eax*4 + 0x1255178]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   33ff                 | xor                 edi, edi

        $sequence_9 = { 844415dc 750a 8bfe 8a07 84c0 75e1 eb05 }
            // n = 7, score = 100
            //   844415dc             | test                byte ptr [ebp + edx - 0x24], al
            //   750a                 | jne                 0xc
            //   8bfe                 | mov                 edi, esi
            //   8a07                 | mov                 al, byte ptr [edi]
            //   84c0                 | test                al, al
            //   75e1                 | jne                 0xffffffe3
            //   eb05                 | jmp                 7

    condition:
        7 of them and filesize < 663552
}