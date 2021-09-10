rule win_unidentified_078_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.unidentified_078."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_078"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 8b06 83f801 0f85defdffff b91f000000 e8???????? 8b06 }
            // n = 6, score = 200
            //   8b06                 | movsd               qword ptr [esp + 0x20], xmm6
            //   83f801               | nop                 
            //   0f85defdffff         | movaps              xmm6, xmmword ptr [esp + 0x40]
            //   b91f000000           | xor                 eax, eax
            //   e8????????           |                     
            //   8b06                 | mov                 ecx, eax

        $sequence_1 = { 8b443dfc 89443bfc e9???????? 31f6 }
            // n = 4, score = 200
            //   8b443dfc             | add                 ecx, 2
            //   89443bfc             | dec                 ecx
            //   e9????????           |                     
            //   31f6                 | mov                 ecx, edx

        $sequence_2 = { 83eb5b 83fb01 0f8720010000 eb0f b901003b00 }
            // n = 5, score = 200
            //   83eb5b               | mov                 eax, ebx
            //   83fb01               | dec                 eax
            //   0f8720010000         | mov                 ecx, ebx
            //   eb0f                 | dec                 ecx
            //   b901003b00           | sar                 eax, 6

        $sequence_3 = { 0f8551ffffff 8b5608 85d2 751d 8b560c }
            // n = 5, score = 200
            //   0f8551ffffff         | dec                 eax
            //   8b5608               | mov                 eax, dword ptr [ebx + 8]
            //   85d2                 | xor                 esi, esi
            //   751d                 | dec                 eax
            //   8b560c               | lea                 edi, dword ptr [eax - 1]

        $sequence_4 = { 8905???????? 85c9 0f84c3000000 8b15???????? 85d2 }
            // n = 5, score = 200
            //   8905????????         |                     
            //   85c9                 | dec                 eax
            //   0f84c3000000         | mov                 dword ptr [edx + 0x10], eax
            //   8b15????????         |                     
            //   85d2                 | je                  0x4e9

        $sequence_5 = { 80fa0d 0f8421010000 80fa1b 0f8576010000 ba02000000 }
            // n = 5, score = 200
            //   80fa0d               | cmp                 ebx, 7
            //   0f8421010000         | dec                 eax
            //   80fa1b               | cmovl               ebx, eax
            //   0f8576010000         | jns                 0xe4
            //   ba02000000           | inc                 edx

        $sequence_6 = { 3d910000c0 7763 3d8d0000c0 737b 3d080000c0 0f8405010000 0f87cb000000 }
            // n = 7, score = 200
            //   3d910000c0           | dec                 esp
            //   7763                 | mov                 ecx, edi
            //   3d8d0000c0           | mov                 edx, 0x50
            //   737b                 | dec                 eax
            //   3d080000c0           | mov                 ebp, eax
            //   0f8405010000         | xor                 edx, edx
            //   0f87cb000000         | dec                 ebp

        $sequence_7 = { 0f87cb000000 3d02000080 0f84f4000000 3d050000c0 0f85c3000000 31d2 b90b000000 }
            // n = 7, score = 200
            //   0f87cb000000         | dec                 eax
            //   3d02000080           | mov                 dword ptr [esp + 0x38], ecx
            //   0f84f4000000         | jmp                 0x3d1
            //   3d050000c0           | dec                 ecx
            //   0f85c3000000         | dec                 eax
            //   31d2                 | lea                 eax, dword ptr [edx + ecx]
            //   b90b000000           | dec                 eax

        $sequence_8 = { 80fa26 0f8f18010000 80fa23 0f8d82010000 ba02000000 }
            // n = 5, score = 200
            //   80fa26               | test                eax, eax
            //   0f8f18010000         | jl                  0x19e
            //   80fa23               | dec                 eax
            //   0f8d82010000         | mov                 edx, dword ptr [edi + ebx*8]
            //   ba02000000           | dec                 esp

        $sequence_9 = { e9???????? ebc0 ebbe ebbc }
            // n = 4, score = 200
            //   e9????????           |                     
            //   ebc0                 | dec                 eax
            //   ebbe                 | test                eax, eax
            //   ebbc                 | dec                 eax

    condition:
        7 of them and filesize < 688128
}