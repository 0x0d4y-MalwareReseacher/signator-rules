rule win_pushdo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.pushdo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pushdo"
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
        $sequence_0 = { f7f9 33c9 ba88020000 f7e2 0f90c1 }
            // n = 5, score = 1200
            //   f7f9                 | idiv                ecx
            //   33c9                 | xor                 ecx, ecx
            //   ba88020000           | mov                 edx, 0x288
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl

        $sequence_1 = { 50 ff15???????? 33d2 b9ffff0000 f7f1 }
            // n = 5, score = 1200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   33d2                 | xor                 edx, edx
            //   b9ffff0000           | mov                 ecx, 0xffff
            //   f7f1                 | div                 ecx

        $sequence_2 = { 60 8b45fc b10b d3c0 }
            // n = 4, score = 1100
            //   60                   | pushal              
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   b10b                 | mov                 cl, 0xb
            //   d3c0                 | rol                 eax, cl

        $sequence_3 = { ebd2 c785e8feffff00000000 c745f400000000 c745fc00000000 eb09 }
            // n = 5, score = 800
            //   ebd2                 | jmp                 0xffffffd4
            //   c785e8feffff00000000     | mov    dword ptr [ebp - 0x118], 0
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   eb09                 | jmp                 0xb

        $sequence_4 = { 8b4514 0fbe1410 03ca 81e1ff000000 898de8feffff }
            // n = 5, score = 800
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   0fbe1410             | movsx               edx, byte ptr [eax + edx]
            //   03ca                 | add                 ecx, edx
            //   81e1ff000000         | and                 ecx, 0xff
            //   898de8feffff         | mov                 dword ptr [ebp - 0x118], ecx

        $sequence_5 = { 83c40c 8d8df0feffff 894df8 c685effeffff00 }
            // n = 4, score = 800
            //   83c40c               | add                 esp, 0xc
            //   8d8df0feffff         | lea                 ecx, [ebp - 0x110]
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   c685effeffff00       | mov                 byte ptr [ebp - 0x111], 0

        $sequence_6 = { 0fbe8c05f0feffff 8b45f4 0fbe8405f0feffff 03c8 81e1ff000000 }
            // n = 5, score = 800
            //   0fbe8c05f0feffff     | movsx               ecx, byte ptr [ebp + eax - 0x110]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   0fbe8405f0feffff     | movsx               eax, byte ptr [ebp + eax - 0x110]
            //   03c8                 | add                 ecx, eax
            //   81e1ff000000         | and                 ecx, 0xff

        $sequence_7 = { 0fbe940df0feffff 0395e8feffff 81e2ff000000 8995e8feffff 8b45f4 8a8c05f0feffff 888deffeffff }
            // n = 7, score = 800
            //   0fbe940df0feffff     | movsx               edx, byte ptr [ebp + ecx - 0x110]
            //   0395e8feffff         | add                 edx, dword ptr [ebp - 0x118]
            //   81e2ff000000         | and                 edx, 0xff
            //   8995e8feffff         | mov                 dword ptr [ebp - 0x118], edx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8a8c05f0feffff       | mov                 cl, byte ptr [ebp + eax - 0x110]
            //   888deffeffff         | mov                 byte ptr [ebp - 0x111], cl

        $sequence_8 = { 83ec2c 53 56 57 be???????? 8d7dd4 }
            // n = 6, score = 500
            //   83ec2c               | sub                 esp, 0x2c
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   be????????           |                     
            //   8d7dd4               | lea                 edi, [ebp - 0x2c]

        $sequence_9 = { 52 8d8588fbffff 50 e8???????? }
            // n = 4, score = 500
            //   52                   | push                edx
            //   8d8588fbffff         | lea                 eax, [ebp - 0x478]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_10 = { 3bc3 7412 8b4d14 3bcb 7402 8901 }
            // n = 6, score = 500
            //   3bc3                 | cmp                 eax, ebx
            //   7412                 | je                  0x14
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   3bcb                 | cmp                 ecx, ebx
            //   7402                 | je                  4
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_11 = { 40 8d4dfc 51 6a02 53 }
            // n = 5, score = 500
            //   40                   | inc                 eax
            //   8d4dfc               | lea                 ecx, [ebp - 4]
            //   51                   | push                ecx
            //   6a02                 | push                2
            //   53                   | push                ebx

        $sequence_12 = { c1fa0c 80e20f 81e7ff0f0000 80fa03 750d 0fbfd7 }
            // n = 6, score = 500
            //   c1fa0c               | sar                 edx, 0xc
            //   80e20f               | and                 dl, 0xf
            //   81e7ff0f0000         | and                 edi, 0xfff
            //   80fa03               | cmp                 dl, 3
            //   750d                 | jne                 0xf
            //   0fbfd7               | movsx               edx, di

        $sequence_13 = { 6a17 ffd6 ffb5f4f7ffff 8d85f4fbffff 50 ffd7 }
            // n = 6, score = 500
            //   6a17                 | push                0x17
            //   ffd6                 | call                esi
            //   ffb5f4f7ffff         | push                dword ptr [ebp - 0x80c]
            //   8d85f4fbffff         | lea                 eax, [ebp - 0x40c]
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_14 = { 8b9598fcffff 0fbe02 50 68???????? e8???????? 83c408 2d???????? }
            // n = 7, score = 200
            //   8b9598fcffff         | mov                 edx, dword ptr [ebp - 0x368]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   2d????????           |                     

        $sequence_15 = { 0f8530010000 b901000000 85c9 0f8421010000 }
            // n = 4, score = 200
            //   0f8530010000         | jne                 0x136
            //   b901000000           | mov                 ecx, 1
            //   85c9                 | test                ecx, ecx
            //   0f8421010000         | je                  0x127

        $sequence_16 = { 8b8544feffff 8b0c85d0540009 51 8b9564feffff 039558feffff 52 8b8564feffff }
            // n = 7, score = 200
            //   8b8544feffff         | mov                 eax, dword ptr [ebp - 0x1bc]
            //   8b0c85d0540009       | mov                 ecx, dword ptr [eax*4 + 0x90054d0]
            //   51                   | push                ecx
            //   8b9564feffff         | mov                 edx, dword ptr [ebp - 0x19c]
            //   039558feffff         | add                 edx, dword ptr [ebp - 0x1a8]
            //   52                   | push                edx
            //   8b8564feffff         | mov                 eax, dword ptr [ebp - 0x19c]

        $sequence_17 = { 899544feffff 8b9544feffff 899548feffff 8b8544feffff 833c85d054000900 0f8481000000 }
            // n = 6, score = 200
            //   899544feffff         | mov                 dword ptr [ebp - 0x1bc], edx
            //   8b9544feffff         | mov                 edx, dword ptr [ebp - 0x1bc]
            //   899548feffff         | mov                 dword ptr [ebp - 0x1b8], edx
            //   8b8544feffff         | mov                 eax, dword ptr [ebp - 0x1bc]
            //   833c85d054000900     | cmp                 dword ptr [eax*4 + 0x90054d0], 0
            //   0f8481000000         | je                  0x87

        $sequence_18 = { 8b45b8 50 e8???????? 8945b8 6a6c 8b4db8 51 }
            // n = 7, score = 200
            //   8b45b8               | mov                 eax, dword ptr [ebp - 0x48]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   6a6c                 | push                0x6c
            //   8b4db8               | mov                 ecx, dword ptr [ebp - 0x48]
            //   51                   | push                ecx

        $sequence_19 = { d3fa 8955f4 8b4df0 83e904 }
            // n = 4, score = 200
            //   d3fa                 | sar                 edx, cl
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   83e904               | sub                 ecx, 4

        $sequence_20 = { 8b4514 8b8de0fdffff 8908 8b95e4fdffff 52 }
            // n = 5, score = 200
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   8b8de0fdffff         | mov                 ecx, dword ptr [ebp - 0x220]
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b95e4fdffff         | mov                 edx, dword ptr [ebp - 0x21c]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 163840
}