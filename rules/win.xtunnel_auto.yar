rule win_xtunnel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.xtunnel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xtunnel"
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
        $sequence_0 = { 8b4c2434 53 55 56 8b74243c 8b2e }
            // n = 6, score = 1200
            //   8b4c2434             | mov                 ecx, dword ptr [esp + 0x34]
            //   53                   | push                ebx
            //   55                   | push                ebp
            //   56                   | push                esi
            //   8b74243c             | mov                 esi, dword ptr [esp + 0x3c]
            //   8b2e                 | mov                 ebp, dword ptr [esi]

        $sequence_1 = { 8b542410 c1e20a 8554241c 7401 46 }
            // n = 5, score = 1200
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   c1e20a               | shl                 edx, 0xa
            //   8554241c             | test                dword ptr [esp + 0x1c], edx
            //   7401                 | je                  3
            //   46                   | inc                 esi

        $sequence_2 = { 8b542430 0ac1 8d4eff f7d1 }
            // n = 4, score = 1200
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   0ac1                 | or                  al, cl
            //   8d4eff               | lea                 ecx, dword ptr [esi - 1]
            //   f7d1                 | not                 ecx

        $sequence_3 = { 8b4c2438 03c8 83c40c 89442428 894c2458 3bc1 }
            // n = 6, score = 1200
            //   8b4c2438             | mov                 ecx, dword ptr [esp + 0x38]
            //   03c8                 | add                 ecx, eax
            //   83c40c               | add                 esp, 0xc
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   894c2458             | mov                 dword ptr [esp + 0x58], ecx
            //   3bc1                 | cmp                 eax, ecx

        $sequence_4 = { 8b542440 8d4c0a0b 894c243c 8b4c243c 8b542420 }
            // n = 5, score = 1200
            //   8b542440             | mov                 edx, dword ptr [esp + 0x40]
            //   8d4c0a0b             | lea                 ecx, dword ptr [edx + ecx + 0xb]
            //   894c243c             | mov                 dword ptr [esp + 0x3c], ecx
            //   8b4c243c             | mov                 ecx, dword ptr [esp + 0x3c]
            //   8b542420             | mov                 edx, dword ptr [esp + 0x20]

        $sequence_5 = { 8be8 83c408 85ed 7917 68???????? 68cd030000 68???????? }
            // n = 7, score = 1200
            //   8be8                 | mov                 ebp, eax
            //   83c408               | add                 esp, 8
            //   85ed                 | test                ebp, ebp
            //   7917                 | jns                 0x19
            //   68????????           |                     
            //   68cd030000           | push                0x3cd
            //   68????????           |                     

        $sequence_6 = { e8???????? 99 b960000000 f7f9 }
            // n = 4, score = 1200
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b960000000           | mov                 ecx, 0x60
            //   f7f9                 | idiv                ecx

        $sequence_7 = { 8be8 c7400401000000 eba7 896c2410 }
            // n = 4, score = 1200
            //   8be8                 | mov                 ebp, eax
            //   c7400401000000       | mov                 dword ptr [eax + 4], 1
            //   eba7                 | jmp                 0xffffffa9
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp

        $sequence_8 = { 8b11 83c202 52 e8???????? }
            // n = 4, score = 1200
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   83c202               | add                 edx, 2
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_9 = { 8b54242c 03d1 3bd5 0f83ad000000 }
            // n = 4, score = 1200
            //   8b54242c             | mov                 edx, dword ptr [esp + 0x2c]
            //   03d1                 | add                 edx, ecx
            //   3bd5                 | cmp                 edx, ebp
            //   0f83ad000000         | jae                 0xb3

        $sequence_10 = { 7406 c7010c000000 5e 5d c3 6a00 }
            // n = 6, score = 1100
            //   7406                 | je                  8
            //   c7010c000000         | mov                 dword ptr [ecx], 0xc
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a00                 | push                0

        $sequence_11 = { 8910 8b5114 895014 0fb7510a 6689500a 8b510c 89500c }
            // n = 7, score = 1000
            //   8910                 | mov                 dword ptr [eax], edx
            //   8b5114               | mov                 edx, dword ptr [ecx + 0x14]
            //   895014               | mov                 dword ptr [eax + 0x14], edx
            //   0fb7510a             | movzx               edx, word ptr [ecx + 0xa]
            //   6689500a             | mov                 word ptr [eax + 0xa], dx
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]
            //   89500c               | mov                 dword ptr [eax + 0xc], edx

        $sequence_12 = { 5e 8d4310 5b 8be5 }
            // n = 4, score = 1000
            //   5e                   | pop                 esi
            //   8d4310               | lea                 eax, dword ptr [ebx + 0x10]
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_13 = { 8b7314 2b7310 d1fe 46 }
            // n = 4, score = 1000
            //   8b7314               | mov                 esi, dword ptr [ebx + 0x14]
            //   2b7310               | sub                 esi, dword ptr [ebx + 0x10]
            //   d1fe                 | sar                 esi, 1
            //   46                   | inc                 esi

        $sequence_14 = { 895dec c645fc0b 8b4304 8b08 }
            // n = 4, score = 1000
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   c645fc0b             | mov                 byte ptr [ebp - 4], 0xb
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_15 = { 8bf0 8b4508 6800400000 56 }
            // n = 4, score = 1000
            //   8bf0                 | mov                 esi, eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   6800400000           | push                0x4000
            //   56                   | push                esi

        $sequence_16 = { 8b5620 895020 8b4e10 894810 }
            // n = 4, score = 1000
            //   8b5620               | mov                 edx, dword ptr [esi + 0x20]
            //   895020               | mov                 dword ptr [eax + 0x20], edx
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]
            //   894810               | mov                 dword ptr [eax + 0x10], ecx

        $sequence_17 = { 8908 8b17 893a 895f04 }
            // n = 4, score = 1000
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   893a                 | mov                 dword ptr [edx], edi
            //   895f04               | mov                 dword ptr [edi + 4], ebx

        $sequence_18 = { 8d4802 2bd1 d1fa 83c404 03d2 }
            // n = 5, score = 1000
            //   8d4802               | lea                 ecx, dword ptr [eax + 2]
            //   2bd1                 | sub                 edx, ecx
            //   d1fa                 | sar                 edx, 1
            //   83c404               | add                 esp, 4
            //   03d2                 | add                 edx, edx

        $sequence_19 = { e8???????? 83c404 8945b0 8b45b4 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]

        $sequence_20 = { 8945b0 8b45b4 50 6a00 }
            // n = 4, score = 500
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_21 = { c685c5e1ffff64 c685c6e1ffff44 c685c7e1ffff05 c685c8e1ffff17 }
            // n = 4, score = 300
            //   c685c5e1ffff64       | mov                 byte ptr [ebp - 0x1e3b], 0x64
            //   c685c6e1ffff44       | mov                 byte ptr [ebp - 0x1e3a], 0x44
            //   c685c7e1ffff05       | mov                 byte ptr [ebp - 0x1e39], 5
            //   c685c8e1ffff17       | mov                 byte ptr [ebp - 0x1e38], 0x17

        $sequence_22 = { c685c5e2ffff2b c685c6e2ffffbf c685c7e2ffff81 c685c8e2ffffa3 }
            // n = 4, score = 300
            //   c685c5e2ffff2b       | mov                 byte ptr [ebp - 0x1d3b], 0x2b
            //   c685c6e2ffffbf       | mov                 byte ptr [ebp - 0x1d3a], 0xbf
            //   c685c7e2ffff81       | mov                 byte ptr [ebp - 0x1d39], 0x81
            //   c685c8e2ffffa3       | mov                 byte ptr [ebp - 0x1d38], 0xa3

        $sequence_23 = { c685c5e0ffff91 c685c6e0ffff8a c685c7e0fffff9 c685c8e0ffff50 c685c9e0ffffe4 c685cae0ffffe2 }
            // n = 6, score = 300
            //   c685c5e0ffff91       | mov                 byte ptr [ebp - 0x1f3b], 0x91
            //   c685c6e0ffff8a       | mov                 byte ptr [ebp - 0x1f3a], 0x8a
            //   c685c7e0fffff9       | mov                 byte ptr [ebp - 0x1f39], 0xf9
            //   c685c8e0ffff50       | mov                 byte ptr [ebp - 0x1f38], 0x50
            //   c685c9e0ffffe4       | mov                 byte ptr [ebp - 0x1f37], 0xe4
            //   c685cae0ffffe2       | mov                 byte ptr [ebp - 0x1f36], 0xe2

    condition:
        7 of them and filesize < 4634440
}