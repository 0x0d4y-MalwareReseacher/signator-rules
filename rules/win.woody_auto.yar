rule win_woody_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.woody."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.woody"
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
        $sequence_0 = { c744241001000080 50 6819000200 6a00 68a8ac0110 6801000080 ff15???????? }
            // n = 7, score = 100
            //   c744241001000080     | mov                 dword ptr [esp + 0x10], 0x80000001
            //   50                   | push                eax
            //   6819000200           | push                0x20019
            //   6a00                 | push                0
            //   68a8ac0110           | push                0x1001aca8
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     

        $sequence_1 = { 85ff 0f843e040000 8b06 8bcf 8d542410 2bc8 53 }
            // n = 7, score = 100
            //   85ff                 | test                edi, edi
            //   0f843e040000         | je                  0x444
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bcf                 | mov                 ecx, edi
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   2bc8                 | sub                 ecx, eax
            //   53                   | push                ebx

        $sequence_2 = { 50 894c2420 51 b9e8ca0110 e8???????? 8b4c241c 83f911 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   894c2420             | mov                 dword ptr [esp + 0x20], ecx
            //   51                   | push                ecx
            //   b9e8ca0110           | mov                 ecx, 0x1001cae8
            //   e8????????           |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   83f911               | cmp                 ecx, 0x11

        $sequence_3 = { bf00000080 8b4c0450 3bca 7423 39540464 751d 8b5d04 }
            // n = 7, score = 100
            //   bf00000080           | mov                 edi, 0x80000000
            //   8b4c0450             | mov                 ecx, dword ptr [esp + eax + 0x50]
            //   3bca                 | cmp                 ecx, edx
            //   7423                 | je                  0x25
            //   39540464             | cmp                 dword ptr [esp + eax + 0x64], edx
            //   751d                 | jne                 0x1f
            //   8b5d04               | mov                 ebx, dword ptr [ebp + 4]

        $sequence_4 = { 50 ffd6 83c410 3bc3 7402 8818 8d8530fdffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   83c410               | add                 esp, 0x10
            //   3bc3                 | cmp                 eax, ebx
            //   7402                 | je                  4
            //   8818                 | mov                 byte ptr [eax], bl
            //   8d8530fdffff         | lea                 eax, [ebp - 0x2d0]

        $sequence_5 = { 56 57 b931000000 33c0 8dbc24f1000000 c68424f000000000 f3ab }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   b931000000           | mov                 ecx, 0x31
            //   33c0                 | xor                 eax, eax
            //   8dbc24f1000000       | lea                 edi, [esp + 0xf1]
            //   c68424f000000000     | mov                 byte ptr [esp + 0xf0], 0
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_6 = { 3975ec 7524 8d45dc 50 8d45d4 50 8d45cc }
            // n = 7, score = 100
            //   3975ec               | cmp                 dword ptr [ebp - 0x14], esi
            //   7524                 | jne                 0x26
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   8d45d4               | lea                 eax, [ebp - 0x2c]
            //   50                   | push                eax
            //   8d45cc               | lea                 eax, [ebp - 0x34]

        $sequence_7 = { 8b4c2450 2bc8 8d442444 50 898c247c030000 ff15???????? }
            // n = 6, score = 100
            //   8b4c2450             | mov                 ecx, dword ptr [esp + 0x50]
            //   2bc8                 | sub                 ecx, eax
            //   8d442444             | lea                 eax, [esp + 0x44]
            //   50                   | push                eax
            //   898c247c030000       | mov                 dword ptr [esp + 0x37c], ecx
            //   ff15????????         |                     

        $sequence_8 = { 8b442410 50 8b10 ff5208 8b742420 8d842430020000 50 }
            // n = 7, score = 100
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   ff5208               | call                dword ptr [edx + 8]
            //   8b742420             | mov                 esi, dword ptr [esp + 0x20]
            //   8d842430020000       | lea                 eax, [esp + 0x230]
            //   50                   | push                eax

        $sequence_9 = { 395ddc 7442 395dcc 743d 395dc4 7438 3bc3 }
            // n = 7, score = 100
            //   395ddc               | cmp                 dword ptr [ebp - 0x24], ebx
            //   7442                 | je                  0x44
            //   395dcc               | cmp                 dword ptr [ebp - 0x34], ebx
            //   743d                 | je                  0x3f
            //   395dc4               | cmp                 dword ptr [ebp - 0x3c], ebx
            //   7438                 | je                  0x3a
            //   3bc3                 | cmp                 eax, ebx

    condition:
        7 of them and filesize < 409600
}