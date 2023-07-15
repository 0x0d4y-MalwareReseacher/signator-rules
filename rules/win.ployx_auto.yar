rule win_ployx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.ployx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ployx"
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
        $sequence_0 = { 66ab aa 53 bf00040000 8d8598faffff 57 50 }
            // n = 7, score = 100
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   53                   | push                ebx
            //   bf00040000           | mov                 edi, 0x400
            //   8d8598faffff         | lea                 eax, [ebp - 0x568]
            //   57                   | push                edi
            //   50                   | push                eax

        $sequence_1 = { e8???????? 8bf0 83c43c 85f6 7417 56 6a01 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c43c               | add                 esp, 0x3c
            //   85f6                 | test                esi, esi
            //   7417                 | je                  0x19
            //   56                   | push                esi
            //   6a01                 | push                1

        $sequence_2 = { 6a01 ff75fc e8???????? 80a58cf5ffff00 b93f010000 33c0 8dbd8df5ffff }
            // n = 7, score = 100
            //   6a01                 | push                1
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   80a58cf5ffff00       | and                 byte ptr [ebp - 0xa74], 0
            //   b93f010000           | mov                 ecx, 0x13f
            //   33c0                 | xor                 eax, eax
            //   8dbd8df5ffff         | lea                 edi, [ebp - 0xa73]

        $sequence_3 = { 037514 68???????? 53 e8???????? 83c424 894514 }
            // n = 6, score = 100
            //   037514               | add                 esi, dword ptr [ebp + 0x14]
            //   68????????           |                     
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c424               | add                 esp, 0x24
            //   894514               | mov                 dword ptr [ebp + 0x14], eax

        $sequence_4 = { 56 57 6a03 8b5d08 99 5e 33c9 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a03                 | push                3
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   99                   | cdq                 
            //   5e                   | pop                 esi
            //   33c9                 | xor                 ecx, ecx

        $sequence_5 = { 8d7c03ff 8a4403ff c1f802 83e03f }
            // n = 4, score = 100
            //   8d7c03ff             | lea                 edi, [ebx + eax - 1]
            //   8a4403ff             | mov                 al, byte ptr [ebx + eax - 1]
            //   c1f802               | sar                 eax, 2
            //   83e03f               | and                 eax, 0x3f

        $sequence_6 = { 0f8d9d010000 ff750c 8b3d???????? 8d8500ffffff 68???????? 50 ffd7 }
            // n = 7, score = 100
            //   0f8d9d010000         | jge                 0x1a3
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8b3d????????         |                     
            //   8d8500ffffff         | lea                 eax, [ebp - 0x100]
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_7 = { e8???????? 8bf8 83c414 3bfe 7506 8b7df8 895df0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c414               | add                 esp, 0x14
            //   3bfe                 | cmp                 edi, esi
            //   7506                 | jne                 8
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx

        $sequence_8 = { ffd6 8d45fe 57 50 e8???????? 8bd8 }
            // n = 6, score = 100
            //   ffd6                 | call                esi
            //   8d45fe               | lea                 eax, [ebp - 2]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_9 = { 59 59 c3 55 8bec 81ec04020000 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec04020000         | sub                 esp, 0x204

    condition:
        7 of them and filesize < 229376
}