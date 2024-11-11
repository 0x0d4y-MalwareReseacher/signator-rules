rule win_icexloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.icexloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.icexloader"
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
        $sequence_0 = { 8d47f8 e8???????? 8b4604 85c0 7408 83e808 e8???????? }
            // n = 7, score = 200
            //   8d47f8               | lea                 eax, [edi - 8]
            //   e8????????           |                     
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   83e808               | sub                 eax, 8
            //   e8????????           |                     

        $sequence_1 = { 89d0 85c9 742d 8d51f8 3c02 7415 770e }
            // n = 7, score = 200
            //   89d0                 | mov                 eax, edx
            //   85c9                 | test                ecx, ecx
            //   742d                 | je                  0x2f
            //   8d51f8               | lea                 edx, [ecx - 8]
            //   3c02                 | cmp                 al, 2
            //   7415                 | je                  0x17
            //   770e                 | ja                  0x10

        $sequence_2 = { 40 ebbd 8a0439 89c2 83e2df 80fa44 0f95c3 }
            // n = 7, score = 200
            //   40                   | inc                 eax
            //   ebbd                 | jmp                 0xffffffbf
            //   8a0439               | mov                 al, byte ptr [ecx + edi]
            //   89c2                 | mov                 edx, eax
            //   83e2df               | and                 edx, 0xffffffdf
            //   80fa44               | cmp                 dl, 0x44
            //   0f95c3               | setne               bl

        $sequence_3 = { 0fb605???????? 84c0 7505 e8???????? 8b4514 c70000000000 c745d800000000 }
            // n = 7, score = 200
            //   0fb605????????       |                     
            //   84c0                 | test                al, al
            //   7505                 | jne                 7
            //   e8????????           |                     
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   c745d800000000       | mov                 dword ptr [ebp - 0x28], 0

        $sequence_4 = { ebca 83c42c 89d8 5b 5e 5f 5d }
            // n = 7, score = 200
            //   ebca                 | jmp                 0xffffffcc
            //   83c42c               | add                 esp, 0x2c
            //   89d8                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp

        $sequence_5 = { 81ec8c010000 8b01 898dc0feffff 8b10 b8???????? 899594feffff e8???????? }
            // n = 7, score = 200
            //   81ec8c010000         | sub                 esp, 0x18c
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   898dc0feffff         | mov                 dword ptr [ebp - 0x140], ecx
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   b8????????           |                     
            //   899594feffff         | mov                 dword ptr [ebp - 0x16c], edx
            //   e8????????           |                     

        $sequence_6 = { c74424086c000000 e9???????? 891424 89ca 8d4de4 c744240400000000 e8???????? }
            // n = 7, score = 200
            //   c74424086c000000     | mov                 dword ptr [esp + 8], 0x6c
            //   e9????????           |                     
            //   891424               | mov                 dword ptr [esp], edx
            //   89ca                 | mov                 edx, ecx
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   e8????????           |                     

        $sequence_7 = { c9 c20800 55 89e5 83ec28 d94508 8d4df4 }
            // n = 7, score = 200
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   83ec28               | sub                 esp, 0x28
            //   d94508               | fld                 dword ptr [ebp + 8]
            //   8d4df4               | lea                 ecx, [ebp - 0xc]

        $sequence_8 = { 8b17 83e33f c1f806 83cb80 83c8c0 885c3209 88443208 }
            // n = 7, score = 200
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   83e33f               | and                 ebx, 0x3f
            //   c1f806               | sar                 eax, 6
            //   83cb80               | or                  ebx, 0xffffff80
            //   83c8c0               | or                  eax, 0xffffffc0
            //   885c3209             | mov                 byte ptr [edx + esi + 9], bl
            //   88443208             | mov                 byte ptr [edx + esi + 8], al

        $sequence_9 = { 8b45dc 8b55d8 29d0 89c3 8b4508 8b5010 8b450c }
            // n = 7, score = 200
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   29d0                 | sub                 eax, edx
            //   89c3                 | mov                 ebx, eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b5010               | mov                 edx, dword ptr [eax + 0x10]
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 656384
}