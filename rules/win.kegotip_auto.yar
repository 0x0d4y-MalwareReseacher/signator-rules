rule win_kegotip_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.kegotip."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kegotip"
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
        $sequence_0 = { 83c408 8d95a8fcffff 52 8b85ecfdffff }
            // n = 4, score = 600
            //   83c408               | add                 esp, 8
            //   8d95a8fcffff         | lea                 edx, [ebp - 0x358]
            //   52                   | push                edx
            //   8b85ecfdffff         | mov                 eax, dword ptr [ebp - 0x214]

        $sequence_1 = { 8b4508 0345fc 0fbe4801 85c9 }
            // n = 4, score = 600
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0345fc               | add                 eax, dword ptr [ebp - 4]
            //   0fbe4801             | movsx               ecx, byte ptr [eax + 1]
            //   85c9                 | test                ecx, ecx

        $sequence_2 = { 55 8bec 83ec0c c645ff00 c645f700 c745f8???????? eb09 }
            // n = 7, score = 600
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   c645f700             | mov                 byte ptr [ebp - 9], 0
            //   c745f8????????       |                     
            //   eb09                 | jmp                 0xb

        $sequence_3 = { 50 ff15???????? 8945f8 837df800 0f8eb1000000 }
            // n = 5, score = 600
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   0f8eb1000000         | jle                 0xb7

        $sequence_4 = { 8b550c 0355e4 8b45f4 0345f8 8a08 880a 8b55e4 }
            // n = 7, score = 600
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   0355e4               | add                 edx, dword ptr [ebp - 0x1c]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   880a                 | mov                 byte ptr [edx], cl
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]

        $sequence_5 = { 0f85c1020000 6a04 6800300000 8b451c 50 6a00 ff15???????? }
            // n = 7, score = 600
            //   0f85c1020000         | jne                 0x2c7
            //   6a04                 | push                4
            //   6800300000           | push                0x3000
            //   8b451c               | mov                 eax, dword ptr [ebp + 0x1c]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_6 = { 8945fc 8b4d0c 83e901 394dfc 0f8d5b020000 8b5508 }
            // n = 6, score = 600
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   83e901               | sub                 ecx, 1
            //   394dfc               | cmp                 dword ptr [ebp - 4], ecx
            //   0f8d5b020000         | jge                 0x261
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]

        $sequence_7 = { 898decfdffff 81bdecfdffff6b020000 7d5b 6804010000 6a00 8d95f8feffff }
            // n = 6, score = 600
            //   898decfdffff         | mov                 dword ptr [ebp - 0x214], ecx
            //   81bdecfdffff6b020000     | cmp    dword ptr [ebp - 0x214], 0x26b
            //   7d5b                 | jge                 0x5d
            //   6804010000           | push                0x104
            //   6a00                 | push                0
            //   8d95f8feffff         | lea                 edx, [ebp - 0x108]

        $sequence_8 = { e8???????? 83f8ff 7405 8b45f8 eb05 e9???????? 8be5 }
            // n = 7, score = 600
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   7405                 | je                  7
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   eb05                 | jmp                 7
            //   e9????????           |                     
            //   8be5                 | mov                 esp, ebp

        $sequence_9 = { 5d c3 55 8bec 83ec08 56 8b4508 }
            // n = 7, score = 600
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   56                   | push                esi
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 278528
}