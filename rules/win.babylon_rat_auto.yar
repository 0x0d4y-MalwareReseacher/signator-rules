rule win_babylon_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.babylon_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.babylon_rat"
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
        $sequence_0 = { ff75a0 ff75b8 e8???????? 8b4dcc 83c41c 85c9 0f8560fcffff }
            // n = 7, score = 100
            //   ff75a0               | push                dword ptr [ebp - 0x60]
            //   ff75b8               | push                dword ptr [ebp - 0x48]
            //   e8????????           |                     
            //   8b4dcc               | mov                 ecx, dword ptr [ebp - 0x34]
            //   83c41c               | add                 esp, 0x1c
            //   85c9                 | test                ecx, ecx
            //   0f8560fcffff         | jne                 0xfffffc66

        $sequence_1 = { eb52 56 8b7508 8d45fc 33c9 51 50 }
            // n = 7, score = 100
            //   eb52                 | jmp                 0x54
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   33c9                 | xor                 ecx, ecx
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_2 = { ff75b0 ff75f8 6a44 56 e8???????? 83c418 e9???????? }
            // n = 7, score = 100
            //   ff75b0               | push                dword ptr [ebp - 0x50]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   6a44                 | push                0x44
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   e9????????           |                     

        $sequence_3 = { 8b08 ff5108 8b8500ffffff 8d9508ffffff 56 52 6a01 }
            // n = 7, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5108               | call                dword ptr [ecx + 8]
            //   8b8500ffffff         | mov                 eax, dword ptr [ebp - 0x100]
            //   8d9508ffffff         | lea                 edx, [ebp - 0xf8]
            //   56                   | push                esi
            //   52                   | push                edx
            //   6a01                 | push                1

        $sequence_4 = { ff5128 83c40c 837d0801 7405 33db 43 eb19 }
            // n = 7, score = 100
            //   ff5128               | call                dword ptr [ecx + 0x28]
            //   83c40c               | add                 esp, 0xc
            //   837d0801             | cmp                 dword ptr [ebp + 8], 1
            //   7405                 | je                  7
            //   33db                 | xor                 ebx, ebx
            //   43                   | inc                 ebx
            //   eb19                 | jmp                 0x1b

        $sequence_5 = { e9???????? c6460901 33d2 0fb64e06 33c0 53 8b5d14 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c6460901             | mov                 byte ptr [esi + 9], 1
            //   33d2                 | xor                 edx, edx
            //   0fb64e06             | movzx               ecx, byte ptr [esi + 6]
            //   33c0                 | xor                 eax, eax
            //   53                   | push                ebx
            //   8b5d14               | mov                 ebx, dword ptr [ebp + 0x14]

        $sequence_6 = { ff7310 68???????? e9???????? 8b4310 50 56 898508ffffff }
            // n = 7, score = 100
            //   ff7310               | push                dword ptr [ebx + 0x10]
            //   68????????           |                     
            //   e9????????           |                     
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   50                   | push                eax
            //   56                   | push                esi
            //   898508ffffff         | mov                 dword ptr [ebp - 0xf8], eax

        $sequence_7 = { ff750c 6a19 56 e8???????? 807f1c00 6afe 58 }
            // n = 7, score = 100
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   6a19                 | push                0x19
            //   56                   | push                esi
            //   e8????????           |                     
            //   807f1c00             | cmp                 byte ptr [edi + 0x1c], 0
            //   6afe                 | push                -2
            //   58                   | pop                 eax

        $sequence_8 = { 8b06 894008 83660400 5e c3 8b15???????? 8b02 }
            // n = 7, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   894008               | mov                 dword ptr [eax + 8], eax
            //   83660400             | and                 dword ptr [esi + 4], 0
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   8b15????????         |                     
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_9 = { ff75fc e8???????? 8d5601 33c0 33f6 8955bc 83c414 }
            // n = 7, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8d5601               | lea                 edx, [esi + 1]
            //   33c0                 | xor                 eax, eax
            //   33f6                 | xor                 esi, esi
            //   8955bc               | mov                 dword ptr [ebp - 0x44], edx
            //   83c414               | add                 esp, 0x14

    condition:
        7 of them and filesize < 1604608
}