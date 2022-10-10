rule win_sinowal_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.sinowal."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sinowal"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8b4dfc 8b7508 8a4c4e01 880c50 8b55fc 8b4508 }
            // n = 6, score = 200
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8a4c4e01             | mov                 cl, byte ptr [esi + ecx*2 + 1]
            //   880c50               | mov                 byte ptr [eax + edx*2], cl
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_1 = { 682c020000 6a00 8d95bcfdffff 52 e8???????? 83c40c c745f000000000 }
            // n = 7, score = 200
            //   682c020000           | push                0x22c
            //   6a00                 | push                0
            //   8d95bcfdffff         | lea                 edx, [ebp - 0x244]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0

        $sequence_2 = { 8b45f4 83c001 8945f4 837df420 734a 8b4df4 }
            // n = 6, score = 200
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c001               | add                 eax, 1
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   837df420             | cmp                 dword ptr [ebp - 0xc], 0x20
            //   734a                 | jae                 0x4c
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_3 = { 7405 e9???????? 6830020000 6a00 8d85b8fdffff 50 e8???????? }
            // n = 7, score = 200
            //   7405                 | je                  7
            //   e9????????           |                     
            //   6830020000           | push                0x230
            //   6a00                 | push                0
            //   8d85b8fdffff         | lea                 eax, [ebp - 0x248]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_4 = { e8???????? 837df838 721e 8b95ccfeffff 0fb74220 83f839 7f0f }
            // n = 7, score = 200
            //   e8????????           |                     
            //   837df838             | cmp                 dword ptr [ebp - 8], 0x38
            //   721e                 | jb                  0x20
            //   8b95ccfeffff         | mov                 edx, dword ptr [ebp - 0x134]
            //   0fb74220             | movzx               eax, word ptr [edx + 0x20]
            //   83f839               | cmp                 eax, 0x39
            //   7f0f                 | jg                  0x11

        $sequence_5 = { 8b4dfc 51 ff15???????? 837d0c00 }
            // n = 4, score = 200
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0

        $sequence_6 = { 837d0800 7406 837d0c00 7502 eb64 8b450c }
            // n = 6, score = 200
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7406                 | je                  8
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7502                 | jne                 4
            //   eb64                 | jmp                 0x66
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_7 = { 8b0c85cc669600 c1e91e 8b55fc 330c95cc669600 69c90d661900 8b45fc 330c85d0669600 }
            // n = 7, score = 200
            //   8b0c85cc669600       | mov                 ecx, dword ptr [eax*4 + 0x9666cc]
            //   c1e91e               | shr                 ecx, 0x1e
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   330c95cc669600       | xor                 ecx, dword ptr [edx*4 + 0x9666cc]
            //   69c90d661900         | imul                ecx, ecx, 0x19660d
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   330c85d0669600       | xor                 ecx, dword ptr [eax*4 + 0x9666d0]

        $sequence_8 = { 890d???????? c705????????00000000 a1???????? 8b0c85d0669600 894dfc }
            // n = 5, score = 200
            //   890d????????         |                     
            //   c705????????00000000     |     
            //   a1????????           |                     
            //   8b0c85d0669600       | mov                 ecx, dword ptr [eax*4 + 0x9666d0]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_9 = { 8b4dfc 0fb611 33d0 8b45fc 8810 8b4dfc }
            // n = 6, score = 200
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   0fb611               | movzx               edx, byte ptr [ecx]
            //   33d0                 | xor                 edx, eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8810                 | mov                 byte ptr [eax], dl
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 73728
}