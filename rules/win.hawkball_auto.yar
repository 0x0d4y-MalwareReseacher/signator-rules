rule win_hawkball_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.hawkball."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hawkball"
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
        $sequence_0 = { ff15???????? c705????????00000000 5e 6a09 6a08 ff15???????? 50 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   c705????????00000000     |     
            //   5e                   | pop                 esi
            //   6a09                 | push                9
            //   6a08                 | push                8
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_1 = { 5d c3 694508e8030000 53 56 57 6800000400 }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   694508e8030000       | imul                eax, dword ptr [ebp + 8], 0x3e8
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   6800000400           | push                0x40000

        $sequence_2 = { 0fb744241c 50 0fb744241e 50 0fb744241e 50 0fb7442420 }
            // n = 7, score = 200
            //   0fb744241c           | movzx               eax, word ptr [esp + 0x1c]
            //   50                   | push                eax
            //   0fb744241e           | movzx               eax, word ptr [esp + 0x1e]
            //   50                   | push                eax
            //   0fb744241e           | movzx               eax, word ptr [esp + 0x1e]
            //   50                   | push                eax
            //   0fb7442420           | movzx               eax, word ptr [esp + 0x20]

        $sequence_3 = { 7419 83be0402000000 7e10 50 6a01 ff15???????? 50 }
            // n = 7, score = 200
            //   7419                 | je                  0x1b
            //   83be0402000000       | cmp                 dword ptr [esi + 0x204], 0
            //   7e10                 | jle                 0x12
            //   50                   | push                eax
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_4 = { 6a00 6a00 68???????? 6a00 ff742430 ff742438 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   6a00                 | push                0
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   ff742438             | push                dword ptr [esp + 0x38]

        $sequence_5 = { 50 ff7311 8bcf ff730d e8???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   ff7311               | push                dword ptr [ebx + 0x11]
            //   8bcf                 | mov                 ecx, edi
            //   ff730d               | push                dword ptr [ebx + 0xd]
            //   e8????????           |                     

        $sequence_6 = { 55 8bec 83ec08 833d????????00 53 7460 }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   833d????????00       |                     
            //   53                   | push                ebx
            //   7460                 | je                  0x62

        $sequence_7 = { 50 0fb745e2 50 8d85d8faffff 68???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   0fb745e2             | movzx               eax, word ptr [ebp - 0x1e]
            //   50                   | push                eax
            //   8d85d8faffff         | lea                 eax, [ebp - 0x528]
            //   68????????           |                     

        $sequence_8 = { 8b15???????? b9???????? e8???????? 8945f8 8d8d78ffffff 51 ff15???????? }
            // n = 7, score = 200
            //   8b15????????         |                     
            //   b9????????           |                     
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8d8d78ffffff         | lea                 ecx, [ebp - 0x88]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_9 = { 50 e8???????? 0fb745ec 68???????? 50 0fb745ea }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   0fb745ec             | movzx               eax, word ptr [ebp - 0x14]
            //   68????????           |                     
            //   50                   | push                eax
            //   0fb745ea             | movzx               eax, word ptr [ebp - 0x16]

    condition:
        7 of them and filesize < 229376
}