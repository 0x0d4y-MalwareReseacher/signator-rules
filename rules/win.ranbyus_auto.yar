rule win_ranbyus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ranbyus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ranbyus"
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
        $sequence_0 = { 50 e8???????? 83c420 83f803 }
            // n = 4, score = 1100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20
            //   83f803               | cmp                 eax, 3

        $sequence_1 = { e8???????? 59 59 85c0 740d 68???????? 50 }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   740d                 | je                  0xf
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_2 = { 6a01 6a00 68???????? 68???????? 68???????? e8???????? }
            // n = 6, score = 1100
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   68????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_3 = { e8???????? 8b06 ff743804 e8???????? }
            // n = 4, score = 1100
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   ff743804             | push                dword ptr [eax + edi + 4]
            //   e8????????           |                     

        $sequence_4 = { 7524 814e2580000000 8b03 89461a eb16 834e2540 668b03 }
            // n = 7, score = 1100
            //   7524                 | jne                 0x26
            //   814e2580000000       | or                  dword ptr [esi + 0x25], 0x80
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   89461a               | mov                 dword ptr [esi + 0x1a], eax
            //   eb16                 | jmp                 0x18
            //   834e2540             | or                  dword ptr [esi + 0x25], 0x40
            //   668b03               | mov                 ax, word ptr [ebx]

        $sequence_5 = { ff74240c 8bf1 ff74240c 832600 834e04ff 83660800 }
            // n = 6, score = 1100
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   8bf1                 | mov                 esi, ecx
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   832600               | and                 dword ptr [esi], 0
            //   834e04ff             | or                  dword ptr [esi + 4], 0xffffffff
            //   83660800             | and                 dword ptr [esi + 8], 0

        $sequence_6 = { 740f 3b4c2404 7504 83601800 33c0 }
            // n = 5, score = 1100
            //   740f                 | je                  0x11
            //   3b4c2404             | cmp                 ecx, dword ptr [esp + 4]
            //   7504                 | jne                 6
            //   83601800             | and                 dword ptr [eax + 0x18], 0
            //   33c0                 | xor                 eax, eax

        $sequence_7 = { 6a05 ff16 33c0 40 5f 5e 5b }
            // n = 7, score = 1100
            //   6a05                 | push                5
            //   ff16                 | call                dword ptr [esi]
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_8 = { 7411 ff7608 e8???????? 89460c 8b06 59 894604 }
            // n = 7, score = 1100
            //   7411                 | je                  0x13
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   59                   | pop                 ecx
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_9 = { 57 ff74240c 83c02c 50 e8???????? 8bf8 59 }
            // n = 7, score = 1100
            //   57                   | push                edi
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   83c02c               | add                 eax, 0x2c
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 638976
}