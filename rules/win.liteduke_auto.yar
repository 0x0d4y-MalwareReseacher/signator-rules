rule win_liteduke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.liteduke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.liteduke"
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
        $sequence_0 = { 8b45f8 c1e802 89433c 8b45fc 894334 8b4df8 c1e902 }
            // n = 7, score = 200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   c1e802               | shr                 eax, 2
            //   89433c               | mov                 dword ptr [ebx + 0x3c], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   894334               | mov                 dword ptr [ebx + 0x34], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   c1e902               | shr                 ecx, 2

        $sequence_1 = { 6a00 6a00 6800020000 ff35???????? 6aff ff35???????? }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6800020000           | push                0x200
            //   ff35????????         |                     
            //   6aff                 | push                -1
            //   ff35????????         |                     

        $sequence_2 = { 54 55 53 45 52 2e44 41 }
            // n = 7, score = 200
            //   54                   | push                esp
            //   55                   | push                ebp
            //   53                   | push                ebx
            //   45                   | inc                 ebp
            //   52                   | push                edx
            //   2e44                 | inc                 esp
            //   41                   | inc                 ecx

        $sequence_3 = { e8???????? 017dec e9???????? 837df000 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   017dec               | add                 dword ptr [ebp - 0x14], edi
            //   e9????????           |                     
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0

        $sequence_4 = { 31f0 01c1 034dc4 81c1d15d8485 }
            // n = 4, score = 200
            //   31f0                 | xor                 eax, esi
            //   01c1                 | add                 ecx, eax
            //   034dc4               | add                 ecx, dword ptr [ebp - 0x3c]
            //   81c1d15d8485         | add                 ecx, 0x85845dd1

        $sequence_5 = { 83ec30 c745ec00000000 c745fc00000000 57 }
            // n = 4, score = 200
            //   83ec30               | sub                 esp, 0x30
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   57                   | push                edi

        $sequence_6 = { 6a00 6a04 ff75ec ff15???????? }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   6a04                 | push                4
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff15????????         |                     

        $sequence_7 = { 20636f 6e 666967207768 657265 }
            // n = 4, score = 200
            //   20636f               | and                 byte ptr [ebx + 0x6f], ah
            //   6e                   | outsb               dx, byte ptr [esi]
            //   666967207768         | imul                sp, word ptr [edi + 0x20], 0x6877
            //   657265               | jb                  0x68

        $sequence_8 = { 01f2 89d8 f7d0 09d0 31f0 01c1 034dd4 }
            // n = 7, score = 200
            //   01f2                 | add                 edx, esi
            //   89d8                 | mov                 eax, ebx
            //   f7d0                 | not                 eax
            //   09d0                 | or                  eax, edx
            //   31f0                 | xor                 eax, esi
            //   01c1                 | add                 ecx, eax
            //   034dd4               | add                 ecx, dword ptr [ebp - 0x2c]

        $sequence_9 = { 6a00 ff15???????? a3???????? be???????? 89c7 b981140000 f3a4 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   a3????????           |                     
            //   be????????           |                     
            //   89c7                 | mov                 edi, eax
            //   b981140000           | mov                 ecx, 0x1481
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]

    condition:
        7 of them and filesize < 1171456
}