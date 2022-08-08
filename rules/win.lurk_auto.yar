rule win_lurk_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.lurk."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lurk"
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
        $sequence_0 = { ff7508 ff15???????? 8b35???????? 50 ff7508 }
            // n = 5, score = 1100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_1 = { 8b4508 5b 5f 5e c9 c3 55 }
            // n = 7, score = 900
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_2 = { 57 ff15???????? eb29 837d0803 7504 }
            // n = 5, score = 800
            //   57                   | push                edi
            //   ff15????????         |                     
            //   eb29                 | jmp                 0x2b
            //   837d0803             | cmp                 dword ptr [ebp + 8], 3
            //   7504                 | jne                 6

        $sequence_3 = { 59 3bc7 7542 0fbe4208 50 }
            // n = 5, score = 800
            //   59                   | pop                 ecx
            //   3bc7                 | cmp                 eax, edi
            //   7542                 | jne                 0x44
            //   0fbe4208             | movsx               eax, byte ptr [edx + 8]
            //   50                   | push                eax

        $sequence_4 = { c3 68???????? 8d85fcfeffff 50 ff15???????? 8d85fcfeffff }
            // n = 6, score = 800
            //   c3                   | ret                 
            //   68????????           |                     
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]

        $sequence_5 = { c3 6a01 53 56 ff35???????? e8???????? 83c410 }
            // n = 7, score = 800
            //   c3                   | ret                 
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff35????????         |                     
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_6 = { ff75fc ffd6 85c0 755f 6a0a 68???????? 6a01 }
            // n = 7, score = 800
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   755f                 | jne                 0x61
            //   6a0a                 | push                0xa
            //   68????????           |                     
            //   6a01                 | push                1

        $sequence_7 = { 894114 8b55ec 83e207 c1e203 8b45d4 8b4814 83e1c7 }
            // n = 7, score = 800
            //   894114               | mov                 dword ptr [ecx + 0x14], eax
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   83e207               | and                 edx, 7
            //   c1e203               | shl                 edx, 3
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8b4814               | mov                 ecx, dword ptr [eax + 0x14]
            //   83e1c7               | and                 ecx, 0xffffffc7

        $sequence_8 = { e8???????? 0fb74614 8365fc00 83c40c 66837e0600 8d443018 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   0fb74614             | movzx               eax, word ptr [esi + 0x14]
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   83c40c               | add                 esp, 0xc
            //   66837e0600           | cmp                 word ptr [esi + 6], 0
            //   8d443018             | lea                 eax, [eax + esi + 0x18]

        $sequence_9 = { e8???????? 0fb74606 83c414 ff45fc 83c328 3945fc 72bc }
            // n = 7, score = 800
            //   e8????????           |                     
            //   0fb74606             | movzx               eax, word ptr [esi + 6]
            //   83c414               | add                 esp, 0x14
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   83c328               | add                 ebx, 0x28
            //   3945fc               | cmp                 dword ptr [ebp - 4], eax
            //   72bc                 | jb                  0xffffffbe

        $sequence_10 = { 894208 8b4de8 83e101 8b55d4 }
            // n = 4, score = 800
            //   894208               | mov                 dword ptr [edx + 8], eax
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   83e101               | and                 ecx, 1
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]

        $sequence_11 = { 83c028 8945e0 ebac 8b45f8 }
            // n = 4, score = 800
            //   83c028               | add                 eax, 0x28
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   ebac                 | jmp                 0xffffffae
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_12 = { 8b4dc0 81e1ffff0000 0fb7c9 8b55e0 }
            // n = 4, score = 800
            //   8b4dc0               | mov                 ecx, dword ptr [ebp - 0x40]
            //   81e1ffff0000         | and                 ecx, 0xffff
            //   0fb7c9               | movzx               ecx, cx
            //   8b55e0               | mov                 edx, dword ptr [ebp - 0x20]

        $sequence_13 = { 59 3bc7 0f85a9000000 0fbe4202 }
            // n = 4, score = 800
            //   59                   | pop                 ecx
            //   3bc7                 | cmp                 eax, edi
            //   0f85a9000000         | jne                 0xaf
            //   0fbe4202             | movsx               eax, byte ptr [edx + 2]

        $sequence_14 = { 8b4d08 51 e8???????? 83c40c ebce }
            // n = 5, score = 800
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   ebce                 | jmp                 0xffffffd0

        $sequence_15 = { ff75fc ffd7 85c0 750f 68???????? }
            // n = 5, score = 800
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   68????????           |                     

    condition:
        7 of them and filesize < 5316608
}