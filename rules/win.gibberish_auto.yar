rule win_gibberish_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.gibberish."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gibberish"
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
        $sequence_0 = { 50 53 68???????? 68ff7f0000 57 e8???????? 83c414 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   53                   | push                ebx
            //   68????????           |                     
            //   68ff7f0000           | push                0x7fff
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14

        $sequence_1 = { 7429 83e805 7415 83e801 0f8595010000 c745e470d44500 }
            // n = 6, score = 100
            //   7429                 | je                  0x2b
            //   83e805               | sub                 eax, 5
            //   7415                 | je                  0x17
            //   83e801               | sub                 eax, 1
            //   0f8595010000         | jne                 0x19b
            //   c745e470d44500       | mov                 dword ptr [ebp - 0x1c], 0x45d470

        $sequence_2 = { 56 e8???????? ff742430 ff742430 57 e8???????? 8b442428 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]

        $sequence_3 = { 83f81f 7730 52 51 e8???????? 83c408 c703???????? }
            // n = 7, score = 100
            //   83f81f               | cmp                 eax, 0x1f
            //   7730                 | ja                  0x32
            //   52                   | push                edx
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   c703????????         |                     

        $sequence_4 = { 89859cfeffff ff05???????? 8d4308 837b1c08 51 0f434308 6880000000 }
            // n = 7, score = 100
            //   89859cfeffff         | mov                 dword ptr [ebp - 0x164], eax
            //   ff05????????         |                     
            //   8d4308               | lea                 eax, [ebx + 8]
            //   837b1c08             | cmp                 dword ptr [ebx + 0x1c], 8
            //   51                   | push                ecx
            //   0f434308             | cmovae              eax, dword ptr [ebx + 8]
            //   6880000000           | push                0x80

        $sequence_5 = { 8b842494000000 0f11842480000000 8bb42480000000 89442460 0f1f00 85ed 7438 }
            // n = 7, score = 100
            //   8b842494000000       | mov                 eax, dword ptr [esp + 0x94]
            //   0f11842480000000     | movups              xmmword ptr [esp + 0x80], xmm0
            //   8bb42480000000       | mov                 esi, dword ptr [esp + 0x80]
            //   89442460             | mov                 dword ptr [esp + 0x60], eax
            //   0f1f00               | nop                 dword ptr [eax]
            //   85ed                 | test                ebp, ebp
            //   7438                 | je                  0x3a

        $sequence_6 = { 50 8d8d78ffffff e8???????? 50 8d4d90 e8???????? 68???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d8d78ffffff         | lea                 ecx, [ebp - 0x88]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4d90               | lea                 ecx, [ebp - 0x70]
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_7 = { 83f807 0f8786000000 ff248572904200 68???????? eb13 68???????? eb0c }
            // n = 7, score = 100
            //   83f807               | cmp                 eax, 7
            //   0f8786000000         | ja                  0x8c
            //   ff248572904200       | jmp                 dword ptr [eax*4 + 0x429072]
            //   68????????           |                     
            //   eb13                 | jmp                 0x15
            //   68????????           |                     
            //   eb0c                 | jmp                 0xe

        $sequence_8 = { ff3485e0ad4500 e8???????? a1???????? 80383f }
            // n = 4, score = 100
            //   ff3485e0ad4500       | push                dword ptr [eax*4 + 0x45ade0]
            //   e8????????           |                     
            //   a1????????           |                     
            //   80383f               | cmp                 byte ptr [eax], 0x3f

        $sequence_9 = { e8???????? 83c40c 8d4c2428 e8???????? 6a20 6a00 8d4c2430 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   e8????????           |                     
            //   6a20                 | push                0x20
            //   6a00                 | push                0
            //   8d4c2430             | lea                 ecx, [esp + 0x30]

    condition:
        7 of them and filesize < 1068032
}