rule win_industroyer2_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.industroyer2."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.industroyer2"
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
        $sequence_0 = { e8???????? 8945f8 8b4508 0fb68818000100 83f901 7505 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0fb68818000100       | movzx               ecx, byte ptr [eax + 0x10018]
            //   83f901               | cmp                 ecx, 1
            //   7505                 | jne                 7

        $sequence_1 = { 6800100000 8b55fc 52 ff15???????? }
            // n = 4, score = 100
            //   6800100000           | push                0x1000
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx
            //   ff15????????         |                     

        $sequence_2 = { b801000000 c1e002 8b4d08 0fb61401 81e2fe000000 }
            // n = 5, score = 100
            //   b801000000           | mov                 eax, 1
            //   c1e002               | shl                 eax, 2
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   0fb61401             | movzx               edx, byte ptr [ecx + eax]
            //   81e2fe000000         | and                 edx, 0xfe

        $sequence_3 = { 68???????? 8d4df4 e8???????? 8b4d08 e8???????? 8945fc 68???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   8d4df4               | lea                 ecx, [ebp - 0xc]
            //   e8????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   68????????           |                     

        $sequence_4 = { 837d0800 7e2b 8b4d08 c1e102 }
            // n = 4, score = 100
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7e2b                 | jle                 0x2d
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c1e102               | shl                 ecx, 2

        $sequence_5 = { c745e800000000 837de0ff 7e0b 8b45e0 83c001 }
            // n = 5, score = 100
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0
            //   837de0ff             | cmp                 dword ptr [ebp - 0x20], -1
            //   7e0b                 | jle                 0xd
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   83c001               | add                 eax, 1

        $sequence_6 = { 8b4cd018 51 8b4dfc e8???????? 8b55f8 8b45fc }
            // n = 6, score = 100
            //   8b4cd018             | mov                 ecx, dword ptr [eax + edx*8 + 0x18]
            //   51                   | push                ecx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_7 = { e8???????? 8b4dec 89410c 8b55fc 83c201 8955fc }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   89410c               | mov                 dword ptr [ecx + 0xc], eax
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c201               | add                 edx, 1
            //   8955fc               | mov                 dword ptr [ebp - 4], edx

        $sequence_8 = { 7409 817dfc03010000 750c 6a01 }
            // n = 4, score = 100
            //   7409                 | je                  0xb
            //   817dfc03010000       | cmp                 dword ptr [ebp - 4], 0x103
            //   750c                 | jne                 0xe
            //   6a01                 | push                1

        $sequence_9 = { 0f84b5000000 807df803 0f840e010000 e9???????? 8b45fc }
            // n = 5, score = 100
            //   0f84b5000000         | je                  0xbb
            //   807df803             | cmp                 byte ptr [ebp - 8], 3
            //   0f840e010000         | je                  0x114
            //   e9????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 100352
}