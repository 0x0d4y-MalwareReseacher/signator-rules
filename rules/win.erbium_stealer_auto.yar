rule win_erbium_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.erbium_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.erbium_stealer"
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
        $sequence_0 = { 8b45f0 8b08 81e1ffff0000 51 8b55d0 52 ff55cc }
            // n = 7, score = 100
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   81e1ffff0000         | and                 ecx, 0xffff
            //   51                   | push                ecx
            //   8b55d0               | mov                 edx, dword ptr [ebp - 0x30]
            //   52                   | push                edx
            //   ff55cc               | call                dword ptr [ebp - 0x34]

        $sequence_1 = { 894df8 e9???????? ba08000000 c1e200 8b45f4 837c106400 0f84cc000000 }
            // n = 7, score = 100
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   e9????????           |                     
            //   ba08000000           | mov                 edx, 8
            //   c1e200               | shl                 edx, 0
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   837c106400           | cmp                 dword ptr [eax + edx + 0x64], 0
            //   0f84cc000000         | je                  0xd2

        $sequence_2 = { 6a00 6800100000 68???????? 8b45e8 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   6800100000           | push                0x1000
            //   68????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_3 = { b908000000 c1e100 8b55f4 8b45fc 03440a60 8945ec }
            // n = 6, score = 100
            //   b908000000           | mov                 ecx, 8
            //   c1e100               | shl                 ecx, 0
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03440a60             | add                 eax, dword ptr [edx + ecx + 0x60]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax

        $sequence_4 = { 6a00 53 ff15???????? eb08 33c0 eb04 8b442414 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   eb08                 | jmp                 0xa
            //   33c0                 | xor                 eax, eax
            //   eb04                 | jmp                 6
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]

        $sequence_5 = { 6a00 6800100000 8b4d0c 51 8b55f8 52 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   6800100000           | push                0x1000
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx

        $sequence_6 = { 83c101 894dd4 8b55ec 83c228 8955ec 8b45d8 0fb74802 }
            // n = 7, score = 100
            //   83c101               | add                 ecx, 1
            //   894dd4               | mov                 dword ptr [ebp - 0x2c], ecx
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   83c228               | add                 edx, 0x28
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   0fb74802             | movzx               ecx, word ptr [eax + 2]

        $sequence_7 = { 8b55f8 837a0400 0f8481000000 8b45f8 8b4804 }
            // n = 5, score = 100
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   837a0400             | cmp                 dword ptr [edx + 4], 0
            //   0f8481000000         | je                  0x87
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]

        $sequence_8 = { 2bd6 660f1f440000 668908 8d4002 }
            // n = 4, score = 100
            //   2bd6                 | sub                 edx, esi
            //   660f1f440000         | nop                 word ptr [eax + eax]
            //   668908               | mov                 word ptr [eax], cx
            //   8d4002               | lea                 eax, [eax + 2]

        $sequence_9 = { 8b45f4 50 ff15???????? 8945d0 68???????? 8b4df4 }
            // n = 6, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   68????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 33792
}