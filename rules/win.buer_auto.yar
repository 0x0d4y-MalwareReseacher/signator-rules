rule win_buer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.buer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buer"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 7cf1 eb02 33c0 5f 5e 5b 5d }
            // n = 7, score = 1100
            //   7cf1                 | jl                  0xfffffff3
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp

        $sequence_1 = { 83e003 83e800 7435 83e801 7420 83e801 740b }
            // n = 7, score = 1100
            //   83e003               | and                 eax, 3
            //   83e800               | sub                 eax, 0
            //   7435                 | je                  0x37
            //   83e801               | sub                 eax, 1
            //   7420                 | je                  0x22
            //   83e801               | sub                 eax, 1
            //   740b                 | je                  0xd

        $sequence_2 = { 01515c 5f 5e 894154 5b c9 c3 }
            // n = 7, score = 1100
            //   01515c               | add                 dword ptr [ecx + 0x5c], edx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   894154               | mov                 dword ptr [ecx + 0x54], eax
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 

        $sequence_3 = { 8b45dc 03c6 89414c 8b45fc 03c7 }
            // n = 5, score = 1100
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   03c6                 | add                 eax, esi
            //   89414c               | mov                 dword ptr [ecx + 0x4c], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03c7                 | add                 eax, edi

        $sequence_4 = { 8b55d8 894148 8b45dc 03c6 }
            // n = 4, score = 1100
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   894148               | mov                 dword ptr [ecx + 0x48], eax
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   03c6                 | add                 eax, esi

        $sequence_5 = { 03c2 8b55e8 015158 8b55d8 894148 }
            // n = 5, score = 1100
            //   03c2                 | add                 eax, edx
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   015158               | add                 dword ptr [ecx + 0x58], edx
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   894148               | mov                 dword ptr [ecx + 0x48], eax

        $sequence_6 = { 8b00 8b4010 8945fc 61 }
            // n = 4, score = 1100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b4010               | mov                 eax, dword ptr [eax + 0x10]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   61                   | popal               

        $sequence_7 = { 6803010000 ff75f8 ff15???????? 59 59 }
            // n = 5, score = 1100
            //   6803010000           | push                0x103
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_8 = { b9???????? eb1a 6a05 59 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   eb1a                 | jmp                 0x1c
            //   6a05                 | push                5
            //   59                   | pop                 ecx

        $sequence_9 = { b9e97f00d6 0fa3c1 7308 83c408 }
            // n = 4, score = 200
            //   b9e97f00d6           | mov                 ecx, 0xd6007fe9
            //   0fa3c1               | bt                  ecx, eax
            //   7308                 | jae                 0xa
            //   83c408               | add                 esp, 8

        $sequence_10 = { b9???????? eb05 b9???????? 8b1424 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   eb05                 | jmp                 7
            //   b9????????           |                     
            //   8b1424               | mov                 edx, dword ptr [esp]

        $sequence_11 = { b9???????? e9???????? 8d9424a4000000 c70205000000 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   e9????????           |                     
            //   8d9424a4000000       | lea                 edx, dword ptr [esp + 0xa4]
            //   c70205000000         | mov                 dword ptr [edx], 5

        $sequence_12 = { b9???????? e9???????? 8b8424a8000000 85c0 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   e9????????           |                     
            //   8b8424a8000000       | mov                 eax, dword ptr [esp + 0xa8]
            //   85c0                 | test                eax, eax

        $sequence_13 = { b9???????? eb36 6a04 59 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   eb36                 | jmp                 0x38
            //   6a04                 | push                4
            //   59                   | pop                 ecx

        $sequence_14 = { b9???????? e9???????? ff4608 89f1 }
            // n = 4, score = 200
            //   b9????????           |                     
            //   e9????????           |                     
            //   ff4608               | inc                 dword ptr [esi + 8]
            //   89f1                 | mov                 ecx, esi

        $sequence_15 = { e8???????? 0f0b 53 57 56 83ec0c }
            // n = 6, score = 200
            //   e8????????           |                     
            //   0f0b                 | ud2                 
            //   53                   | push                ebx
            //   57                   | push                edi
            //   56                   | push                esi
            //   83ec0c               | sub                 esp, 0xc

    condition:
        7 of them and filesize < 2518016
}