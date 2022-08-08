rule win_getmypass_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.getmypass."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.getmypass"
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
        $sequence_0 = { 51 8b55f4 52 e8???????? 83c40c 8d85f0fbffff 50 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85f0fbffff         | lea                 eax, [ebp - 0x410]
            //   50                   | push                eax

        $sequence_1 = { 837da0ff 0f84e8000000 837de400 750b 8b45e0 }
            // n = 5, score = 200
            //   837da0ff             | cmp                 dword ptr [ebp - 0x60], -1
            //   0f84e8000000         | je                  0xee
            //   837de400             | cmp                 dword ptr [ebp - 0x1c], 0
            //   750b                 | jne                 0xd
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]

        $sequence_2 = { 7622 8b4d08 51 8b55f8 8b02 50 e8???????? }
            // n = 7, score = 200
            //   7622                 | jbe                 0x24
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { 8b45f8 89148520404000 8b4df8 83c101 894df8 }
            // n = 5, score = 200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   89148520404000       | mov                 dword ptr [eax*4 + 0x404020], edx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   83c101               | add                 ecx, 1
            //   894df8               | mov                 dword ptr [ebp - 8], ecx

        $sequence_4 = { 8945f8 837df810 7d24 8b4dfc 8b5508 0fb7044a 50 }
            // n = 7, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   837df810             | cmp                 dword ptr [ebp - 8], 0x10
            //   7d24                 | jge                 0x26
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0fb7044a             | movzx               eax, word ptr [edx + ecx*2]
            //   50                   | push                eax

        $sequence_5 = { 6a00 ff15???????? 6a00 ff15???????? 68???????? 68???????? e8???????? }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_6 = { 83780400 7418 8b4dfc 8b11 52 e8???????? 83c404 }
            // n = 7, score = 200
            //   83780400             | cmp                 dword ptr [eax + 4], 0
            //   7418                 | je                  0x1a
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_7 = { ff15???????? 6a00 6a00 6a10 8d55ec 52 6a00 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a10                 | push                0x10
            //   8d55ec               | lea                 edx, [ebp - 0x14]
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_8 = { 8945dc 33c9 894de8 894dec 894df0 894df4 894df8 }
            // n = 7, score = 200
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   33c9                 | xor                 ecx, ecx
            //   894de8               | mov                 dword ptr [ebp - 0x18], ecx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   894df8               | mov                 dword ptr [ebp - 8], ecx

        $sequence_9 = { 8b8594fdffff 50 8b8da0fdffff 51 8b95ccfdffff }
            // n = 5, score = 200
            //   8b8594fdffff         | mov                 eax, dword ptr [ebp - 0x26c]
            //   50                   | push                eax
            //   8b8da0fdffff         | mov                 ecx, dword ptr [ebp - 0x260]
            //   51                   | push                ecx
            //   8b95ccfdffff         | mov                 edx, dword ptr [ebp - 0x234]

    condition:
        7 of them and filesize < 49152
}