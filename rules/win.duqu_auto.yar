rule win_duqu_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.duqu."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.duqu"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 894634 8bcf e8???????? 894638 }
            // n = 4, score = 400
            //   894634               | mov                 dword ptr [esi + 0x34], eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   894638               | mov                 dword ptr [esi + 0x38], eax

        $sequence_1 = { 740f 83c204 8b0411 33c7 8902 663bc6 }
            // n = 6, score = 400
            //   740f                 | je                  0x11
            //   83c204               | add                 edx, 4
            //   8b0411               | mov                 eax, dword ptr [ecx + edx]
            //   33c7                 | xor                 eax, edi
            //   8902                 | mov                 dword ptr [edx], eax
            //   663bc6               | cmp                 ax, si

        $sequence_2 = { e8???????? 894638 85c0 0f84d7020000 }
            // n = 4, score = 400
            //   e8????????           |                     
            //   894638               | mov                 dword ptr [esi + 0x38], eax
            //   85c0                 | test                eax, eax
            //   0f84d7020000         | je                  0x2dd

        $sequence_3 = { 8d442438 6a01 50 8d442438 }
            // n = 4, score = 400
            //   8d442438             | lea                 eax, dword ptr [esp + 0x38]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   8d442438             | lea                 eax, dword ptr [esp + 0x38]

        $sequence_4 = { 898680000000 8bcb e8???????? 894678 }
            // n = 4, score = 400
            //   898680000000         | mov                 dword ptr [esi + 0x80], eax
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   894678               | mov                 dword ptr [esi + 0x78], eax

        $sequence_5 = { 56 51 8bf2 e8???????? }
            // n = 4, score = 400
            //   56                   | push                esi
            //   51                   | push                ecx
            //   8bf2                 | mov                 esi, edx
            //   e8????????           |                     

        $sequence_6 = { 85c0 7465 e8???????? 85c0 }
            // n = 4, score = 400
            //   85c0                 | test                eax, eax
            //   7465                 | je                  0x67
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_7 = { 894624 85c0 0f8474020000 baf71ad500 8bcf e8???????? }
            // n = 6, score = 400
            //   894624               | mov                 dword ptr [esi + 0x24], eax
            //   85c0                 | test                eax, eax
            //   0f8474020000         | je                  0x27a
            //   baf71ad500           | mov                 edx, 0xd51af7
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_8 = { e8???????? bafef547ab 898698000000 8bcf }
            // n = 4, score = 400
            //   e8????????           |                     
            //   bafef547ab           | mov                 edx, 0xab47f5fe
            //   898698000000         | mov                 dword ptr [esi + 0x98], eax
            //   8bcf                 | mov                 ecx, edi

        $sequence_9 = { ff5334 f7d8 1bc0 f7d0 21442414 }
            // n = 5, score = 400
            //   ff5334               | call                dword ptr [ebx + 0x34]
            //   f7d8                 | neg                 eax
            //   1bc0                 | sbb                 eax, eax
            //   f7d0                 | not                 eax
            //   21442414             | and                 dword ptr [esp + 0x14], eax

        $sequence_10 = { 8bd8 eb9d 8bf3 e8???????? }
            // n = 4, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   eb9d                 | jmp                 0xffffff9f
            //   8bf3                 | mov                 esi, ebx
            //   e8????????           |                     

        $sequence_11 = { 8bd8 e8???????? 8b5614 0fb7c0 }
            // n = 4, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   8b5614               | mov                 edx, dword ptr [esi + 0x14]
            //   0fb7c0               | movzx               eax, ax

        $sequence_12 = { 8bd8 e8???????? a1???????? 85c0 740f }
            // n = 5, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11

        $sequence_13 = { 8bd9 2b5de8 8bf7 2bf0 3bde }
            // n = 5, score = 200
            //   8bd9                 | mov                 ebx, ecx
            //   2b5de8               | sub                 ebx, dword ptr [ebp - 0x18]
            //   8bf7                 | mov                 esi, edi
            //   2bf0                 | sub                 esi, eax
            //   3bde                 | cmp                 ebx, esi

        $sequence_14 = { 8bd8 e8???????? 8b5604 0fb7c0 }
            // n = 4, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   8b5604               | mov                 edx, dword ptr [esi + 4]
            //   0fb7c0               | movzx               eax, ax

        $sequence_15 = { 8bd8 ffd6 68???????? 57 8be8 ffd6 85db }
            // n = 7, score = 200
            //   8bd8                 | mov                 ebx, eax
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   57                   | push                edi
            //   8be8                 | mov                 ebp, eax
            //   ffd6                 | call                esi
            //   85db                 | test                ebx, ebx

    condition:
        7 of them and filesize < 18759680
}