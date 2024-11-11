rule win_darkme_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.darkme."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkme"
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
        $sequence_0 = { 66c745b40000 8b4dd0 894d88 c745d000000000 8d55b4 52 8b45d8 }
            // n = 7, score = 100
            //   66c745b40000         | mov                 word ptr [ebp - 0x4c], 0
            //   8b4dd0               | mov                 ecx, dword ptr [ebp - 0x30]
            //   894d88               | mov                 dword ptr [ebp - 0x78], ecx
            //   c745d000000000       | mov                 dword ptr [ebp - 0x30], 0
            //   8d55b4               | lea                 edx, [ebp - 0x4c]
            //   52                   | push                edx
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]

        $sequence_1 = { c745f8???????? c745fc00000000 8b7508 8b06 56 ff5004 8b7d0c }
            // n = 7, score = 100
            //   c745f8????????       |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   56                   | push                esi
            //   ff5004               | call                dword ptr [eax + 4]
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]

        $sequence_2 = { 89856cffffff c78564ffffff08000000 8d8564ffffff 50 8b4d08 83c134 51 }
            // n = 7, score = 100
            //   89856cffffff         | mov                 dword ptr [ebp - 0x94], eax
            //   c78564ffffff08000000     | mov    dword ptr [ebp - 0x9c], 8
            //   8d8564ffffff         | lea                 eax, [ebp - 0x9c]
            //   50                   | push                eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   83c134               | add                 ecx, 0x34
            //   51                   | push                ecx

        $sequence_3 = { 8b4ddc 51 e8???????? 898520ffffff ff15???????? 8b55bc 52 }
            // n = 7, score = 100
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   898520ffffff         | mov                 dword ptr [ebp - 0xe0], eax
            //   ff15????????         |                     
            //   8b55bc               | mov                 edx, dword ptr [ebp - 0x44]
            //   52                   | push                edx

        $sequence_4 = { ff15???????? 898520ffffff 8d4dbc 51 8b9520ffffff 8b02 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   898520ffffff         | mov                 dword ptr [ebp - 0xe0], eax
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   51                   | push                ecx
            //   8b9520ffffff         | mov                 edx, dword ptr [ebp - 0xe0]
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_5 = { 8b85ecfeffff 50 ff15???????? 89856cfeffff eb0a c7856cfeffff00000000 8d8d7cffffff }
            // n = 7, score = 100
            //   8b85ecfeffff         | mov                 eax, dword ptr [ebp - 0x114]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   89856cfeffff         | mov                 dword ptr [ebp - 0x194], eax
            //   eb0a                 | jmp                 0xc
            //   c7856cfeffff00000000     | mov    dword ptr [ebp - 0x194], 0
            //   8d8d7cffffff         | lea                 ecx, [ebp - 0x84]

        $sequence_6 = { ff15???????? 8945d0 c745c808000000 8d4dc8 51 8b5508 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   c745c808000000       | mov                 dword ptr [ebp - 0x38], 8
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   51                   | push                ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]

        $sequence_7 = { 68???????? ff15???????? 898574ffffff c745fc01000000 c745fc02000000 6aff ff15???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   898574ffffff         | mov                 dword ptr [ebp - 0x8c], eax
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   c745fc02000000       | mov                 dword ptr [ebp - 4], 2
            //   6aff                 | push                -1
            //   ff15????????         |                     

        $sequence_8 = { eb0a c78558feffff00000000 8d459c 50 8d4da0 51 }
            // n = 6, score = 100
            //   eb0a                 | jmp                 0xc
            //   c78558feffff00000000     | mov    dword ptr [ebp - 0x1a8], 0
            //   8d459c               | lea                 eax, [ebp - 0x64]
            //   50                   | push                eax
            //   8d4da0               | lea                 ecx, [ebp - 0x60]
            //   51                   | push                ecx

        $sequence_9 = { 8d55b0 52 8d4590 50 ffd6 50 8d8d10ffffff }
            // n = 7, score = 100
            //   8d55b0               | lea                 edx, [ebp - 0x50]
            //   52                   | push                edx
            //   8d4590               | lea                 eax, [ebp - 0x70]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   8d8d10ffffff         | lea                 ecx, [ebp - 0xf0]

    condition:
        7 of them and filesize < 1515520
}