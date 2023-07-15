rule win_solarbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.solarbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.solarbot"
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
        $sequence_0 = { 8b85f0fdffff 50 6a00 6a00 8b85ecfdffff 50 8b85e8fdffff }
            // n = 7, score = 300
            //   8b85f0fdffff         | mov                 eax, dword ptr [ebp - 0x210]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8b85ecfdffff         | mov                 eax, dword ptr [ebp - 0x214]
            //   50                   | push                eax
            //   8b85e8fdffff         | mov                 eax, dword ptr [ebp - 0x218]

        $sequence_1 = { 85c0 7574 6800040000 8d85f4fbffff 50 e8???????? }
            // n = 6, score = 300
            //   85c0                 | test                eax, eax
            //   7574                 | jne                 0x76
            //   6800040000           | push                0x400
            //   8d85f4fbffff         | lea                 eax, [ebp - 0x40c]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { 8b75f8 0375f4 46 8b45f0 8b38 0fb6c3 }
            // n = 6, score = 300
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]
            //   0375f4               | add                 esi, dword ptr [ebp - 0xc]
            //   46                   | inc                 esi
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   0fb6c3               | movzx               eax, bl

        $sequence_3 = { 8a85f8fdffff 50 89bdccfdffff ffb5ccfdffff 8b85fcfdffff 50 8b85f4fdffff }
            // n = 7, score = 300
            //   8a85f8fdffff         | mov                 al, byte ptr [ebp - 0x208]
            //   50                   | push                eax
            //   89bdccfdffff         | mov                 dword ptr [ebp - 0x234], edi
            //   ffb5ccfdffff         | push                dword ptr [ebp - 0x234]
            //   8b85fcfdffff         | mov                 eax, dword ptr [ebp - 0x204]
            //   50                   | push                eax
            //   8b85f4fdffff         | mov                 eax, dword ptr [ebp - 0x20c]

        $sequence_4 = { 3dfb000000 7312 6a00 6aff }
            // n = 4, score = 300
            //   3dfb000000           | cmp                 eax, 0xfb
            //   7312                 | jae                 0x14
            //   6a00                 | push                0
            //   6aff                 | push                -1

        $sequence_5 = { b800000000 bf00000000 bb00000000 8b85fcfbffff 48 }
            // n = 5, score = 300
            //   b800000000           | mov                 eax, 0
            //   bf00000000           | mov                 edi, 0
            //   bb00000000           | mov                 ebx, 0
            //   8b85fcfbffff         | mov                 eax, dword ptr [ebp - 0x404]
            //   48                   | dec                 eax

        $sequence_6 = { 89da 52 89fa 52 89c7 57 }
            // n = 6, score = 300
            //   89da                 | mov                 edx, ebx
            //   52                   | push                edx
            //   89fa                 | mov                 edx, edi
            //   52                   | push                edx
            //   89c7                 | mov                 edi, eax
            //   57                   | push                edi

        $sequence_7 = { 53 ff75f4 57 6aff 8b55f8 }
            // n = 5, score = 300
            //   53                   | push                ebx
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   57                   | push                edi
            //   6aff                 | push                -1
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_8 = { 01ca 89f8 01d8 8a12 3a10 7508 39fe }
            // n = 7, score = 300
            //   01ca                 | add                 edx, ecx
            //   89f8                 | mov                 eax, edi
            //   01d8                 | add                 eax, ebx
            //   8a12                 | mov                 dl, byte ptr [edx]
            //   3a10                 | cmp                 dl, byte ptr [eax]
            //   7508                 | jne                 0xa
            //   39fe                 | cmp                 esi, edi

        $sequence_9 = { 6a00 6a00 8d45e0 50 ff75cc ff75dc 8b55d0 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d45e0               | lea                 eax, [ebp - 0x20]
            //   50                   | push                eax
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   8b55d0               | mov                 edx, dword ptr [ebp - 0x30]

    condition:
        7 of them and filesize < 204800
}