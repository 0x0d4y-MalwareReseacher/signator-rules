rule win_zeus_action_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.zeus_action."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_action"
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
        $sequence_0 = { 8d8de4fdffff 3bc1 0f8490000000 33c9 680a020000 668908 51 }
            // n = 7, score = 300
            //   8d8de4fdffff         | lea                 ecx, [ebp - 0x21c]
            //   3bc1                 | cmp                 eax, ecx
            //   0f8490000000         | je                  0x96
            //   33c9                 | xor                 ecx, ecx
            //   680a020000           | push                0x20a
            //   668908               | mov                 word ptr [eax], cx
            //   51                   | push                ecx

        $sequence_1 = { 85c0 0f845e010000 8bc7 69c018010000 50 e8???????? 59 }
            // n = 7, score = 300
            //   85c0                 | test                eax, eax
            //   0f845e010000         | je                  0x164
            //   8bc7                 | mov                 eax, edi
            //   69c018010000         | imul                eax, eax, 0x118
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_2 = { 8bd8 59 59 85db 741f ff7514 8d043b }
            // n = 7, score = 300
            //   8bd8                 | mov                 ebx, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85db                 | test                ebx, ebx
            //   741f                 | je                  0x21
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   8d043b               | lea                 eax, [ebx + edi]

        $sequence_3 = { ffd7 83630800 53 6a00 ffd6 50 ffd7 }
            // n = 7, score = 300
            //   ffd7                 | call                edi
            //   83630800             | and                 dword ptr [ebx + 8], 0
            //   53                   | push                ebx
            //   6a00                 | push                0
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_4 = { 85f6 7406 66891e 83c602 48 75f3 8b5df8 }
            // n = 7, score = 300
            //   85f6                 | test                esi, esi
            //   7406                 | je                  8
            //   66891e               | mov                 word ptr [esi], bx
            //   83c602               | add                 esi, 2
            //   48                   | dec                 eax
            //   75f3                 | jne                 0xfffffff5
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]

        $sequence_5 = { 8b550c 53 56 33f6 0b7508 57 8bc2 }
            // n = 7, score = 300
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   0b7508               | or                  esi, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   8bc2                 | mov                 eax, edx

        $sequence_6 = { 8b5d10 ff7514 53 ff750c 56 e8???????? 83c414 }
            // n = 7, score = 300
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   53                   | push                ebx
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14

        $sequence_7 = { 81e600f00300 0bce 8bc7 c1e10c c1e804 25003f0000 }
            // n = 6, score = 300
            //   81e600f00300         | and                 esi, 0x3f000
            //   0bce                 | or                  ecx, esi
            //   8bc7                 | mov                 eax, edi
            //   c1e10c               | shl                 ecx, 0xc
            //   c1e804               | shr                 eax, 4
            //   25003f0000           | and                 eax, 0x3f00

        $sequence_8 = { e8???????? 53 8b5d10 33c0 56 8b7518 8945dc }
            // n = 7, score = 300
            //   e8????????           |                     
            //   53                   | push                ebx
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   33c0                 | xor                 eax, eax
            //   56                   | push                esi
            //   8b7518               | mov                 esi, dword ptr [ebp + 0x18]
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax

        $sequence_9 = { e8???????? 59 ff742434 88442417 e8???????? 807c241700 59 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   ff742434             | push                dword ptr [esp + 0x34]
            //   88442417             | mov                 byte ptr [esp + 0x17], al
            //   e8????????           |                     
            //   807c241700           | cmp                 byte ptr [esp + 0x17], 0
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 827392
}