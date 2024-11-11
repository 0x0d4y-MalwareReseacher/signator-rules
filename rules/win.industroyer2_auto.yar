rule win_industroyer2_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.industroyer2."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.industroyer2"
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
        $sequence_0 = { 55 8bec 83ec08 837d0800 7504 33c0 eb29 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb29                 | jmp                 0x2b

        $sequence_1 = { 051d000100 50 68???????? e8???????? }
            // n = 4, score = 100
            //   051d000100           | add                 eax, 0x1001d
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_2 = { 8b45fc 837c901000 7425 8b4dfc 8b5108 8b45fc }
            // n = 6, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   837c901000           | cmp                 dword ptr [eax + edx*4 + 0x10], 0
            //   7425                 | je                  0x27
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5108               | mov                 edx, dword ptr [ecx + 8]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_3 = { 51 e8???????? 8845ff 8b55f8 52 }
            // n = 5, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8845ff               | mov                 byte ptr [ebp - 1], al
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx

        $sequence_4 = { 8b4dec 89410c 8b55fc 83c201 8955fc eb0e c745e804680000 }
            // n = 7, score = 100
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   89410c               | mov                 dword ptr [ecx + 0xc], eax
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c201               | add                 edx, 1
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   eb0e                 | jmp                 0x10
            //   c745e804680000       | mov                 dword ptr [ebp - 0x18], 0x6804

        $sequence_5 = { 8b4df8 83e140 7540 e8???????? 8bc8 e8???????? }
            // n = 6, score = 100
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   83e140               | and                 ecx, 0x40
            //   7540                 | jne                 0x42
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     

        $sequence_6 = { 8b4df0 51 ff15???????? 85c0 7406 c645ff01 eb04 }
            // n = 7, score = 100
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8
            //   c645ff01             | mov                 byte ptr [ebp - 1], 1
            //   eb04                 | jmp                 6

        $sequence_7 = { 83ba600d010000 7e41 e8???????? 8bc8 e8???????? 68b3680000 8b4508 }
            // n = 7, score = 100
            //   83ba600d010000       | cmp                 dword ptr [edx + 0x10d60], 0
            //   7e41                 | jle                 0x43
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   68b3680000           | push                0x68b3
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_8 = { 51 ff15???????? 8b85dcfeffff eb21 8d95d4feffff }
            // n = 5, score = 100
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b85dcfeffff         | mov                 eax, dword ptr [ebp - 0x124]
            //   eb21                 | jmp                 0x23
            //   8d95d4feffff         | lea                 edx, [ebp - 0x12c]

        $sequence_9 = { c745ecffffffff eb15 8b450c c6801800010001 }
            // n = 4, score = 100
            //   c745ecffffffff       | mov                 dword ptr [ebp - 0x14], 0xffffffff
            //   eb15                 | jmp                 0x17
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   c6801800010001       | mov                 byte ptr [eax + 0x10018], 1

    condition:
        7 of them and filesize < 100352
}