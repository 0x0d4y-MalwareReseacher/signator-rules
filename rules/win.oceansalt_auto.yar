rule win_oceansalt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.oceansalt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.oceansalt"
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
        $sequence_0 = { 8b450c 56 6a00 6800000008 6a03 }
            // n = 5, score = 300
            //   8b450c               | push                edi
            //   56                   | dec                 eax
            //   6a00                 | sub                 esp, 0x20
            //   6800000008           | dec                 eax
            //   6a03                 | lea                 ebx, [0x82f7]

        $sequence_1 = { 77a2 57 ff15???????? 6a00 6a09 68???????? }
            // n = 6, score = 300
            //   77a2                 | mov                 edi, 1
            //   57                   | mov                 dword ptr [esp + 0x70], edi
            //   ff15????????         |                     
            //   6a00                 | push                ecx
            //   6a09                 | lea                 edx, [ebp - 0x404]
            //   68????????           |                     

        $sequence_2 = { 51 8d95fcfbffff 6800020000 52 }
            // n = 4, score = 300
            //   51                   | dec                 eax
            //   8d95fcfbffff         | inc                 ecx
            //   6800020000           | mov                 byte ptr [esp + ecx + 0x2f], al
            //   52                   | test                al, al

        $sequence_3 = { 5d c3 8b5508 68???????? 52 ff15???????? }
            // n = 6, score = 300
            //   5d                   | mov                 dword ptr [ebx], ecx
            //   c3                   | test                eax, eax
            //   8b5508               | dec                 esp
            //   68????????           |                     
            //   52                   | lea                 esp, [0x910b]
            //   ff15????????         |                     

        $sequence_4 = { 50 8985c4fdffff c745f801000000 e8???????? 8b7508 8b3d???????? }
            // n = 6, score = 300
            //   50                   | push                0x200
            //   8985c4fdffff         | push                edx
            //   c745f801000000       | mov                 eax, dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   8b7508               | push                esi
            //   8b3d????????         |                     

        $sequence_5 = { 8b45fc 83c40c 50 ff15???????? 8b550c 2bd0 }
            // n = 6, score = 300
            //   8b45fc               | dec                 eax
            //   83c40c               | lea                 eax, [0xb8d6]
            //   50                   | dec                 eax
            //   ff15????????         |                     
            //   8b550c               | lea                 ecx, [eax + ecx*8]
            //   2bd0                 | dec                 eax

        $sequence_6 = { 6808010000 8d85f4feffff 50 56 ffd7 }
            // n = 5, score = 300
            //   6808010000           | push                0
            //   8d85f4feffff         | push                0x8000000
            //   50                   | push                3
            //   56                   | lea                 eax, [ebp - 0x404]
            //   ffd7                 | push                eax

        $sequence_7 = { 8d85fcfbffff 50 56 ffd3 83f8ff }
            // n = 5, score = 300
            //   8d85fcfbffff         | mov                 edi, 0xa
            //   50                   | dec                 eax
            //   56                   | mov                 ecx, dword ptr [ebx]
            //   ffd3                 | dec                 eax
            //   83f8ff               | lea                 ecx, [eax + eax*4]

        $sequence_8 = { 57 4883ec20 488d1df7820000 bf0a000000 488b0b e8???????? }
            // n = 6, score = 100
            //   57                   | xor                 ecx, ecx
            //   4883ec20             | test                eax, eax
            //   488d1df7820000       | jne                 0xffffff72
            //   bf0a000000           | dec                 eax
            //   488b0b               | lea                 edx, [esp + 0x100]
            //   e8????????           |                     

        $sequence_9 = { 85c0 0f8e83000000 4533c9 488d542430 488bcb 458d4102 ff15???????? }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f8e83000000         | jle                 0x89
            //   4533c9               | inc                 ebp
            //   488d542430           | xor                 ecx, ecx
            //   488bcb               | dec                 eax
            //   458d4102             | lea                 edx, [esp + 0x30]
            //   ff15????????         |                     

        $sequence_10 = { 85c0 0f856affffff 488d942400010000 4533c9 41b804100000 488bcb }
            // n = 6, score = 100
            //   85c0                 | dec                 eax
            //   0f856affffff         | mov                 ecx, ebx
            //   488d942400010000     | mov                 dword ptr [esp + 0x1100], edi
            //   4533c9               | dec                 eax
            //   41b804100000         | mov                 ecx, dword ptr [esp + 0x1118]
            //   488bcb               | dec                 eax

        $sequence_11 = { 89842440020000 ff15???????? 448b842440020000 4533c9 }
            // n = 4, score = 100
            //   89842440020000       | lea                 eax, [esp + 0x3b0]
            //   ff15????????         |                     
            //   448b842440020000     | inc                 ecx
            //   4533c9               | mov                 eax, 0x1004

        $sequence_12 = { 33d2 41b868010000 e8???????? 4c8d8424b0030000 }
            // n = 4, score = 100
            //   33d2                 | dec                 eax
            //   41b868010000         | mov                 ecx, ebx
            //   e8????????           |                     
            //   4c8d8424b0030000     | inc                 ebp

        $sequence_13 = { 41b804100000 488bcb 89bc2400110000 ff15???????? 488b8c2418110000 4833cc }
            // n = 6, score = 100
            //   41b804100000         | lea                 eax, [ecx + 2]
            //   488bcb               | xor                 edx, edx
            //   89bc2400110000       | inc                 ecx
            //   ff15????????         |                     
            //   488b8c2418110000     | mov                 eax, 0x168
            //   4833cc               | dec                 esp

        $sequence_14 = { 488d0c80 488d05d6b80000 488d0cc8 48890b e8???????? 85c0 }
            // n = 6, score = 100
            //   488d0c80             | inc                 ebp
            //   488d05d6b80000       | xor                 ecx, ecx
            //   488d0cc8             | inc                 ecx
            //   48890b               | mov                 eax, 0x1004
            //   e8????????           |                     
            //   85c0                 | dec                 eax

        $sequence_15 = { 6666666666660f1f840000000000 0fb6840c6c010000 48ffc1 88440c2f 84c0 }
            // n = 5, score = 100
            //   6666666666660f1f840000000000     | xor    ecx, esp
            //   0fb6840c6c010000     | mov                 dword ptr [esp + 0x240], eax
            //   48ffc1               | inc                 esp
            //   88440c2f             | mov                 eax, dword ptr [esp + 0x240]
            //   84c0                 | inc                 ebp

    condition:
        7 of them and filesize < 212992
}