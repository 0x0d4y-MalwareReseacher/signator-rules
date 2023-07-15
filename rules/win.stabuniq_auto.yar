rule win_stabuniq_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.stabuniq."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stabuniq"
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
        $sequence_0 = { 57 e8???????? 5b 81ebe7924000 }
            // n = 4, score = 100
            //   57                   | push                edi
            //   e8????????           |                     
            //   5b                   | pop                 ebx
            //   81ebe7924000         | sub                 ebx, 0x4092e7

        $sequence_1 = { 6a00 6a00 6a25 8d55ac 52 8b4508 05e8110000 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a25                 | push                0x25
            //   8d55ac               | lea                 edx, [ebp - 0x54]
            //   52                   | push                edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   05e8110000           | add                 eax, 0x11e8

        $sequence_2 = { 8b4838 51 8b5510 ff524c 50 8b450c }
            // n = 6, score = 100
            //   8b4838               | mov                 ecx, dword ptr [eax + 0x38]
            //   51                   | push                ecx
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   ff524c               | call                dword ptr [edx + 0x4c]
            //   50                   | push                eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_3 = { 8b4518 0fbe88dc0e0000 85c9 7515 685cf94000 8b5518 81c2dc0e0000 }
            // n = 7, score = 100
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   0fbe88dc0e0000       | movsx               ecx, byte ptr [eax + 0xedc]
            //   85c9                 | test                ecx, ecx
            //   7515                 | jne                 0x17
            //   685cf94000           | push                0x40f95c
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]
            //   81c2dc0e0000         | add                 edx, 0xedc

        $sequence_4 = { c20400 55 8bec 8b4508 0518020000 50 }
            // n = 6, score = 100
            //   c20400               | ret                 4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0518020000           | add                 eax, 0x218
            //   50                   | push                eax

        $sequence_5 = { 8b8d6cf9ffff 83e940 51 8b9528f9ffff 52 8d856cfaffff 50 }
            // n = 7, score = 100
            //   8b8d6cf9ffff         | mov                 ecx, dword ptr [ebp - 0x694]
            //   83e940               | sub                 ecx, 0x40
            //   51                   | push                ecx
            //   8b9528f9ffff         | mov                 edx, dword ptr [ebp - 0x6d8]
            //   52                   | push                edx
            //   8d856cfaffff         | lea                 eax, [ebp - 0x594]
            //   50                   | push                eax

        $sequence_6 = { 51 8b550c ff523c 8d45f8 50 }
            // n = 5, score = 100
            //   51                   | push                ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   ff523c               | call                dword ptr [edx + 0x3c]
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax

        $sequence_7 = { 50 8b4d10 ff9184000000 6a02 8d95e4fcffff 52 8b4510 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   ff9184000000         | call                dword ptr [ecx + 0x84]
            //   6a02                 | push                2
            //   8d95e4fcffff         | lea                 edx, [ebp - 0x31c]
            //   52                   | push                edx
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_8 = { 8d8dc0fcffff 51 e8???????? 8b5508 83c220 895508 68ff000000 }
            // n = 7, score = 100
            //   8d8dc0fcffff         | lea                 ecx, [ebp - 0x340]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83c220               | add                 edx, 0x20
            //   895508               | mov                 dword ptr [ebp + 8], edx
            //   68ff000000           | push                0xff

        $sequence_9 = { ff9188000000 8b95d8fdffff 52 8b4508 }
            // n = 4, score = 100
            //   ff9188000000         | call                dword ptr [ecx + 0x88]
            //   8b95d8fdffff         | mov                 edx, dword ptr [ebp - 0x228]
            //   52                   | push                edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 57344
}