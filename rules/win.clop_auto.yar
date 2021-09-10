rule win_clop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.clop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.clop"
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
        $sequence_0 = { ff15???????? 68???????? 8d85dcf7ffff 50 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   68????????           |                     
            //   8d85dcf7ffff         | lea                 eax, dword ptr [ebp - 0x824]
            //   50                   | push                eax

        $sequence_1 = { 57 6a00 ff15???????? 68???????? 8bd8 }
            // n = 5, score = 300
            //   57                   | push                edi
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   68????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_2 = { 83c408 6aff ff15???????? 33c0 }
            // n = 4, score = 300
            //   83c408               | add                 esp, 8
            //   6aff                 | push                -1
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { ffd0 c3 8bff 55 8bec 83ec1c 8d4de4 }
            // n = 7, score = 300
            //   ffd0                 | call                eax
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec1c               | sub                 esp, 0x1c
            //   8d4de4               | lea                 ecx, dword ptr [ebp - 0x1c]

        $sequence_4 = { 83c424 53 50 ffd6 }
            // n = 4, score = 300
            //   83c424               | add                 esp, 0x24
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_5 = { 83c40c 33f6 85ff 7428 }
            // n = 4, score = 300
            //   83c40c               | add                 esp, 0xc
            //   33f6                 | xor                 esi, esi
            //   85ff                 | test                edi, edi
            //   7428                 | je                  0x2a

        $sequence_6 = { 8d85c8efffff 50 6a08 6a01 }
            // n = 4, score = 300
            //   8d85c8efffff         | lea                 eax, dword ptr [ebp - 0x1038]
            //   50                   | push                eax
            //   6a08                 | push                8
            //   6a01                 | push                1

        $sequence_7 = { ff15???????? 6a00 6a00 e8???????? 83c408 6aff }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   6aff                 | push                -1

        $sequence_8 = { 8bf8 ff15???????? 8bf0 56 6a40 }
            // n = 5, score = 300
            //   8bf8                 | mov                 edi, eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   6a40                 | push                0x40

        $sequence_9 = { 56 53 ff15???????? 50 ff15???????? 56 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_10 = { 68???????? 68???????? e8???????? 83c424 6aff }
            // n = 5, score = 300
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   83c424               | add                 esp, 0x24
            //   6aff                 | push                -1

        $sequence_11 = { 83c40c 6860070000 6a40 ff15???????? }
            // n = 4, score = 300
            //   83c40c               | add                 esp, 0xc
            //   6860070000           | push                0x760
            //   6a40                 | push                0x40
            //   ff15????????         |                     

        $sequence_12 = { 50 ff15???????? 56 53 8bf8 ff15???????? }
            // n = 6, score = 300
            //   50                   | push                eax
            //   ff15????????         |                     
            //   56                   | push                esi
            //   53                   | push                ebx
            //   8bf8                 | mov                 edi, eax
            //   ff15????????         |                     

        $sequence_13 = { 53 56 ff15???????? 56 ff15???????? 53 ff15???????? }
            // n = 7, score = 300
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_14 = { 8d85bcefffff 50 ff15???????? 68???????? }
            // n = 4, score = 300
            //   8d85bcefffff         | lea                 eax, dword ptr [ebp - 0x1044]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_15 = { 53 56 57 8d44240c 894c241c 50 52 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   894c241c             | mov                 dword ptr [esp + 0x1c], ecx
            //   50                   | push                eax
            //   52                   | push                edx

        $sequence_16 = { 6aff ffd7 8b4dfc 33c0 }
            // n = 4, score = 200
            //   6aff                 | push                -1
            //   ffd7                 | call                edi
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33c0                 | xor                 eax, eax

    condition:
        7 of them and filesize < 630784
}