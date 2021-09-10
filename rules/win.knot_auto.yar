rule win_knot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.knot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.knot"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 8d95f4fdffff 52 8d8580f7ffff 50 6804010000 }
            // n = 5, score = 200
            //   8d95f4fdffff         | lea                 edx, dword ptr [ebp - 0x20c]
            //   52                   | push                edx
            //   8d8580f7ffff         | lea                 eax, dword ptr [ebp - 0x880]
            //   50                   | push                eax
            //   6804010000           | push                0x104

        $sequence_1 = { 741c 6a09 8b85ccfeffff 50 ff15???????? }
            // n = 5, score = 200
            //   741c                 | je                  0x1e
            //   6a09                 | push                9
            //   8b85ccfeffff         | mov                 eax, dword ptr [ebp - 0x134]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { 0f84af000000 68???????? 8b8574f7ffff 50 e8???????? 83c408 }
            // n = 6, score = 200
            //   0f84af000000         | je                  0xb5
            //   68????????           |                     
            //   8b8574f7ffff         | mov                 eax, dword ptr [ebp - 0x88c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_3 = { 52 ff15???????? 85c0 7507 32c0 e9???????? c785d8fdffff00000000 }
            // n = 7, score = 200
            //   52                   | push                edx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   32c0                 | xor                 al, al
            //   e9????????           |                     
            //   c785d8fdffff00000000     | mov    dword ptr [ebp - 0x228], 0

        $sequence_4 = { 83bd74f7ffff00 0f84af000000 68???????? 8b8574f7ffff }
            // n = 4, score = 200
            //   83bd74f7ffff00       | cmp                 dword ptr [ebp - 0x88c], 0
            //   0f84af000000         | je                  0xb5
            //   68????????           |                     
            //   8b8574f7ffff         | mov                 eax, dword ptr [ebp - 0x88c]

        $sequence_5 = { 50 8b55f0 52 a1???????? 50 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   52                   | push                edx
            //   a1????????           |                     
            //   50                   | push                eax

        $sequence_6 = { 837df8ff 747b 6a00 6a00 6a00 6a02 6a00 }
            // n = 7, score = 200
            //   837df8ff             | cmp                 dword ptr [ebp - 8], -1
            //   747b                 | je                  0x7d
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   6a00                 | push                0

        $sequence_7 = { 8b4df4 51 ff15???????? 85c0 7507 32c0 e9???????? }
            // n = 7, score = 200
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9
            //   32c0                 | xor                 al, al
            //   e9????????           |                     

        $sequence_8 = { 51 ff15???????? 8b55ec 52 ff15???????? 8b45e8 }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_9 = { 52 e8???????? 83c404 ebdc 6888130000 ff15???????? }
            // n = 6, score = 200
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ebdc                 | jmp                 0xffffffde
            //   6888130000           | push                0x1388
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 59392
}