rule win_nozelesn_decryptor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.nozelesn_decryptor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nozelesn_decryptor"
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
        $sequence_0 = { 731f 8bc1 83e13f c1f806 6bc930 8b048568ff4700 f644082801 }
            // n = 7, score = 100
            //   731f                 | jae                 0x21
            //   8bc1                 | mov                 eax, ecx
            //   83e13f               | and                 ecx, 0x3f
            //   c1f806               | sar                 eax, 6
            //   6bc930               | imul                ecx, ecx, 0x30
            //   8b048568ff4700       | mov                 eax, dword ptr [eax*4 + 0x47ff68]
            //   f644082801           | test                byte ptr [eax + ecx + 0x28], 1

        $sequence_1 = { 84c0 754f 8b5d94 807f0400 7507 }
            // n = 5, score = 100
            //   84c0                 | test                al, al
            //   754f                 | jne                 0x51
            //   8b5d94               | mov                 ebx, dword ptr [ebp - 0x6c]
            //   807f0400             | cmp                 byte ptr [edi + 4], 0
            //   7507                 | jne                 9

        $sequence_2 = { 56 57 8bf9 33f6 8b07 8bd3 8b08 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   33f6                 | xor                 esi, esi
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8bd3                 | mov                 edx, ebx
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_3 = { 83f938 0f8770020000 0fb68184174200 ff248528174200 ff7524 8d45ec }
            // n = 6, score = 100
            //   83f938               | cmp                 ecx, 0x38
            //   0f8770020000         | ja                  0x276
            //   0fb68184174200       | movzx               eax, byte ptr [ecx + 0x421784]
            //   ff248528174200       | jmp                 dword ptr [eax*4 + 0x421728]
            //   ff7524               | push                dword ptr [ebp + 0x24]
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_4 = { 0bda 0b75f8 51 8d4df0 33de 51 33df }
            // n = 7, score = 100
            //   0bda                 | or                  ebx, edx
            //   0b75f8               | or                  esi, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   33de                 | xor                 ebx, esi
            //   51                   | push                ecx
            //   33df                 | xor                 ebx, edi

        $sequence_5 = { 895158 50 6a04 5a e8???????? 8b4df4 8b45fc }
            // n = 7, score = 100
            //   895158               | mov                 dword ptr [ecx + 0x58], edx
            //   50                   | push                eax
            //   6a04                 | push                4
            //   5a                   | pop                 edx
            //   e8????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_6 = { 898330020000 8b45e0 898334020000 8b45dc 898338020000 8b45d8 89833c020000 }
            // n = 7, score = 100
            //   898330020000         | mov                 dword ptr [ebx + 0x230], eax
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   898334020000         | mov                 dword ptr [ebx + 0x234], eax
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   898338020000         | mov                 dword ptr [ebx + 0x238], eax
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   89833c020000         | mov                 dword ptr [ebx + 0x23c], eax

        $sequence_7 = { d1c6 334de8 c1c107 8bc1 8975fc 33c6 894df4 }
            // n = 7, score = 100
            //   d1c6                 | rol                 esi, 1
            //   334de8               | xor                 ecx, dword ptr [ebp - 0x18]
            //   c1c107               | rol                 ecx, 7
            //   8bc1                 | mov                 eax, ecx
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   33c6                 | xor                 eax, esi
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx

        $sequence_8 = { 668908 c645fc19 8b95b8fbffff 83fa08 7235 8b8da4fbffff 8d145502000000 }
            // n = 7, score = 100
            //   668908               | mov                 word ptr [eax], cx
            //   c645fc19             | mov                 byte ptr [ebp - 4], 0x19
            //   8b95b8fbffff         | mov                 edx, dword ptr [ebp - 0x448]
            //   83fa08               | cmp                 edx, 8
            //   7235                 | jb                  0x37
            //   8b8da4fbffff         | mov                 ecx, dword ptr [ebp - 0x45c]
            //   8d145502000000       | lea                 edx, [edx*2 + 2]

        $sequence_9 = { 8bc2 83c602 8d0448 3bf0 0f8411080000 ff7594 }
            // n = 6, score = 100
            //   8bc2                 | mov                 eax, edx
            //   83c602               | add                 esi, 2
            //   8d0448               | lea                 eax, [eax + ecx*2]
            //   3bf0                 | cmp                 esi, eax
            //   0f8411080000         | je                  0x817
            //   ff7594               | push                dword ptr [ebp - 0x6c]

    condition:
        7 of them and filesize < 1122304
}