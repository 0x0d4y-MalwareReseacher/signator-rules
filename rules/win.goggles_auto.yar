rule win_goggles_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.goggles."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.goggles"
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
        $sequence_0 = { f3a4 6a00 6a00 6a00 8d4c242c 6a00 51 }
            // n = 7, score = 100
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d4c242c             | lea                 ecx, dword ptr [esp + 0x2c]
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_1 = { 6a29 f3ab 52 ffd3 }
            // n = 4, score = 100
            //   6a29                 | push                0x29
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   52                   | push                edx
            //   ffd3                 | call                ebx

        $sequence_2 = { 56 50 8d8424bc040000 6a01 50 ffd7 56 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   50                   | push                eax
            //   8d8424bc040000       | lea                 eax, dword ptr [esp + 0x4bc]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   56                   | push                esi

        $sequence_3 = { a0???????? 55 57 88442410 b940000000 }
            // n = 5, score = 100
            //   a0????????           |                     
            //   55                   | push                ebp
            //   57                   | push                edi
            //   88442410             | mov                 byte ptr [esp + 0x10], al
            //   b940000000           | mov                 ecx, 0x40

        $sequence_4 = { 8d4c244c 50 8d54247c 51 52 }
            // n = 5, score = 100
            //   8d4c244c             | lea                 ecx, dword ptr [esp + 0x4c]
            //   50                   | push                eax
            //   8d54247c             | lea                 edx, dword ptr [esp + 0x7c]
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_5 = { 83c414 ebb4 2bc3 33c9 }
            // n = 4, score = 100
            //   83c414               | add                 esp, 0x14
            //   ebb4                 | jmp                 0xffffffb6
            //   2bc3                 | sub                 eax, ebx
            //   33c9                 | xor                 ecx, ecx

        $sequence_6 = { 85c0 7416 56 50 8d8424bc040000 }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   56                   | push                esi
            //   50                   | push                eax
            //   8d8424bc040000       | lea                 eax, dword ptr [esp + 0x4bc]

        $sequence_7 = { ffd7 53 6a04 8d4c2428 6a01 51 }
            // n = 6, score = 100
            //   ffd7                 | call                edi
            //   53                   | push                ebx
            //   6a04                 | push                4
            //   8d4c2428             | lea                 ecx, dword ptr [esp + 0x28]
            //   6a01                 | push                1
            //   51                   | push                ecx

        $sequence_8 = { 8b8424c0080000 8d4c244c 50 8d54247c 51 }
            // n = 5, score = 100
            //   8b8424c0080000       | mov                 eax, dword ptr [esp + 0x8c0]
            //   8d4c244c             | lea                 ecx, dword ptr [esp + 0x4c]
            //   50                   | push                eax
            //   8d54247c             | lea                 edx, dword ptr [esp + 0x7c]
            //   51                   | push                ecx

        $sequence_9 = { 8d8c2484010000 2bc2 50 8d842484000000 50 }
            // n = 5, score = 100
            //   8d8c2484010000       | lea                 ecx, dword ptr [esp + 0x184]
            //   2bc2                 | sub                 eax, edx
            //   50                   | push                eax
            //   8d842484000000       | lea                 eax, dword ptr [esp + 0x84]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 57344
}