rule win_bs2005_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.bs2005."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bs2005"
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
        $sequence_0 = { c705????????00000000 8901 e8???????? 83c40c 33c0 }
            // n = 5, score = 100
            //   c705????????00000000     |     
            //   8901                 | mov                 dword ptr [ecx], eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 8b0a ffd1 8b45f0 85f6 740b 8b16 8b4208 }
            // n = 7, score = 100
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   ffd1                 | call                ecx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   85f6                 | test                esi, esi
            //   740b                 | je                  0xd
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b4208               | mov                 eax, dword ptr [edx + 8]

        $sequence_2 = { 8975f4 6a11 8945f0 8975f4 ff15???????? }
            // n = 5, score = 100
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   6a11                 | push                0x11
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   ff15????????         |                     

        $sequence_3 = { 83c410 8d4df4 51 8d860c010800 }
            // n = 4, score = 100
            //   83c410               | add                 esp, 0x10
            //   8d4df4               | lea                 ecx, dword ptr [ebp - 0xc]
            //   51                   | push                ecx
            //   8d860c010800         | lea                 eax, dword ptr [esi + 0x8010c]

        $sequence_4 = { 8b8f4c060000 8b09 81c150000400 8bc1 8d7001 8d642400 8a10 }
            // n = 7, score = 100
            //   8b8f4c060000         | mov                 ecx, dword ptr [edi + 0x64c]
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   81c150000400         | add                 ecx, 0x40050
            //   8bc1                 | mov                 eax, ecx
            //   8d7001               | lea                 esi, dword ptr [eax + 1]
            //   8d642400             | lea                 esp, dword ptr [esp]
            //   8a10                 | mov                 dl, byte ptr [eax]

        $sequence_5 = { 6a02 68???????? 57 ffd6 57 85c0 74cf }
            // n = 7, score = 100
            //   6a02                 | push                2
            //   68????????           |                     
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   57                   | push                edi
            //   85c0                 | test                eax, eax
            //   74cf                 | je                  0xffffffd1

        $sequence_6 = { 68???????? 53 8bf8 e8???????? 83c410 }
            // n = 5, score = 100
            //   68????????           |                     
            //   53                   | push                ebx
            //   8bf8                 | mov                 edi, eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_7 = { 5d c21000 8b5510 8b4d14 }
            // n = 4, score = 100
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

        $sequence_8 = { ffd0 395dfc 740b 68fa000000 ff15???????? ffd6 }
            // n = 6, score = 100
            //   ffd0                 | call                eax
            //   395dfc               | cmp                 dword ptr [ebp - 4], ebx
            //   740b                 | je                  0xd
            //   68fa000000           | push                0xfa
            //   ff15????????         |                     
            //   ffd6                 | call                esi

        $sequence_9 = { 7410 8bc7 e8???????? 57 e8???????? 83c404 68e0930400 }
            // n = 7, score = 100
            //   7410                 | je                  0x12
            //   8bc7                 | mov                 eax, edi
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   68e0930400           | push                0x493e0

    condition:
        7 of them and filesize < 212992
}