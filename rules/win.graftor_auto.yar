rule win_graftor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.graftor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.graftor"
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
        $sequence_0 = { 755e ffb5f8bfffff 57 e8???????? ffb5f8bfffff ff15???????? eb44 }
            // n = 7, score = 100
            //   755e                 | jne                 0x60
            //   ffb5f8bfffff         | push                dword ptr [ebp - 0x4008]
            //   57                   | push                edi
            //   e8????????           |                     
            //   ffb5f8bfffff         | push                dword ptr [ebp - 0x4008]
            //   ff15????????         |                     
            //   eb44                 | jmp                 0x46

        $sequence_1 = { eb0b 8d7db4 e8???????? 83c630 3bf3 75f1 }
            // n = 6, score = 100
            //   eb0b                 | jmp                 0xd
            //   8d7db4               | lea                 edi, [ebp - 0x4c]
            //   e8????????           |                     
            //   83c630               | add                 esi, 0x30
            //   3bf3                 | cmp                 esi, ebx
            //   75f1                 | jne                 0xfffffff3

        $sequence_2 = { 3b410c 732c ff75f0 8b4508 8b00 ff75ec 8945e4 }
            // n = 7, score = 100
            //   3b410c               | cmp                 eax, dword ptr [ecx + 0xc]
            //   732c                 | jae                 0x2e
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax

        $sequence_3 = { e8???????? 8b8534ffffff 8b4d10 40 6bc054 03c7 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b8534ffffff         | mov                 eax, dword ptr [ebp - 0xcc]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   40                   | inc                 eax
            //   6bc054               | imul                eax, eax, 0x54
            //   03c7                 | add                 eax, edi
            //   50                   | push                eax

        $sequence_4 = { 33c0 668987c8000000 6a00 6a01 8d75d0 e8???????? e8???????? }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   668987c8000000       | mov                 word ptr [edi + 0xc8], ax
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   8d75d0               | lea                 esi, [ebp - 0x30]
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_5 = { ff15???????? 56 ff15???????? 837dfc02 0f94c0 5f }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   837dfc02             | cmp                 dword ptr [ebp - 4], 2
            //   0f94c0               | sete                al
            //   5f                   | pop                 edi

        $sequence_6 = { e8???????? 33db 43 84c0 7442 8b4510 8b4d0c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   43                   | inc                 ebx
            //   84c0                 | test                al, al
            //   7442                 | je                  0x44
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_7 = { 47 89bd60ffffff c78548ffffff01000080 c7854cffffff02000080 89b574ffffff eb03 33ff }
            // n = 7, score = 100
            //   47                   | inc                 edi
            //   89bd60ffffff         | mov                 dword ptr [ebp - 0xa0], edi
            //   c78548ffffff01000080     | mov    dword ptr [ebp - 0xb8], 0x80000001
            //   c7854cffffff02000080     | mov    dword ptr [ebp - 0xb4], 0x80000002
            //   89b574ffffff         | mov                 dword ptr [ebp - 0x8c], esi
            //   eb03                 | jmp                 5
            //   33ff                 | xor                 edi, edi

        $sequence_8 = { ffd6 8d5f50 c7450806000000 817bf880bc4e00 7409 8b03 85c0 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   8d5f50               | lea                 ebx, [edi + 0x50]
            //   c7450806000000       | mov                 dword ptr [ebp + 8], 6
            //   817bf880bc4e00       | cmp                 dword ptr [ebx - 8], 0x4ebc80
            //   7409                 | je                  0xb
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   85c0                 | test                eax, eax

        $sequence_9 = { 56 8b35???????? eb0e ff7604 50 e8???????? 59 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b35????????         |                     
            //   eb0e                 | jmp                 0x10
            //   ff7604               | push                dword ptr [esi + 4]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 294912
}