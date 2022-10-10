rule win_mylobot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.mylobot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mylobot"
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
        $sequence_0 = { 83c40c 8907 6a00 ff5644 50 ff5640 5f }
            // n = 7, score = 1000
            //   83c40c               | add                 esp, 0xc
            //   8907                 | mov                 dword ptr [edi], eax
            //   6a00                 | push                0
            //   ff5644               | call                dword ptr [esi + 0x44]
            //   50                   | push                eax
            //   ff5640               | call                dword ptr [esi + 0x40]
            //   5f                   | pop                 edi

        $sequence_1 = { 8b750c 8d7dea 668945e8 ab ab }
            // n = 5, score = 1000
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8d7dea               | lea                 edi, [ebp - 0x16]
            //   668945e8             | mov                 word ptr [ebp - 0x18], ax
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_2 = { 8d45c0 50 ff15???????? 85c0 750b 68e8030000 ff15???????? }
            // n = 7, score = 1000
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750b                 | jne                 0xd
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     

        $sequence_3 = { 894b08 85c9 747e 8b430c 8b54241c 891481 ff430c }
            // n = 7, score = 1000
            //   894b08               | mov                 dword ptr [ebx + 8], ecx
            //   85c9                 | test                ecx, ecx
            //   747e                 | je                  0x80
            //   8b430c               | mov                 eax, dword ptr [ebx + 0xc]
            //   8b54241c             | mov                 edx, dword ptr [esp + 0x1c]
            //   891481               | mov                 dword ptr [ecx + eax*4], edx
            //   ff430c               | inc                 dword ptr [ebx + 0xc]

        $sequence_4 = { 56 ffd3 8b0d???????? 55 8981f4000000 8d442414 50 }
            // n = 7, score = 1000
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   8b0d????????         |                     
            //   55                   | push                ebp
            //   8981f4000000         | mov                 dword ptr [ecx + 0xf4], eax
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   50                   | push                eax

        $sequence_5 = { 74d2 6a00 6800040000 8d85c8f6ffff 50 57 ff15???????? }
            // n = 7, score = 1000
            //   74d2                 | je                  0xffffffd4
            //   6a00                 | push                0
            //   6800040000           | push                0x400
            //   8d85c8f6ffff         | lea                 eax, [ebp - 0x938]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_6 = { 8bf0 85d2 7413 57 8b7c2410 2bf8 8a0c37 }
            // n = 7, score = 1000
            //   8bf0                 | mov                 esi, eax
            //   85d2                 | test                edx, edx
            //   7413                 | je                  0x15
            //   57                   | push                edi
            //   8b7c2410             | mov                 edi, dword ptr [esp + 0x10]
            //   2bf8                 | sub                 edi, eax
            //   8a0c37               | mov                 cl, byte ptr [edi + esi]

        $sequence_7 = { 8b0d???????? 53 ff91b0000000 a1???????? ff90ac000000 50 e8???????? }
            // n = 7, score = 1000
            //   8b0d????????         |                     
            //   53                   | push                ebx
            //   ff91b0000000         | call                dword ptr [ecx + 0xb0]
            //   a1????????           |                     
            //   ff90ac000000         | call                dword ptr [eax + 0xac]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 8d8dd4fdffff 8bf8 51 57 ff15???????? 8b35???????? 8d642400 }
            // n = 7, score = 800
            //   8d8dd4fdffff         | lea                 ecx, [ebp - 0x22c]
            //   8bf8                 | mov                 edi, eax
            //   51                   | push                ecx
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   8d642400             | lea                 esp, [esp]

        $sequence_9 = { 5d c3 8b45fc 3bc7 7408 8b08 }
            // n = 6, score = 800
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3bc7                 | cmp                 eax, edi
            //   7408                 | je                  0xa
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_10 = { 8d7e1c 687e660480 50 ffd3 85c0 }
            // n = 5, score = 800
            //   8d7e1c               | lea                 edi, [esi + 0x1c]
            //   687e660480           | push                0x8004667e
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax

        $sequence_11 = { 0f8824030000 395df8 0f841b030000 6804010000 }
            // n = 4, score = 800
            //   0f8824030000         | js                  0x32a
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx
            //   0f841b030000         | je                  0x321
            //   6804010000           | push                0x104

        $sequence_12 = { 3bf7 7423 ff15???????? 56 }
            // n = 4, score = 800
            //   3bf7                 | cmp                 esi, edi
            //   7423                 | je                  0x25
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_13 = { 83c404 53 ffd7 8b45ec 83c404 }
            // n = 5, score = 800
            //   83c404               | add                 esp, 4
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   83c404               | add                 esp, 4

        $sequence_14 = { 52 53 50 c745e8ff3f0000 ff15???????? 85c0 }
            // n = 6, score = 800
            //   52                   | push                edx
            //   53                   | push                ebx
            //   50                   | push                eax
            //   c745e8ff3f0000       | mov                 dword ptr [ebp - 0x18], 0x3fff
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_15 = { 83e804 83c104 83f804 73eb 57 }
            // n = 5, score = 800
            //   83e804               | sub                 eax, 4
            //   83c104               | add                 ecx, 4
            //   83f804               | cmp                 eax, 4
            //   73eb                 | jae                 0xffffffed
            //   57                   | push                edi

    condition:
        7 of them and filesize < 8028160
}