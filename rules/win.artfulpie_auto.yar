rule win_artfulpie_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.artfulpie."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.artfulpie"
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
        $sequence_0 = { 1bc0 23c1 eb55 8b1c9d24e24000 56 }
            // n = 5, score = 100
            //   1bc0                 | sbb                 eax, eax
            //   23c1                 | and                 eax, ecx
            //   eb55                 | jmp                 0x57
            //   8b1c9d24e24000       | mov                 ebx, dword ptr [ebx*4 + 0x40e224]
            //   56                   | push                esi

        $sequence_1 = { 83e908 8d7608 660fd60f 8d7f08 8b048dd4d34000 ffe0 }
            // n = 6, score = 100
            //   83e908               | sub                 ecx, 8
            //   8d7608               | lea                 esi, [esi + 8]
            //   660fd60f             | movq                qword ptr [edi], xmm1
            //   8d7f08               | lea                 edi, [edi + 8]
            //   8b048dd4d34000       | mov                 eax, dword ptr [ecx*4 + 0x40d3d4]
            //   ffe0                 | jmp                 eax

        $sequence_2 = { 85f6 7420 6bc618 57 8db8b44b4100 57 ff15???????? }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   7420                 | je                  0x22
            //   6bc618               | imul                eax, esi, 0x18
            //   57                   | push                edi
            //   8db8b44b4100         | lea                 edi, [eax + 0x414bb4]
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_3 = { eb07 c7431801000000 8bcb e8???????? 85c0 743d 8bcb }
            // n = 7, score = 100
            //   eb07                 | jmp                 9
            //   c7431801000000       | mov                 dword ptr [ebx + 0x18], 1
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   743d                 | je                  0x3f
            //   8bcb                 | mov                 ecx, ebx

        $sequence_4 = { e9???????? 57 33ff 8bcf 8bc7 894de4 399800424100 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   8bcf                 | mov                 ecx, edi
            //   8bc7                 | mov                 eax, edi
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   399800424100         | cmp                 dword ptr [eax + 0x414200], ebx

        $sequence_5 = { 8b404c 83b8a800000000 7512 8b04bd984e4100 807c302900 7504 }
            // n = 6, score = 100
            //   8b404c               | mov                 eax, dword ptr [eax + 0x4c]
            //   83b8a800000000       | cmp                 dword ptr [eax + 0xa8], 0
            //   7512                 | jne                 0x14
            //   8b04bd984e4100       | mov                 eax, dword ptr [edi*4 + 0x414e98]
            //   807c302900           | cmp                 byte ptr [eax + esi + 0x29], 0
            //   7504                 | jne                 6

        $sequence_6 = { eb34 8b4604 03c1 3bf8 7253 }
            // n = 5, score = 100
            //   eb34                 | jmp                 0x36
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   03c1                 | add                 eax, ecx
            //   3bf8                 | cmp                 edi, eax
            //   7253                 | jb                  0x55

        $sequence_7 = { 8d4598 50 6a00 6a00 56 c745c807020000 }
            // n = 6, score = 100
            //   8d4598               | lea                 eax, [ebp - 0x68]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   c745c807020000       | mov                 dword ptr [ebp - 0x38], 0x207

        $sequence_8 = { 81fa00010000 7313 8a87fc414100 08441619 42 0fb64101 }
            // n = 6, score = 100
            //   81fa00010000         | cmp                 edx, 0x100
            //   7313                 | jae                 0x15
            //   8a87fc414100         | mov                 al, byte ptr [edi + 0x4141fc]
            //   08441619             | or                  byte ptr [esi + edx + 0x19], al
            //   42                   | inc                 edx
            //   0fb64101             | movzx               eax, byte ptr [ecx + 1]

        $sequence_9 = { 7512 8b04bd984e4100 807c302900 7504 32c0 eb1a }
            // n = 6, score = 100
            //   7512                 | jne                 0x14
            //   8b04bd984e4100       | mov                 eax, dword ptr [edi*4 + 0x414e98]
            //   807c302900           | cmp                 byte ptr [eax + esi + 0x29], 0
            //   7504                 | jne                 6
            //   32c0                 | xor                 al, al
            //   eb1a                 | jmp                 0x1c

    condition:
        7 of them and filesize < 204800
}