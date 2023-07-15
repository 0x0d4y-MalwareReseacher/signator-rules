rule win_getmypass_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.getmypass."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.getmypass"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 8b55e0 0fbe02 83f85e 0f856d010000 }
            // n = 4, score = 200
            //   8b55e0               | mov                 edx, dword ptr [ebp - 0x20]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   83f85e               | cmp                 eax, 0x5e
            //   0f856d010000         | jne                 0x173

        $sequence_1 = { 8b55fc 83c201 8955fc ebcb 837dfc05 7e04 b001 }
            // n = 7, score = 200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c201               | add                 edx, 1
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   ebcb                 | jmp                 0xffffffcd
            //   837dfc05             | cmp                 dword ptr [ebp - 4], 5
            //   7e04                 | jle                 6
            //   b001                 | mov                 al, 1

        $sequence_2 = { 3b450c 7374 8b4df4 83c101 81e1ff000000 }
            // n = 5, score = 200
            //   3b450c               | cmp                 eax, dword ptr [ebp + 0xc]
            //   7374                 | jae                 0x76
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   83c101               | add                 ecx, 1
            //   81e1ff000000         | and                 ecx, 0xff

        $sequence_3 = { e8???????? 83c404 0fb6c8 85c9 0f8430010000 8b5508 52 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   0fb6c8               | movzx               ecx, al
            //   85c9                 | test                ecx, ecx
            //   0f8430010000         | je                  0x136
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx

        $sequence_4 = { 894df4 8b55e8 0355f4 0fb602 8945fc 8b4df8 034dfc }
            // n = 7, score = 200
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   0355f4               | add                 edx, dword ptr [ebp - 0xc]
            //   0fb602               | movzx               eax, byte ptr [edx]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   034dfc               | add                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { 8bec 83ec08 894df8 c645ff01 837d0800 750d 8b4df8 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   c645ff01             | mov                 byte ptr [ebp - 1], 1
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   750d                 | jne                 0xf
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_6 = { 6800020000 68???????? ff15???????? 8d95f8fbffff 52 }
            // n = 5, score = 200
            //   6800020000           | push                0x200
            //   68????????           |                     
            //   ff15????????         |                     
            //   8d95f8fbffff         | lea                 edx, [ebp - 0x408]
            //   52                   | push                edx

        $sequence_7 = { 83c408 8945fc 837dfc00 7463 8b45fc }
            // n = 5, score = 200
            //   83c408               | add                 esp, 8
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7463                 | je                  0x65
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_8 = { 83c408 85c0 0f8403010000 6800020000 8d95e8f9ffff 52 }
            // n = 6, score = 200
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f8403010000         | je                  0x109
            //   6800020000           | push                0x200
            //   8d95e8f9ffff         | lea                 edx, [ebp - 0x618]
            //   52                   | push                edx

        $sequence_9 = { 51 c745fc00000000 8b45fc 833c852040400000 7428 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   833c852040400000     | cmp                 dword ptr [eax*4 + 0x404020], 0
            //   7428                 | je                  0x2a

    condition:
        7 of them and filesize < 49152
}