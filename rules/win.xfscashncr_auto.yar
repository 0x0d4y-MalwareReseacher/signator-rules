rule win_xfscashncr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.xfscashncr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xfscashncr"
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
        $sequence_0 = { 8b4d10 8379080b 7f25 8b5518 52 8b4514 50 }
            // n = 7, score = 100
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8379080b             | cmp                 dword ptr [ecx + 8], 0xb
            //   7f25                 | jg                  0x27
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]
            //   52                   | push                edx
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   50                   | push                eax

        $sequence_1 = { 81e2ffff0000 0bc2 8b4df8 894114 8b45ec 5f 5e }
            // n = 7, score = 100
            //   81e2ffff0000         | and                 edx, 0xffff
            //   0bc2                 | or                  eax, edx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   894114               | mov                 dword ptr [ecx + 0x14], eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_2 = { 52 8bcd 50 8d1538864700 e8???????? 58 5a }
            // n = 7, score = 100
            //   52                   | push                edx
            //   8bcd                 | mov                 ecx, ebp
            //   50                   | push                eax
            //   8d1538864700         | lea                 edx, [0x478638]
            //   e8????????           |                     
            //   58                   | pop                 eax
            //   5a                   | pop                 edx

        $sequence_3 = { e8???????? 898550ffffff 8b8550ffffff 8a08 80c101 8b9550ffffff 880a }
            // n = 7, score = 100
            //   e8????????           |                     
            //   898550ffffff         | mov                 dword ptr [ebp - 0xb0], eax
            //   8b8550ffffff         | mov                 eax, dword ptr [ebp - 0xb0]
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   80c101               | add                 cl, 1
            //   8b9550ffffff         | mov                 edx, dword ptr [ebp - 0xb0]
            //   880a                 | mov                 byte ptr [edx], cl

        $sequence_4 = { c1f905 8b5508 83e21f c1e206 8b048dc0195700 0fbe4c1004 81c980000000 }
            // n = 7, score = 100
            //   c1f905               | sar                 ecx, 5
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83e21f               | and                 edx, 0x1f
            //   c1e206               | shl                 edx, 6
            //   8b048dc0195700       | mov                 eax, dword ptr [ecx*4 + 0x5719c0]
            //   0fbe4c1004           | movsx               ecx, byte ptr [eax + edx + 4]
            //   81c980000000         | or                  ecx, 0x80

        $sequence_5 = { 66d1e2 b802000000 6bc000 8b4d08 66891401 eb86 }
            // n = 6, score = 100
            //   66d1e2               | shl                 dx, 1
            //   b802000000           | mov                 eax, 2
            //   6bc000               | imul                eax, eax, 0
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   66891401             | mov                 word ptr [ecx + eax], dx
            //   eb86                 | jmp                 0xffffff88

        $sequence_6 = { 50 8b4d14 e8???????? 50 6a4c 8d8d70ffffff 51 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   e8????????           |                     
            //   50                   | push                eax
            //   6a4c                 | push                0x4c
            //   8d8d70ffffff         | lea                 ecx, [ebp - 0x90]
            //   51                   | push                ecx

        $sequence_7 = { 8b45f4 83784000 7512 8b450c 83e801 8b4d10 83d900 }
            // n = 7, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83784000             | cmp                 dword ptr [eax + 0x40], 0
            //   7512                 | jne                 0x14
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83e801               | sub                 eax, 1
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   83d900               | sbb                 ecx, 0

        $sequence_8 = { 8b4d08 d9ee d95c81fc 8b55f0 8b4508 d90490 d9ee }
            // n = 7, score = 100
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   d9ee                 | fldz                
            //   d95c81fc             | fstp                dword ptr [ecx + eax*4 - 4]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   d90490               | fld                 dword ptr [eax + edx*4]
            //   d9ee                 | fldz                

        $sequence_9 = { 51 e8???????? 83c408 dd5d94 dd4594 d9ee dae9 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   dd5d94               | fstp                qword ptr [ebp - 0x6c]
            //   dd4594               | fld                 qword ptr [ebp - 0x6c]
            //   d9ee                 | fldz                
            //   dae9                 | fucompp             

    condition:
        7 of them and filesize < 3126272
}