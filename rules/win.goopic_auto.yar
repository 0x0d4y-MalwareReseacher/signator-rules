rule win_goopic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.goopic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.goopic"
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
        $sequence_0 = { 8d8df8dfffff e8???????? 8d85f8dfffff 50 ff15???????? 8d85a895ffff 50 }
            // n = 7, score = 100
            //   8d8df8dfffff         | lea                 ecx, [ebp - 0x2008]
            //   e8????????           |                     
            //   8d85f8dfffff         | lea                 eax, [ebp - 0x2008]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85a895ffff         | lea                 eax, [ebp - 0x6a58]
            //   50                   | push                eax

        $sequence_1 = { 85f6 7451 fec7 0fb6f7 8a1c06 02d3 }
            // n = 6, score = 100
            //   85f6                 | test                esi, esi
            //   7451                 | je                  0x53
            //   fec7                 | inc                 bh
            //   0fb6f7               | movzx               esi, bh
            //   8a1c06               | mov                 bl, byte ptr [esi + eax]
            //   02d3                 | add                 dl, bl

        $sequence_2 = { ffb5f4efffff 8d85fcf7ffff 6aff 50 57 ff15???????? 85c0 }
            // n = 7, score = 100
            //   ffb5f4efffff         | push                dword ptr [ebp - 0x100c]
            //   8d85fcf7ffff         | lea                 eax, [ebp - 0x804]
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_3 = { 75f2 68???????? 8d84244c010000 50 }
            // n = 4, score = 100
            //   75f2                 | jne                 0xfffffff4
            //   68????????           |                     
            //   8d84244c010000       | lea                 eax, [esp + 0x14c]
            //   50                   | push                eax

        $sequence_4 = { 50 ffd6 8bd7 8d8df8bfffff }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8bd7                 | mov                 edx, edi
            //   8d8df8bfffff         | lea                 ecx, [ebp - 0x4008]

        $sequence_5 = { ff15???????? 85c0 752f 8d85f4efffff 50 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   752f                 | jne                 0x31
            //   8d85f4efffff         | lea                 eax, [ebp - 0x100c]
            //   50                   | push                eax

        $sequence_6 = { 50 ffd3 83f8ff 7507 b8???????? eb4a 50 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   83f8ff               | cmp                 eax, -1
            //   7507                 | jne                 9
            //   b8????????           |                     
            //   eb4a                 | jmp                 0x4c
            //   50                   | push                eax

        $sequence_7 = { 0f8664ffffff 8b4dfc 33c0 5f 5e }
            // n = 5, score = 100
            //   0f8664ffffff         | jbe                 0xffffff6a
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_8 = { 6a00 ffd7 8d842448090000 50 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   ffd7                 | call                edi
            //   8d842448090000       | lea                 eax, [esp + 0x948]
            //   50                   | push                eax

        $sequence_9 = { 33d2 c1ee10 69c680510100 2bc8 8bc1 }
            // n = 5, score = 100
            //   33d2                 | xor                 edx, edx
            //   c1ee10               | shr                 esi, 0x10
            //   69c680510100         | imul                eax, esi, 0x15180
            //   2bc8                 | sub                 ecx, eax
            //   8bc1                 | mov                 eax, ecx

    condition:
        7 of them and filesize < 114688
}