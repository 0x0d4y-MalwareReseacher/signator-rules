rule win_banjori_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.banjori."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.banjori"
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
        $sequence_0 = { 2b4df4 c1e010 0bc1 8b550c 3902 7506 8b4508 }
            // n = 7, score = 100
            //   2b4df4               | sub                 ecx, dword ptr [ebp - 0xc]
            //   c1e010               | shl                 eax, 0x10
            //   0bc1                 | or                  eax, ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   3902                 | cmp                 dword ptr [edx], eax
            //   7506                 | jne                 8
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_1 = { 66696c653d2768 7474 703a 2f 2f 6a61 626265 }
            // n = 7, score = 100
            //   66696c653d2768       | imul                bp, word ptr [ebp + 0x3d], 0x6827
            //   7474                 | je                  0x76
            //   703a                 | jo                  0x3c
            //   2f                   | das                 
            //   2f                   | das                 
            //   6a61                 | push                0x61
            //   626265               | bound               esp, qword ptr [edx + 0x65]

        $sequence_2 = { 8bec 83c4d8 57 56 53 33db e8???????? }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   83c4d8               | add                 esp, -0x28
            //   57                   | push                edi
            //   56                   | push                esi
            //   53                   | push                ebx
            //   33db                 | xor                 ebx, ebx
            //   e8????????           |                     

        $sequence_3 = { 81c49cfeffff 57 56 53 33db e8???????? 8945fc }
            // n = 7, score = 100
            //   81c49cfeffff         | add                 esp, 0xfffffe9c
            //   57                   | push                edi
            //   56                   | push                esi
            //   53                   | push                ebx
            //   33db                 | xor                 ebx, ebx
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_4 = { 8b00 85c0 7529 ff75f8 e8???????? 8b7dfc 57 }
            // n = 7, score = 100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   85c0                 | test                eax, eax
            //   7529                 | jne                 0x2b
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   57                   | push                edi

        $sequence_5 = { 83c4d8 57 56 6a0a ff15???????? 391d???????? }
            // n = 6, score = 100
            //   83c4d8               | add                 esp, -0x28
            //   57                   | push                edi
            //   56                   | push                esi
            //   6a0a                 | push                0xa
            //   ff15????????         |                     
            //   391d????????         |                     

        $sequence_6 = { ff75f4 ff15???????? ff75f8 e8???????? ff7510 ff750c ff75f4 }
            // n = 7, score = 100
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff75f4               | push                dword ptr [ebp - 0xc]

        $sequence_7 = { 0145f4 6a42 ff75f4 ff75f8 ff15???????? 8945f8 ff75dc }
            // n = 7, score = 100
            //   0145f4               | add                 dword ptr [ebp - 0xc], eax
            //   6a42                 | push                0x42
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ff75dc               | push                dword ptr [ebp - 0x24]

        $sequence_8 = { 8b12 80fa30 7504 66c1ea08 663bca 7410 8b45f0 }
            // n = 7, score = 100
            //   8b12                 | mov                 edx, dword ptr [edx]
            //   80fa30               | cmp                 dl, 0x30
            //   7504                 | jne                 6
            //   66c1ea08             | shr                 dx, 8
            //   663bca               | cmp                 cx, dx
            //   7410                 | je                  0x12
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_9 = { 57 e8???????? 395dc8 0f843a010000 ff75e4 57 ff15???????? }
            // n = 7, score = 100
            //   57                   | push                edi
            //   e8????????           |                     
            //   395dc8               | cmp                 dword ptr [ebp - 0x38], ebx
            //   0f843a010000         | je                  0x140
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   57                   | push                edi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 139264
}