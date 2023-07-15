rule win_invisimole_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.invisimole."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.invisimole"
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
        $sequence_0 = { 6a0c 6a08 50 ff15???????? 8bf0 85f6 }
            // n = 6, score = 100
            //   6a0c                 | push                0xc
            //   6a08                 | push                8
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_1 = { 837dfc04 8bc1 0f848e110000 8d4dc8 51 8d75fc e8???????? }
            // n = 7, score = 100
            //   837dfc04             | cmp                 dword ptr [ebp - 4], 4
            //   8bc1                 | mov                 eax, ecx
            //   0f848e110000         | je                  0x1194
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   51                   | push                ecx
            //   8d75fc               | lea                 esi, [ebp - 4]
            //   e8????????           |                     

        $sequence_2 = { 8b8748020000 6a00 8d8d2cffffff 51 6800200000 52 }
            // n = 6, score = 100
            //   8b8748020000         | mov                 eax, dword ptr [edi + 0x248]
            //   6a00                 | push                0
            //   8d8d2cffffff         | lea                 ecx, [ebp - 0xd4]
            //   51                   | push                ecx
            //   6800200000           | push                0x2000
            //   52                   | push                edx

        $sequence_3 = { 837dfc04 0f84bd090000 8d4dc8 51 8d75fc }
            // n = 5, score = 100
            //   837dfc04             | cmp                 dword ptr [ebp - 4], 4
            //   0f84bd090000         | je                  0x9c3
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   51                   | push                ecx
            //   8d75fc               | lea                 esi, [ebp - 4]

        $sequence_4 = { 6a08 52 ffd7 8bd8 85db 0f84c7000000 68???????? }
            // n = 7, score = 100
            //   6a08                 | push                8
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   0f84c7000000         | je                  0xcd
            //   68????????           |                     

        $sequence_5 = { 33c9 66837c43fe5c 66890c43 8d4c43fe 894df4 0f8551060000 b902000000 }
            // n = 7, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   66837c43fe5c         | cmp                 word ptr [ebx + eax*2 - 2], 0x5c
            //   66890c43             | mov                 word ptr [ebx + eax*2], cx
            //   8d4c43fe             | lea                 ecx, [ebx + eax*2 - 2]
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   0f8551060000         | jne                 0x657
            //   b902000000           | mov                 ecx, 2

        $sequence_6 = { 72d1 8955f0 85d2 7511 8b55ec 8b4d08 52 }
            // n = 7, score = 100
            //   72d1                 | jb                  0xffffffd3
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx
            //   85d2                 | test                edx, edx
            //   7511                 | jne                 0x13
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   52                   | push                edx

        $sequence_7 = { 81fb08020000 0f8392000000 8b7df8 8a9746020000 0a5710 8b45e8 }
            // n = 6, score = 100
            //   81fb08020000         | cmp                 ebx, 0x208
            //   0f8392000000         | jae                 0x98
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   8a9746020000         | mov                 dl, byte ptr [edi + 0x246]
            //   0a5710               | or                  dl, byte ptr [edi + 0x10]
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_8 = { 53 56 ff15???????? 85c0 0f8595000000 3975fc 0f848c000000 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8595000000         | jne                 0x9b
            //   3975fc               | cmp                 dword ptr [ebp - 4], esi
            //   0f848c000000         | je                  0x92

        $sequence_9 = { 3bce 72e5 8b0d???????? 52 }
            // n = 4, score = 100
            //   3bce                 | cmp                 ecx, esi
            //   72e5                 | jb                  0xffffffe7
            //   8b0d????????         |                     
            //   52                   | push                edx

    condition:
        7 of them and filesize < 139264
}