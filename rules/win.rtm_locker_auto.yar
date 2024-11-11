rule win_rtm_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.rtm_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rtm_locker"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { c1fe06 e8???????? 59 83e03f 59 6bc838 8b04b5500f4200 }
            // n = 7, score = 100
            //   c1fe06               | sar                 esi, 6
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   83e03f               | and                 eax, 0x3f
            //   59                   | pop                 ecx
            //   6bc838               | imul                ecx, eax, 0x38
            //   8b04b5500f4200       | mov                 eax, dword ptr [esi*4 + 0x420f50]

        $sequence_1 = { ff15???????? 8b1d???????? 89442410 85f6 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   85f6                 | test                esi, esi

        $sequence_2 = { 8945e4 03c6 8945d0 33c7 8b75ec c1c007 8945f8 }
            // n = 7, score = 100
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   03c6                 | add                 eax, esi
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   33c7                 | xor                 eax, edi
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   c1c007               | rol                 eax, 7
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_3 = { 33ff 3bf0 7711 8d8550ffffff 8945d8 8d463c 3b45d8 }
            // n = 7, score = 100
            //   33ff                 | xor                 edi, edi
            //   3bf0                 | cmp                 esi, eax
            //   7711                 | ja                  0x13
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8d463c               | lea                 eax, [esi + 0x3c]
            //   3b45d8               | cmp                 eax, dword ptr [ebp - 0x28]

        $sequence_4 = { 0f28cb 8344242810 660f62d0 660f6ae0 0f104630 89542420 }
            // n = 6, score = 100
            //   0f28cb               | movaps              xmm1, xmm3
            //   8344242810           | add                 dword ptr [esp + 0x28], 0x10
            //   660f62d0             | punpckldq           xmm2, xmm0
            //   660f6ae0             | punpckhdq           xmm4, xmm0
            //   0f104630             | movups              xmm0, xmmword ptr [esi + 0x30]
            //   89542420             | mov                 dword ptr [esp + 0x20], edx

        $sequence_5 = { 660fefc8 0f104220 0f1149d1 0f104e20 660fefc8 0f104230 0f1149e1 }
            // n = 7, score = 100
            //   660fefc8             | pxor                xmm1, xmm0
            //   0f104220             | movups              xmm0, xmmword ptr [edx + 0x20]
            //   0f1149d1             | movups              xmmword ptr [ecx - 0x2f], xmm1
            //   0f104e20             | movups              xmm1, xmmword ptr [esi + 0x20]
            //   660fefc8             | pxor                xmm1, xmm0
            //   0f104230             | movups              xmm0, xmmword ptr [edx + 0x30]
            //   0f1149e1             | movups              xmmword ptr [ecx - 0x1f], xmm1

        $sequence_6 = { 23cb c1fe1f 8b5dd0 23ce 8b75e8 }
            // n = 5, score = 100
            //   23cb                 | and                 ecx, ebx
            //   c1fe1f               | sar                 esi, 0x1f
            //   8b5dd0               | mov                 ebx, dword ptr [ebp - 0x30]
            //   23ce                 | and                 ecx, esi
            //   8b75e8               | mov                 esi, dword ptr [ebp - 0x18]

        $sequence_7 = { 50 ffd6 833d????????00 8b3d???????? 7442 6a00 8d442414 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   833d????????00       |                     
            //   8b3d????????         |                     
            //   7442                 | je                  0x44
            //   6a00                 | push                0
            //   8d442414             | lea                 eax, [esp + 0x14]

        $sequence_8 = { 68???????? 57 ff15???????? 8d85a0fdffff }
            // n = 4, score = 100
            //   68????????           |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8d85a0fdffff         | lea                 eax, [ebp - 0x260]

        $sequence_9 = { 0f108570feffff 0f118508ffffff e8???????? 8d8d30feffff e8???????? 8d8d30feffff e8???????? }
            // n = 7, score = 100
            //   0f108570feffff       | movups              xmm0, xmmword ptr [ebp - 0x190]
            //   0f118508ffffff       | movups              xmmword ptr [ebp - 0xf8], xmm0
            //   e8????????           |                     
            //   8d8d30feffff         | lea                 ecx, [ebp - 0x1d0]
            //   e8????????           |                     
            //   8d8d30feffff         | lea                 ecx, [ebp - 0x1d0]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 598016
}