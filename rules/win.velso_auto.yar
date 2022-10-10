rule win_velso_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.velso."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.velso"
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
        $sequence_0 = { 7419 31c0 837d14ff c6459000 0f8497010000 3a4590 0f8487fbffff }
            // n = 7, score = 200
            //   7419                 | je                  0x1b
            //   31c0                 | xor                 eax, eax
            //   837d14ff             | cmp                 dword ptr [ebp + 0x14], -1
            //   c6459000             | mov                 byte ptr [ebp - 0x70], 0
            //   0f8497010000         | je                  0x19d
            //   3a4590               | cmp                 al, byte ptr [ebp - 0x70]
            //   0f8487fbffff         | je                  0xfffffb8d

        $sequence_1 = { c7042430000000 e8???????? 83ec08 85c0 742e 83f8ff 8b55e4 }
            // n = 7, score = 200
            //   c7042430000000       | mov                 dword ptr [esp], 0x30
            //   e8????????           |                     
            //   83ec08               | sub                 esp, 8
            //   85c0                 | test                eax, eax
            //   742e                 | je                  0x30
            //   83f8ff               | cmp                 eax, -1
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]

        $sequence_2 = { c7431000000000 c7431800000000 c6434601 eb9f 8b4b40 8b533c 83f901 }
            // n = 7, score = 200
            //   c7431000000000       | mov                 dword ptr [ebx + 0x10], 0
            //   c7431800000000       | mov                 dword ptr [ebx + 0x18], 0
            //   c6434601             | mov                 byte ptr [ebx + 0x46], 1
            //   eb9f                 | jmp                 0xffffffa1
            //   8b4b40               | mov                 ecx, dword ptr [ebx + 0x40]
            //   8b533c               | mov                 edx, dword ptr [ebx + 0x3c]
            //   83f901               | cmp                 ecx, 1

        $sequence_3 = { 8b7d10 8b01 897c2404 8b7d0c 893c24 8b4030 c745a801000000 }
            // n = 7, score = 200
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   897c2404             | mov                 dword ptr [esp + 4], edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   893c24               | mov                 dword ptr [esp], edi
            //   8b4030               | mov                 eax, dword ptr [eax + 0x30]
            //   c745a801000000       | mov                 dword ptr [ebp - 0x58], 1

        $sequence_4 = { e9???????? 89e8 e8???????? 89c6 89e8 e8???????? 89c7 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   89e8                 | mov                 eax, ebp
            //   e8????????           |                     
            //   89c6                 | mov                 esi, eax
            //   89e8                 | mov                 eax, ebp
            //   e8????????           |                     
            //   89c7                 | mov                 edi, eax

        $sequence_5 = { c21000 8b55a8 8b4178 8955d8 8b55ac 8955dc 8b55b0 }
            // n = 7, score = 200
            //   c21000               | ret                 0x10
            //   8b55a8               | mov                 edx, dword ptr [ebp - 0x58]
            //   8b4178               | mov                 eax, dword ptr [ecx + 0x78]
            //   8955d8               | mov                 dword ptr [ebp - 0x28], edx
            //   8b55ac               | mov                 edx, dword ptr [ebp - 0x54]
            //   8955dc               | mov                 dword ptr [ebp - 0x24], edx
            //   8b55b0               | mov                 edx, dword ptr [ebp - 0x50]

        $sequence_6 = { e8???????? 83ec04 84c0 88459e 0f85df070000 8d4d08 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83ec04               | sub                 esp, 4
            //   84c0                 | test                al, al
            //   88459e               | mov                 byte ptr [ebp - 0x62], al
            //   0f85df070000         | jne                 0x7e5
            //   8d4d08               | lea                 ecx, [ebp + 8]
            //   e8????????           |                     

        $sequence_7 = { 8b5508 891424 8d55e0 8b4010 c745a8ffffffff 89d1 }
            // n = 6, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   891424               | mov                 dword ptr [esp], edx
            //   8d55e0               | lea                 edx, [ebp - 0x20]
            //   8b4010               | mov                 eax, dword ptr [eax + 0x10]
            //   c745a8ffffffff       | mov                 dword ptr [ebp - 0x58], 0xffffffff
            //   89d1                 | mov                 ecx, edx

        $sequence_8 = { dd1c24 e8???????? 8b742438 8b7d00 29fe 89c3 8b44243c }
            // n = 7, score = 200
            //   dd1c24               | fstp                qword ptr [esp]
            //   e8????????           |                     
            //   8b742438             | mov                 esi, dword ptr [esp + 0x38]
            //   8b7d00               | mov                 edi, dword ptr [ebp]
            //   29fe                 | sub                 esi, edi
            //   89c3                 | mov                 ebx, eax
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]

        $sequence_9 = { e8???????? 8945f4 8b45a4 80781000 0f85ec060000 b8ffff0000 99 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b45a4               | mov                 eax, dword ptr [ebp - 0x5c]
            //   80781000             | cmp                 byte ptr [eax + 0x10], 0
            //   0f85ec060000         | jne                 0x6f2
            //   b8ffff0000           | mov                 eax, 0xffff
            //   99                   | cdq                 

    condition:
        7 of them and filesize < 1736704
}