rule win_bbsrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.bbsrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bbsrat"
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
        $sequence_0 = { e8???????? 8bf0 83c40c 85f6 7515 8b442414 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c40c               | add                 esp, 0xc
            //   85f6                 | test                esi, esi
            //   7515                 | jne                 0x17
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   85c0                 | test                eax, eax

        $sequence_1 = { 40 83f825 7ce7 8d4c2414 51 8d54241c 52 }
            // n = 7, score = 100
            //   40                   | inc                 eax
            //   83f825               | cmp                 eax, 0x25
            //   7ce7                 | jl                  0xffffffe9
            //   8d4c2414             | lea                 ecx, [esp + 0x14]
            //   51                   | push                ecx
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   52                   | push                edx

        $sequence_2 = { 56 68???????? 6a00 6a00 895e14 ff15???????? 89460c }
            // n = 7, score = 100
            //   56                   | push                esi
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   895e14               | mov                 dword ptr [esi + 0x14], ebx
            //   ff15????????         |                     
            //   89460c               | mov                 dword ptr [esi + 0xc], eax

        $sequence_3 = { 6a00 6a03 68000000c0 68???????? c744242000000000 ff15???????? 8bf8 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a03                 | push                3
            //   68000000c0           | push                0xc0000000
            //   68????????           |                     
            //   c744242000000000     | mov                 dword ptr [esp + 0x20], 0
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_4 = { 8d542458 52 6a45 56 8d7c1f02 e8???????? 8b44243c }
            // n = 7, score = 100
            //   8d542458             | lea                 edx, [esp + 0x58]
            //   52                   | push                edx
            //   6a45                 | push                0x45
            //   56                   | push                esi
            //   8d7c1f02             | lea                 edi, [edi + ebx + 2]
            //   e8????????           |                     
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]

        $sequence_5 = { 81c408020000 c3 56 e8???????? 85c0 74de }
            // n = 6, score = 100
            //   81c408020000         | add                 esp, 0x208
            //   c3                   | ret                 
            //   56                   | push                esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   74de                 | je                  0xffffffe0

        $sequence_6 = { 53 e8???????? e9???????? 85f6 7420 8b952c020000 8b02 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   e8????????           |                     
            //   e9????????           |                     
            //   85f6                 | test                esi, esi
            //   7420                 | je                  0x22
            //   8b952c020000         | mov                 edx, dword ptr [ebp + 0x22c]
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_7 = { 55 8bec c7452000000000 c7451001000000 833d????????00 7516 }
            // n = 6, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   c7452000000000       | mov                 dword ptr [ebp + 0x20], 0
            //   c7451001000000       | mov                 dword ptr [ebp + 0x10], 1
            //   833d????????00       |                     
            //   7516                 | jne                 0x18

        $sequence_8 = { ff15???????? 8b5c2424 89442414 e9???????? 8bd8 6a04 8d54242c }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b5c2424             | mov                 ebx, dword ptr [esp + 0x24]
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   e9????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   6a04                 | push                4
            //   8d54242c             | lea                 edx, [esp + 0x2c]

        $sequence_9 = { 6a10 56 6861001100 57 89460c 895e08 e8???????? }
            // n = 7, score = 100
            //   6a10                 | push                0x10
            //   56                   | push                esi
            //   6861001100           | push                0x110061
            //   57                   | push                edi
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   895e08               | mov                 dword ptr [esi + 8], ebx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 434176
}