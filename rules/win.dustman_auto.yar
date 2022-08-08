rule win_dustman_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.dustman."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dustman"
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
        $sequence_0 = { 488d1d145c0100 488b0b 4885c9 7410 4883f9ff }
            // n = 5, score = 100
            //   488d1d145c0100       | dec                 eax
            //   488b0b               | mov                 eax, ebx
            //   4885c9               | dec                 eax
            //   7410                 | lea                 ecx, [0xb03]
            //   4883f9ff             | dec                 eax

        $sequence_1 = { 4883ec20 488bd9 4c8d0de0860000 b91c000000 4c8d05d0860000 488d15cd860000 e8???????? }
            // n = 7, score = 100
            //   4883ec20             | sub                 ecx, edx
            //   488bd9               | dec                 ecx
            //   4c8d0de0860000       | sub                 ecx, edx
            //   b91c000000           | dec                 esp
            //   4c8d05d0860000       | lea                 ebx, [ebp + 0x1ec]
            //   488d15cd860000       | dec                 ecx
            //   e8????????           |                     

        $sequence_2 = { 4154 4155 4156 4157 4883ec20 448bf9 4c8d35e69cffff }
            // n = 7, score = 100
            //   4154                 | dec                 eax
            //   4155                 | mov                 dword ptr [ebp - 0x80], ecx
            //   4156                 | dec                 eax
            //   4157                 | mov                 ecx, edx
            //   4883ec20             | dec                 ecx
            //   448bf9               | sub                 ecx, edx
            //   4c8d35e69cffff       | dec                 esp

        $sequence_3 = { 412bc1 3bc2 0f87cf000000 8b8c86b0d70000 4803ce ffe1 660f73f901 }
            // n = 7, score = 100
            //   412bc1               | dec                 ecx
            //   3bc2                 | add                 ecx, ebx
            //   0f87cf000000         | dec                 eax
            //   8b8c86b0d70000       | mov                 dword ptr [ebp + 0x78], ecx
            //   4803ce               | dec                 eax
            //   ffe1                 | mov                 ecx, edx
            //   660f73f901           | dec                 ecx

        $sequence_4 = { e9???????? 66833b5c 75e6 4d85c0 4889742460 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   66833b5c             | add                 ecx, ebx
            //   75e6                 | dec                 eax
            //   4d85c0               | mov                 dword ptr [ebp - 0x20], ecx
            //   4889742460           | dec                 eax

        $sequence_5 = { 4885c0 7509 488d0573420100 eb04 4883c020 4883c428 }
            // n = 6, score = 100
            //   4885c0               | pop                 ebx
            //   7509                 | ret                 
            //   488d0573420100       | dec                 eax
            //   eb04                 | sub                 esp, 0x38
            //   4883c020             | dec                 eax
            //   4883c428             | lea                 eax, [0x8555]

        $sequence_6 = { 837b1000 75dd 488d056be30000 483bd8 74d1 488bcb e8???????? }
            // n = 7, score = 100
            //   837b1000             | dec                 eax
            //   75dd                 | add                 eax, 0x24
            //   488d056be30000       | dec                 eax
            //   483bd8               | sub                 esp, 0x28
            //   74d1                 | dec                 eax
            //   488bcb               | mov                 ecx, eax
            //   e8????????           |                     

        $sequence_7 = { 48894a08 488d4808 e8???????? 488d0519bb0000 488903 488bc3 4883c420 }
            // n = 7, score = 100
            //   48894a08             | mov                 dword ptr [ecx + 0x10], esi
            //   488d4808             | dec                 esp
            //   e8????????           |                     
            //   488d0519bb0000       | mov                 eax, ebx
            //   488903               | dec                 eax
            //   488bc3               | lea                 edx, [0x162d3]
            //   4883c420             | dec                 eax

        $sequence_8 = { 488bc2 488d0d29b70000 48890b 488d5308 33c9 48890a }
            // n = 6, score = 100
            //   488bc2               | or                  edx, eax
            //   488d0d29b70000       | movzx               eax, byte ptr [ebp + 0x225]
            //   48890b               | dec                 eax
            //   488d5308             | shl                 eax, 0x28
            //   33c9                 | dec                 esp
            //   48890a               | or                  edx, eax

        $sequence_9 = { 4903cb 48898d90000000 488bca 492bca 4c8d9dd3010000 }
            // n = 5, score = 100
            //   4903cb               | mov                 dword ptr [ecx + 8], eax
            //   48898d90000000       | dec                 eax
            //   488bca               | lea                 eax, [0xed3d]
            //   492bca               | dec                 eax
            //   4c8d9dd3010000       | mov                 dword ptr [ecx], eax

    condition:
        7 of them and filesize < 368640
}