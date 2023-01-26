rule win_tabmsgsql_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.tabmsgsql."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tabmsgsql"
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
        $sequence_0 = { 50 51 8d542448 68???????? 52 ffd3 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8d542448             | lea                 edx, [esp + 0x48]
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd3                 | call                ebx

        $sequence_1 = { 85f6 0f84e0010000 8b3d???????? 8d4c240c 51 68???????? }
            // n = 6, score = 100
            //   85f6                 | test                esi, esi
            //   0f84e0010000         | je                  0x1e6
            //   8b3d????????         |                     
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   51                   | push                ecx
            //   68????????           |                     

        $sequence_2 = { 8d542418 8d44240c 52 8d4c2454 50 8d542418 51 }
            // n = 7, score = 100
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   8d44240c             | lea                 eax, [esp + 0xc]
            //   52                   | push                edx
            //   8d4c2454             | lea                 ecx, [esp + 0x54]
            //   50                   | push                eax
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   51                   | push                ecx

        $sequence_3 = { 3d808d5b00 7e0a c705????????808d5b00 8b4df4 5f 5e b801000000 }
            // n = 7, score = 100
            //   3d808d5b00           | cmp                 eax, 0x5b8d80
            //   7e0a                 | jle                 0xc
            //   c705????????808d5b00     |     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   b801000000           | mov                 eax, 1

        $sequence_4 = { 33c0 5b 81c43c2c0000 c3 53 56 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   81c43c2c0000         | add                 esp, 0x2c3c
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_5 = { e8???????? 83c40c 81fd60ea0000 7e36 8b542414 b900f40100 52 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   81fd60ea0000         | cmp                 ebp, 0xea60
            //   7e36                 | jle                 0x38
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   b900f40100           | mov                 ecx, 0x1f400
            //   52                   | push                edx

        $sequence_6 = { 33c0 83e103 f3a4 8bbc2438060000 83c9ff f2ae f7d1 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8bbc2438060000       | mov                 edi, dword ptr [esp + 0x638]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_7 = { 02c3 880416 33c0 0fbe1d???????? 8a443903 46 3bc3 }
            // n = 7, score = 100
            //   02c3                 | add                 al, bl
            //   880416               | mov                 byte ptr [esi + edx], al
            //   33c0                 | xor                 eax, eax
            //   0fbe1d????????       |                     
            //   8a443903             | mov                 al, byte ptr [ecx + edi + 3]
            //   46                   | inc                 esi
            //   3bc3                 | cmp                 eax, ebx

        $sequence_8 = { 68???????? ff15???????? 83c404 a1???????? 50 ff15???????? b940000000 }
            // n = 7, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   b940000000           | mov                 ecx, 0x40

        $sequence_9 = { 899e2c800000 8b4618 3bc3 7427 8d48ff 8a40ff }
            // n = 6, score = 100
            //   899e2c800000         | mov                 dword ptr [esi + 0x802c], ebx
            //   8b4618               | mov                 eax, dword ptr [esi + 0x18]
            //   3bc3                 | cmp                 eax, ebx
            //   7427                 | je                  0x29
            //   8d48ff               | lea                 ecx, [eax - 1]
            //   8a40ff               | mov                 al, byte ptr [eax - 1]

    condition:
        7 of them and filesize < 163840
}