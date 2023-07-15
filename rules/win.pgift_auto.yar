rule win_pgift_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.pgift."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pgift"
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
        $sequence_0 = { ff7510 8bcb e8???????? 83c304 }
            // n = 4, score = 100
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   83c304               | add                 ebx, 4

        $sequence_1 = { 5b 64890d00000000 c9 c20800 8b4104 8b09 }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   c9                   | leave               
            //   c20800               | ret                 8
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   8b09                 | mov                 ecx, dword ptr [ecx]

        $sequence_2 = { 59 ff7630 ff15???????? 894638 ff7634 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   ff7630               | push                dword ptr [esi + 0x30]
            //   ff15????????         |                     
            //   894638               | mov                 dword ptr [esi + 0x38], eax
            //   ff7634               | push                dword ptr [esi + 0x34]

        $sequence_3 = { 895dfc ff15???????? 8b35???????? 50 }
            // n = 4, score = 100
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   50                   | push                eax

        $sequence_4 = { 740f 8bcb e8???????? 83c304 3b5d08 75f1 ff7604 }
            // n = 7, score = 100
            //   740f                 | je                  0x11
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   83c304               | add                 ebx, 4
            //   3b5d08               | cmp                 ebx, dword ptr [ebp + 8]
            //   75f1                 | jne                 0xfffffff3
            //   ff7604               | push                dword ptr [esi + 4]

        $sequence_5 = { e8???????? 3bc3 7403 894638 8b7d0c }
            // n = 5, score = 100
            //   e8????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   7403                 | je                  5
            //   894638               | mov                 dword ptr [esi + 0x38], eax
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]

        $sequence_6 = { 8d4dec e9???????? 8d8dd0feffff e9???????? }
            // n = 4, score = 100
            //   8d4dec               | lea                 ecx, [ebp - 0x14]
            //   e9????????           |                     
            //   8d8dd0feffff         | lea                 ecx, [ebp - 0x130]
            //   e9????????           |                     

        $sequence_7 = { e8???????? 33db 8d4dec 895dfc e8???????? 8d4de8 c645fc01 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   8d4dec               | lea                 ecx, [ebp - 0x14]
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   e8????????           |                     
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1

        $sequence_8 = { 59 c3 b8???????? e9???????? 8b4dec 83c108 }
            // n = 6, score = 100
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   b8????????           |                     
            //   e9????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   83c108               | add                 ecx, 8

        $sequence_9 = { 53 ff7630 e8???????? 83c40c 66817d0c0c40 c645fc03 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   ff7630               | push                dword ptr [esi + 0x30]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   66817d0c0c40         | cmp                 word ptr [ebp + 0xc], 0x400c
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3

    condition:
        7 of them and filesize < 98304
}