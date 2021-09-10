rule win_poldat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.poldat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poldat"
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
        $sequence_0 = { 56 56 53 ff74241c 6aff ff74242c }
            // n = 6, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   53                   | push                ebx
            //   ff74241c             | push                dword ptr [esp + 0x1c]
            //   6aff                 | push                -1
            //   ff74242c             | push                dword ptr [esp + 0x2c]

        $sequence_1 = { 40 3b45fc 72ae eb43 81ec580c0000 b916030000 be???????? }
            // n = 7, score = 100
            //   40                   | inc                 eax
            //   3b45fc               | cmp                 eax, dword ptr [ebp - 4]
            //   72ae                 | jb                  0xffffffb0
            //   eb43                 | jmp                 0x45
            //   81ec580c0000         | sub                 esp, 0xc58
            //   b916030000           | mov                 ecx, 0x316
            //   be????????           |                     

        $sequence_2 = { 8a449598 c645dd6e c0e003 0404 8065fe00 8845fd }
            // n = 6, score = 100
            //   8a449598             | mov                 al, byte ptr [ebp + edx*4 - 0x68]
            //   c645dd6e             | mov                 byte ptr [ebp - 0x23], 0x6e
            //   c0e003               | shl                 al, 3
            //   0404                 | add                 al, 4
            //   8065fe00             | and                 byte ptr [ebp - 2], 0
            //   8845fd               | mov                 byte ptr [ebp - 3], al

        $sequence_3 = { e8???????? 83c40c 8d85a4fbffff ff7508 68???????? }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85a4fbffff         | lea                 eax, dword ptr [ebp - 0x45c]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   68????????           |                     

        $sequence_4 = { 8b4620 897e18 3bc7 750a c74620a0324000 897e28 397e24 }
            // n = 7, score = 100
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   897e18               | mov                 dword ptr [esi + 0x18], edi
            //   3bc7                 | cmp                 eax, edi
            //   750a                 | jne                 0xc
            //   c74620a0324000       | mov                 dword ptr [esi + 0x20], 0x4032a0
            //   897e28               | mov                 dword ptr [esi + 0x28], edi
            //   397e24               | cmp                 dword ptr [esi + 0x24], edi

        $sequence_5 = { 0f8485030000 833e00 0f847c030000 8b542418 33db }
            // n = 5, score = 100
            //   0f8485030000         | je                  0x38b
            //   833e00               | cmp                 dword ptr [esi], 0
            //   0f847c030000         | je                  0x382
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   33db                 | xor                 ebx, ebx

        $sequence_6 = { 85c0 0f84aa000000 8b442410 8a4808 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   0f84aa000000         | je                  0xb0
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8a4808               | mov                 cl, byte ptr [eax + 8]

        $sequence_7 = { 50 ff15???????? 85c0 7547 8d85ecfdffff 68???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7547                 | jne                 0x49
            //   8d85ecfdffff         | lea                 eax, dword ptr [ebp - 0x214]
            //   68????????           |                     

        $sequence_8 = { 85c0 0f84bd000000 8b5608 8b0e 48 42 895608 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f84bd000000         | je                  0xc3
            //   8b5608               | mov                 edx, dword ptr [esi + 8]
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   48                   | dec                 eax
            //   42                   | inc                 edx
            //   895608               | mov                 dword ptr [esi + 8], edx

        $sequence_9 = { 56 8d85ecfdffff 56 50 ff15???????? }
            // n = 5, score = 100
            //   56                   | push                esi
            //   8d85ecfdffff         | lea                 eax, dword ptr [ebp - 0x214]
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 247808
}