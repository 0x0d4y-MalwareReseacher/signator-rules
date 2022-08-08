rule win_grateful_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.grateful_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grateful_pos"
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
        $sequence_0 = { e8???????? 83f801 7510 e8???????? e8???????? }
            // n = 5, score = 600
            //   e8????????           |                     
            //   83f801               | cmp                 eax, 1
            //   7510                 | jne                 0x12
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_1 = { b8feffffff eb1a b8fdffffff eb13 }
            // n = 4, score = 600
            //   b8feffffff           | mov                 eax, 0xfffffffe
            //   eb1a                 | jmp                 0x1c
            //   b8fdffffff           | mov                 eax, 0xfffffffd
            //   eb13                 | jmp                 0x15

        $sequence_2 = { b8fdffffff eb13 b8fcffffff eb0c }
            // n = 4, score = 600
            //   b8fdffffff           | mov                 eax, 0xfffffffd
            //   eb13                 | jmp                 0x15
            //   b8fcffffff           | mov                 eax, 0xfffffffc
            //   eb0c                 | jmp                 0xe

        $sequence_3 = { 7411 e8???????? e8???????? 33c0 e9???????? }
            // n = 5, score = 600
            //   7411                 | je                  0x13
            //   e8????????           |                     
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_4 = { eb07 b8fcffffff eb02 33c0 }
            // n = 4, score = 600
            //   eb07                 | jmp                 9
            //   b8fcffffff           | mov                 eax, 0xfffffffc
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { e8???????? 99 b980ee3600 f7f9 }
            // n = 4, score = 600
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b980ee3600           | mov                 ecx, 0x36ee80
            //   f7f9                 | idiv                ecx

        $sequence_6 = { 7407 b8f6ffffff eb02 33c0 }
            // n = 4, score = 600
            //   7407                 | je                  9
            //   b8f6ffffff           | mov                 eax, 0xfffffff6
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax

        $sequence_7 = { 83c201 8955fc 837dfc45 7332 8b4508 }
            // n = 5, score = 500
            //   83c201               | dec                 eax
            //   8955fc               | mov                 edi, eax
            //   837dfc45             | xor                 eax, eax
            //   7332                 | dec                 eax
            //   8b4508               | mov                 eax, dword ptr [esp + 0x20]

        $sequence_8 = { 83f04d 8845df b901000000 6bc92c }
            // n = 4, score = 500
            //   83f04d               | xor                 eax, 0x4d
            //   8845df               | mov                 byte ptr [ebp - 0x21], al
            //   b901000000           | mov                 ecx, 1
            //   6bc92c               | imul                ecx, ecx, 0x2c

        $sequence_9 = { 8b8ddcfbffff 83c101 898ddcfbffff 83bddcfbffff0f 7d5e }
            // n = 5, score = 500
            //   8b8ddcfbffff         | cmp                 dword ptr [eax + 0x20], 0
            //   83c101               | je                  0x1e
            //   898ddcfbffff         | dec                 eax
            //   83bddcfbffff0f       | mov                 eax, dword ptr [esp + 0x20]
            //   7d5e                 | add                 edx, 1

        $sequence_10 = { 0f8dad000000 8b5510 52 e8???????? 83c404 50 8b4510 }
            // n = 7, score = 500
            //   0f8dad000000         | push                edx
            //   8b5510               | lea                 eax, [ebp - 0x28c]
            //   52                   | push                eax
            //   e8????????           |                     
            //   83c404               | lea                 ecx, [ebp - 0x18c]
            //   50                   | push                0xf
            //   8b4510               | mov                 eax, dword ptr [ebp - 0x420]

        $sequence_11 = { 51 e8???????? 83c40c eb29 8b15???????? 52 8b4508 }
            // n = 7, score = 500
            //   51                   | mov                 ecx, dword ptr [ebp - 0x424]
            //   e8????????           |                     
            //   83c40c               | add                 ecx, 1
            //   eb29                 | mov                 dword ptr [ebp - 0x424], ecx
            //   8b15????????         |                     
            //   52                   | cmp                 dword ptr [ebp - 0x424], 0xf
            //   8b4508               | jge                 0x70

        $sequence_12 = { 0fb65520 83fa01 7525 6a05 68???????? 8b85e0fbffff }
            // n = 6, score = 500
            //   0fb65520             | dec                 eax
            //   83fa01               | mov                 ecx, dword ptr [eax + 0x18]
            //   7525                 | dec                 eax
            //   6a05                 | mov                 eax, dword ptr [esp + 0x20]
            //   68????????           |                     
            //   8b85e0fbffff         | dec                 eax

        $sequence_13 = { 52 8d8574fdffff 50 8d8d74feffff }
            // n = 4, score = 500
            //   52                   | mov                 dword ptr [ebp - 4], edx
            //   8d8574fdffff         | cmp                 dword ptr [ebp - 4], 0x45
            //   50                   | jae                 0x38
            //   8d8d74feffff         | mov                 eax, dword ptr [ebp + 8]

        $sequence_14 = { 6a0f 8b85e0fbffff 83e80f 50 8d4de4 }
            // n = 5, score = 500
            //   6a0f                 | movzx               edx, byte ptr [ebp + 0x20]
            //   8b85e0fbffff         | cmp                 edx, 1
            //   83e80f               | jne                 0x27
            //   50                   | push                5
            //   8d4de4               | mov                 eax, dword ptr [ebp - 0x420]

        $sequence_15 = { b900040000 f3aa 0fb605???????? 88842460040000 488d842461040000 488bf8 33c0 }
            // n = 7, score = 200
            //   b900040000           | mov                 ecx, 0x400
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   0fb605????????       |                     
            //   88842460040000       | mov                 byte ptr [esp + 0x460], al
            //   488d842461040000     | dec                 eax
            //   488bf8               | lea                 eax, [esp + 0x461]
            //   33c0                 | dec                 eax

    condition:
        7 of them and filesize < 3964928
}