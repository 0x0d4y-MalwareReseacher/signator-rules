rule win_synflooder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.synflooder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.synflooder"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { e8???????? 83c404 eb17 bb00040000 c744241800280000 be3c000000 b8e8030000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   eb17                 | jmp                 0x19
            //   bb00040000           | mov                 ebx, 0x400
            //   c744241800280000     | mov                 dword ptr [esp + 0x18], 0x2800
            //   be3c000000           | mov                 esi, 0x3c
            //   b8e8030000           | mov                 eax, 0x3e8

        $sequence_1 = { c7465c20b04000 83660800 33ff 47 897e14 897e70 }
            // n = 6, score = 200
            //   c7465c20b04000       | mov                 dword ptr [esi + 0x5c], 0x40b020
            //   83660800             | and                 dword ptr [esi + 8], 0
            //   33ff                 | xor                 edi, edi
            //   47                   | inc                 edi
            //   897e14               | mov                 dword ptr [esi + 0x14], edi
            //   897e70               | mov                 dword ptr [esi + 0x70], edi

        $sequence_2 = { 50 e8???????? 46 83c404 89742410 3b74241c }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   46                   | inc                 esi
            //   83c404               | add                 esp, 4
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   3b74241c             | cmp                 esi, dword ptr [esp + 0x1c]

        $sequence_3 = { 807e0a00 750b 56 e8???????? 59 85c0 7407 }
            // n = 7, score = 200
            //   807e0a00             | cmp                 byte ptr [esi + 0xa], 0
            //   750b                 | jne                 0xd
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9

        $sequence_4 = { ff15???????? 8b742420 56 68???????? }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8b742420             | mov                 esi, dword ptr [esp + 0x20]
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_5 = { 33f6 85db 7e1b 8bff e8???????? 0fbec0 99 }
            // n = 7, score = 200
            //   33f6                 | xor                 esi, esi
            //   85db                 | test                ebx, ebx
            //   7e1b                 | jle                 0x1d
            //   8bff                 | mov                 edi, edi
            //   e8????????           |                     
            //   0fbec0               | movsx               eax, al
            //   99                   | cdq                 

        $sequence_6 = { c3 8bff 55 8bec 8b4508 33c9 3b04cdd0e24000 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   33c9                 | xor                 ecx, ecx
            //   3b04cdd0e24000       | cmp                 eax, dword ptr [ecx*8 + 0x40e2d0]

        $sequence_7 = { 46 83c404 89742410 3b74241c 7539 6a64 }
            // n = 6, score = 200
            //   46                   | inc                 esi
            //   83c404               | add                 esp, 4
            //   89742410             | mov                 dword ptr [esp + 0x10], esi
            //   3b74241c             | cmp                 esi, dword ptr [esp + 0x1c]
            //   7539                 | jne                 0x3b
            //   6a64                 | push                0x64

        $sequence_8 = { 0fb60b 40 80b910ee400000 74e8 8a13 0fb6ca 0fbe8910ee4000 }
            // n = 7, score = 200
            //   0fb60b               | movzx               ecx, byte ptr [ebx]
            //   40                   | inc                 eax
            //   80b910ee400000       | cmp                 byte ptr [ecx + 0x40ee10], 0
            //   74e8                 | je                  0xffffffea
            //   8a13                 | mov                 dl, byte ptr [ebx]
            //   0fb6ca               | movzx               ecx, dl
            //   0fbe8910ee4000       | movsx               ecx, byte ptr [ecx + 0x40ee10]

        $sequence_9 = { 7432 8d7304 66837efc01 751d }
            // n = 4, score = 200
            //   7432                 | je                  0x34
            //   8d7304               | lea                 esi, [ebx + 4]
            //   66837efc01           | cmp                 word ptr [esi - 4], 1
            //   751d                 | jne                 0x1f

    condition:
        7 of them and filesize < 163840
}