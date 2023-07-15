rule win_compfun_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.compfun."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.compfun"
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
        $sequence_0 = { 6a22 6a02 57 57 }
            // n = 4, score = 300
            //   6a22                 | push                0x22
            //   6a02                 | push                2
            //   57                   | push                edi
            //   57                   | push                edi

        $sequence_1 = { 0f84ce000000 57 8d95acfdffff 52 }
            // n = 4, score = 300
            //   0f84ce000000         | je                  0xd4
            //   57                   | push                edi
            //   8d95acfdffff         | lea                 edx, [ebp - 0x254]
            //   52                   | push                edx

        $sequence_2 = { 59 50 57 ffd3 89467c 85c0 }
            // n = 6, score = 300
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   57                   | push                edi
            //   ffd3                 | call                ebx
            //   89467c               | mov                 dword ptr [esi + 0x7c], eax
            //   85c0                 | test                eax, eax

        $sequence_3 = { 680e040000 668945f0 668945fa 66898548f6ffff }
            // n = 4, score = 300
            //   680e040000           | push                0x40e
            //   668945f0             | mov                 word ptr [ebp - 0x10], ax
            //   668945fa             | mov                 word ptr [ebp - 6], ax
            //   66898548f6ffff       | mov                 word ptr [ebp - 0x9b8], ax

        $sequence_4 = { 50 a1???????? 68???????? 56 ff5010 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   a1????????           |                     
            //   68????????           |                     
            //   56                   | push                esi
            //   ff5010               | call                dword ptr [eax + 0x10]

        $sequence_5 = { 0f842e040000 68???????? e8???????? 59 50 57 }
            // n = 6, score = 300
            //   0f842e040000         | je                  0x434
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_6 = { 6a00 56 e8???????? 83c40c c746106e666f20 }
            // n = 5, score = 300
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   c746106e666f20       | mov                 dword ptr [esi + 0x10], 0x206f666e

        $sequence_7 = { 56 8b7508 6880000000 6a00 }
            // n = 4, score = 300
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   6880000000           | push                0x80
            //   6a00                 | push                0

        $sequence_8 = { 034c2460 488b442450 894820 488b4c2450 }
            // n = 4, score = 100
            //   034c2460             | lea                 edx, [esp + 0x40]
            //   488b442450           | dec                 eax
            //   894820               | mov                 ecx, dword ptr [esp + 0x70]
            //   488b4c2450           | add                 ecx, dword ptr [esp + 0x2c]

        $sequence_9 = { 03c1 89442420 8b542438 486bd218 }
            // n = 4, score = 100
            //   03c1                 | movzx               eax, byte ptr [eax + eax]
            //   89442420             | mov                 byte ptr [ecx + edx], al
            //   8b542438             | mov                 eax, dword ptr [esp + 0x18]
            //   486bd218             | add                 eax, ecx

        $sequence_10 = { 03c1 4863d0 488b4c2430 488b442438 }
            // n = 4, score = 100
            //   03c1                 | add                 ecx, dword ptr [esp + 0x60]
            //   4863d0               | dec                 eax
            //   488b4c2430           | mov                 eax, dword ptr [esp + 0x50]
            //   488b442438           | mov                 dword ptr [eax + 0x20], ecx

        $sequence_11 = { 03c1 89442420 8b442420 83c001 }
            // n = 4, score = 100
            //   03c1                 | add                 ecx, dword ptr [esp + 0x60]
            //   89442420             | dec                 eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x50]
            //   83c001               | mov                 dword ptr [eax + 0x20], ecx

        $sequence_12 = { 03c1 89442434 8b442430 39442434 }
            // n = 4, score = 100
            //   03c1                 | mov                 dword ptr [esp + 0x20], eax
            //   89442434             | mov                 eax, dword ptr [esp + 0x20]
            //   8b442430             | add                 eax, 0xa
            //   39442434             | add                 eax, ecx

        $sequence_13 = { 03c1 89442420 8b4c2438 488b442450 }
            // n = 4, score = 100
            //   03c1                 | dec                 eax
            //   89442420             | mov                 eax, dword ptr [esp + 0x38]
            //   8b4c2438             | inc                 edx
            //   488b442450           | movzx               eax, byte ptr [eax + eax]

        $sequence_14 = { 034c242c 488b442470 894820 488d542440 }
            // n = 4, score = 100
            //   034c242c             | add                 eax, dword ptr [esp + 0x2c]
            //   488b442470           | mov                 ecx, eax
            //   894820               | dec                 eax
            //   488d542440           | mov                 dword ptr [esp + 0x48], eax

        $sequence_15 = { 0344242c 8bc8 e8???????? 4889442448 }
            // n = 4, score = 100
            //   0344242c             | add                 eax, dword ptr [esp + 0x2c]
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   4889442448           | dec                 eax

    condition:
        7 of them and filesize < 402432
}