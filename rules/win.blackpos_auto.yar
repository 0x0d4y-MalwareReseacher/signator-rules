rule win_blackpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.blackpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackpos"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 40 50 ffd6 85c0 7507 e8???????? eb27 }
            // n = 7, score = 100
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   e8????????           |                     
            //   eb27                 | jmp                 0x29

        $sequence_1 = { 46 83bddcfbffff1e 0f8c44ffffff 807d2000 754a }
            // n = 5, score = 100
            //   46                   | inc                 esi
            //   83bddcfbffff1e       | cmp                 dword ptr [ebp - 0x424], 0x1e
            //   0f8c44ffffff         | jl                  0xffffff4a
            //   807d2000             | cmp                 byte ptr [ebp + 0x20], 0
            //   754a                 | jne                 0x4c

        $sequence_2 = { 80f920 7205 80f97f 7204 c6041021 }
            // n = 5, score = 100
            //   80f920               | cmp                 cl, 0x20
            //   7205                 | jb                  7
            //   80f97f               | cmp                 cl, 0x7f
            //   7204                 | jb                  6
            //   c6041021             | mov                 byte ptr [eax + edx], 0x21

        $sequence_3 = { 8bec 81ec48040000 a1???????? 33c5 8945fc 8b450c 8985ccfbffff }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   81ec48040000         | sub                 esp, 0x448
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8985ccfbffff         | mov                 dword ptr [ebp - 0x434], eax

        $sequence_4 = { c745c021282a28 c745c44d4d4d4d c745c84d4d4d4d c745cc4d4d4d4d c745d04d4d4d4d c745d44d4d4d4d }
            // n = 6, score = 100
            //   c745c021282a28       | mov                 dword ptr [ebp - 0x40], 0x282a2821
            //   c745c44d4d4d4d       | mov                 dword ptr [ebp - 0x3c], 0x4d4d4d4d
            //   c745c84d4d4d4d       | mov                 dword ptr [ebp - 0x38], 0x4d4d4d4d
            //   c745cc4d4d4d4d       | mov                 dword ptr [ebp - 0x34], 0x4d4d4d4d
            //   c745d04d4d4d4d       | mov                 dword ptr [ebp - 0x30], 0x4d4d4d4d
            //   c745d44d4d4d4d       | mov                 dword ptr [ebp - 0x2c], 0x4d4d4d4d

        $sequence_5 = { 50 8d85b8f4ffff 50 53 6800000008 6a01 53 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d85b8f4ffff         | lea                 eax, [ebp - 0xb48]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   6800000008           | push                0x8000000
            //   6a01                 | push                1
            //   53                   | push                ebx

        $sequence_6 = { bf???????? 833cf544ee410001 751d 8d04f540ee4100 8938 68a00f0000 ff30 }
            // n = 7, score = 100
            //   bf????????           |                     
            //   833cf544ee410001     | cmp                 dword ptr [esi*8 + 0x41ee44], 1
            //   751d                 | jne                 0x1f
            //   8d04f540ee4100       | lea                 eax, [esi*8 + 0x41ee40]
            //   8938                 | mov                 dword ptr [eax], edi
            //   68a00f0000           | push                0xfa0
            //   ff30                 | push                dword ptr [eax]

        $sequence_7 = { 3bc6 0f848e000000 68b80b0000 6a01 56 }
            // n = 5, score = 100
            //   3bc6                 | cmp                 eax, esi
            //   0f848e000000         | je                  0x94
            //   68b80b0000           | push                0xbb8
            //   6a01                 | push                1
            //   56                   | push                esi

        $sequence_8 = { 8bf8 897dd4 8b5dd0 ebab c745e42c824100 817de438824100 7311 }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   897dd4               | mov                 dword ptr [ebp - 0x2c], edi
            //   8b5dd0               | mov                 ebx, dword ptr [ebp - 0x30]
            //   ebab                 | jmp                 0xffffffad
            //   c745e42c824100       | mov                 dword ptr [ebp - 0x1c], 0x41822c
            //   817de438824100       | cmp                 dword ptr [ebp - 0x1c], 0x418238
            //   7311                 | jae                 0x13

        $sequence_9 = { 7e33 89b5b4f4ffff 6a14 8d45bc 50 }
            // n = 5, score = 100
            //   7e33                 | jle                 0x35
            //   89b5b4f4ffff         | mov                 dword ptr [ebp - 0xb4c], esi
            //   6a14                 | push                0x14
            //   8d45bc               | lea                 eax, [ebp - 0x44]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 3293184
}