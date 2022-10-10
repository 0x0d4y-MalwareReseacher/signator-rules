rule win_adylkuzz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.adylkuzz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.adylkuzz"
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
        $sequence_0 = { e8???????? 8b434c c744240400000000 c74424080000f0c3 890424 e8???????? 31c9 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b434c               | mov                 eax, dword ptr [ebx + 0x4c]
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c74424080000f0c3     | mov                 dword ptr [esp + 8], 0xc3f00000
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   31c9                 | xor                 ecx, ecx

        $sequence_1 = { 8b0a 8b5014 8d5a08 895814 b801000000 890a c74204f7ffffff }
            // n = 7, score = 100
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   8b5014               | mov                 edx, dword ptr [eax + 0x14]
            //   8d5a08               | lea                 ebx, [edx + 8]
            //   895814               | mov                 dword ptr [eax + 0x14], ebx
            //   b801000000           | mov                 eax, 1
            //   890a                 | mov                 dword ptr [edx], ecx
            //   c74204f7ffffff       | mov                 dword ptr [edx + 4], 0xfffffff7

        $sequence_2 = { dd5c2408 dd03 897c2410 dd1c24 e8???????? dd542420 dbe8 }
            // n = 7, score = 100
            //   dd5c2408             | fstp                qword ptr [esp + 8]
            //   dd03                 | fld                 qword ptr [ebx]
            //   897c2410             | mov                 dword ptr [esp + 0x10], edi
            //   dd1c24               | fstp                qword ptr [esp]
            //   e8????????           |                     
            //   dd542420             | fst                 qword ptr [esp + 0x20]
            //   dbe8                 | fucomi              st(0)

        $sequence_3 = { f9 6681ffd078 f5 6635ca42 f5 66d1c0 6685ca }
            // n = 7, score = 100
            //   f9                   | stc                 
            //   6681ffd078           | cmp                 di, 0x78d0
            //   f5                   | cmc                 
            //   6635ca42             | xor                 ax, 0x42ca
            //   f5                   | cmc                 
            //   66d1c0               | rol                 ax, 1
            //   6685ca               | test                dx, cx

        $sequence_4 = { e9???????? 85ff 0f8403010000 3c2e 7476 7731 3c28 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   85ff                 | test                edi, edi
            //   0f8403010000         | je                  0x109
            //   3c2e                 | cmp                 al, 0x2e
            //   7476                 | je                  0x78
            //   7731                 | ja                  0x33
            //   3c28                 | cmp                 al, 0x28

        $sequence_5 = { f9 8d80bff55da3 3bd6 f7d0 2d064cd540 c1c002 f9 }
            // n = 7, score = 100
            //   f9                   | stc                 
            //   8d80bff55da3         | lea                 eax, [eax - 0x5ca20a41]
            //   3bd6                 | cmp                 edx, esi
            //   f7d0                 | not                 eax
            //   2d064cd540           | sub                 eax, 0x40d54c06
            //   c1c002               | rol                 eax, 2
            //   f9                   | stc                 

        $sequence_6 = { f5 66f7c4c160 8d801b31795d 35a6348e03 33d8 f5 3bd7 }
            // n = 7, score = 100
            //   f5                   | cmc                 
            //   66f7c4c160           | test                sp, 0x60c1
            //   8d801b31795d         | lea                 eax, [eax + 0x5d79311b]
            //   35a6348e03           | xor                 eax, 0x38e34a6
            //   33d8                 | xor                 ebx, eax
            //   f5                   | cmc                 
            //   3bd7                 | cmp                 edx, edi

        $sequence_7 = { e8???????? 3b742418 741d 85ff 7503 46 eba2 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   3b742418             | cmp                 esi, dword ptr [esp + 0x18]
            //   741d                 | je                  0x1f
            //   85ff                 | test                edi, edi
            //   7503                 | jne                 5
            //   46                   | inc                 esi
            //   eba2                 | jmp                 0xffffffa4

        $sequence_8 = { c744240401000000 893424 e8???????? 8b4610 83ff14 8b40f8 8b4018 }
            // n = 7, score = 100
            //   c744240401000000     | mov                 dword ptr [esp + 4], 1
            //   893424               | mov                 dword ptr [esp], esi
            //   e8????????           |                     
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   83ff14               | cmp                 edi, 0x14
            //   8b40f8               | mov                 eax, dword ptr [eax - 8]
            //   8b4018               | mov                 eax, dword ptr [eax + 0x18]

        $sequence_9 = { f7d8 f8 f5 c1c003 84da f7d8 3bd4 }
            // n = 7, score = 100
            //   f7d8                 | neg                 eax
            //   f8                   | clc                 
            //   f5                   | cmc                 
            //   c1c003               | rol                 eax, 3
            //   84da                 | test                dl, bl
            //   f7d8                 | neg                 eax
            //   3bd4                 | cmp                 edx, esp

    condition:
        7 of them and filesize < 6438912
}