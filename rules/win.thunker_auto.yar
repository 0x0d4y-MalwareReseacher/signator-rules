rule win_thunker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.thunker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.thunker"
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
        $sequence_0 = { 750b 68???????? e8???????? 59 68???????? 68???????? 6801000080 }
            // n = 7, score = 100
            //   750b                 | jne                 0xd
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   68????????           |                     
            //   68????????           |                     
            //   6801000080           | push                0x80000001

        $sequence_1 = { 5b 5d c3 55 89e5 81ecc8010000 }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   81ecc8010000         | sub                 esp, 0x1c8

        $sequence_2 = { 51 50 53 56 57 8b750c 8365f800 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   50                   | push                eax
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8365f800             | and                 dword ptr [ebp - 8], 0

        $sequence_3 = { e8???????? 83c40c 89c7 e8???????? 8985ecfdffff }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   89c7                 | mov                 edi, eax
            //   e8????????           |                     
            //   8985ecfdffff         | mov                 dword ptr [ebp - 0x214], eax

        $sequence_4 = { baabaaaaaa f7e2 d1ea 8995dcfdffff 89d0 }
            // n = 5, score = 100
            //   baabaaaaaa           | mov                 edx, 0xaaaaaaab
            //   f7e2                 | mul                 edx
            //   d1ea                 | shr                 edx, 1
            //   8995dcfdffff         | mov                 dword ptr [ebp - 0x224], edx
            //   89d0                 | mov                 eax, edx

        $sequence_5 = { e8???????? 6a06 53 e8???????? 83c410 eb40 6a04 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a06                 | push                6
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   eb40                 | jmp                 0x42
            //   6a04                 | push                4

        $sequence_6 = { 83c40c 8d8544edffff 50 e8???????? 8985c4edffff 8b400c }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8d8544edffff         | lea                 eax, [ebp - 0x12bc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8985c4edffff         | mov                 dword ptr [ebp - 0x123c], eax
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]

        $sequence_7 = { e8???????? eb07 c685fbeeffff01 80bdfbeeffff00 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   eb07                 | jmp                 9
            //   c685fbeeffff01       | mov                 byte ptr [ebp - 0x1105], 1
            //   80bdfbeeffff00       | cmp                 byte ptr [ebp - 0x1105], 0

        $sequence_8 = { 83c40c 8d8544edffff 50 e8???????? 8985c4edffff }
            // n = 5, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8d8544edffff         | lea                 eax, [ebp - 0x12bc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8985c4edffff         | mov                 dword ptr [ebp - 0x123c], eax

        $sequence_9 = { 89df 31c0 f9 19c9 }
            // n = 4, score = 100
            //   89df                 | mov                 edi, ebx
            //   31c0                 | xor                 eax, eax
            //   f9                   | stc                 
            //   19c9                 | sbb                 ecx, ecx

    condition:
        7 of them and filesize < 73728
}