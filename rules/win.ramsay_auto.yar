rule win_ramsay_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.ramsay."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ramsay"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 83f820 7502 eb07 33c0 }
            // n = 4, score = 600
            //   83f820               | cmp                 eax, 0x20
            //   7502                 | jne                 4
            //   eb07                 | jmp                 9
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 7514 ff15???????? 83f820 7502 }
            // n = 4, score = 600
            //   7514                 | jne                 0x16
            //   ff15????????         |                     
            //   83f820               | cmp                 eax, 0x20
            //   7502                 | jne                 4

        $sequence_2 = { ff15???????? 85c0 7502 eb02 ebb1 }
            // n = 5, score = 600
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   eb02                 | jmp                 4
            //   ebb1                 | jmp                 0xffffffb3

        $sequence_3 = { 8bec 83ec18 a1???????? 33c5 8945f8 8b4508 8a4803 }
            // n = 7, score = 500
            //   8bec                 | mov                 ebp, esp
            //   83ec18               | sub                 esp, 0x18
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4803               | mov                 cl, byte ptr [eax + 3]

        $sequence_4 = { 8b4df8 51 ff15???????? 8b550c 8902 8b450c 8b08 }
            // n = 7, score = 500
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8902                 | mov                 dword ptr [edx], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_5 = { 8b5508 8b4508 8a481c 884a0b 8b5508 8b4508 8a4821 }
            // n = 7, score = 500
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a481c               | mov                 cl, byte ptr [eax + 0x1c]
            //   884a0b               | mov                 byte ptr [edx + 0xb], cl
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4821               | mov                 cl, byte ptr [eax + 0x21]

        $sequence_6 = { ebbd b801000000 8b4df8 33cd e8???????? 8be5 }
            // n = 6, score = 500
            //   ebbd                 | jmp                 0xffffffbf
            //   b801000000           | mov                 eax, 1
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   33cd                 | xor                 ecx, ebp
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp

        $sequence_7 = { 8bec 83ec18 c745e800000000 c745ec00000000 c745f088020000 c745f400000000 6888020000 }
            // n = 7, score = 500
            //   8bec                 | mov                 ebp, esp
            //   83ec18               | sub                 esp, 0x18
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   c745f088020000       | mov                 dword ptr [ebp - 0x10], 0x288
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   6888020000           | push                0x288

        $sequence_8 = { 55 8bec 83ec08 c745f800000000 6a00 6880000000 6a02 }
            // n = 7, score = 500
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a02                 | push                2

        $sequence_9 = { 8b5508 8b4508 8a481e 884a08 8b5508 8b4508 }
            // n = 6, score = 500
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a481e               | mov                 cl, byte ptr [eax + 0x1e]
            //   884a08               | mov                 byte ptr [edx + 8], cl
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_10 = { 8b5508 8b4508 8a481e 884a03 8b5508 8b4508 8a4815 }
            // n = 7, score = 500
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a481e               | mov                 cl, byte ptr [eax + 0x1e]
            //   884a03               | mov                 byte ptr [edx + 3], cl
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4815               | mov                 cl, byte ptr [eax + 0x15]

        $sequence_11 = { ff15???????? 33c0 e9???????? e8???????? 85c0 7507 }
            // n = 6, score = 400
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_12 = { e8???????? e8???????? 0fb78424c6040000 99 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e8????????           |                     
            //   0fb78424c6040000     | mov                 ecx, edi
            //   99                   | dec                 esp

        $sequence_13 = { e8???????? cc b201 488bcf e8???????? 4c8d1dfb260100 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   cc                   | lea                 eax, [0x15fa0]
            //   b201                 | dec                 ecx
            //   488bcf               | mov                 edx, esp
            //   e8????????           |                     
            //   4c8d1dfb260100       | dec                 eax

        $sequence_14 = { e8???????? cc 4c8d05a05f0100 498bd4 488bcd e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   cc                   | int3                
            //   4c8d05a05f0100       | dec                 esp
            //   498bd4               | lea                 eax, [0x15fa0]
            //   488bcd               | dec                 ecx
            //   e8????????           |                     

        $sequence_15 = { e8???????? e8???????? 33c0 6689442440 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   e8????????           |                     
            //   33c0                 | cdq                 
            //   6689442440           | mov                 ecx, 5

    condition:
        7 of them and filesize < 2031616
}