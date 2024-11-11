rule win_tabmsgsql_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.tabmsgsql."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tabmsgsql"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { a1???????? 85c0 74e1 a1???????? 85c0 741a a1???????? }
            // n = 7, score = 100
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   74e1                 | je                  0xffffffe3
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   741a                 | je                  0x1c
            //   a1????????           |                     

        $sequence_1 = { c3 8d560a 52 68???????? }
            // n = 4, score = 100
            //   c3                   | ret                 
            //   8d560a               | lea                 edx, [esi + 0xa]
            //   52                   | push                edx
            //   68????????           |                     

        $sequence_2 = { 50 57 6a01 56 ff15???????? 8b442444 8b4c2448 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b442444             | mov                 eax, dword ptr [esp + 0x44]
            //   8b4c2448             | mov                 ecx, dword ptr [esp + 0x48]

        $sequence_3 = { 8b6c2418 56 57 8b7c2418 33db 57 50 }
            // n = 7, score = 100
            //   8b6c2418             | mov                 ebp, dword ptr [esp + 0x18]
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   50                   | push                eax

        $sequence_4 = { 57 6a01 56 ff15???????? 8b442444 8b4c2448 03c7 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b442444             | mov                 eax, dword ptr [esp + 0x44]
            //   8b4c2448             | mov                 ecx, dword ptr [esp + 0x48]
            //   03c7                 | add                 eax, edi

        $sequence_5 = { 25ffff0000 50 8b44242a 51 }
            // n = 4, score = 100
            //   25ffff0000           | and                 eax, 0xffff
            //   50                   | push                eax
            //   8b44242a             | mov                 eax, dword ptr [esp + 0x2a]
            //   51                   | push                ecx

        $sequence_6 = { 8b4508 53 6a01 50 b9???????? e8???????? }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   6a01                 | push                1
            //   50                   | push                eax
            //   b9????????           |                     
            //   e8????????           |                     

        $sequence_7 = { 8965f0 66ab 53 53 aa 8a4510 51 }
            // n = 7, score = 100
            //   8965f0               | mov                 dword ptr [ebp - 0x10], esp
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8a4510               | mov                 al, byte ptr [ebp + 0x10]
            //   51                   | push                ecx

        $sequence_8 = { 7d04 0430 eb02 0437 8801 }
            // n = 5, score = 100
            //   7d04                 | jge                 6
            //   0430                 | add                 al, 0x30
            //   eb02                 | jmp                 4
            //   0437                 | add                 al, 0x37
            //   8801                 | mov                 byte ptr [ecx], al

        $sequence_9 = { 5e 5d 5b 7421 8b8424f8f40100 8d4c2400 50 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   7421                 | je                  0x23
            //   8b8424f8f40100       | mov                 eax, dword ptr [esp + 0x1f4f8]
            //   8d4c2400             | lea                 ecx, [esp]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 163840
}