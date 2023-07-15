rule win_windealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.windealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.windealer"
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
        $sequence_0 = { ff15???????? 85c0 7407 50 ff15???????? 6a01 }
            // n = 6, score = 800
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a01                 | push                1

        $sequence_1 = { 668b91d2070000 8a89d0070000 52 51 }
            // n = 4, score = 800
            //   668b91d2070000       | mov                 dx, word ptr [ecx + 0x7d2]
            //   8a89d0070000         | mov                 cl, byte ptr [ecx + 0x7d0]
            //   52                   | push                edx
            //   51                   | push                ecx

        $sequence_2 = { 53 56 57 68da070000 }
            // n = 4, score = 800
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   68da070000           | push                0x7da

        $sequence_3 = { 56 e8???????? 83c410 8b4610 }
            // n = 4, score = 800
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]

        $sequence_4 = { 6a04 50 6a04 68???????? 68???????? }
            // n = 5, score = 800
            //   6a04                 | push                4
            //   50                   | push                eax
            //   6a04                 | push                4
            //   68????????           |                     
            //   68????????           |                     

        $sequence_5 = { 6a00 ff15???????? 85c0 7407 50 ff15???????? 6a01 }
            // n = 7, score = 800
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a01                 | push                1

        $sequence_6 = { 8b4d08 668b91d2070000 8a89d0070000 52 }
            // n = 4, score = 800
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   668b91d2070000       | mov                 dx, word ptr [ecx + 0x7d2]
            //   8a89d0070000         | mov                 cl, byte ptr [ecx + 0x7d0]
            //   52                   | push                edx

        $sequence_7 = { 6a01 50 56 e8???????? 83c410 8bc7 }
            // n = 6, score = 800
            //   6a01                 | push                1
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8bc7                 | mov                 eax, edi

        $sequence_8 = { 50 56 e8???????? 83c410 8b4618 }
            // n = 5, score = 800
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8b4618               | mov                 eax, dword ptr [esi + 0x18]

        $sequence_9 = { 56 57 68da070000 e8???????? }
            // n = 4, score = 800
            //   56                   | push                esi
            //   57                   | push                edi
            //   68da070000           | push                0x7da
            //   e8????????           |                     

    condition:
        7 of them and filesize < 770048
}