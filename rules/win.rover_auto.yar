rule win_rover_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.rover."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rover"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 8b30 8b1d???????? 6a0d 56 ffd3 83c408 85c0 }
            // n = 7, score = 100
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   8b1d????????         |                     
            //   6a0d                 | push                0xd
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_1 = { 85c0 0f844ef9ffff c7450803000000 e9???????? 017d14 80fb20 750c }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f844ef9ffff         | je                  0xfffff954
            //   c7450803000000       | mov                 dword ptr [ebp + 8], 3
            //   e9????????           |                     
            //   017d14               | add                 dword ptr [ebp + 0x14], edi
            //   80fb20               | cmp                 bl, 0x20
            //   750c                 | jne                 0xe

        $sequence_2 = { 50 68???????? eba5 6800010000 8d8c24b4000000 51 55 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   eba5                 | jmp                 0xffffffa7
            //   6800010000           | push                0x100
            //   8d8c24b4000000       | lea                 ecx, [esp + 0xb4]
            //   51                   | push                ecx
            //   55                   | push                ebp

        $sequence_3 = { 83c404 85c0 7423 8bbe00050000 8b4720 8b4f1c 83c70c }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7423                 | je                  0x25
            //   8bbe00050000         | mov                 edi, dword ptr [esi + 0x500]
            //   8b4720               | mov                 eax, dword ptr [edi + 0x20]
            //   8b4f1c               | mov                 ecx, dword ptr [edi + 0x1c]
            //   83c70c               | add                 edi, 0xc

        $sequence_4 = { 83f851 0f84d6040000 33c9 3bc1 7409 894c2414 e9???????? }
            // n = 7, score = 100
            //   83f851               | cmp                 eax, 0x51
            //   0f84d6040000         | je                  0x4dc
            //   33c9                 | xor                 ecx, ecx
            //   3bc1                 | cmp                 eax, ecx
            //   7409                 | je                  0xb
            //   894c2414             | mov                 dword ptr [esp + 0x14], ecx
            //   e9????????           |                     

        $sequence_5 = { 8b6c2430 8b54243c 55 6a00 52 6a01 6aff }
            // n = 7, score = 100
            //   8b6c2430             | mov                 ebp, dword ptr [esp + 0x30]
            //   8b54243c             | mov                 edx, dword ptr [esp + 0x3c]
            //   55                   | push                ebp
            //   6a00                 | push                0
            //   52                   | push                edx
            //   6a01                 | push                1
            //   6aff                 | push                -1

        $sequence_6 = { e9???????? 83fe50 750a 68???????? e9???????? 83fe51 750f }
            // n = 7, score = 100
            //   e9????????           |                     
            //   83fe50               | cmp                 esi, 0x50
            //   750a                 | jne                 0xc
            //   68????????           |                     
            //   e9????????           |                     
            //   83fe51               | cmp                 esi, 0x51
            //   750f                 | jne                 0x11

        $sequence_7 = { b814000000 c70101000000 39873c010000 89542434 c744245822a14400 896c2440 89542444 }
            // n = 7, score = 100
            //   b814000000           | mov                 eax, 0x14
            //   c70101000000         | mov                 dword ptr [ecx], 1
            //   39873c010000         | cmp                 dword ptr [edi + 0x13c], eax
            //   89542434             | mov                 dword ptr [esp + 0x34], edx
            //   c744245822a14400     | mov                 dword ptr [esp + 0x58], 0x44a122
            //   896c2440             | mov                 dword ptr [esp + 0x40], ebp
            //   89542444             | mov                 dword ptr [esp + 0x44], edx

        $sequence_8 = { 754e 8d54241c 52 56 e8???????? 8b542428 8b4c2424 }
            // n = 7, score = 100
            //   754e                 | jne                 0x50
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   52                   | push                edx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b542428             | mov                 edx, dword ptr [esp + 0x28]
            //   8b4c2424             | mov                 ecx, dword ptr [esp + 0x24]

        $sequence_9 = { 83e7e5 83c71b e9???????? 85ff 0f85ce090000 8b4500 50 }
            // n = 7, score = 100
            //   83e7e5               | and                 edi, 0xffffffe5
            //   83c71b               | add                 edi, 0x1b
            //   e9????????           |                     
            //   85ff                 | test                edi, edi
            //   0f85ce090000         | jne                 0x9d4
            //   8b4500               | mov                 eax, dword ptr [ebp]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 704512
}