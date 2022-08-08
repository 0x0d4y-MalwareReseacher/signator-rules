rule win_betabot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.betabot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.betabot"
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
        $sequence_0 = { 894708 83670400 66891f a1???????? 894710 a1???????? }
            // n = 6, score = 400
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   83670400             | and                 dword ptr [edi + 4], 0
            //   66891f               | mov                 word ptr [edi], bx
            //   a1????????           |                     
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   a1????????           |                     

        $sequence_1 = { 7426 57 33ff 397508 7619 8b04b3 83f801 }
            // n = 7, score = 400
            //   7426                 | je                  0x28
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   397508               | cmp                 dword ptr [ebp + 8], esi
            //   7619                 | jbe                 0x1b
            //   8b04b3               | mov                 eax, dword ptr [ebx + esi*4]
            //   83f801               | cmp                 eax, 1

        $sequence_2 = { 0fafc1 c3 85c0 7406 6683383c 7403 33c0 }
            // n = 7, score = 400
            //   0fafc1               | imul                eax, ecx
            //   c3                   | ret                 
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8
            //   6683383c             | cmp                 word ptr [eax], 0x3c
            //   7403                 | je                  5
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 8b7508 8b4618 8945f0 58 5e 56 50 }
            // n = 7, score = 400
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8b4618               | mov                 eax, dword ptr [esi + 0x18]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   58                   | pop                 eax
            //   5e                   | pop                 esi
            //   56                   | push                esi
            //   50                   | push                eax

        $sequence_4 = { ff760c e8???????? 8d45f8 50 ff75f8 8b460c 83e805 }
            // n = 7, score = 400
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   e8????????           |                     
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   83e805               | sub                 eax, 5

        $sequence_5 = { 33c0 e9???????? 68d0020000 e8???????? 8985b4fcffff 83bdb4fcffff00 }
            // n = 6, score = 400
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   68d0020000           | push                0x2d0
            //   e8????????           |                     
            //   8985b4fcffff         | mov                 dword ptr [ebp - 0x34c], eax
            //   83bdb4fcffff00       | cmp                 dword ptr [ebp - 0x34c], 0

        $sequence_6 = { e9???????? 837d0800 7426 837d0c00 7413 8b450c 0fb700 }
            // n = 7, score = 400
            //   e9????????           |                     
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7426                 | je                  0x28
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7413                 | je                  0x15
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   0fb700               | movzx               eax, word ptr [eax]

        $sequence_7 = { 7504 6a06 58 c3 68c0510000 e8???????? a3???????? }
            // n = 7, score = 400
            //   7504                 | jne                 6
            //   6a06                 | push                6
            //   58                   | pop                 eax
            //   c3                   | ret                 
            //   68c0510000           | push                0x51c0
            //   e8????????           |                     
            //   a3????????           |                     

        $sequence_8 = { 6a30 53 8d442418 50 e8???????? e8???????? 3c01 }
            // n = 7, score = 400
            //   6a30                 | push                0x30
            //   53                   | push                ebx
            //   8d442418             | lea                 eax, [esp + 0x18]
            //   50                   | push                eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   3c01                 | cmp                 al, 1

        $sequence_9 = { 8b45fc 83e803 eb03 6afe 58 c9 c20400 }
            // n = 7, score = 400
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83e803               | sub                 eax, 3
            //   eb03                 | jmp                 5
            //   6afe                 | push                -2
            //   58                   | pop                 eax
            //   c9                   | leave               
            //   c20400               | ret                 4

    condition:
        7 of them and filesize < 835584
}