rule win_obscene_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.obscene."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.obscene"
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
        $sequence_0 = { 8b45f8 0fbe00 83f839 7e4b 8b45f8 0fbe00 83f841 }
            // n = 7, score = 100
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f839               | cmp                 eax, 0x39
            //   7e4b                 | jle                 0x4d
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f841               | cmp                 eax, 0x41

        $sequence_1 = { 8b45fc 40 8945fc 8b4508 0fbe00 }
            // n = 5, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]

        $sequence_2 = { ff15???????? 0fb7c0 83f819 750d ff7510 ff750c }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   0fb7c0               | movzx               eax, ax
            //   83f819               | cmp                 eax, 0x19
            //   750d                 | jne                 0xf
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_3 = { 752f ff7508 6814110010 e8???????? 59 59 ff7508 }
            // n = 7, score = 100
            //   752f                 | jne                 0x31
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6814110010           | push                0x10001114
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_4 = { 59 59 ff7508 6860ad0010 e8???????? 59 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6860ad0010           | push                0x1000ad60
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_5 = { 8d45f8 50 6a06 68ec421010 ff35???????? 6aff }
            // n = 6, score = 100
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   6a06                 | push                6
            //   68ec421010           | push                0x101042ec
            //   ff35????????         |                     
            //   6aff                 | push                -1

        $sequence_6 = { 8b45f8 0fbe00 83f830 7c0b 8b45f8 0fbe00 83f839 }
            // n = 7, score = 100
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f830               | cmp                 eax, 0x30
            //   7c0b                 | jl                  0xd
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0fbe00               | movsx               eax, byte ptr [eax]
            //   83f839               | cmp                 eax, 0x39

        $sequence_7 = { ff75fc ff15???????? 59 ff750c e8???????? 59 85c0 }
            // n = 7, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_8 = { 40 50 6814100010 e8???????? }
            // n = 4, score = 100
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   6814100010           | push                0x10001014
            //   e8????????           |                     

        $sequence_9 = { 6a00 ff15???????? eb09 ff75f8 ff15???????? c9 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   eb09                 | jmp                 0xb
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   c9                   | leave               

    condition:
        7 of them and filesize < 2170880
}