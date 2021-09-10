rule win_contopee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.contopee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.contopee"
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
        $sequence_0 = { 56 57 8b7c241c 8b5f1c }
            // n = 4, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7c241c             | mov                 edi, dword ptr [esp + 0x1c]
            //   8b5f1c               | mov                 ebx, dword ptr [edi + 0x1c]

        $sequence_1 = { 740d 5e 5d 83c8ff 5b 81c468040000 }
            // n = 6, score = 100
            //   740d                 | je                  0xf
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   83c8ff               | or                  eax, 0xffffffff
            //   5b                   | pop                 ebx
            //   81c468040000         | add                 esp, 0x468

        $sequence_2 = { 85c0 7447 8b442424 85c0 763f 57 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   7447                 | je                  0x49
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   85c0                 | test                eax, eax
            //   763f                 | jbe                 0x41
            //   57                   | push                edi

        $sequence_3 = { e8???????? 83c410 85c0 7ede 8d44241c 50 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7ede                 | jle                 0xffffffe0
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]
            //   50                   | push                eax

        $sequence_4 = { 6a00 68???????? 51 ff15???????? 85c0 5e 7504 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   68????????           |                     
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   5e                   | pop                 esi
            //   7504                 | jne                 6

        $sequence_5 = { ffd6 a1???????? 83c408 3bc5 }
            // n = 4, score = 100
            //   ffd6                 | call                esi
            //   a1????????           |                     
            //   83c408               | add                 esp, 8
            //   3bc5                 | cmp                 eax, ebp

        $sequence_6 = { 89442428 e8???????? 83c404 6a00 6880000000 6a04 6a00 }
            // n = 7, score = 100
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a04                 | push                4
            //   6a00                 | push                0

        $sequence_7 = { 6a00 55 56 e8???????? 83c410 85c0 7ede }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   55                   | push                ebp
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7ede                 | jle                 0xffffffe0

        $sequence_8 = { 6800080000 51 56 e8???????? 6a14 6a01 56 }
            // n = 7, score = 100
            //   6800080000           | push                0x800
            //   51                   | push                ecx
            //   56                   | push                esi
            //   e8????????           |                     
            //   6a14                 | push                0x14
            //   6a01                 | push                1
            //   56                   | push                esi

        $sequence_9 = { 52 e8???????? 83c430 5f 5e }
            // n = 5, score = 100
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c430               | add                 esp, 0x30
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

    condition:
        7 of them and filesize < 180224
}