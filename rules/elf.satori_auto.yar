rule elf_satori_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects elf.satori."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/elf.satori"
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
        $sequence_0 = { ba01000000 ebbb 5b 5b 5e c3 55 }
            // n = 7, score = 100
            //   ba01000000           | mov                 edx, 1
            //   ebbb                 | jmp                 0xffffffbd
            //   5b                   | pop                 ebx
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_1 = { e8???????? 891c24 e8???????? 6800400000 50 53 ffb51c040000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   e8????????           |                     
            //   6800400000           | push                0x4000
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ffb51c040000         | push                dword ptr [ebp + 0x41c]

        $sequence_2 = { 83ec0c 56 8b10 e9???????? 80f964 752b 8b442408 }
            // n = 7, score = 100
            //   83ec0c               | sub                 esp, 0xc
            //   56                   | push                esi
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   e9????????           |                     
            //   80f964               | cmp                 cl, 0x64
            //   752b                 | jne                 0x2d
            //   8b442408             | mov                 eax, dword ptr [esp + 8]

        $sequence_3 = { 6a03 56 53 e8???????? 0fb7c0 }
            // n = 5, score = 100
            //   6a03                 | push                3
            //   56                   | push                esi
            //   53                   | push                ebx
            //   e8????????           |                     
            //   0fb7c0               | movzx               eax, ax

        $sequence_4 = { e8???????? c70424076c0000 e8???????? e8???????? eb0f 50 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c70424076c0000       | mov                 dword ptr [esp], 0x6c07
            //   e8????????           |                     
            //   e8????????           |                     
            //   eb0f                 | jmp                 0x11
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_5 = { c744245000000000 88442417 6a04 0fb644241b }
            // n = 4, score = 100
            //   c744245000000000     | mov                 dword ptr [esp + 0x50], 0
            //   88442417             | mov                 byte ptr [esp + 0x17], al
            //   6a04                 | push                4
            //   0fb644241b           | movzx               eax, byte ptr [esp + 0x1b]

        $sequence_6 = { 85c0 0f8fae000000 40 0f84a7000000 c784243c05000001000000 50 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   0f8fae000000         | jg                  0xb4
            //   40                   | inc                 eax
            //   0f84a7000000         | je                  0xad
            //   c784243c05000001000000     | mov    dword ptr [esp + 0x53c], 1
            //   50                   | push                eax

        $sequence_7 = { 89542408 740c 8b10 8b442408 8802 ff01 }
            // n = 6, score = 100
            //   89542408             | mov                 dword ptr [esp + 8], edx
            //   740c                 | je                  0xe
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   8802                 | mov                 byte ptr [edx], al
            //   ff01                 | inc                 dword ptr [ecx]

        $sequence_8 = { 66894314 8b44242c 66c1c808 66894602 8b442410 }
            // n = 5, score = 100
            //   66894314             | mov                 word ptr [ebx + 0x14], ax
            //   8b44242c             | mov                 eax, dword ptr [esp + 0x2c]
            //   66c1c808             | ror                 ax, 8
            //   66894602             | mov                 word ptr [esi + 2], ax
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]

        $sequence_9 = { c70300000000 6802400000 0fb784244a050000 50 8d742418 56 }
            // n = 6, score = 100
            //   c70300000000         | mov                 dword ptr [ebx], 0
            //   6802400000           | push                0x4002
            //   0fb784244a050000     | movzx               eax, word ptr [esp + 0x54a]
            //   50                   | push                eax
            //   8d742418             | lea                 esi, [esp + 0x18]
            //   56                   | push                esi

    condition:
        7 of them and filesize < 122880
}