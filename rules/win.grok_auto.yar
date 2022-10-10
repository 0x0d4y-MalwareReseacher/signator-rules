rule win_grok_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.grok."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grok"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8b8094010000 833800 7610 8d45d8 50 }
            // n = 5, score = 400
            //   8b8094010000         | mov                 eax, dword ptr [eax + 0x194]
            //   833800               | cmp                 dword ptr [eax], 0
            //   7610                 | jbe                 0x12
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   50                   | push                eax

        $sequence_1 = { 58 50 53 51 8d5d04 8b4d08 8d448d14 }
            // n = 7, score = 400
            //   58                   | pop                 eax
            //   50                   | push                eax
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   8d5d04               | lea                 ebx, [ebp + 4]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8d448d14             | lea                 eax, [ebp + ecx*4 + 0x14]

        $sequence_2 = { c1e102 51 ff30 55 ff15???????? 8bd8 3bdd }
            // n = 7, score = 400
            //   c1e102               | shl                 ecx, 2
            //   51                   | push                ecx
            //   ff30                 | push                dword ptr [eax]
            //   55                   | push                ebp
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   3bdd                 | cmp                 ebx, ebp

        $sequence_3 = { 6a00 ffd6 8bf0 8975dc 85db 7437 85f6 }
            // n = 7, score = 400
            //   6a00                 | push                0
            //   ffd6                 | call                esi
            //   8bf0                 | mov                 esi, eax
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   85db                 | test                ebx, ebx
            //   7437                 | je                  0x39
            //   85f6                 | test                esi, esi

        $sequence_4 = { 56 8b74240c 0f20e0 83e6f1 33db a820 }
            // n = 6, score = 400
            //   56                   | push                esi
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   0f20e0               | mov                 eax, cr4
            //   83e6f1               | and                 esi, 0xfffffff1
            //   33db                 | xor                 ebx, ebx
            //   a820                 | test                al, 0x20

        $sequence_5 = { 83daff 899588fdffff 8b8588fdffff 898584fdffff 83bd84fdffff00 0f84d7000000 }
            // n = 6, score = 400
            //   83daff               | sbb                 edx, -1
            //   899588fdffff         | mov                 dword ptr [ebp - 0x278], edx
            //   8b8588fdffff         | mov                 eax, dword ptr [ebp - 0x278]
            //   898584fdffff         | mov                 dword ptr [ebp - 0x27c], eax
            //   83bd84fdffff00       | cmp                 dword ptr [ebp - 0x27c], 0
            //   0f84d7000000         | je                  0xdd

        $sequence_6 = { 59 50 8b45fc 894508 58 50 }
            // n = 6, score = 400
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   58                   | pop                 eax
            //   50                   | push                eax

        $sequence_7 = { 895114 8b0d???????? 8b4924 8b5018 895118 8b0d???????? }
            // n = 6, score = 400
            //   895114               | mov                 dword ptr [ecx + 0x14], edx
            //   8b0d????????         |                     
            //   8b4924               | mov                 ecx, dword ptr [ecx + 0x24]
            //   8b5018               | mov                 edx, dword ptr [eax + 0x18]
            //   895118               | mov                 dword ptr [ecx + 0x18], edx
            //   8b0d????????         |                     

        $sequence_8 = { 83fe08 720c ff7004 ff30 e8???????? eb0c b80d0000c0 }
            // n = 7, score = 400
            //   83fe08               | cmp                 esi, 8
            //   720c                 | jb                  0xe
            //   ff7004               | push                dword ptr [eax + 4]
            //   ff30                 | push                dword ptr [eax]
            //   e8????????           |                     
            //   eb0c                 | jmp                 0xe
            //   b80d0000c0           | mov                 eax, 0xc000000d

        $sequence_9 = { 83c001 8945b8 8b4dc8 83c110 394db8 7308 }
            // n = 6, score = 400
            //   83c001               | add                 eax, 1
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   8b4dc8               | mov                 ecx, dword ptr [ebp - 0x38]
            //   83c110               | add                 ecx, 0x10
            //   394db8               | cmp                 dword ptr [ebp - 0x48], ecx
            //   7308                 | jae                 0xa

    condition:
        7 of them and filesize < 84992
}