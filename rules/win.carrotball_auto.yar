rule win_carrotball_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.carrotball."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.carrotball"
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
        $sequence_0 = { 8bf0 85f6 0f84ac000000 68???????? }
            // n = 4, score = 200
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   0f84ac000000         | je                  0xb2
            //   68????????           |                     

        $sequence_1 = { 57 ff15???????? 8bf0 85f6 0f84ac000000 68???????? }
            // n = 6, score = 200
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   0f84ac000000         | je                  0xb2
            //   68????????           |                     

        $sequence_2 = { ffb5ecfdffff ff15???????? 56 8b35???????? }
            // n = 4, score = 200
            //   ffb5ecfdffff         | push                dword ptr [ebp - 0x214]
            //   ff15????????         |                     
            //   56                   | push                esi
            //   8b35????????         |                     

        $sequence_3 = { c705????????01000000 c705????????01000000 6a04 58 6bc000 c7807430001002000000 }
            // n = 6, score = 200
            //   c705????????01000000     |     
            //   c705????????01000000     |     
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   6bc000               | imul                eax, eax, 0
            //   c7807430001002000000     | mov    dword ptr [eax + 0x10003074], 2

        $sequence_4 = { 6804010000 8d85f4fdffff 50 c785ecfdffff00000000 ff15???????? }
            // n = 5, score = 200
            //   6804010000           | push                0x104
            //   8d85f4fdffff         | lea                 eax, dword ptr [ebp - 0x20c]
            //   50                   | push                eax
            //   c785ecfdffff00000000     | mov    dword ptr [ebp - 0x214], 0
            //   ff15????????         |                     

        $sequence_5 = { c7807430001002000000 6a04 58 6bc000 8b0d???????? 894c05f8 }
            // n = 6, score = 200
            //   c7807430001002000000     | mov    dword ptr [eax + 0x10003074], 2
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   6bc000               | imul                eax, eax, 0
            //   8b0d????????         |                     
            //   894c05f8             | mov                 dword ptr [ebp + eax - 8], ecx

        $sequence_6 = { 85f6 0f84ac000000 68???????? 56 ff15???????? 85c0 0f8498000000 }
            // n = 7, score = 200
            //   85f6                 | test                esi, esi
            //   0f84ac000000         | je                  0xb2
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8498000000         | je                  0x9e

        $sequence_7 = { 68???????? 83f878 751f 68???????? 56 ff15???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   83f878               | cmp                 eax, 0x78
            //   751f                 | jne                 0x21
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_8 = { 6a04 58 6bc000 c7807430001002000000 6a04 58 6bc000 }
            // n = 7, score = 200
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   6bc000               | imul                eax, eax, 0
            //   c7807430001002000000     | mov    dword ptr [eax + 0x10003074], 2
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   6bc000               | imul                eax, eax, 0

        $sequence_9 = { 68???????? ff15???????? eb36 68???????? 56 ff15???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   ff15????????         |                     
            //   eb36                 | jmp                 0x38
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 40960
}