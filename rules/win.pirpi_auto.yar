rule win_pirpi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.pirpi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pirpi"
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
        $sequence_0 = { 50 8bcf e8???????? eb21 8d4c240c }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   eb21                 | jmp                 0x23
            //   8d4c240c             | lea                 ecx, [esp + 0xc]

        $sequence_1 = { 85c0 0f8586000000 b920000000 33c0 8dbc24a0000000 68???????? }
            // n = 6, score = 200
            //   85c0                 | test                eax, eax
            //   0f8586000000         | jne                 0x8c
            //   b920000000           | mov                 ecx, 0x20
            //   33c0                 | xor                 eax, eax
            //   8dbc24a0000000       | lea                 edi, [esp + 0xa0]
            //   68????????           |                     

        $sequence_2 = { 50 6a40 ffd7 85c0 89442414 7516 ff15???????? }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   7516                 | jne                 0x18
            //   ff15????????         |                     

        $sequence_3 = { 83c9ff f2ae f7d1 49 741b 803c1a3e 0f8497000000 }
            // n = 7, score = 200
            //   83c9ff               | or                  ecx, 0xffffffff
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   741b                 | je                  0x1d
            //   803c1a3e             | cmp                 byte ptr [edx + ebx], 0x3e
            //   0f8497000000         | je                  0x9d

        $sequence_4 = { 8bcd 56 53 50 57 e8???????? 3933 }
            // n = 7, score = 200
            //   8bcd                 | mov                 ecx, ebp
            //   56                   | push                esi
            //   53                   | push                ebx
            //   50                   | push                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   3933                 | cmp                 dword ptr [ebx], esi

        $sequence_5 = { 83c404 b802000000 5f 5e 5b 83c448 c20800 }
            // n = 7, score = 200
            //   83c404               | add                 esp, 4
            //   b802000000           | mov                 eax, 2
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   83c448               | add                 esp, 0x48
            //   c20800               | ret                 8

        $sequence_6 = { f3a5 8bc8 83e103 f3a4 8b35???????? ffd6 8b7c2424 }
            // n = 7, score = 200
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   8b7c2424             | mov                 edi, dword ptr [esp + 0x24]

        $sequence_7 = { 7521 8b8820200000 85c9 7517 8b8868340000 85c9 750d }
            // n = 7, score = 200
            //   7521                 | jne                 0x23
            //   8b8820200000         | mov                 ecx, dword ptr [eax + 0x2020]
            //   85c9                 | test                ecx, ecx
            //   7517                 | jne                 0x19
            //   8b8868340000         | mov                 ecx, dword ptr [eax + 0x3468]
            //   85c9                 | test                ecx, ecx
            //   750d                 | jne                 0xf

        $sequence_8 = { 8b2d???????? 56 57 8bf1 33db b980000000 }
            // n = 6, score = 200
            //   8b2d????????         |                     
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf1                 | mov                 esi, ecx
            //   33db                 | xor                 ebx, ebx
            //   b980000000           | mov                 ecx, 0x80

        $sequence_9 = { 32da 8818 40 49 75f2 b900010000 33c0 }
            // n = 7, score = 200
            //   32da                 | xor                 bl, dl
            //   8818                 | mov                 byte ptr [eax], bl
            //   40                   | inc                 eax
            //   49                   | dec                 ecx
            //   75f2                 | jne                 0xfffffff4
            //   b900010000           | mov                 ecx, 0x100
            //   33c0                 | xor                 eax, eax

    condition:
        7 of them and filesize < 327680
}