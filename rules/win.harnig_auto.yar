rule win_harnig_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.harnig."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.harnig"
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
        $sequence_0 = { c20800 6a05 ff742408 e8???????? c20400 53 }
            // n = 6, score = 100
            //   c20800               | ret                 8
            //   6a05                 | push                5
            //   ff742408             | push                dword ptr [esp + 8]
            //   e8????????           |                     
            //   c20400               | ret                 4
            //   53                   | push                ebx

        $sequence_1 = { 8bca 8dbde8fbffff f3ab 8d45f0 50 8d85e8fbffff }
            // n = 6, score = 100
            //   8bca                 | mov                 ecx, edx
            //   8dbde8fbffff         | lea                 edi, [ebp - 0x418]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   8d85e8fbffff         | lea                 eax, [ebp - 0x418]

        $sequence_2 = { ffd0 eb0b 68???????? ff15???????? 8bc8 }
            // n = 5, score = 100
            //   ffd0                 | call                eax
            //   eb0b                 | jmp                 0xd
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bc8                 | mov                 ecx, eax

        $sequence_3 = { 03c1 5e c9 c20800 8b542404 8a0a 33c0 }
            // n = 7, score = 100
            //   03c1                 | add                 eax, ecx
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   8b542404             | mov                 edx, dword ptr [esp + 4]
            //   8a0a                 | mov                 cl, byte ptr [edx]
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { 0bc6 5e c20800 6a05 }
            // n = 4, score = 100
            //   0bc6                 | or                  eax, esi
            //   5e                   | pop                 esi
            //   c20800               | ret                 8
            //   6a05                 | push                5

        $sequence_5 = { 56 8d85e0fdffff 50 ffd3 8d45e0 50 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   8d85e0fdffff         | lea                 eax, [ebp - 0x220]
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax

        $sequence_6 = { 56 57 ba00010000 33c0 8bca 8dbde8f7ffff f3ab }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   ba00010000           | mov                 edx, 0x100
            //   33c0                 | xor                 eax, eax
            //   8bca                 | mov                 ecx, edx
            //   8dbde8f7ffff         | lea                 edi, [ebp - 0x818]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_7 = { 85c0 746b 8b45f8 68f1cbf7ae }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   746b                 | je                  0x6d
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   68f1cbf7ae           | push                0xaef7cbf1

        $sequence_8 = { ff5150 8b45fc 8b08 8d9524fdffff 52 8d9590feffff }
            // n = 6, score = 100
            //   ff5150               | call                dword ptr [ecx + 0x50]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d9524fdffff         | lea                 edx, [ebp - 0x2dc]
            //   52                   | push                edx
            //   8d9590feffff         | lea                 edx, [ebp - 0x170]

        $sequence_9 = { 8a0a 33c0 84c9 7419 56 8bf0 }
            // n = 6, score = 100
            //   8a0a                 | mov                 cl, byte ptr [edx]
            //   33c0                 | xor                 eax, eax
            //   84c9                 | test                cl, cl
            //   7419                 | je                  0x1b
            //   56                   | push                esi
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 49152
}