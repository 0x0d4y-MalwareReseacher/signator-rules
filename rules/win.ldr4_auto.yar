rule win_ldr4_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.ldr4."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ldr4"
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
        $sequence_0 = { ff742410 6a00 ff742414 ff742414 6a00 6a00 ffd0 }
            // n = 7, score = 100
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   6a00                 | push                0
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ffd0                 | call                eax

        $sequence_1 = { e8???????? 8bfb 85db 0f855d020000 8d44242c 50 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bfb                 | mov                 edi, ebx
            //   85db                 | test                ebx, ebx
            //   0f855d020000         | jne                 0x263
            //   8d44242c             | lea                 eax, [esp + 0x2c]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { 81fee5030000 740c 8b7d08 56 ff7514 e8???????? 5f }
            // n = 7, score = 100
            //   81fee5030000         | cmp                 esi, 0x3e5
            //   740c                 | je                  0xe
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   e8????????           |                     
            //   5f                   | pop                 edi

        $sequence_3 = { 6a00 6a00 ffd0 eb02 33c0 85c0 750f }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ffd0                 | call                eax
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11

        $sequence_4 = { 3bc6 7d34 ff15???????? 8bd8 83fbff 7508 ff15???????? }
            // n = 7, score = 100
            //   3bc6                 | cmp                 eax, esi
            //   7d34                 | jge                 0x36
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   83fbff               | cmp                 ebx, -1
            //   7508                 | jne                 0xa
            //   ff15????????         |                     

        $sequence_5 = { ffd7 5f 8b4508 5e c9 c20c00 55 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   5f                   | pop                 edi
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   55                   | push                ebp

        $sequence_6 = { 89480c 8b45fc 897808 8b45fc }
            // n = 4, score = 100
            //   89480c               | mov                 dword ptr [eax + 0xc], ecx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   897808               | mov                 dword ptr [eax + 8], edi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_7 = { 33c0 c20400 56 57 6a08 }
            // n = 5, score = 100
            //   33c0                 | xor                 eax, eax
            //   c20400               | ret                 4
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a08                 | push                8

        $sequence_8 = { 53 894604 ff15???????? 894508 83f80e 7616 8d8f28d20010 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   ff15????????         |                     
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   83f80e               | cmp                 eax, 0xe
            //   7616                 | jbe                 0x18
            //   8d8f28d20010         | lea                 ecx, [edi + 0x1000d228]

        $sequence_9 = { 8d4d14 51 6a54 ff7614 ffd0 814d0800008000 c74514bb010000 }
            // n = 7, score = 100
            //   8d4d14               | lea                 ecx, [ebp + 0x14]
            //   51                   | push                ecx
            //   6a54                 | push                0x54
            //   ff7614               | push                dword ptr [esi + 0x14]
            //   ffd0                 | call                eax
            //   814d0800008000       | or                  dword ptr [ebp + 8], 0x800000
            //   c74514bb010000       | mov                 dword ptr [ebp + 0x14], 0x1bb

    condition:
        7 of them and filesize < 117760
}