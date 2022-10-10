rule win_feodo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.feodo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.feodo"
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
        $sequence_0 = { 56 57 33ff 57 6a02 6a02 }
            // n = 6, score = 1100
            //   56                   | push                esi
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   57                   | push                edi
            //   6a02                 | push                2
            //   6a02                 | push                2

        $sequence_1 = { 2401 f6d8 1bc0 25000000c0 }
            // n = 4, score = 1100
            //   2401                 | and                 al, 1
            //   f6d8                 | neg                 al
            //   1bc0                 | sbb                 eax, eax
            //   25000000c0           | and                 eax, 0xc0000000

        $sequence_2 = { 50 8b442414 50 ff15???????? 85c0 7405 8b442408 }
            // n = 7, score = 1100
            //   50                   | push                eax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7
            //   8b442408             | mov                 eax, dword ptr [esp + 8]

        $sequence_3 = { 81ec08020000 6808020000 8d442404 50 }
            // n = 4, score = 1100
            //   81ec08020000         | sub                 esp, 0x208
            //   6808020000           | push                0x208
            //   8d442404             | lea                 eax, [esp + 4]
            //   50                   | push                eax

        $sequence_4 = { 83c001 83f801 72f2 83f801 750c }
            // n = 5, score = 1100
            //   83c001               | add                 eax, 1
            //   83f801               | cmp                 eax, 1
            //   72f2                 | jb                  0xfffffff4
            //   83f801               | cmp                 eax, 1
            //   750c                 | jne                 0xe

        $sequence_5 = { 81ec08020000 53 8b9c2414020000 8bc3 56 2500070000 3d00040000 }
            // n = 7, score = 1100
            //   81ec08020000         | sub                 esp, 0x208
            //   53                   | push                ebx
            //   8b9c2414020000       | mov                 ebx, dword ptr [esp + 0x214]
            //   8bc3                 | mov                 eax, ebx
            //   56                   | push                esi
            //   2500070000           | and                 eax, 0x700
            //   3d00040000           | cmp                 eax, 0x400

        $sequence_6 = { 6a00 8d542424 52 6a00 ff15???????? 85c0 }
            // n = 6, score = 1100
            //   6a00                 | push                0
            //   8d542424             | lea                 edx, [esp + 0x24]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_7 = { 57 8d442424 50 ff15???????? 8bf0 }
            // n = 5, score = 1100
            //   57                   | push                edi
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_8 = { e2c3 7474 7474 7474 }
            // n = 4, score = 100
            //   e2c3                 | loop                0xffffffc5
            //   7474                 | je                  0x76
            //   7474                 | je                  0x76
            //   7474                 | je                  0x76

        $sequence_9 = { 006c082e 08cc 6969690bc8cc69 690c2e2e0b8ce0 04f7 e10c 206d53 }
            // n = 7, score = 100
            //   006c082e             | add                 byte ptr [eax + ecx + 0x2e], ch
            //   08cc                 | or                  ah, cl
            //   6969690bc8cc69       | imul                ebp, dword ptr [ecx + 0x69], 0x69ccc80b
            //   690c2e2e0b8ce0       | imul                ecx, dword ptr [esi + ebp], 0xe08c0b2e
            //   04f7                 | add                 al, 0xf7
            //   e10c                 | loope               0xe
            //   206d53               | and                 byte ptr [ebp + 0x53], ch

        $sequence_10 = { 0863b8 68???????? 7272 7272 }
            // n = 4, score = 100
            //   0863b8               | or                  byte ptr [ebx - 0x48], ah
            //   68????????           |                     
            //   7272                 | jb                  0x74
            //   7272                 | jb                  0x74

        $sequence_11 = { 1c5f 8d422e 2e2e2e2e2ee02e 2e2e2e2e2e2e2ea12e2e2e2e 690b721cb889 51 9a519a519a2e2e }
            // n = 7, score = 100
            //   1c5f                 | sbb                 al, 0x5f
            //   8d422e               | lea                 eax, [edx + 0x2e]
            //   2e2e2e2e2ee02e       | loopne              0x35
            //   2e2e2e2e2e2e2ea12e2e2e2e     | mov    eax, dword ptr cs:[0x2e2e2e2e]
            //   690b721cb889         | imul                ecx, dword ptr [ebx], 0x89b81c72
            //   51                   | push                ecx
            //   9a519a519a2e2e       | lcall               0x2e2e:0x9a519a51

        $sequence_12 = { 005056 44 53 b9864c7474 44 44 44 }
            // n = 7, score = 100
            //   005056               | add                 byte ptr [eax + 0x56], dl
            //   44                   | inc                 esp
            //   53                   | push                ebx
            //   b9864c7474           | mov                 ecx, 0x74744c86
            //   44                   | inc                 esp
            //   44                   | inc                 esp
            //   44                   | inc                 esp

        $sequence_13 = { c07f3cc3 e2c3 e450 2478 232e 1c5f 8d422e }
            // n = 7, score = 100
            //   c07f3cc3             | sar                 byte ptr [edi + 0x3c], 0xc3
            //   e2c3                 | loop                0xffffffc5
            //   e450                 | in                  al, 0x50
            //   2478                 | and                 al, 0x78
            //   232e                 | and                 ebp, dword ptr [esi]
            //   1c5f                 | sbb                 al, 0x5f
            //   8d422e               | lea                 eax, [edx + 0x2e]

        $sequence_14 = { 0404 0316 16 51 9a519a2e2e2e2e 20640444 }
            // n = 6, score = 100
            //   0404                 | add                 al, 4
            //   0316                 | add                 edx, dword ptr [esi]
            //   16                   | push                ss
            //   51                   | push                ecx
            //   9a519a2e2e2e2e       | lcall               0x2e2e:0x2e2e9a51
            //   20640444             | and                 byte ptr [esp + eax + 0x44], ah

        $sequence_15 = { 73fe 6c 3800 16 7f8b 0495 }
            // n = 6, score = 100
            //   73fe                 | jae                 0
            //   6c                   | insb                byte ptr es:[edi], dx
            //   3800                 | cmp                 byte ptr [eax], al
            //   16                   | push                ss
            //   7f8b                 | jg                  0xffffff8d
            //   0495                 | add                 al, 0x95

    condition:
        7 of them and filesize < 270336
}