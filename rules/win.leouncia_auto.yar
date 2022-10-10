rule win_leouncia_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.leouncia."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.leouncia"
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
        $sequence_0 = { 50 81c2???????? 51 52 895c2428 e8???????? 83c418 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   81c2????????         |                     
            //   51                   | push                ecx
            //   52                   | push                edx
            //   895c2428             | mov                 dword ptr [esp + 0x28], ebx
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18

        $sequence_1 = { 745c 8bc5 2bc6 85c0 7e19 }
            // n = 5, score = 100
            //   745c                 | je                  0x5e
            //   8bc5                 | mov                 eax, ebp
            //   2bc6                 | sub                 eax, esi
            //   85c0                 | test                eax, eax
            //   7e19                 | jle                 0x1b

        $sequence_2 = { e8???????? 8d542418 8d8424c0050000 52 50 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   8d8424c0050000       | lea                 eax, [esp + 0x5c0]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_3 = { 55 52 56 56 6a01 50 ffd3 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   52                   | push                edx
            //   56                   | push                esi
            //   56                   | push                esi
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ffd3                 | call                ebx

        $sequence_4 = { 50 6a0f 56 ff15???????? 85c0 7407 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   6a0f                 | push                0xf
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9

        $sequence_5 = { ff15???????? 3bc3 740b 83f801 75dd 395c2410 75d7 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   3bc3                 | cmp                 eax, ebx
            //   740b                 | je                  0xd
            //   83f801               | cmp                 eax, 1
            //   75dd                 | jne                 0xffffffdf
            //   395c2410             | cmp                 dword ptr [esp + 0x10], ebx
            //   75d7                 | jne                 0xffffffd9

        $sequence_6 = { 8b74241c 2bcf 6a00 1bd6 6810270000 }
            // n = 5, score = 100
            //   8b74241c             | mov                 esi, dword ptr [esp + 0x1c]
            //   2bcf                 | sub                 ecx, edi
            //   6a00                 | push                0
            //   1bd6                 | sbb                 edx, esi
            //   6810270000           | push                0x2710

        $sequence_7 = { 8d842424050000 52 8d8c2429010000 50 51 e8???????? }
            // n = 6, score = 100
            //   8d842424050000       | lea                 eax, [esp + 0x524]
            //   52                   | push                edx
            //   8d8c2429010000       | lea                 ecx, [esp + 0x129]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_8 = { 660fb601 6685c0 743a 0fb6d0 f68221b0400004 741a 8a5101 }
            // n = 7, score = 100
            //   660fb601             | movzx               ax, byte ptr [ecx]
            //   6685c0               | test                ax, ax
            //   743a                 | je                  0x3c
            //   0fb6d0               | movzx               edx, al
            //   f68221b0400004       | test                byte ptr [edx + 0x40b021], 4
            //   741a                 | je                  0x1c
            //   8a5101               | mov                 dl, byte ptr [ecx + 1]

        $sequence_9 = { 8b442410 8b4c2414 8d542410 52 50 57 6a01 }
            // n = 7, score = 100
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   52                   | push                edx
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a01                 | push                1

    condition:
        7 of them and filesize < 114688
}