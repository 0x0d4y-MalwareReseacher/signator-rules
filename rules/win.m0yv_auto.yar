rule win_m0yv_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.m0yv."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.m0yv"
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
        $sequence_0 = { 55 53 4883ec28 bb02000000 4885c9 0f84e1010000 4889d6 }
            // n = 7, score = 100
            //   55                   | ror                 edi, cl
            //   53                   | dec                 eax
            //   4883ec28             | lea                 ecx, [0xfffc56f2]
            //   bb02000000           | dec                 ecx
            //   4885c9               | xor                 edi, eax
            //   0f84e1010000         | dec                 edx
            //   4889d6               | xchg                dword ptr [ecx + esi*8 + 0x5a7b0], edi

        $sequence_1 = { 41884027 418ac1 c0e802 2401 41884025 }
            // n = 5, score = 100
            //   41884027             | shr                 eax, 0x14
            //   418ac1               | lea                 eax, [eax + ecx*2]
            //   c0e802               | mov                 byte ptr [edi + 0xd], al
            //   2401                 | and                 edx, 0xfc000000
            //   41884025             | sub                 ebx, edx

        $sequence_2 = { 6690 488b09 488b0cc1 49890cc4 4883c001 488b4b08 8b5108 }
            // n = 7, score = 100
            //   6690                 | mov                 dword ptr [ebx + 4], edx
            //   488b09               | inc                 ebp
            //   488b0cc1             | mov                 dword ptr [ebx + 8], esp
            //   49890cc4             | inc                 ebp
            //   4883c001             | mov                 dword ptr [ebx + 0xc], esi
            //   488b4b08             | inc                 ebp
            //   8b5108               | mov                 dword ptr [ebx + 0x10], ebp

        $sequence_3 = { 4c01e7 4881c700001000 4989fa 4881e70000e0ff 4829fe 49c1fd15 }
            // n = 6, score = 100
            //   4c01e7               | lea                 eax, [edx]
            //   4881c700001000       | dec                 ecx
            //   4989fa               | lea                 ebp, [esp + edx]
            //   4881e70000e0ff       | dec                 eax
            //   4829fe               | add                 ebp, 0x2000000
            //   49c1fd15             | dec                 eax

        $sequence_4 = { 400fb6c7 4002d7 40887b62 8893a6000000 8a0c28 884b66 0fb65361 }
            // n = 7, score = 100
            //   400fb6c7             | dec                 eax
            //   4002d7               | mov                 ecx, esi
            //   40887b62             | dec                 eax
            //   8893a6000000         | lea                 edx, [0x15a7f]
            //   8a0c28               | dec                 eax
            //   884b66               | mov                 ecx, esi
            //   0fb65361             | inc                 ebp

        $sequence_5 = { 48635720 4889f9 4c8b4c2458 4c89cd 480fafea }
            // n = 5, score = 100
            //   48635720             | mov                 ebp, eax
            //   4889f9               | shr                 eax, 1
            //   4c8b4c2458           | and                 eax, 0x1fffff
            //   4c89cd               | dec                 eax
            //   480fafea             | mov                 dword ptr [esp + 0x28], eax

        $sequence_6 = { 89c1 e8???????? 488b5708 85c0 7415 4c89e1 ffd2 }
            // n = 7, score = 100
            //   89c1                 | lea                 esi, [eax + eax*8]
            //   e8????????           |                     
            //   488b5708             | dec                 ebp
            //   85c0                 | lea                 esi, [eax + esi*2]
            //   7415                 | dec                 esp
            //   4c89e1               | mov                 esi, esi
            //   ffd2                 | dec                 eax

        $sequence_7 = { 75c0 0fb6c0 8b0484 4931c2 4d89d6 49c1ee08 31f6 }
            // n = 7, score = 100
            //   75c0                 | mov                 eax, edx
            //   0fb6c0               | and                 eax, 0x1fffff
            //   8b0484               | dec                 ecx
            //   4931c2               | shr                 esi, 0xd
            //   4d89d6               | inc                 esp
            //   49c1ee08             | mov                 byte ptr [edx + 0x14], dh
            //   31f6                 | mov                 byte ptr [edx + 0x15], bl

        $sequence_8 = { eb1d 488d050b000200 ffcb 488d0c9b 488d0cc8 ff15???????? ff0d???????? }
            // n = 7, score = 100
            //   eb1d                 | test                ecx, ecx
            //   488d050b000200       | je                  0xf8f
            //   ffcb                 | dec                 eax
            //   488d0c9b             | mov                 esi, edx
            //   488d0cc8             | dec                 eax
            //   ff15????????         |                     
            //   ff0d????????         |                     

        $sequence_9 = { 80fb0a 72de 83f810 75e0 8d599f bea9ffffff 80fb06 }
            // n = 7, score = 100
            //   80fb0a               | mov                 edi, dword ptr [ecx + 0x10]
            //   72de                 | inc                 esp
            //   83f810               | mov                 esp, dword ptr [edx + 0xc]
            //   75e0                 | inc                 esp
            //   8d599f               | mov                 ebp, dword ptr [edx + 0x10]
            //   bea9ffffff           | inc                 esp
            //   80fb06               | mov                 esi, dword ptr [edx + 0x14]

    condition:
        7 of them and filesize < 779264
}