rule win_chainshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.chainshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chainshot"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8bc6 f7e1 c1ea0f 69c20f00ffff }
            // n = 4, score = 300
            //   8bc6                 | dec                 eax
            //   f7e1                 | mov                 edx, dword ptr [esp + 0x38]
            //   c1ea0f               | test                ecx, ecx
            //   69c20f00ffff         | je                  0x1e0

        $sequence_1 = { 84c0 7507 b901050080 ebbd b901020000 }
            // n = 5, score = 300
            //   84c0                 | jne                 0x1740
            //   7507                 | mov                 esi, 0x800000aa
            //   b901050080           | push                edi
            //   ebbd                 | mov                 edi, dword ptr [ebp + 0xc]
            //   b901020000           | jne                 0x174b

        $sequence_2 = { 744a ffc8 0f8495000000 ffc8 0f85270e0000 }
            // n = 5, score = 300
            //   744a                 | mov                 edx, 4
            //   ffc8                 | lea                 ecx, [ebp - 0x1c]
            //   0f8495000000         | push                eax
            //   ffc8                 | push                esi
            //   0f85270e0000         | push                1

        $sequence_3 = { c7041f488b5424 c6441f0410 83c705 c7041f4c8b4424 c6441f0418 83c705 c7041f4c8b4c24 }
            // n = 7, score = 300
            //   c7041f488b5424       | je                  0x138b
            //   c6441f0410           | test                eax, eax
            //   83c705               | je                  0x138b
            //   c7041f4c8b4424       | cmp                 eax, 3
            //   c6441f0418           | je                  0x138b
            //   83c705               | test                edi, edi
            //   c7041f4c8b4c24       | je                  0x1325

        $sequence_4 = { 7408 ffd0 8905???????? bb68000080 }
            // n = 4, score = 300
            //   7408                 | movups              xmm0, xmmword ptr [esp + 0x30]
            //   ffd0                 | movdqu              xmmword ptr [ebp + 0x1d8], xmm0
            //   8905????????         |                     
            //   bb68000080           | dec                 esp

        $sequence_5 = { 0f84740b0000 83f803 0f84bb0e0000 83f801 0f8580000000 }
            // n = 5, score = 300
            //   0f84740b0000         | xor                 ecx, ecx
            //   83f803               | inc                 eax
            //   0f84bb0e0000         | test                bh, bh
            //   83f801               | jne                 0x1854
            //   0f8580000000         | xor                 ecx, ecx

        $sequence_6 = { 83e827 0f844e0e0000 ffc8 0f84d8110000 }
            // n = 4, score = 300
            //   83e827               | mov                 esi, 0x80000062
            //   0f844e0e0000         | je                  0x3f
            //   ffc8                 | call                eax
            //   0f84d8110000         | mov                 esi, 0x80000063

        $sequence_7 = { 740c 8bd0 b90d0e0080 e9???????? }
            // n = 4, score = 300
            //   740c                 | and                 dword ptr [ebp + 0x5d0], esi
            //   8bd0                 | inc                 ebp
            //   b90d0e0080           | xor                 ecx, ecx
            //   e9????????           |                     

        $sequence_8 = { 85c0 7525 8bd3 b908080080 eb0e b909000080 eb05 }
            // n = 7, score = 300
            //   85c0                 | dec                 eax
            //   7525                 | mov                 ecx, dword ptr [esp + 0x20]
            //   8bd3                 | movzx               eax, bp
            //   b908080080           | cmp                 dx, bp
            //   eb0e                 | jne                 0x3ec
            //   b909000080           | mov                 ebx, 0x80000018
            //   eb05                 | jmp                 0x413

        $sequence_9 = { 32db e9???????? 84db 0f85d6000000 }
            // n = 4, score = 300
            //   32db                 | sar                 eax, 3
            //   e9????????           |                     
            //   84db                 | dec                 ecx
            //   0f85d6000000         | sub                 eax, edi

    condition:
        7 of them and filesize < 802816
}