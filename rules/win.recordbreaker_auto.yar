rule win_recordbreaker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.recordbreaker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.recordbreaker"
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
        $sequence_0 = { 55 8bec 81ec68040000 837d1002 }
            // n = 4, score = 600
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec68040000         | sub                 esp, 0x468
            //   837d1002             | cmp                 dword ptr [ebp + 0x10], 2

        $sequence_1 = { 85c0 7408 8bf0 2bf7 }
            // n = 4, score = 600
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   8bf0                 | mov                 esi, eax
            //   2bf7                 | sub                 esi, edi

        $sequence_2 = { 6a00 ff750c 8b55f8 8bce ff7508 e8???????? 83c40c }
            // n = 7, score = 600
            //   6a00                 | push                0
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8bce                 | mov                 ecx, esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_3 = { 51 8b4dfc 8975d0 e8???????? }
            // n = 4, score = 600
            //   51                   | push                ecx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi
            //   e8????????           |                     

        $sequence_4 = { ff75f0 ff15???????? ff75ec ff15???????? 57 ff15???????? }
            // n = 6, score = 600
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff15????????         |                     
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff15????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_5 = { 8b5510 8d8d98fdffff e8???????? 85c0 }
            // n = 4, score = 600
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   8d8d98fdffff         | lea                 ecx, [ebp - 0x268]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_6 = { 85c0 7410 ff75fc ff15???????? 33c0 e9???????? 8bde }
            // n = 7, score = 600
            //   85c0                 | test                eax, eax
            //   7410                 | je                  0x12
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8bde                 | mov                 ebx, esi

        $sequence_7 = { ff15???????? 8bd3 8bcf e8???????? 8bd3 8bcf }
            // n = 6, score = 600
            //   ff15????????         |                     
            //   8bd3                 | mov                 edx, ebx
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8bd3                 | mov                 edx, ebx
            //   8bcf                 | mov                 ecx, edi

        $sequence_8 = { 8b5508 8bc8 e8???????? 8b15???????? 8bc8 e8???????? }
            // n = 6, score = 600
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8b15????????         |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     

        $sequence_9 = { 8d55f0 d1fe 8bcf 56 }
            // n = 4, score = 600
            //   8d55f0               | lea                 edx, [ebp - 0x10]
            //   d1fe                 | sar                 esi, 1
            //   8bcf                 | mov                 ecx, edi
            //   56                   | push                esi

    condition:
        7 of them and filesize < 232312
}