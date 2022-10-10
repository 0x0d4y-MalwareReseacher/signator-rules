rule win_snifula_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.snifula."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.snifula"
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
        $sequence_0 = { 85f6 747e 397c2418 7278 8364242000 833e00 8d7e08 }
            // n = 7, score = 200
            //   85f6                 | test                esi, esi
            //   747e                 | je                  0x80
            //   397c2418             | cmp                 dword ptr [esp + 0x18], edi
            //   7278                 | jb                  0x7a
            //   8364242000           | and                 dword ptr [esp + 0x20], 0
            //   833e00               | cmp                 dword ptr [esi], 0
            //   8d7e08               | lea                 edi, [esi + 8]

        $sequence_1 = { 50 68???????? e8???????? ff75f8 ff15???????? 8b45fc }
            // n = 6, score = 200
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_2 = { 5f 5b c9 c20400 57 ff742408 }
            // n = 6, score = 200
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   57                   | push                edi
            //   ff742408             | push                dword ptr [esp + 8]

        $sequence_3 = { ff15???????? 8bd8 3bde 7435 53 ff75fc }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   3bde                 | cmp                 ebx, esi
            //   7435                 | je                  0x37
            //   53                   | push                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_4 = { 0fb68d61feffff 3bc1 752c 33c0 85c9 760f 80bc0562feffff02 }
            // n = 7, score = 200
            //   0fb68d61feffff       | movzx               ecx, byte ptr [ebp - 0x19f]
            //   3bc1                 | cmp                 eax, ecx
            //   752c                 | jne                 0x2e
            //   33c0                 | xor                 eax, eax
            //   85c9                 | test                ecx, ecx
            //   760f                 | jbe                 0x11
            //   80bc0562feffff02     | cmp                 byte ptr [ebp + eax - 0x19e], 2

        $sequence_5 = { 7409 8b450c 56 e8???????? 56 6a00 ff35???????? }
            // n = 7, score = 200
            //   7409                 | je                  0xb
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     
            //   56                   | push                esi
            //   6a00                 | push                0
            //   ff35????????         |                     

        $sequence_6 = { 8bf0 3bf7 7505 6a02 5b eb40 6a5c }
            // n = 7, score = 200
            //   8bf0                 | mov                 esi, eax
            //   3bf7                 | cmp                 esi, edi
            //   7505                 | jne                 7
            //   6a02                 | push                2
            //   5b                   | pop                 ebx
            //   eb40                 | jmp                 0x42
            //   6a5c                 | push                0x5c

        $sequence_7 = { 46 41 41 83fe0f 76ef 33c9 }
            // n = 6, score = 200
            //   46                   | inc                 esi
            //   41                   | inc                 ecx
            //   41                   | inc                 ecx
            //   83fe0f               | cmp                 esi, 0xf
            //   76ef                 | jbe                 0xfffffff1
            //   33c9                 | xor                 ecx, ecx

        $sequence_8 = { ff7508 ff15???????? 3bc6 7409 50 ff15???????? eb08 }
            // n = 7, score = 200
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   3bc6                 | cmp                 eax, esi
            //   7409                 | je                  0xb
            //   50                   | push                eax
            //   ff15????????         |                     
            //   eb08                 | jmp                 0xa

        $sequence_9 = { 7434 8b7308 8d043e 3b4304 7743 85ff }
            // n = 6, score = 200
            //   7434                 | je                  0x36
            //   8b7308               | mov                 esi, dword ptr [ebx + 8]
            //   8d043e               | lea                 eax, [esi + edi]
            //   3b4304               | cmp                 eax, dword ptr [ebx + 4]
            //   7743                 | ja                  0x45
            //   85ff                 | test                edi, edi

    condition:
        7 of them and filesize < 188416
}