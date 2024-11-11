rule win_knot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.knot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.knot"
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
        $sequence_0 = { e8???????? 83c408 85c0 7407 c685f3fdffff00 ebbe }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   c685f3fdffff00       | mov                 byte ptr [ebp - 0x20d], 0
            //   ebbe                 | jmp                 0xffffffc0

        $sequence_1 = { 32c0 e9???????? 8b4508 50 68???????? 8d8de0fdffff 51 }
            // n = 7, score = 200
            //   32c0                 | xor                 al, al
            //   e9????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d8de0fdffff         | lea                 ecx, [ebp - 0x220]
            //   51                   | push                ecx

        $sequence_2 = { 50 e8???????? 83c408 68???????? 8b8d74f7ffff }
            // n = 5, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   68????????           |                     
            //   8b8d74f7ffff         | mov                 ecx, dword ptr [ebp - 0x88c]

        $sequence_3 = { 51 8b95ecfdffff 52 8b45fc 50 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   8b95ecfdffff         | mov                 edx, dword ptr [ebp - 0x214]
            //   52                   | push                edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_4 = { 8b148d58504000 52 8b8598fbffff 50 e8???????? 83c408 85c0 }
            // n = 7, score = 200
            //   8b148d58504000       | mov                 edx, dword ptr [ecx*4 + 0x405058]
            //   52                   | push                edx
            //   8b8598fbffff         | mov                 eax, dword ptr [ebp - 0x468]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_5 = { 6a00 6a00 6a00 6a02 6a00 8b55e8 52 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   52                   | push                edx

        $sequence_6 = { 747b 6a00 6a00 6a00 }
            // n = 4, score = 200
            //   747b                 | je                  0x7d
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { e9???????? 8d95f4fdffff 52 8d8580f7ffff }
            // n = 4, score = 200
            //   e9????????           |                     
            //   8d95f4fdffff         | lea                 edx, [ebp - 0x20c]
            //   52                   | push                edx
            //   8d8580f7ffff         | lea                 eax, [ebp - 0x880]

        $sequence_8 = { 7507 32c0 e9???????? c785d8fdffff00000000 8d85d8fdffff 50 6a00 }
            // n = 7, score = 200
            //   7507                 | jne                 9
            //   32c0                 | xor                 al, al
            //   e9????????           |                     
            //   c785d8fdffff00000000     | mov    dword ptr [ebp - 0x228], 0
            //   8d85d8fdffff         | lea                 eax, [ebp - 0x228]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_9 = { 6880000000 6a02 6a00 6a00 6800000040 8d95e0fdffff 52 }
            // n = 7, score = 200
            //   6880000000           | push                0x80
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6800000040           | push                0x40000000
            //   8d95e0fdffff         | lea                 edx, [ebp - 0x220]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 59392
}