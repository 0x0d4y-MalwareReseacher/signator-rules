rule win_faketc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.faketc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.faketc"
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
        $sequence_0 = { b903000000 89942410010000 89b42414010000 898c241c010000 8b90c4000000 89942440010000 89b42444010000 }
            // n = 7, score = 100
            //   b903000000           | mov                 ecx, 3
            //   89942410010000       | mov                 dword ptr [esp + 0x110], edx
            //   89b42414010000       | mov                 dword ptr [esp + 0x114], esi
            //   898c241c010000       | mov                 dword ptr [esp + 0x11c], ecx
            //   8b90c4000000         | mov                 edx, dword ptr [eax + 0xc4]
            //   89942440010000       | mov                 dword ptr [esp + 0x140], edx
            //   89b42444010000       | mov                 dword ptr [esp + 0x144], esi

        $sequence_1 = { 8d6f10 6a01 8bcd e8???????? 8d9680010000 52 6a00 }
            // n = 7, score = 100
            //   8d6f10               | lea                 ebp, [edi + 0x10]
            //   6a01                 | push                1
            //   8bcd                 | mov                 ecx, ebp
            //   e8????????           |                     
            //   8d9680010000         | lea                 edx, [esi + 0x180]
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_2 = { e8???????? 8bf8 83c408 85ff 750e 6851010000 68???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c408               | add                 esp, 8
            //   85ff                 | test                edi, edi
            //   750e                 | jne                 0x10
            //   6851010000           | push                0x151
            //   68????????           |                     

        $sequence_3 = { c7405400000000 e9???????? 8b4de4 51 68???????? 8b55e0 52 }
            // n = 7, score = 100
            //   c7405400000000       | mov                 dword ptr [eax + 0x54], 0
            //   e9????????           |                     
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx
            //   68????????           |                     
            //   8b55e0               | mov                 edx, dword ptr [ebp - 0x20]
            //   52                   | push                edx

        $sequence_4 = { f7d8 1bc0 40 50 680a040000 55 ffd3 }
            // n = 7, score = 100
            //   f7d8                 | neg                 eax
            //   1bc0                 | sbb                 eax, eax
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   680a040000           | push                0x40a
            //   55                   | push                ebp
            //   ffd3                 | call                ebx

        $sequence_5 = { 8b8424c4000000 8b8c24c0000000 50 8b442424 51 57 8d54243c }
            // n = 7, score = 100
            //   8b8424c4000000       | mov                 eax, dword ptr [esp + 0xc4]
            //   8b8c24c0000000       | mov                 ecx, dword ptr [esp + 0xc0]
            //   50                   | push                eax
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   51                   | push                ecx
            //   57                   | push                edi
            //   8d54243c             | lea                 edx, [esp + 0x3c]

        $sequence_6 = { b81c200000 e8???????? a1???????? 33c4 89842418200000 8b842420200000 56 }
            // n = 7, score = 100
            //   b81c200000           | mov                 eax, 0x201c
            //   e8????????           |                     
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89842418200000       | mov                 dword ptr [esp + 0x2018], eax
            //   8b842420200000       | mov                 eax, dword ptr [esp + 0x2020]
            //   56                   | push                esi

        $sequence_7 = { e8???????? 83c404 83ee01 88443431 79e6 8b4b04 c744241400000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   83ee01               | sub                 esi, 1
            //   88443431             | mov                 byte ptr [esp + esi + 0x31], al
            //   79e6                 | jns                 0xffffffe8
            //   8b4b04               | mov                 ecx, dword ptr [ebx + 4]
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0

        $sequence_8 = { c1ef1d 0bfd 33f7 33f0 8b8424a0000000 33d3 c1e906 }
            // n = 7, score = 100
            //   c1ef1d               | shr                 edi, 0x1d
            //   0bfd                 | or                  edi, ebp
            //   33f7                 | xor                 esi, edi
            //   33f0                 | xor                 esi, eax
            //   8b8424a0000000       | mov                 eax, dword ptr [esp + 0xa0]
            //   33d3                 | xor                 edx, ebx
            //   c1e906               | shr                 ecx, 6

        $sequence_9 = { b0d0 b6d0 bdd18bd185 20d1 84d0 b0d0 b9d0bbd0be }
            // n = 7, score = 100
            //   b0d0                 | mov                 al, 0xd0
            //   b6d0                 | mov                 dh, 0xd0
            //   bdd18bd185           | mov                 ebp, 0x85d18bd1
            //   20d1                 | and                 cl, dl
            //   84d0                 | test                al, dl
            //   b0d0                 | mov                 al, 0xd0
            //   b9d0bbd0be           | mov                 ecx, 0xbed0bbd0

    condition:
        7 of them and filesize < 6864896
}