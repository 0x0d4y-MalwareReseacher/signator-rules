rule win_lolsnif_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.lolsnif."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lolsnif"
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
        $sequence_0 = { 8b06 8d4c240c 51 ff742410 53 56 ff500c }
            // n = 7, score = 200
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d4c240c             | lea                 ecx, dword ptr [esp + 0xc]
            //   51                   | push                ecx
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff500c               | call                dword ptr [eax + 0xc]

        $sequence_1 = { 0f841b020000 50 ff7320 e8???????? 8bf0 85f6 }
            // n = 6, score = 200
            //   0f841b020000         | je                  0x221
            //   50                   | push                eax
            //   ff7320               | push                dword ptr [ebx + 0x20]
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_2 = { e8???????? 8bf0 3bf3 7513 ff75f0 8b4df8 33c0 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   3bf3                 | cmp                 esi, ebx
            //   7513                 | jne                 0x15
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 8944243c 0f84d5000000 8b0d???????? 53 51 894c241c }
            // n = 6, score = 200
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax
            //   0f84d5000000         | je                  0xdb
            //   8b0d????????         |                     
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   894c241c             | mov                 dword ptr [esp + 0x1c], ecx

        $sequence_4 = { 754d 837df408 8b5dec 7531 8d45e8 }
            // n = 5, score = 200
            //   754d                 | jne                 0x4f
            //   837df408             | cmp                 dword ptr [ebp - 0xc], 8
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   7531                 | jne                 0x33
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]

        $sequence_5 = { 8945f8 3bc3 0f85b5050000 ff7508 8d45f8 6a04 }
            // n = 6, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   3bc3                 | cmp                 eax, ebx
            //   0f85b5050000         | jne                 0x5bb
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   6a04                 | push                4

        $sequence_6 = { 8b5634 8364242400 eb0a 8b4634 8b5630 89442424 8b4510 }
            // n = 7, score = 200
            //   8b5634               | mov                 edx, dword ptr [esi + 0x34]
            //   8364242400           | and                 dword ptr [esp + 0x24], 0
            //   eb0a                 | jmp                 0xc
            //   8b4634               | mov                 eax, dword ptr [esi + 0x34]
            //   8b5630               | mov                 edx, dword ptr [esi + 0x30]
            //   89442424             | mov                 dword ptr [esp + 0x24], eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_7 = { e8???????? 85c0 7422 6a20 e8???????? 8bf0 85f6 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24
            //   6a20                 | push                0x20
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_8 = { 3522be3f09 50 8bd3 e8???????? }
            // n = 4, score = 200
            //   3522be3f09           | xor                 eax, 0x93fbe22
            //   50                   | push                eax
            //   8bd3                 | mov                 edx, ebx
            //   e8????????           |                     

        $sequence_9 = { 890b 75c5 5b 5f 5d c20800 53 }
            // n = 7, score = 200
            //   890b                 | mov                 dword ptr [ebx], ecx
            //   75c5                 | jne                 0xffffffc7
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 425984
}