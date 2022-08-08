rule win_synflooder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.synflooder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.synflooder"
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
        $sequence_0 = { 742d 8b480c 8b11 0fb60a }
            // n = 4, score = 200
            //   742d                 | je                  0x2f
            //   8b480c               | mov                 ecx, dword ptr [eax + 0xc]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   0fb60a               | movzx               ecx, byte ptr [edx]

        $sequence_1 = { 0fb60b 40 80b910ee400000 74e8 8a13 0fb6ca 0fbe8910ee4000 }
            // n = 7, score = 200
            //   0fb60b               | movzx               ecx, byte ptr [ebx]
            //   40                   | inc                 eax
            //   80b910ee400000       | cmp                 byte ptr [ecx + 0x40ee10], 0
            //   74e8                 | je                  0xffffffea
            //   8a13                 | mov                 dl, byte ptr [ebx]
            //   0fb6ca               | movzx               ecx, dl
            //   0fbe8910ee4000       | movsx               ecx, byte ptr [ecx + 0x40ee10]

        $sequence_2 = { ff15???????? 83f8ff 743e 8d95f8fbffff 52 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   743e                 | je                  0x40
            //   8d95f8fbffff         | lea                 edx, [ebp - 0x408]
            //   52                   | push                edx

        $sequence_3 = { 83e61f 8d3c8520fc4000 8b07 c1e606 f644300401 7436 }
            // n = 6, score = 200
            //   83e61f               | and                 esi, 0x1f
            //   8d3c8520fc4000       | lea                 edi, [eax*4 + 0x40fc20]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   c1e606               | shl                 esi, 6
            //   f644300401           | test                byte ptr [eax + esi + 4], 1
            //   7436                 | je                  0x38

        $sequence_4 = { 68ff000000 e8???????? cc e8???????? 50 e8???????? }
            // n = 6, score = 200
            //   68ff000000           | push                0xff
            //   e8????????           |                     
            //   cc                   | int3                
            //   e8????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 68ff000000 6a03 6a02 ff15???????? 8bf0 89742414 }
            // n = 6, score = 200
            //   68ff000000           | push                0xff
            //   6a03                 | push                3
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   89742414             | mov                 dword ptr [esp + 0x14], esi

        $sequence_6 = { 8bfe 53 8d1c8520fc4000 8b03 83e71f c1e706 8a4c3824 }
            // n = 7, score = 200
            //   8bfe                 | mov                 edi, esi
            //   53                   | push                ebx
            //   8d1c8520fc4000       | lea                 ebx, [eax*4 + 0x40fc20]
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   83e71f               | and                 edi, 0x1f
            //   c1e706               | shl                 edi, 6
            //   8a4c3824             | mov                 cl, byte ptr [eax + edi + 0x24]

        $sequence_7 = { 8d42e0 3c58 770f 0fbec2 0fbe8038a54000 }
            // n = 5, score = 200
            //   8d42e0               | lea                 eax, [edx - 0x20]
            //   3c58                 | cmp                 al, 0x58
            //   770f                 | ja                  0x11
            //   0fbec2               | movsx               eax, dl
            //   0fbe8038a54000       | movsx               eax, byte ptr [eax + 0x40a538]

        $sequence_8 = { 7414 8bc8 83e01f c1f905 c1e006 03048d20fc4000 eb02 }
            // n = 7, score = 200
            //   7414                 | je                  0x16
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   c1e006               | shl                 eax, 6
            //   03048d20fc4000       | add                 eax, dword ptr [ecx*4 + 0x40fc20]
            //   eb02                 | jmp                 4

        $sequence_9 = { c3 8bff 56 57 33f6 bf???????? 833cf584e4400001 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   56                   | push                esi
            //   57                   | push                edi
            //   33f6                 | xor                 esi, esi
            //   bf????????           |                     
            //   833cf584e4400001     | cmp                 dword ptr [esi*8 + 0x40e484], 1

    condition:
        7 of them and filesize < 163840
}