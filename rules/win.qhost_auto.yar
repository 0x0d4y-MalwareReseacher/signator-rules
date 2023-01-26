rule win_qhost_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.qhost."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.qhost"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 8985dcfdffff eb18 68???????? 8b4d1c 51 ff15???????? }
            // n = 6, score = 100
            //   8985dcfdffff         | mov                 dword ptr [ebp - 0x224], eax
            //   eb18                 | jmp                 0x1a
            //   68????????           |                     
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_1 = { 85c0 7407 b801000000 eb04 ebbd 33c0 8be5 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   b801000000           | mov                 eax, 1
            //   eb04                 | jmp                 6
            //   ebbd                 | jmp                 0xffffffbf
            //   33c0                 | xor                 eax, eax
            //   8be5                 | mov                 esp, ebp

        $sequence_2 = { 6a00 8d85fcfeffff 50 e8???????? 83c40c 6804010000 8d8df4fdffff }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6804010000           | push                0x104
            //   8d8df4fdffff         | lea                 ecx, [ebp - 0x20c]

        $sequence_3 = { 7537 83bd6cffffff00 752e 8b4dfe 81e1ff000000 }
            // n = 5, score = 100
            //   7537                 | jne                 0x39
            //   83bd6cffffff00       | cmp                 dword ptr [ebp - 0x94], 0
            //   752e                 | jne                 0x30
            //   8b4dfe               | mov                 ecx, dword ptr [ebp - 2]
            //   81e1ff000000         | and                 ecx, 0xff

        $sequence_4 = { ff15???????? 83c408 898598f4ffff 83bd98f4ffff00 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   898598f4ffff         | mov                 dword ptr [ebp - 0xb68], eax
            //   83bd98f4ffff00       | cmp                 dword ptr [ebp - 0xb68], 0

        $sequence_5 = { 68???????? 8b5508 52 ff15???????? 85c0 7413 }
            // n = 6, score = 100
            //   68????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15

        $sequence_6 = { eb18 68???????? 8b4d1c 51 ff15???????? }
            // n = 5, score = 100
            //   eb18                 | jmp                 0x1a
            //   68????????           |                     
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_7 = { 752d 8b45fe 25ff000000 83f801 7520 }
            // n = 5, score = 100
            //   752d                 | jne                 0x2f
            //   8b45fe               | mov                 eax, dword ptr [ebp - 2]
            //   25ff000000           | and                 eax, 0xff
            //   83f801               | cmp                 eax, 1
            //   7520                 | jne                 0x22

        $sequence_8 = { c745fc00000000 c745f800000000 837d0c00 7406 837d1000 }
            // n = 5, score = 100
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7406                 | je                  8
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0

        $sequence_9 = { c3 55 8bec 817d0802000080 }
            // n = 4, score = 100
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   817d0802000080       | cmp                 dword ptr [ebp + 8], 0x80000002

    condition:
        7 of them and filesize < 286720
}