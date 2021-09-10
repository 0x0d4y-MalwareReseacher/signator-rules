rule win_ayegent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ayegent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ayegent"
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
        $sequence_0 = { 8854240e 89442413 ff15???????? a1???????? }
            // n = 4, score = 100
            //   8854240e             | mov                 byte ptr [esp + 0xe], dl
            //   89442413             | mov                 dword ptr [esp + 0x13], eax
            //   ff15????????         |                     
            //   a1????????           |                     

        $sequence_1 = { 8d542400 52 50 ff15???????? 8b4c2428 8b542424 }
            // n = 6, score = 100
            //   8d542400             | lea                 edx, dword ptr [esp]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]

        $sequence_2 = { 89442410 8d4c240c 89442414 51 }
            // n = 4, score = 100
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   8d4c240c             | lea                 ecx, dword ptr [esp + 0xc]
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   51                   | push                ecx

        $sequence_3 = { c744242402000000 89442428 894c242c 66c74424301404 895c2432 }
            // n = 5, score = 100
            //   c744242402000000     | mov                 dword ptr [esp + 0x24], 2
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   894c242c             | mov                 dword ptr [esp + 0x2c], ecx
            //   66c74424301404       | mov                 word ptr [esp + 0x30], 0x414
            //   895c2432             | mov                 dword ptr [esp + 0x32], ebx

        $sequence_4 = { 68???????? 50 ff15???????? 8b4c2428 8b542424 }
            // n = 5, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]

        $sequence_5 = { 8b542424 51 52 a3???????? ffd0 }
            // n = 5, score = 100
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   a3????????           |                     
            //   ffd0                 | call                eax

        $sequence_6 = { 8d8c2430030000 8d542410 50 6808020000 51 53 52 }
            // n = 7, score = 100
            //   8d8c2430030000       | lea                 ecx, dword ptr [esp + 0x330]
            //   8d542410             | lea                 edx, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   6808020000           | push                0x208
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   52                   | push                edx

        $sequence_7 = { 5f 5e 5d b801000000 5b 81c428050000 c20400 }
            // n = 7, score = 100
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   b801000000           | mov                 eax, 1
            //   5b                   | pop                 ebx
            //   81c428050000         | add                 esp, 0x528
            //   c20400               | ret                 4

        $sequence_8 = { 55 ff15???????? 5f 5e 5d 81c458010000 c3 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   81c458010000         | add                 esp, 0x158
            //   c3                   | ret                 

        $sequence_9 = { c3 68???????? e8???????? 83c404 85c0 744b }
            // n = 6, score = 100
            //   c3                   | ret                 
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   744b                 | je                  0x4d

    condition:
        7 of them and filesize < 90112
}