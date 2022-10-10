rule win_datper_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.datper."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.datper"
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
        $sequence_0 = { 837da8ff 7507 33c0 8945bc eb1d 6a00 8d45a4 }
            // n = 7, score = 200
            //   837da8ff             | cmp                 dword ptr [ebp - 0x58], -1
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   8945bc               | mov                 dword ptr [ebp - 0x44], eax
            //   eb1d                 | jmp                 0x1f
            //   6a00                 | push                0
            //   8d45a4               | lea                 eax, [ebp - 0x5c]

        $sequence_1 = { 8945f8 8b4df8 8d9518feffff a1???????? e8???????? 8d55f8 }
            // n = 6, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8d9518feffff         | lea                 edx, [ebp - 0x1e8]
            //   a1????????           |                     
            //   e8????????           |                     
            //   8d55f8               | lea                 edx, [ebp - 8]

        $sequence_2 = { e8???????? 8945b4 8b55d4 83c210 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]
            //   83c210               | add                 edx, 0x10

        $sequence_3 = { 2bd7 8bc3 e8???????? 8d45fc }
            // n = 4, score = 200
            //   2bd7                 | sub                 edx, edi
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_4 = { e8???????? 68???????? 8d442424 50 e8???????? 8d442420 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   68????????           |                     
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d442420             | lea                 eax, [esp + 0x20]

        $sequence_5 = { 0f8515020000 8d45ec ba00280000 e8???????? 8b45d4 }
            // n = 5, score = 200
            //   0f8515020000         | jne                 0x21b
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   ba00280000           | mov                 edx, 0x2800
            //   e8????????           |                     
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]

        $sequence_6 = { a3???????? 8d95e4fbffff b8???????? e8???????? }
            // n = 4, score = 200
            //   a3????????           |                     
            //   8d95e4fbffff         | lea                 edx, [ebp - 0x41c]
            //   b8????????           |                     
            //   e8????????           |                     

        $sequence_7 = { e8???????? 33ed c744240801000000 3b6c240c 0f8dab000000 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   33ed                 | xor                 ebp, ebp
            //   c744240801000000     | mov                 dword ptr [esp + 8], 1
            //   3b6c240c             | cmp                 ebp, dword ptr [esp + 0xc]
            //   0f8dab000000         | jge                 0xb1

        $sequence_8 = { 83c210 8d85a0feffff b9d8000000 e8???????? bbe8000000 }
            // n = 5, score = 200
            //   83c210               | add                 edx, 0x10
            //   8d85a0feffff         | lea                 eax, [ebp - 0x160]
            //   b9d8000000           | mov                 ecx, 0xd8
            //   e8????????           |                     
            //   bbe8000000           | mov                 ebx, 0xe8

        $sequence_9 = { e8???????? 8b15???????? 66898280000000 a1???????? ba???????? e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b15????????         |                     
            //   66898280000000       | mov                 word ptr [edx + 0x80], ax
            //   a1????????           |                     
            //   ba????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 253952
}