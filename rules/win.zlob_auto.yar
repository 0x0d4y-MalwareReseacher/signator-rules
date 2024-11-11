rule win_zlob_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.zlob."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zlob"
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
        $sequence_0 = { 8d442434 50 c64424385e c644243924 }
            // n = 4, score = 200
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   50                   | push                eax
            //   c64424385e           | mov                 byte ptr [esp + 0x38], 0x5e
            //   c644243924           | mov                 byte ptr [esp + 0x39], 0x24

        $sequence_1 = { 47 83ff10 7c9b 5f 5e }
            // n = 5, score = 200
            //   47                   | inc                 edi
            //   83ff10               | cmp                 edi, 0x10
            //   7c9b                 | jl                  0xffffff9d
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_2 = { ffd7 ffd6 ffd6 ffd7 8b4d08 034c241c 8d442410 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   ffd6                 | call                esi
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   034c241c             | add                 ecx, dword ptr [esp + 0x1c]
            //   8d442410             | lea                 eax, [esp + 0x10]

        $sequence_3 = { 7415 6a01 68???????? 8bc8 e8???????? a3???????? eb07 }
            // n = 7, score = 200
            //   7415                 | je                  0x17
            //   6a01                 | push                1
            //   68????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   eb07                 | jmp                 9

        $sequence_4 = { ffd7 ffd6 ffd7 ffd6 ffd6 ffd7 8d85f0eeffff }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   ffd6                 | call                esi
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   8d85f0eeffff         | lea                 eax, [ebp - 0x1110]

        $sequence_5 = { ffd6 ffd6 ffd7 8b0d???????? 8d442424 50 e8???????? }
            // n = 7, score = 200
            //   ffd6                 | call                esi
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   8b0d????????         |                     
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_6 = { c685f5feffff61 c685f6feffff63 c685f7feffff34 c685f8feffff66 c685f9feffff36 c685fafeffff39 }
            // n = 6, score = 200
            //   c685f5feffff61       | mov                 byte ptr [ebp - 0x10b], 0x61
            //   c685f6feffff63       | mov                 byte ptr [ebp - 0x10a], 0x63
            //   c685f7feffff34       | mov                 byte ptr [ebp - 0x109], 0x34
            //   c685f8feffff66       | mov                 byte ptr [ebp - 0x108], 0x66
            //   c685f9feffff36       | mov                 byte ptr [ebp - 0x107], 0x36
            //   c685fafeffff39       | mov                 byte ptr [ebp - 0x106], 0x39

        $sequence_7 = { ffd6 ffd7 5f 5e 5d 5b 81c494180000 }
            // n = 7, score = 200
            //   ffd6                 | call                esi
            //   ffd7                 | call                edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   81c494180000         | add                 esp, 0x1894

        $sequence_8 = { 50 6a00 ff742420 6802660000 ff742420 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff742420             | push                dword ptr [esp + 0x20]
            //   6802660000           | push                0x6602
            //   ff742420             | push                dword ptr [esp + 0x20]

        $sequence_9 = { 8b4c2418 ff742428 ff7118 ff7114 52 }
            // n = 5, score = 200
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   ff7118               | push                dword ptr [ecx + 0x18]
            //   ff7114               | push                dword ptr [ecx + 0x14]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 98304
}