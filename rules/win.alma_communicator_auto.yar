rule win_alma_communicator_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.alma_communicator."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.alma_communicator"
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
        $sequence_0 = { 83f802 7509 80bdfdfdffff3a 7429 }
            // n = 4, score = 100
            //   83f802               | cmp                 eax, 2
            //   7509                 | jne                 0xb
            //   80bdfdfdffff3a       | cmp                 byte ptr [ebp - 0x203], 0x3a
            //   7429                 | je                  0x2b

        $sequence_1 = { 50 6a00 ffd3 ba???????? 8d8dfcfdffff e8???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ffd3                 | call                ebx
            //   ba????????           |                     
            //   8d8dfcfdffff         | lea                 ecx, [ebp - 0x204]
            //   e8????????           |                     

        $sequence_2 = { 8bf0 ff15???????? 889dd4ebffff 83fe01 }
            // n = 4, score = 100
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   889dd4ebffff         | mov                 byte ptr [ebp - 0x142c], bl
            //   83fe01               | cmp                 esi, 1

        $sequence_3 = { 75f4 8bca 33c0 c1e902 f3a5 }
            // n = 5, score = 100
            //   75f4                 | jne                 0xfffffff6
            //   8bca                 | mov                 ecx, edx
            //   33c0                 | xor                 eax, eax
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]

        $sequence_4 = { 8945fc 85ff 7416 8b45f4 }
            // n = 4, score = 100
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85ff                 | test                edi, edi
            //   7416                 | je                  0x18
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_5 = { e8???????? 8bcb 898554f7ffff e8???????? 8bcb 898550f7ffff 6a02 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   898554f7ffff         | mov                 dword ptr [ebp - 0x8ac], eax
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   898550f7ffff         | mov                 dword ptr [ebp - 0x8b0], eax
            //   6a02                 | push                2

        $sequence_6 = { f20f5905???????? e8???????? 05e8030000 50 e8???????? }
            // n = 5, score = 100
            //   f20f5905????????     |                     
            //   e8????????           |                     
            //   05e8030000           | add                 eax, 0x3e8
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_7 = { 8b1485f08f4100 8a4c1a2d f6c104 7419 8a441a2e 80e1fb 8845f4 }
            // n = 7, score = 100
            //   8b1485f08f4100       | mov                 edx, dword ptr [eax*4 + 0x418ff0]
            //   8a4c1a2d             | mov                 cl, byte ptr [edx + ebx + 0x2d]
            //   f6c104               | test                cl, 4
            //   7419                 | je                  0x1b
            //   8a441a2e             | mov                 al, byte ptr [edx + ebx + 0x2e]
            //   80e1fb               | and                 cl, 0xfb
            //   8845f4               | mov                 byte ptr [ebp - 0xc], al

        $sequence_8 = { 8d55e8 8bf2 33c9 6a02 5f }
            // n = 5, score = 100
            //   8d55e8               | lea                 edx, [ebp - 0x18]
            //   8bf2                 | mov                 esi, edx
            //   33c9                 | xor                 ecx, ecx
            //   6a02                 | push                2
            //   5f                   | pop                 edi

        $sequence_9 = { e8???????? 8b4dfc 83c40c 33cd 33c0 5b e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c40c               | add                 esp, 0xc
            //   33cd                 | xor                 ecx, ebp
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 245760
}