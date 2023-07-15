rule win_kardonloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.kardonloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kardonloader"
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
        $sequence_0 = { 8d85fcfbffff 50 ff35???????? ff35???????? }
            // n = 4, score = 200
            //   8d85fcfbffff         | lea                 eax, [ebp - 0x404]
            //   50                   | push                eax
            //   ff35????????         |                     
            //   ff35????????         |                     

        $sequence_1 = { c1e802 03d2 8a0418 880437 8b4508 0fb64c0101 }
            // n = 6, score = 200
            //   c1e802               | shr                 eax, 2
            //   03d2                 | add                 edx, edx
            //   8a0418               | mov                 al, byte ptr [eax + ebx]
            //   880437               | mov                 byte ptr [edi + esi], al
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0fb64c0101           | movzx               ecx, byte ptr [ecx + eax + 1]

        $sequence_2 = { 8b00 85c0 7417 ff30 ff15???????? 50 }
            // n = 6, score = 200
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   85c0                 | test                eax, eax
            //   7417                 | je                  0x19
            //   ff30                 | push                dword ptr [eax]
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_3 = { e8???????? 8b7dfc 8bd8 8d4f01 51 e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   8bd8                 | mov                 ebx, eax
            //   8d4f01               | lea                 ecx, [edi + 1]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_4 = { e9???????? 33c0 53 8b5d08 57 807c0bff3d }
            // n = 6, score = 200
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   807c0bff3d           | cmp                 byte ptr [ebx + ecx - 1], 0x3d

        $sequence_5 = { 59 85d2 0f84ea000000 8b450c 8bfe 2b45f8 }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   85d2                 | test                edx, edx
            //   0f84ea000000         | je                  0xf0
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8bfe                 | mov                 edi, esi
            //   2b45f8               | sub                 eax, dword ptr [ebp - 8]

        $sequence_6 = { 57 807c0bff3d 0f94c0 807c0bfe3d 8d7801 0f45f8 6bc103 }
            // n = 7, score = 200
            //   57                   | push                edi
            //   807c0bff3d           | cmp                 byte ptr [ebx + ecx - 1], 0x3d
            //   0f94c0               | sete                al
            //   807c0bfe3d           | cmp                 byte ptr [ebx + ecx - 2], 0x3d
            //   8d7801               | lea                 edi, [eax + 1]
            //   0f45f8               | cmovne              edi, eax
            //   6bc103               | imul                eax, ecx, 3

        $sequence_7 = { 8b55fc 0fb6443803 83c704 0a9818314000 }
            // n = 4, score = 200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   0fb6443803           | movzx               eax, byte ptr [eax + edi + 3]
            //   83c704               | add                 edi, 4
            //   0a9818314000         | or                  bl, byte ptr [eax + 0x403118]

        $sequence_8 = { e8???????? 59 eb07 68f4010000 ffd6 e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   eb07                 | jmp                 9
            //   68f4010000           | push                0x1f4
            //   ffd6                 | call                esi
            //   e8????????           |                     

        $sequence_9 = { 55 8bec 83ec28 56 c745d8d0324000 33f6 }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec28               | sub                 esp, 0x28
            //   56                   | push                esi
            //   c745d8d0324000       | mov                 dword ptr [ebp - 0x28], 0x4032d0
            //   33f6                 | xor                 esi, esi

    condition:
        7 of them and filesize < 57344
}