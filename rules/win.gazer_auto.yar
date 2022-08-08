rule win_gazer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.gazer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gazer"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 85c0 7511 e8???????? 84c0 7508 83c8ff }
            // n = 6, score = 300
            //   85c0                 | je                  0x1185
            //   7511                 | dec                 eax
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, dword ptr [ebx + 0x30]
            //   7508                 | dec                 eax
            //   83c8ff               | lea                 edx, [0x2f907]

        $sequence_1 = { 7511 e8???????? 84c0 7508 83c8ff e9???????? }
            // n = 6, score = 300
            //   7511                 | sub                 esp, eax
            //   e8????????           |                     
            //   84c0                 | dec                 eax
            //   7508                 | cmp                 dword ptr [ecx + 0x10], 0
            //   83c8ff               | dec                 eax
            //   e9????????           |                     

        $sequence_2 = { ff15???????? 85c0 7511 e8???????? 84c0 7508 83c8ff }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   85c0                 | and                 dword ptr [esp + 0x30], 0
            //   7511                 | jne                 0x1a04
            //   e8????????           |                     
            //   84c0                 | lea                 eax, [ebp - 0x18]
            //   7508                 | push                esi
            //   83c8ff               | push                eax

        $sequence_3 = { ff15???????? 85c0 7511 e8???????? 84c0 }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   85c0                 | jne                 0x71a
            //   7511                 | dec                 ecx
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, dword ptr [esp + 0xc0]

        $sequence_4 = { ff15???????? 85c0 7511 e8???????? 84c0 7508 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   85c0                 | jl                  0x1ba3
            //   7511                 | dec                 ecx
            //   e8????????           |                     
            //   84c0                 | mov                 eax, eax
            //   7508                 | dec                 eax

        $sequence_5 = { 85c0 7511 e8???????? 84c0 7508 83c8ff e9???????? }
            // n = 7, score = 300
            //   85c0                 | je                  0x182f
            //   7511                 | dec                 eax
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, dword ptr [esi]
            //   7508                 | dec                 esp
            //   83c8ff               | mov                 eax, ebx
            //   e9????????           |                     

        $sequence_6 = { 85c0 7511 e8???????? 84c0 7508 }
            // n = 5, score = 300
            //   85c0                 | inc                 ecx
            //   7511                 | mov                 eax, 0x1000
            //   e8????????           |                     
            //   84c0                 | dec                 eax
            //   7508                 | mov                 ecx, eax

        $sequence_7 = { 7511 e8???????? 84c0 7508 83c8ff }
            // n = 5, score = 300
            //   7511                 | mov                 ecx, edi
            //   e8????????           |                     
            //   84c0                 | or                  eax, 0xffffffff
            //   7508                 | lock xadd           dword ptr [ebx + 0x58], eax
            //   83c8ff               | dec                 eax

        $sequence_8 = { 85c0 7511 e8???????? 84c0 }
            // n = 4, score = 300
            //   85c0                 | sub                 esp, 0x20
            //   7511                 | push                ebp
            //   e8????????           |                     
            //   84c0                 | dec                 eax

        $sequence_9 = { 8b942488000000 8d941040b340c0 c1c209 03d1 8bc2 }
            // n = 5, score = 200
            //   8b942488000000       | push                edi
            //   8d941040b340c0       | push                0x1003bf68
            //   c1c209               | cmp                 eax, edi
            //   03d1                 | jne                 0x403
            //   8bc2                 | push                edi

    condition:
        7 of them and filesize < 950272
}