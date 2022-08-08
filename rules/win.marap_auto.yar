rule win_marap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.marap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.marap"
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
        $sequence_0 = { d3ea 8bcb 8bdf d3e3 eb2a 0fb6c1 }
            // n = 6, score = 100
            //   d3ea                 | shr                 edx, cl
            //   8bcb                 | mov                 ecx, ebx
            //   8bdf                 | mov                 ebx, edi
            //   d3e3                 | shl                 ebx, cl
            //   eb2a                 | jmp                 0x2c
            //   0fb6c1               | movzx               eax, cl

        $sequence_1 = { eb07 8386e41d000010 8b8de4feffff 3bcb 755a 8b8de8feffff 83f901 }
            // n = 7, score = 100
            //   eb07                 | jmp                 9
            //   8386e41d000010       | add                 dword ptr [esi + 0x1de4], 0x10
            //   8b8de4feffff         | mov                 ecx, dword ptr [ebp - 0x11c]
            //   3bcb                 | cmp                 ecx, ebx
            //   755a                 | jne                 0x5c
            //   8b8de8feffff         | mov                 ecx, dword ptr [ebp - 0x118]
            //   83f901               | cmp                 ecx, 1

        $sequence_2 = { 83c302 66833b00 895df8 0f8576ffffff 8bd7 }
            // n = 5, score = 100
            //   83c302               | add                 ebx, 2
            //   66833b00             | cmp                 word ptr [ebx], 0
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   0f8576ffffff         | jne                 0xffffff7c
            //   8bd7                 | mov                 edx, edi

        $sequence_3 = { 8bc7 c1f805 8bf7 83e61f c1e606 03348580320110 }
            // n = 6, score = 100
            //   8bc7                 | mov                 eax, edi
            //   c1f805               | sar                 eax, 5
            //   8bf7                 | mov                 esi, edi
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   03348580320110       | add                 esi, dword ptr [eax*4 + 0x10013280]

        $sequence_4 = { 8bb5acfdffff 8d85bcfdffff 50 56 ff15???????? }
            // n = 5, score = 100
            //   8bb5acfdffff         | mov                 esi, dword ptr [ebp - 0x254]
            //   8d85bcfdffff         | lea                 eax, [ebp - 0x244]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_5 = { 7437 8d8424a0010000 50 ff15???????? 85c0 7425 8b480c }
            // n = 7, score = 100
            //   7437                 | je                  0x39
            //   8d8424a0010000       | lea                 eax, [esp + 0x1a0]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7425                 | je                  0x27
            //   8b480c               | mov                 ecx, dword ptr [eax + 0xc]

        $sequence_6 = { eb02 33c0 0fbe84c1f8cb0010 6a07 c1f804 }
            // n = 5, score = 100
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   0fbe84c1f8cb0010     | movsx               eax, byte ptr [ecx + eax*8 + 0x1000cbf8]
            //   6a07                 | push                7
            //   c1f804               | sar                 eax, 4

        $sequence_7 = { eb17 a900040000 7409 8386e41d000012 eb07 }
            // n = 5, score = 100
            //   eb17                 | jmp                 0x19
            //   a900040000           | test                eax, 0x400
            //   7409                 | je                  0xb
            //   8386e41d000012       | add                 dword ptr [esi + 0x1de4], 0x12
            //   eb07                 | jmp                 9

        $sequence_8 = { 3bf7 0f848d000000 8bc6 8d5002 668b08 }
            // n = 5, score = 100
            //   3bf7                 | cmp                 esi, edi
            //   0f848d000000         | je                  0x93
            //   8bc6                 | mov                 eax, esi
            //   8d5002               | lea                 edx, [eax + 2]
            //   668b08               | mov                 cx, word ptr [eax]

        $sequence_9 = { 6a01 57 68???????? 89bda8fdffff ff15???????? }
            // n = 5, score = 100
            //   6a01                 | push                1
            //   57                   | push                edi
            //   68????????           |                     
            //   89bda8fdffff         | mov                 dword ptr [ebp - 0x258], edi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 188416
}