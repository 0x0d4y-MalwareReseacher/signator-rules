rule win_protonbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.protonbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.protonbot"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 89b5f8feffff 50 c785f8feffffff000000 e8???????? }
            // n = 4, score = 400
            //   89b5f8feffff         | mov                 dword ptr [ebp - 0x108], esi
            //   50                   | push                eax
            //   c785f8feffffff000000     | mov    dword ptr [ebp - 0x108], 0xff
            //   e8????????           |                     

        $sequence_1 = { 8d4d20 6a00 0f434d20 8d4550 837d6410 6800000080 0f434550 }
            // n = 7, score = 400
            //   8d4d20               | lea                 ecx, [ebp + 0x20]
            //   6a00                 | push                0
            //   0f434d20             | cmovae              ecx, dword ptr [ebp + 0x20]
            //   8d4550               | lea                 eax, [ebp + 0x50]
            //   837d6410             | cmp                 dword ptr [ebp + 0x64], 0x10
            //   6800000080           | push                0x80000000
            //   0f434550             | cmovae              eax, dword ptr [ebp + 0x50]

        $sequence_2 = { 57 68???????? 6a00 6a00 ffd3 83ee01 }
            // n = 6, score = 400
            //   57                   | push                edi
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ffd3                 | call                ebx
            //   83ee01               | sub                 esi, 1

        $sequence_3 = { 57 50 e8???????? ffb5d4feffff e8???????? 83c40c }
            // n = 6, score = 400
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   ffb5d4feffff         | push                dword ptr [ebp - 0x12c]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_4 = { 50 e8???????? 8b85d4feffff 83c418 85c0 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b85d4feffff         | mov                 eax, dword ptr [ebp - 0x12c]
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax

        $sequence_5 = { ffb588fdffff e8???????? 83c40c 8d85d8feffff 6a00 }
            // n = 5, score = 400
            //   ffb588fdffff         | push                dword ptr [ebp - 0x278]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85d8feffff         | lea                 eax, [ebp - 0x128]
            //   6a00                 | push                0

        $sequence_6 = { 8d45ed c78598fbffff00000000 c7859cfbffff0f000000 c68588fbffff00 3bf0 740f 2bc6 }
            // n = 7, score = 400
            //   8d45ed               | lea                 eax, [ebp - 0x13]
            //   c78598fbffff00000000     | mov    dword ptr [ebp - 0x468], 0
            //   c7859cfbffff0f000000     | mov    dword ptr [ebp - 0x464], 0xf
            //   c68588fbffff00       | mov                 byte ptr [ebp - 0x478], 0
            //   3bf0                 | cmp                 esi, eax
            //   740f                 | je                  0x11
            //   2bc6                 | sub                 eax, esi

        $sequence_7 = { 8d85bcfeffff 8bcc 50 e8???????? 8d8dd4feffff e8???????? }
            // n = 6, score = 400
            //   8d85bcfeffff         | lea                 eax, [ebp - 0x144]
            //   8bcc                 | mov                 ecx, esp
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8dd4feffff         | lea                 ecx, [ebp - 0x12c]
            //   e8????????           |                     

        $sequence_8 = { 50 8d8584fbffff 50 e8???????? 83c418 83bd84fbffff00 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   8d8584fbffff         | lea                 eax, [ebp - 0x47c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   83bd84fbffff00       | cmp                 dword ptr [ebp - 0x47c], 0

        $sequence_9 = { 8d95d4feffff c785b4feffff00000000 0f4395d4feffff 8bca c785b8feffff0f000000 c685a4feffff00 8d7101 }
            // n = 7, score = 400
            //   8d95d4feffff         | lea                 edx, [ebp - 0x12c]
            //   c785b4feffff00000000     | mov    dword ptr [ebp - 0x14c], 0
            //   0f4395d4feffff       | cmovae              edx, dword ptr [ebp - 0x12c]
            //   8bca                 | mov                 ecx, edx
            //   c785b8feffff0f000000     | mov    dword ptr [ebp - 0x148], 0xf
            //   c685a4feffff00       | mov                 byte ptr [ebp - 0x15c], 0
            //   8d7101               | lea                 esi, [ecx + 1]

    condition:
        7 of them and filesize < 1073152
}