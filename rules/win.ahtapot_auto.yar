rule win_ahtapot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.ahtapot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ahtapot"
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
        $sequence_0 = { 8945e8 668945ec e8???????? 80bd47c5ffff00 0f8480000000 0fbe45e4 0fbe4de5 }
            // n = 7, score = 100
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   e8????????           |                     
            //   80bd47c5ffff00       | cmp                 byte ptr [ebp - 0x3ab9], 0
            //   0f8480000000         | je                  0x86
            //   0fbe45e4             | movsx               eax, byte ptr [ebp - 0x1c]
            //   0fbe4de5             | movsx               ecx, byte ptr [ebp - 0x1b]

        $sequence_1 = { ebde 8bc8 83e01f c1f905 8b0c8dc0f24200 c1e006 0fbe440104 }
            // n = 7, score = 100
            //   ebde                 | jmp                 0xffffffe0
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8dc0f24200       | mov                 ecx, dword ptr [ecx*4 + 0x42f2c0]
            //   c1e006               | shl                 eax, 6
            //   0fbe440104           | movsx               eax, byte ptr [ecx + eax + 4]

        $sequence_2 = { 66399de0dbffff 742d 8d8de0dbffff 8da42400000000 0fb701 83f868 7406 }
            // n = 7, score = 100
            //   66399de0dbffff       | cmp                 word ptr [ebp - 0x2420], bx
            //   742d                 | je                  0x2f
            //   8d8de0dbffff         | lea                 ecx, [ebp - 0x2420]
            //   8da42400000000       | lea                 esp, [esp]
            //   0fb701               | movzx               eax, word ptr [ecx]
            //   83f868               | cmp                 eax, 0x68
            //   7406                 | je                  8

        $sequence_3 = { 8b4508 c745fcffffffff e8???????? a3???????? 85c0 741b }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   e8????????           |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d

        $sequence_4 = { 50 8d8db4f9ffff 68???????? 51 ffd6 6a44 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   8d8db4f9ffff         | lea                 ecx, [ebp - 0x64c]
            //   68????????           |                     
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   6a44                 | push                0x44

        $sequence_5 = { 8bfe 46 6683bc7588fdffff00 8d847588fdffff 75e5 }
            // n = 5, score = 100
            //   8bfe                 | mov                 edi, esi
            //   46                   | inc                 esi
            //   6683bc7588fdffff00     | cmp    word ptr [ebp + esi*2 - 0x278], 0
            //   8d847588fdffff       | lea                 eax, [ebp + esi*2 - 0x278]
            //   75e5                 | jne                 0xffffffe7

        $sequence_6 = { c6470801 33c0 eb05 b800000001 a3???????? 3bc3 744c }
            // n = 7, score = 100
            //   c6470801             | mov                 byte ptr [edi + 8], 1
            //   33c0                 | xor                 eax, eax
            //   eb05                 | jmp                 7
            //   b800000001           | mov                 eax, 0x1000000
            //   a3????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   744c                 | je                  0x4e

        $sequence_7 = { 8d8528ecffff 8bff 668b10 663b11 751e 6685d2 7415 }
            // n = 7, score = 100
            //   8d8528ecffff         | lea                 eax, [ebp - 0x13d8]
            //   8bff                 | mov                 edi, edi
            //   668b10               | mov                 dx, word ptr [eax]
            //   663b11               | cmp                 dx, word ptr [ecx]
            //   751e                 | jne                 0x20
            //   6685d2               | test                dx, dx
            //   7415                 | je                  0x17

        $sequence_8 = { 52 ff15???????? 8d85c4fdffff 50 ffd6 57 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8d85c4fdffff         | lea                 eax, [ebp - 0x23c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   57                   | push                edi

        $sequence_9 = { 0f8494000000 8d85bcf7ffff 8d5002 8d642400 668b08 83c002 }
            // n = 6, score = 100
            //   0f8494000000         | je                  0x9a
            //   8d85bcf7ffff         | lea                 eax, [ebp - 0x844]
            //   8d5002               | lea                 edx, [eax + 2]
            //   8d642400             | lea                 esp, [esp]
            //   668b08               | mov                 cx, word ptr [eax]
            //   83c002               | add                 eax, 2

    condition:
        7 of them and filesize < 430080
}