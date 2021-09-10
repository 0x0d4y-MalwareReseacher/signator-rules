rule win_arik_keylogger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.arik_keylogger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.arik_keylogger"
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
        $sequence_0 = { fc b908000000 f3a4 8d4db0 8d5598 b801000000 e8???????? }
            // n = 7, score = 100
            //   fc                   | cld                 
            //   b908000000           | mov                 ecx, 8
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d4db0               | lea                 ecx, dword ptr [ebp - 0x50]
            //   8d5598               | lea                 edx, dword ptr [ebp - 0x68]
            //   b801000000           | mov                 eax, 1
            //   e8????????           |                     

        $sequence_1 = { ff4df4 89f6 ff45f4 8b55f4 8b45fc e8???????? 80781c00 }
            // n = 7, score = 100
            //   ff4df4               | dec                 dword ptr [ebp - 0xc]
            //   89f6                 | mov                 esi, esi
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   80781c00             | cmp                 byte ptr [eax + 0x1c], 0

        $sequence_2 = { ff5168 8945cc c6402100 8b45d8 8b4008 85c0 7407 }
            // n = 7, score = 100
            //   ff5168               | call                dword ptr [ecx + 0x68]
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   c6402100             | mov                 byte ptr [eax + 0x21], 0
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   8b4008               | mov                 eax, dword ptr [eax + 8]
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9

        $sequence_3 = { ff85e0faffff b808000000 89c1 29f1 8b849df8faffff d3e0 89c7 }
            // n = 7, score = 100
            //   ff85e0faffff         | inc                 dword ptr [ebp - 0x520]
            //   b808000000           | mov                 eax, 8
            //   89c1                 | mov                 ecx, eax
            //   29f1                 | sub                 ecx, esi
            //   8b849df8faffff       | mov                 eax, dword ptr [ebp + ebx*4 - 0x508]
            //   d3e0                 | shl                 eax, cl
            //   89c7                 | mov                 edi, eax

        $sequence_4 = { c745fc00000000 8b45f4 3b45fc 0f8c6e000000 ff4dfc ff45fc 8b75dc }
            // n = 7, score = 100
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   3b45fc               | cmp                 eax, dword ptr [ebp - 4]
            //   0f8c6e000000         | jl                  0x74
            //   ff4dfc               | dec                 dword ptr [ebp - 4]
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   8b75dc               | mov                 esi, dword ptr [ebp - 0x24]

        $sequence_5 = { c78558feffff00000000 8d8558feffff e8???????? c78558feffff00000000 8d8554feffff e8???????? c78554feffff00000000 }
            // n = 7, score = 100
            //   c78558feffff00000000     | mov    dword ptr [ebp - 0x1a8], 0
            //   8d8558feffff         | lea                 eax, dword ptr [ebp - 0x1a8]
            //   e8????????           |                     
            //   c78558feffff00000000     | mov    dword ptr [ebp - 0x1a8], 0
            //   8d8554feffff         | lea                 eax, dword ptr [ebp - 0x1ac]
            //   e8????????           |                     
            //   c78554feffff00000000     | mov    dword ptr [ebp - 0x1ac], 0

        $sequence_6 = { ff9220010000 8945f0 8b45f4 85c0 7430 8b45f0 85c0 }
            // n = 7, score = 100
            //   ff9220010000         | call                dword ptr [edx + 0x120]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   85c0                 | test                eax, eax
            //   7430                 | je                  0x32
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   85c0                 | test                eax, eax

        $sequence_7 = { ff93d4000000 8b55b4 8b4214 85c0 745e 8d45cc e8???????? }
            // n = 7, score = 100
            //   ff93d4000000         | call                dword ptr [ebx + 0xd4]
            //   8b55b4               | mov                 edx, dword ptr [ebp - 0x4c]
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   85c0                 | test                eax, eax
            //   745e                 | je                  0x60
            //   8d45cc               | lea                 eax, dword ptr [ebp - 0x34]
            //   e8????????           |                     

        $sequence_8 = { ff92c0000000 8b45fc 8b55fc 8b12 ff92bc000000 48 89c7 }
            // n = 7, score = 100
            //   ff92c0000000         | call                dword ptr [edx + 0xc0]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b12                 | mov                 edx, dword ptr [edx]
            //   ff92bc000000         | call                dword ptr [edx + 0xbc]
            //   48                   | dec                 eax
            //   89c7                 | mov                 edi, eax

        $sequence_9 = { 8b8574ffffff 894584 c745800b000000 c7458c20000000 c7458802000000 8b45f8 e8???????? }
            // n = 7, score = 100
            //   8b8574ffffff         | mov                 eax, dword ptr [ebp - 0x8c]
            //   894584               | mov                 dword ptr [ebp - 0x7c], eax
            //   c745800b000000       | mov                 dword ptr [ebp - 0x80], 0xb
            //   c7458c20000000       | mov                 dword ptr [ebp - 0x74], 0x20
            //   c7458802000000       | mov                 dword ptr [ebp - 0x78], 2
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 4947968
}