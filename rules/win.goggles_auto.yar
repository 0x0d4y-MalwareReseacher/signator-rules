rule win_goggles_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.goggles."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.goggles"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 53 ffd7 85c0 75c7 8b6c2418 56 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   75c7                 | jne                 0xffffffc9
            //   8b6c2418             | mov                 ebp, dword ptr [esp + 0x18]
            //   56                   | push                esi

        $sequence_1 = { ff15???????? 8b442410 8d4c241c 8d542420 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]
            //   8d542420             | lea                 edx, [esp + 0x20]

        $sequence_2 = { 85c0 7430 68???????? ff15???????? 8d542408 52 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   7430                 | je                  0x32
            //   68????????           |                     
            //   ff15????????         |                     
            //   8d542408             | lea                 edx, [esp + 8]
            //   52                   | push                edx

        $sequence_3 = { 81fd90010000 f3ab aa 53 7616 ff15???????? }
            // n = 6, score = 100
            //   81fd90010000         | cmp                 ebp, 0x190
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   53                   | push                ebx
            //   7616                 | jbe                 0x18
            //   ff15????????         |                     

        $sequence_4 = { 85c0 7443 8b2d???????? 8b442414 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7443                 | je                  0x45
            //   8b2d????????         |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]

        $sequence_5 = { ffd3 57 6a04 8d44245c 6a01 50 ff15???????? }
            // n = 7, score = 100
            //   ffd3                 | call                ebx
            //   57                   | push                edi
            //   6a04                 | push                4
            //   8d44245c             | lea                 eax, [esp + 0x5c]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_6 = { 6a2f 56 ff15???????? 8bf8 83c9ff 47 }
            // n = 6, score = 100
            //   6a2f                 | push                0x2f
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   83c9ff               | or                  ecx, 0xffffffff
            //   47                   | inc                 edi

        $sequence_7 = { c680a841001000 8d842410010000 6891010000 50 6a02 56 ffd5 }
            // n = 7, score = 100
            //   c680a841001000       | mov                 byte ptr [eax + 0x100041a8], 0
            //   8d842410010000       | lea                 eax, [esp + 0x110]
            //   6891010000           | push                0x191
            //   50                   | push                eax
            //   6a02                 | push                2
            //   56                   | push                esi
            //   ffd5                 | call                ebp

        $sequence_8 = { 68???????? 51 68???????? e8???????? 83c410 c680a841001000 8d842410010000 }
            // n = 7, score = 100
            //   68????????           |                     
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c680a841001000       | mov                 byte ptr [eax + 0x100041a8], 0
            //   8d842410010000       | lea                 eax, [esp + 0x110]

        $sequence_9 = { ffd7 8d842484030000 682d010000 8d8c2484020000 50 51 e8???????? }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   8d842484030000       | lea                 eax, [esp + 0x384]
            //   682d010000           | push                0x12d
            //   8d8c2484020000       | lea                 ecx, [esp + 0x284]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 57344
}