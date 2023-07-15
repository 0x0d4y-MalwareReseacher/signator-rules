rule win_virtualgate_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.virtualgate."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.virtualgate"
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
        $sequence_0 = { 4883ec50 418bd9 498bf8 8bf2 4c8d0db5d20000 }
            // n = 5, score = 100
            //   4883ec50             | test                edi, edi
            //   418bd9               | cmove               eax, dword ptr [esp + 0x6c]
            //   498bf8               | mov                 dword ptr [esp + 0x54], eax
            //   8bf2                 | mov                 dword ptr [ecx + 0x28], edx
            //   4c8d0db5d20000       | dec                 eax

        $sequence_1 = { c705????????01000000 c705????????01000000 b808000000 486bc000 488d0d32f90100 }
            // n = 5, score = 100
            //   c705????????01000000     |     
            //   c705????????01000000     |     
            //   b808000000           | mov                 eax, dword ptr [ecx + eax*8]
            //   486bc000             | inc                 edx
            //   488d0d32f90100       | cmp                 byte ptr [eax + esi*8 + 0x38], dh

        $sequence_2 = { e8???????? 448938 488b4c2430 ff15???????? 488b4c2438 ff15???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   448938               | mov                 dword ptr [ebp + 0x150], edi
            //   488b4c2430           | jmp                 0xf16
            //   ff15????????         |                     
            //   488b4c2438           | inc                 ecx
            //   ff15????????         |                     

        $sequence_3 = { 40887c2462 84db 0f846dffffff b880400000 41b880000000 80f974 440f44c0 }
            // n = 7, score = 100
            //   40887c2462           | mov                 byte ptr [eax + ebx*8 + 0x39], 0
            //   84db                 | dec                 edx
            //   0f846dffffff         | mov                 eax, dword ptr [ecx + ebp*8]
            //   b880400000           | dec                 eax
            //   41b880000000         | lea                 ecx, [0xfffeec30]
            //   80f974               | dec                 esp
            //   440f44c0             | mov                 dword ptr [ebp - 0x19], eax

        $sequence_4 = { f00fc103 83f801 7516 488d05c6420100 488b4c2430 483bc8 7405 }
            // n = 7, score = 100
            //   f00fc103             | dec                 eax
            //   83f801               | mov                 edx, ebx
            //   7516                 | dec                 eax
            //   488d05c6420100       | lea                 ecx, [0x1fd2c]
            //   488b4c2430           | dec                 eax
            //   483bc8               | or                  dword ptr [ebp + 0x7f], 0xffffffff
            //   7405                 | dec                 esp

        $sequence_5 = { e8???????? 85c0 7505 458bfd }
            // n = 4, score = 100
            //   e8????????           |                     
            //   85c0                 | dec                 esp
            //   7505                 | mov                 eax, ecx
            //   458bfd               | mov                 eax, 0x5a4d

        $sequence_6 = { ff8370040000 83bb7004000002 0f8493010000 488d2dbe280100 }
            // n = 4, score = 100
            //   ff8370040000         | dec                 esp
            //   83bb7004000002       | lea                 ecx, [0x8e6b]
            //   0f8493010000         | mulsd               xmm3, xmm2
            //   488d2dbe280100       | dec                 esp

        $sequence_7 = { b808000000 486bc000 488d0d56f80100 8b542430 48891401 }
            // n = 5, score = 100
            //   b808000000           | dec                 eax
            //   486bc000             | lea                 edi, [0x1c688]
            //   488d0d56f80100       | dec                 eax
            //   8b542430             | mov                 dword ptr [esp + 8], ebx
            //   48891401             | push                edi

        $sequence_8 = { 2bc8 0f8481000000 8d41ff 8b8482989a0100 85c0 }
            // n = 5, score = 100
            //   2bc8                 | dec                 eax
            //   0f8481000000         | lea                 eax, [0x9acb]
            //   8d41ff               | dec                 eax
            //   8b8482989a0100       | mov                 ebx, ecx
            //   85c0                 | push                ebp

        $sequence_9 = { 7409 488b4de7 e8???????? 4c8d9c2400010000 8bc3 498b5b30 498b7338 }
            // n = 7, score = 100
            //   7409                 | inc                 eax
            //   488b4de7             | push                ebx
            //   e8????????           |                     
            //   4c8d9c2400010000     | dec                 eax
            //   8bc3                 | sub                 esp, 0x20
            //   498b5b30             | xor                 edx, edx
            //   498b7338             | dec                 eax

    condition:
        7 of them and filesize < 323584
}