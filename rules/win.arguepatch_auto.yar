rule win_arguepatch_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.arguepatch."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.arguepatch"
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
        $sequence_0 = { 03c7 8b481c 8b5018 03cf }
            // n = 4, score = 200
            //   03c7                 | add                 eax, edi
            //   8b481c               | mov                 ecx, dword ptr [eax + 0x1c]
            //   8b5018               | mov                 edx, dword ptr [eax + 0x18]
            //   03cf                 | add                 ecx, edi

        $sequence_1 = { e8???????? 59 8b4df8 8d0441 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8d0441               | lea                 eax, [ecx + eax*2]

        $sequence_2 = { 59 85c0 740a 395df8 }
            // n = 4, score = 200
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx

        $sequence_3 = { eb88 8bff 55 8bec 8b4d0c }
            // n = 5, score = 200
            //   eb88                 | jmp                 0xffffff8a
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_4 = { eb88 8bff 55 8bec 8b4d0c 0fb711 56 }
            // n = 7, score = 200
            //   eb88                 | jmp                 0xffffff8a
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   0fb711               | movzx               edx, word ptr [ecx]
            //   56                   | push                esi

        $sequence_5 = { 8b400c 8b4014 56 57 }
            // n = 4, score = 200
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b4014               | mov                 eax, dword ptr [eax + 0x14]
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_6 = { 50 51 e8???????? 8b4f04 83c40c }
            // n = 5, score = 200
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   83c40c               | add                 esp, 0xc

        $sequence_7 = { eb88 8bff 55 8bec 8b4d0c 0fb711 }
            // n = 6, score = 200
            //   eb88                 | jmp                 0xffffff8a
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   0fb711               | movzx               edx, word ptr [ecx]

        $sequence_8 = { 74bd 83c102 eb88 8bff 55 8bec 8b4d0c }
            // n = 7, score = 200
            //   74bd                 | je                  0xffffffbf
            //   83c102               | add                 ecx, 2
            //   eb88                 | jmp                 0xffffff8a
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_9 = { 59 59 85c0 740a 395df8 }
            // n = 5, score = 200
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx

    condition:
        7 of them and filesize < 1318912
}