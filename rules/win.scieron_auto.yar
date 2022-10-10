rule win_scieron_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.scieron."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.scieron"
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
        $sequence_0 = { 57 ff742418 898610020000 57 56 68???????? 68???????? }
            // n = 7, score = 100
            //   57                   | push                edi
            //   ff742418             | push                dword ptr [esp + 0x18]
            //   898610020000         | mov                 dword ptr [esi + 0x210], eax
            //   57                   | push                edi
            //   56                   | push                esi
            //   68????????           |                     
            //   68????????           |                     

        $sequence_1 = { ffb61c020000 c744241c80330000 68???????? 55 ffd3 50 ffd7 }
            // n = 7, score = 100
            //   ffb61c020000         | push                dword ptr [esi + 0x21c]
            //   c744241c80330000     | mov                 dword ptr [esp + 0x1c], 0x3380
            //   68????????           |                     
            //   55                   | push                ebp
            //   ffd3                 | call                ebx
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_2 = { 57 33ff 397d10 742e }
            // n = 4, score = 100
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   397d10               | cmp                 dword ptr [ebp + 0x10], edi
            //   742e                 | je                  0x30

        $sequence_3 = { 50 ffb600020000 ffb614020000 68???????? 55 ffd3 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffb600020000         | push                dword ptr [esi + 0x200]
            //   ffb614020000         | push                dword ptr [esi + 0x214]
            //   68????????           |                     
            //   55                   | push                ebp
            //   ffd3                 | call                ebx

        $sequence_4 = { 8b7004 57 33ed 55 55 }
            // n = 5, score = 100
            //   8b7004               | mov                 esi, dword ptr [eax + 4]
            //   57                   | push                edi
            //   33ed                 | xor                 ebp, ebp
            //   55                   | push                ebp
            //   55                   | push                ebp

        $sequence_5 = { ff75f8 57 ff15???????? ff75f8 68???????? 68???????? }
            // n = 6, score = 100
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   57                   | push                edi
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   68????????           |                     
            //   68????????           |                     

        $sequence_6 = { 8945fc 8d45fc 50 8d443df0 }
            // n = 4, score = 100
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   8d443df0             | lea                 eax, [ebp + edi - 0x10]

        $sequence_7 = { ff15???????? 8d440004 8d8e14400010 50 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8d440004             | lea                 eax, [eax + eax + 4]
            //   8d8e14400010         | lea                 ecx, [esi + 0x10004014]
            //   50                   | push                eax

        $sequence_8 = { 8d45fc 8bce e8???????? 83c40c 85c0 0f8466010000 0fb645f7 }
            // n = 7, score = 100
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f8466010000         | je                  0x16c
            //   0fb645f7             | movzx               eax, byte ptr [ebp - 9]

        $sequence_9 = { 0fb645f7 48 83f809 0f87db000000 }
            // n = 4, score = 100
            //   0fb645f7             | movzx               eax, byte ptr [ebp - 9]
            //   48                   | dec                 eax
            //   83f809               | cmp                 eax, 9
            //   0f87db000000         | ja                  0xe1

    condition:
        7 of them and filesize < 100352
}