rule win_orcarat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.orcarat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.orcarat"
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
        $sequence_0 = { f7d1 2bf9 8d542414 8bc1 8bf7 8bfa 8d542410 }
            // n = 7, score = 200
            //   f7d1                 | not                 ecx
            //   2bf9                 | sub                 edi, ecx
            //   8d542414             | lea                 edx, dword ptr [esp + 0x14]
            //   8bc1                 | mov                 eax, ecx
            //   8bf7                 | mov                 esi, edi
            //   8bfa                 | mov                 edi, edx
            //   8d542410             | lea                 edx, dword ptr [esp + 0x10]

        $sequence_1 = { 52 8d442420 894c2418 51 50 8bcd c744242400080000 }
            // n = 7, score = 200
            //   52                   | push                edx
            //   8d442420             | lea                 eax, dword ptr [esp + 0x20]
            //   894c2418             | mov                 dword ptr [esp + 0x18], ecx
            //   51                   | push                ecx
            //   50                   | push                eax
            //   8bcd                 | mov                 ecx, ebp
            //   c744242400080000     | mov                 dword ptr [esp + 0x24], 0x800

        $sequence_2 = { be04010000 52 50 89742410 ff15???????? 85c0 7506 }
            // n = 7, score = 200
            //   be04010000           | mov                 esi, 0x104
            //   52                   | push                edx
            //   50                   | push                eax
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7506                 | jne                 8

        $sequence_3 = { f3a4 7411 50 ff15???????? c7855c03000000000000 6a00 }
            // n = 6, score = 200
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   7411                 | je                  0x13
            //   50                   | push                eax
            //   ff15????????         |                     
            //   c7855c03000000000000     | mov    dword ptr [ebp + 0x35c], 0
            //   6a00                 | push                0

        $sequence_4 = { c3 53 6880020000 33f6 c744241080020000 e8???????? 83c404 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   6880020000           | push                0x280
            //   33f6                 | xor                 esi, esi
            //   c744241080020000     | mov                 dword ptr [esp + 0x10], 0x280
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_5 = { 5f 5e 5d 5b c21000 8b07 5f }
            // n = 7, score = 200
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   5f                   | pop                 edi

        $sequence_6 = { 8b35???????? ffd6 8b442418 50 ffd6 8b4c241c }
            // n = 6, score = 200
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]

        $sequence_7 = { 50 894c2414 51 8d4c2420 51 8bcb e8???????? }
            // n = 7, score = 200
            //   50                   | push                eax
            //   894c2414             | mov                 dword ptr [esp + 0x14], ecx
            //   51                   | push                ecx
            //   8d4c2420             | lea                 ecx, dword ptr [esp + 0x20]
            //   51                   | push                ecx
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     

        $sequence_8 = { ff15???????? 85c0 0f849e010000 8b0f 53 6a01 51 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f849e010000         | je                  0x1a4
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   53                   | push                ebx
            //   6a01                 | push                1
            //   51                   | push                ecx

        $sequence_9 = { 50 ff15???????? 899d5c030000 53 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   899d5c030000         | mov                 dword ptr [ebp + 0x35c], ebx
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 114688
}