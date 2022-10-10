rule win_bhunt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.bhunt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bhunt"
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
        $sequence_0 = { ff9010d828c3 a5 56 00f8 e8???????? 5e ec }
            // n = 7, score = 100
            //   ff9010d828c3         | call                dword ptr [eax - 0x3cd727f0]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   56                   | push                esi
            //   00f8                 | add                 al, bh
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   ec                   | in                  al, dx

        $sequence_1 = { ff74241c ffd0 eb02 33c0 5e 59 c20c00 }
            // n = 7, score = 100
            //   ff74241c             | push                dword ptr [esp + 0x1c]
            //   ffd0                 | call                eax
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   59                   | pop                 ecx
            //   c20c00               | ret                 0xc

        $sequence_2 = { f6d2 32da 66ffc9 0fa3c1 66890414 f8 0fbaf958 }
            // n = 7, score = 100
            //   f6d2                 | not                 dl
            //   32da                 | xor                 bl, dl
            //   66ffc9               | dec                 cx
            //   0fa3c1               | bt                  ecx, eax
            //   66890414             | mov                 word ptr [esp + edx], ax
            //   f8                   | clc                 
            //   0fbaf958             | btc                 ecx, 0x58

        $sequence_3 = { ffb6b8060000 6a00 50 e8???????? 8b45d8 83c006 8945f8 }
            // n = 7, score = 100
            //   ffb6b8060000         | push                dword ptr [esi + 0x6b8]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   83c006               | add                 eax, 6
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_4 = { 8b44240c 8b400c 8b4c2410 8b0408 8bcb e8???????? }
            // n = 6, score = 100
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   8b0408               | mov                 eax, dword ptr [eax + ecx]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     

        $sequence_5 = { f7bbec98d720 41 e72b 99 44 00c3 ec }
            // n = 7, score = 100
            //   f7bbec98d720         | idiv                dword ptr [ebx + 0x20d798ec]
            //   41                   | inc                 ecx
            //   e72b                 | out                 0x2b, eax
            //   99                   | cdq                 
            //   44                   | inc                 esp
            //   00c3                 | add                 bl, al
            //   ec                   | in                  al, dx

        $sequence_6 = { 6681d2f667 32d8 668bd7 880c04 c0c69b 6681ea335b }
            // n = 6, score = 100
            //   6681d2f667           | adc                 dx, 0x67f6
            //   32d8                 | xor                 bl, al
            //   668bd7               | mov                 dx, di
            //   880c04               | mov                 byte ptr [esp + eax], cl
            //   c0c69b               | rol                 dh, 0x9b
            //   6681ea335b           | sub                 dx, 0x5b33

        $sequence_7 = { e8???????? c20400 833e00 57 0f850b010000 6855010000 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c20400               | ret                 4
            //   833e00               | cmp                 dword ptr [esi], 0
            //   57                   | push                edi
            //   0f850b010000         | jne                 0x111
            //   6855010000           | push                0x155
            //   e8????????           |                     

        $sequence_8 = { f5 33cb d1c1 81f136342139 f9 f7d9 f7d1 }
            // n = 7, score = 100
            //   f5                   | cmc                 
            //   33cb                 | xor                 ecx, ebx
            //   d1c1                 | rol                 ecx, 1
            //   81f136342139         | xor                 ecx, 0x39213436
            //   f9                   | stc                 
            //   f7d9                 | neg                 ecx
            //   f7d1                 | not                 ecx

        $sequence_9 = { ff7508 53 e8???????? 6a00 68???????? ff7508 51 }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 19161088
}