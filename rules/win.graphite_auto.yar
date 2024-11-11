rule win_graphite_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.graphite."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.graphite"
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
        $sequence_0 = { 81e2ff030000 81e1bf030000 83c940 c1e10a }
            // n = 4, score = 500
            //   81e2ff030000         | mov                 ecx, dword ptr [ebx + 4]
            //   81e1bf030000         | lea                 eax, [esp + 0x38]
            //   83c940               | push                esi
            //   c1e10a               | lea                 esi, [edi + eax*2]

        $sequence_1 = { 7513 33d2 e8???????? 84c0 74e4 }
            // n = 5, score = 500
            //   7513                 | dec                 eax
            //   33d2                 | lea                 ecx, [ebp - 0x29]
            //   e8????????           |                     
            //   84c0                 | mov                 dword ptr [ebp - 0x29], 0x5268795b
            //   74e4                 | mov                 dword ptr [ebp - 0x25], 0x6a75687d

        $sequence_2 = { 85db 7513 33d2 e8???????? }
            // n = 4, score = 500
            //   85db                 | push                0xef
            //   7513                 | mov                 word ptr [ebp - 4], 0xc7cb
            //   33d2                 | push                0xe8
            //   e8????????           |                     

        $sequence_3 = { 7513 33d2 e8???????? 84c0 }
            // n = 4, score = 500
            //   7513                 | mov                 ecx, ebx
            //   33d2                 | dec                 ebp
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, edx

        $sequence_4 = { 85db 7513 33d2 e8???????? 84c0 }
            // n = 5, score = 500
            //   85db                 | dec                 esp
            //   7513                 | mov                 edi, ecx
            //   33d2                 | dec                 eax
            //   e8????????           |                     
            //   84c0                 | test                ecx, ecx

        $sequence_5 = { 81e1bf030000 83c940 c1e10a 0bca }
            // n = 4, score = 500
            //   81e1bf030000         | push                esi
            //   83c940               | mov                 dword ptr [esp + 0x20], eax
            //   c1e10a               | inc                 eax
            //   0bca                 | push                esi

        $sequence_6 = { 33d2 e8???????? 84c0 74e4 }
            // n = 4, score = 500
            //   33d2                 | push                ebp
            //   e8????????           |                     
            //   84c0                 | push                dword ptr [esp + 0x34]
            //   74e4                 | sub                 ebx, dword ptr [ebp + 0x20]

        $sequence_7 = { ff15???????? 33c0 eb05 b801010000 }
            // n = 4, score = 500
            //   ff15????????         |                     
            //   33c0                 | mov                 dword ptr [ebp - 0x58], 0x57255723
            //   eb05                 | mov                 dword ptr [ebp - 0x54], 0x570b572e
            //   b801010000           | mov                 dword ptr [ebp - 0x50], 0x5736571a

        $sequence_8 = { 85db 7513 33d2 e8???????? 84c0 74e4 }
            // n = 6, score = 500
            //   85db                 | movups              xmm0, xmmword ptr [edi]
            //   7513                 | movd                eax, xmm0
            //   33d2                 | dec                 eax
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, ebx
            //   74e4                 | dec                 eax

        $sequence_9 = { 81e2ff030000 81e1bf030000 83c940 c1e10a 0bca }
            // n = 5, score = 500
            //   81e2ff030000         | lea                 ebx, [eax - 1]
            //   81e1bf030000         | dec                 ecx
            //   83c940               | mov                 ecx, esi
            //   c1e10a               | dec                 esp
            //   0bca                 | mov                 ecx, edi

    condition:
        7 of them and filesize < 98304
}