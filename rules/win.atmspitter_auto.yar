rule win_atmspitter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.atmspitter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmspitter"
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
        $sequence_0 = { c3 8b04cd14c04000 5d c3 0544ffffff 6a0e 59 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   8b04cd14c04000       | mov                 eax, dword ptr [ecx*8 + 0x40c014]
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   0544ffffff           | add                 eax, 0xffffff44
            //   6a0e                 | push                0xe
            //   59                   | pop                 ecx

        $sequence_1 = { a1???????? 8a15???????? 53 56 57 b910000000 be???????? }
            // n = 7, score = 200
            //   a1????????           |                     
            //   8a15????????         |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   b910000000           | mov                 ecx, 0x10
            //   be????????           |                     

        $sequence_2 = { 8b4508 8bc8 83e01f c1f905 8b0c8d60da4000 c1e006 8d44010c }
            // n = 7, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d60da4000       | mov                 ecx, dword ptr [ecx*4 + 0x40da60]
            //   c1e006               | shl                 eax, 6
            //   8d44010c             | lea                 eax, [ecx + eax + 0xc]

        $sequence_3 = { f7460c0c010000 754e 53 57 8d3c8544d44000 833f00 bb00100000 }
            // n = 7, score = 200
            //   f7460c0c010000       | test                dword ptr [esi + 0xc], 0x10c
            //   754e                 | jne                 0x50
            //   53                   | push                ebx
            //   57                   | push                edi
            //   8d3c8544d44000       | lea                 edi, [eax*4 + 0x40d444]
            //   833f00               | cmp                 dword ptr [edi], 0
            //   bb00100000           | mov                 ebx, 0x1000

        $sequence_4 = { 83c404 eb59 68???????? e8???????? 83c404 }
            // n = 5, score = 200
            //   83c404               | add                 esp, 4
            //   eb59                 | jmp                 0x5b
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_5 = { b9e1070000 66394c2450 0f854a020000 66837c245207 0f853e020000 8d942480000000 }
            // n = 6, score = 200
            //   b9e1070000           | mov                 ecx, 0x7e1
            //   66394c2450           | cmp                 word ptr [esp + 0x50], cx
            //   0f854a020000         | jne                 0x250
            //   66837c245207         | cmp                 word ptr [esp + 0x52], 7
            //   0f853e020000         | jne                 0x244
            //   8d942480000000       | lea                 edx, [esp + 0x80]

        $sequence_6 = { 8bc6 c1f805 8b048560da4000 83e61f c1e606 59 }
            // n = 6, score = 200
            //   8bc6                 | mov                 eax, esi
            //   c1f805               | sar                 eax, 5
            //   8b048560da4000       | mov                 eax, dword ptr [eax*4 + 0x40da60]
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   59                   | pop                 ecx

        $sequence_7 = { 55 8bec 8b4508 ff34c5f0cb4000 ff15???????? 5d }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   ff34c5f0cb4000       | push                dword ptr [eax*8 + 0x40cbf0]
            //   ff15????????         |                     
            //   5d                   | pop                 ebp

        $sequence_8 = { e8???????? 83c408 68???????? e8???????? 8b4528 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   68????????           |                     
            //   e8????????           |                     
            //   8b4528               | mov                 eax, dword ptr [ebp + 0x28]

        $sequence_9 = { 49 741e 81e9ddda0000 0f8536010000 68???????? }
            // n = 5, score = 200
            //   49                   | dec                 ecx
            //   741e                 | je                  0x20
            //   81e9ddda0000         | sub                 ecx, 0xdadd
            //   0f8536010000         | jne                 0x13c
            //   68????????           |                     

    condition:
        7 of them and filesize < 147456
}