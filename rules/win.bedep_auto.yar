rule win_bedep_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.bedep."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bedep"
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
        $sequence_0 = { 57 8d4de0 e8???????? 33c0 8d55e0 33ff c745f820000000 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   8d55e0               | lea                 edx, [ebp - 0x20]
            //   33ff                 | xor                 edi, edi
            //   c745f820000000       | mov                 dword ptr [ebp - 8], 0x20

        $sequence_1 = { 8dbbe8000000 8db598fcffff 6a10 8d9598fcffff f3a5 e8???????? 3b85dcfcffff }
            // n = 7, score = 100
            //   8dbbe8000000         | lea                 edi, [ebx + 0xe8]
            //   8db598fcffff         | lea                 esi, [ebp - 0x368]
            //   6a10                 | push                0x10
            //   8d9598fcffff         | lea                 edx, [ebp - 0x368]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   e8????????           |                     
            //   3b85dcfcffff         | cmp                 eax, dword ptr [ebp - 0x324]

        $sequence_2 = { c9 c20400 55 8bec 51 8365fc00 6800800000 }
            // n = 7, score = 100
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   6800800000           | push                0x8000

        $sequence_3 = { 8d7e38 8bcf 5a 885dff e8???????? 85c0 7417 }
            // n = 7, score = 100
            //   8d7e38               | lea                 edi, [esi + 0x38]
            //   8bcf                 | mov                 ecx, edi
            //   5a                   | pop                 edx
            //   885dff               | mov                 byte ptr [ebp - 1], bl
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7417                 | je                  0x19

        $sequence_4 = { ffd6 8bf8 ff75fc 90 e8???????? 85ff 7d02 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   8bf8                 | mov                 edi, eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   90                   | nop                 
            //   e8????????           |                     
            //   85ff                 | test                edi, edi
            //   7d02                 | jge                 4

        $sequence_5 = { ffd7 53 56 90 e8???????? 8b7d60 c70014000000 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   53                   | push                ebx
            //   56                   | push                esi
            //   90                   | nop                 
            //   e8????????           |                     
            //   8b7d60               | mov                 edi, dword ptr [ebp + 0x60]
            //   c70014000000         | mov                 dword ptr [eax], 0x14

        $sequence_6 = { 7c08 6a01 57 e8???????? 8365fc00 8d45fc 50 }
            // n = 7, score = 100
            //   7c08                 | jl                  0xa
            //   6a01                 | push                1
            //   57                   | push                edi
            //   e8????????           |                     
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax

        $sequence_7 = { 8945e4 90 e8???????? 3bc3 8945ec 750c c745f402000000 }
            // n = 7, score = 100
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   90                   | nop                 
            //   e8????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   750c                 | jne                 0xe
            //   c745f402000000       | mov                 dword ptr [ebp - 0xc], 2

        $sequence_8 = { ffd6 85c0 7c0d 8b4d0c 85c9 7406 c70102000000 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7c0d                 | jl                  0xf
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   85c9                 | test                ecx, ecx
            //   7406                 | je                  8
            //   c70102000000         | mov                 dword ptr [ecx], 2

        $sequence_9 = { ff7638 ff742438 50 8d442450 50 ff742438 8d442438 }
            // n = 7, score = 100
            //   ff7638               | push                dword ptr [esi + 0x38]
            //   ff742438             | push                dword ptr [esp + 0x38]
            //   50                   | push                eax
            //   8d442450             | lea                 eax, [esp + 0x50]
            //   50                   | push                eax
            //   ff742438             | push                dword ptr [esp + 0x38]
            //   8d442438             | lea                 eax, [esp + 0x38]

    condition:
        7 of them and filesize < 557056
}