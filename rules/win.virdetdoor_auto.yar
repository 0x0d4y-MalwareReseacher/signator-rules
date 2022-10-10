rule win_virdetdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.virdetdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.virdetdoor"
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
        $sequence_0 = { 390b 7348 3903 7316 832200 33c0 40 }
            // n = 7, score = 100
            //   390b                 | cmp                 dword ptr [ebx], ecx
            //   7348                 | jae                 0x4a
            //   3903                 | cmp                 dword ptr [ebx], eax
            //   7316                 | jae                 0x18
            //   832200               | and                 dword ptr [edx], 0
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax

        $sequence_1 = { eb3e ff7510 8b4f04 53 56 e8???????? ff7510 }
            // n = 7, score = 100
            //   eb3e                 | jmp                 0x40
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   e8????????           |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_2 = { eb0a 6a42 eb06 6a3d eb02 6a3e }
            // n = 6, score = 100
            //   eb0a                 | jmp                 0xc
            //   6a42                 | push                0x42
            //   eb06                 | jmp                 8
            //   6a3d                 | push                0x3d
            //   eb02                 | jmp                 4
            //   6a3e                 | push                0x3e

        $sequence_3 = { 85c0 56 0f4405???????? 50 68???????? e8???????? 83c40c }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   56                   | push                esi
            //   0f4405????????       |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_4 = { 740a 83fa08 7205 83ea08 eb02 33ff 8b75f8 }
            // n = 7, score = 100
            //   740a                 | je                  0xc
            //   83fa08               | cmp                 edx, 8
            //   7205                 | jb                  7
            //   83ea08               | sub                 edx, 8
            //   eb02                 | jmp                 4
            //   33ff                 | xor                 edi, edi
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]

        $sequence_5 = { 8d8df8fdffff ff7508 50 e8???????? 83c40c 0f57c0 }
            // n = 6, score = 100
            //   8d8df8fdffff         | lea                 ecx, [ebp - 0x208]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0f57c0               | xorps               xmm0, xmm0

        $sequence_6 = { 83e801 0f848f000000 6a05 5e 2bc6 744a 83e80b }
            // n = 7, score = 100
            //   83e801               | sub                 eax, 1
            //   0f848f000000         | je                  0x95
            //   6a05                 | push                5
            //   5e                   | pop                 esi
            //   2bc6                 | sub                 eax, esi
            //   744a                 | je                  0x4c
            //   83e80b               | sub                 eax, 0xb

        $sequence_7 = { 33d2 83ca06 eb64 8d8df8fdffff }
            // n = 4, score = 100
            //   33d2                 | xor                 edx, edx
            //   83ca06               | or                  edx, 6
            //   eb64                 | jmp                 0x66
            //   8d8df8fdffff         | lea                 ecx, [ebp - 0x208]

        $sequence_8 = { 57 8945fc ff15???????? 8bf0 85f6 7487 85f6 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7487                 | je                  0xffffff89
            //   85f6                 | test                esi, esi

        $sequence_9 = { 0f850f020000 8b4d08 c6410105 eb2b 8b4d08 }
            // n = 5, score = 100
            //   0f850f020000         | jne                 0x215
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c6410105             | mov                 byte ptr [ecx + 1], 5
            //   eb2b                 | jmp                 0x2d
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 106496
}