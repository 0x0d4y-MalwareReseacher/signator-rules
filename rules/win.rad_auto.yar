rule win_rad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.rad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rad"
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
        $sequence_0 = { 83c102 663bd3 75f5 2bce d1f9 51 8d4dd0 }
            // n = 7, score = 100
            //   83c102               | add                 ecx, 2
            //   663bd3               | cmp                 dx, bx
            //   75f5                 | jne                 0xfffffff7
            //   2bce                 | sub                 ecx, esi
            //   d1f9                 | sar                 ecx, 1
            //   51                   | push                ecx
            //   8d4dd0               | lea                 ecx, [ebp - 0x30]

        $sequence_1 = { 83c114 ff25???????? 8b542408 8d420c 8b4ae4 33c8 e8???????? }
            // n = 7, score = 100
            //   83c114               | add                 ecx, 0x14
            //   ff25????????         |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8d420c               | lea                 eax, [edx + 0xc]
            //   8b4ae4               | mov                 ecx, dword ptr [edx - 0x1c]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     

        $sequence_2 = { 8b420c 47 897c2424 ffd0 3bf8 0f8216fbffff }
            // n = 6, score = 100
            //   8b420c               | mov                 eax, dword ptr [edx + 0xc]
            //   47                   | inc                 edi
            //   897c2424             | mov                 dword ptr [esp + 0x24], edi
            //   ffd0                 | call                eax
            //   3bf8                 | cmp                 edi, eax
            //   0f8216fbffff         | jb                  0xfffffb1c

        $sequence_3 = { 898d68fbffff 895dfc 8d642400 6a01 e8???????? 83c404 }
            // n = 6, score = 100
            //   898d68fbffff         | mov                 dword ptr [ebp - 0x498], ecx
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   8d642400             | lea                 esp, [esp]
            //   6a01                 | push                1
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_4 = { 8d8d20ffffff e9???????? 8d75bc e9???????? 8b542408 }
            // n = 5, score = 100
            //   8d8d20ffffff         | lea                 ecx, [ebp - 0xe0]
            //   e9????????           |                     
            //   8d75bc               | lea                 esi, [ebp - 0x44]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]

        $sequence_5 = { 8bf0 8bfa 720d 8b45b4 50 ff15???????? }
            // n = 6, score = 100
            //   8bf0                 | mov                 esi, eax
            //   8bfa                 | mov                 edi, edx
            //   720d                 | jb                  0xf
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_6 = { c784247c01000007000000 899c2478010000 6689842468010000 8d8c242c030000 51 8d8c2488010000 }
            // n = 6, score = 100
            //   c784247c01000007000000     | mov    dword ptr [esp + 0x17c], 7
            //   899c2478010000       | mov                 dword ptr [esp + 0x178], ebx
            //   6689842468010000     | mov                 word ptr [esp + 0x168], ax
            //   8d8c242c030000       | lea                 ecx, [esp + 0x32c]
            //   51                   | push                ecx
            //   8d8c2488010000       | lea                 ecx, [esp + 0x188]

        $sequence_7 = { 897c2418 c684240001000001 85ff 747d 6a2c }
            // n = 5, score = 100
            //   897c2418             | mov                 dword ptr [esp + 0x18], edi
            //   c684240001000001     | mov                 byte ptr [esp + 0x100], 1
            //   85ff                 | test                edi, edi
            //   747d                 | je                  0x7f
            //   6a2c                 | push                0x2c

        $sequence_8 = { c684240806000013 39742434 720e 8b542420 52 ff15???????? 83c404 }
            // n = 7, score = 100
            //   c684240806000013     | mov                 byte ptr [esp + 0x608], 0x13
            //   39742434             | cmp                 dword ptr [esp + 0x34], esi
            //   720e                 | jb                  0x10
            //   8b542420             | mov                 edx, dword ptr [esp + 0x20]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4

        $sequence_9 = { 8d7e04 c645fc29 8d4f04 c706???????? 89bd10fdffff ff15???????? }
            // n = 6, score = 100
            //   8d7e04               | lea                 edi, [esi + 4]
            //   c645fc29             | mov                 byte ptr [ebp - 4], 0x29
            //   8d4f04               | lea                 ecx, [edi + 4]
            //   c706????????         |                     
            //   89bd10fdffff         | mov                 dword ptr [ebp - 0x2f0], edi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 207872
}