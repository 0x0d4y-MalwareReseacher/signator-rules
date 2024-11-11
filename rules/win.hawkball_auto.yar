rule win_hawkball_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.hawkball."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hawkball"
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
        $sequence_0 = { 8d5f08 c745f000000000 8d470c c745ec0c000000 53 }
            // n = 5, score = 200
            //   8d5f08               | lea                 ebx, [edi + 8]
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   8d470c               | lea                 eax, [edi + 0xc]
            //   c745ec0c000000       | mov                 dword ptr [ebp - 0x14], 0xc
            //   53                   | push                ebx

        $sequence_1 = { 51 53 8b1d???????? 8bd3 8bcb c1ea08 c1e910 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   8bd3                 | mov                 edx, ebx
            //   8bcb                 | mov                 ecx, ebx
            //   c1ea08               | shr                 edx, 8
            //   c1e910               | shr                 ecx, 0x10

        $sequence_2 = { e8???????? 83c40c 8d85fcfeffff 6a01 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   6a01                 | push                1

        $sequence_3 = { 81ec7c050000 53 56 8b7508 57 8b3e 85ff }
            // n = 7, score = 200
            //   81ec7c050000         | sub                 esp, 0x57c
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   85ff                 | test                edi, edi

        $sequence_4 = { 53 660f6f05???????? 56 f30f7f4588 }
            // n = 4, score = 200
            //   53                   | push                ebx
            //   660f6f05????????     |                     
            //   56                   | push                esi
            //   f30f7f4588           | movdqu              xmmword ptr [ebp - 0x78], xmm0

        $sequence_5 = { 6a01 894705 ff15???????? 50 }
            // n = 4, score = 200
            //   6a01                 | push                1
            //   894705               | mov                 dword ptr [edi + 5], eax
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_6 = { 50 e8???????? 83c40c 8d842478020000 6a00 6a00 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d842478020000       | lea                 eax, [esp + 0x278]
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { 83c40c 8d842478020000 6a00 6a00 6804010000 50 8d442464 }
            // n = 7, score = 200
            //   83c40c               | add                 esp, 0xc
            //   8d842478020000       | lea                 eax, [esp + 0x278]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6804010000           | push                0x104
            //   50                   | push                eax
            //   8d442464             | lea                 eax, [esp + 0x64]

        $sequence_8 = { 8b5dfc eb35 837e4400 7462 6a00 }
            // n = 5, score = 200
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   eb35                 | jmp                 0x37
            //   837e4400             | cmp                 dword ptr [esi + 0x44], 0
            //   7462                 | je                  0x64
            //   6a00                 | push                0

        $sequence_9 = { 6a08 ffd3 50 ff15???????? 8bf0 8d8578ffffff 50 }
            // n = 7, score = 200
            //   6a08                 | push                8
            //   ffd3                 | call                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8d8578ffffff         | lea                 eax, [ebp - 0x88]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 229376
}