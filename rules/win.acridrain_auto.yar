rule win_acridrain_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.acridrain."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.acridrain"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 8d7b10 ff77fc 56 e8???????? 6a01 ff37 56 }
            // n = 7, score = 200
            //   8d7b10               | lea                 edi, [ebx + 0x10]
            //   ff77fc               | push                dword ptr [edi - 4]
            //   56                   | push                esi
            //   e8????????           |                     
            //   6a01                 | push                1
            //   ff37                 | push                dword ptr [edi]
            //   56                   | push                esi

        $sequence_1 = { eb10 c785d4fdffff00000000 8bbdccfdffff 85f6 0f841badffff ff7608 ffb5d0fdffff }
            // n = 7, score = 200
            //   eb10                 | jmp                 0x12
            //   c785d4fdffff00000000     | mov    dword ptr [ebp - 0x22c], 0
            //   8bbdccfdffff         | mov                 edi, dword ptr [ebp - 0x234]
            //   85f6                 | test                esi, esi
            //   0f841badffff         | je                  0xffffad21
            //   ff7608               | push                dword ptr [esi + 8]
            //   ffb5d0fdffff         | push                dword ptr [ebp - 0x230]

        $sequence_2 = { ffb53cffffff 53 56 e8???????? 83c40c 85c0 0f8555160000 }
            // n = 7, score = 200
            //   ffb53cffffff         | push                dword ptr [ebp - 0xc4]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f8555160000         | jne                 0x165b

        $sequence_3 = { e9???????? 80b9d002000000 0fb6f3 744a 83fe27 7709 8b0cb5a0744f00 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   80b9d002000000       | cmp                 byte ptr [ecx + 0x2d0], 0
            //   0fb6f3               | movzx               esi, bl
            //   744a                 | je                  0x4c
            //   83fe27               | cmp                 esi, 0x27
            //   7709                 | ja                  0xb
            //   8b0cb5a0744f00       | mov                 ecx, dword ptr [esi*4 + 0x4f74a0]

        $sequence_4 = { ff75cc e8???????? 83c410 ff75b0 57 ff75cc e8???????? }
            // n = 7, score = 200
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   ff75b0               | push                dword ptr [ebp - 0x50]
            //   57                   | push                edi
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   e8????????           |                     

        $sequence_5 = { ff36 e8???????? 83c424 83f812 751c 6a00 6a01 }
            // n = 7, score = 200
            //   ff36                 | push                dword ptr [esi]
            //   e8????????           |                     
            //   83c424               | add                 esp, 0x24
            //   83f812               | cmp                 eax, 0x12
            //   751c                 | jne                 0x1e
            //   6a00                 | push                0
            //   6a01                 | push                1

        $sequence_6 = { ff4148 8b4508 66897e22 5f 894628 b801000000 5e }
            // n = 7, score = 200
            //   ff4148               | inc                 dword ptr [ecx + 0x48]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   66897e22             | mov                 word ptr [esi + 0x22], di
            //   5f                   | pop                 edi
            //   894628               | mov                 dword ptr [esi + 0x28], eax
            //   b801000000           | mov                 eax, 1
            //   5e                   | pop                 esi

        $sequence_7 = { 7409 41 83c010 3b4f14 7cf3 8bb5fcfeffff 8bbd30ffffff }
            // n = 7, score = 200
            //   7409                 | je                  0xb
            //   41                   | inc                 ecx
            //   83c010               | add                 eax, 0x10
            //   3b4f14               | cmp                 ecx, dword ptr [edi + 0x14]
            //   7cf3                 | jl                  0xfffffff5
            //   8bb5fcfeffff         | mov                 esi, dword ptr [ebp - 0x104]
            //   8bbd30ffffff         | mov                 edi, dword ptr [ebp - 0xd0]

        $sequence_8 = { ff7580 ffb57cffffff 68???????? ff33 e8???????? 8b4e18 83c418 }
            // n = 7, score = 200
            //   ff7580               | push                dword ptr [ebp - 0x80]
            //   ffb57cffffff         | push                dword ptr [ebp - 0x84]
            //   68????????           |                     
            //   ff33                 | push                dword ptr [ebx]
            //   e8????????           |                     
            //   8b4e18               | mov                 ecx, dword ptr [esi + 0x18]
            //   83c418               | add                 esp, 0x18

        $sequence_9 = { e9???????? 0fb64602 8945dc e9???????? 6a00 6a00 68???????? }
            // n = 7, score = 200
            //   e9????????           |                     
            //   0fb64602             | movzx               eax, byte ptr [esi + 2]
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   e9????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

    condition:
        7 of them and filesize < 2244608
}