rule win_bredolab_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.bredolab."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bredolab"
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
        $sequence_0 = { 89d1 f3a4 c64415d800 8b550c 89542404 890424 ff15???????? }
            // n = 7, score = 200
            //   89d1                 | mov                 ecx, edx
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   c64415d800           | mov                 byte ptr [ebp + edx - 0x28], 0
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   89542404             | mov                 dword ptr [esp + 4], edx
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     

        $sequence_1 = { 84c0 74ca 89f0 40 }
            // n = 4, score = 200
            //   84c0                 | test                al, al
            //   74ca                 | je                  0xffffffcc
            //   89f0                 | mov                 eax, esi
            //   40                   | inc                 eax

        $sequence_2 = { 0f84a1000000 c7042401000000 e8???????? e9???????? 8b85bcebffff 8d53ff 85d0 }
            // n = 7, score = 200
            //   0f84a1000000         | je                  0xa7
            //   c7042401000000       | mov                 dword ptr [esp], 1
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b85bcebffff         | mov                 eax, dword ptr [ebp - 0x1444]
            //   8d53ff               | lea                 edx, [ebx - 1]
            //   85d0                 | test                eax, edx

        $sequence_3 = { 8d9c1b00000080 8d7de4 897c2410 c744240c3f000f00 }
            // n = 4, score = 200
            //   8d9c1b00000080       | lea                 ebx, [ebx + ebx - 0x80000000]
            //   8d7de4               | lea                 edi, [ebp - 0x1c]
            //   897c2410             | mov                 dword ptr [esp + 0x10], edi
            //   c744240c3f000f00     | mov                 dword ptr [esp + 0xc], 0xf003f

        $sequence_4 = { 77f1 8944ce10 ff864c090000 83c418 5b 5e 5f }
            // n = 7, score = 200
            //   77f1                 | ja                  0xfffffff3
            //   8944ce10             | mov                 dword ptr [esi + ecx*8 + 0x10], eax
            //   ff864c090000         | inc                 dword ptr [esi + 0x94c]
            //   83c418               | add                 esp, 0x18
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_5 = { 55 89e5 53 83ec14 a1???????? 8b0d???????? 89c3 }
            // n = 7, score = 200
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   53                   | push                ebx
            //   83ec14               | sub                 esp, 0x14
            //   a1????????           |                     
            //   8b0d????????         |                     
            //   89c3                 | mov                 ebx, eax

        $sequence_6 = { 8db5e6feffff 8d7600 8a9300500010 8855e6 897c2404 8d0406 }
            // n = 6, score = 200
            //   8db5e6feffff         | lea                 esi, [ebp - 0x11a]
            //   8d7600               | lea                 esi, [esi]
            //   8a9300500010         | mov                 dl, byte ptr [ebx + 0x10005000]
            //   8855e6               | mov                 byte ptr [ebp - 0x1a], dl
            //   897c2404             | mov                 dword ptr [esp + 4], edi
            //   8d0406               | lea                 eax, [esi + eax]

        $sequence_7 = { 890424 ff15???????? 83ec10 85c0 7466 01c3 85db }
            // n = 7, score = 200
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     
            //   83ec10               | sub                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7466                 | je                  0x68
            //   01c3                 | add                 ebx, eax
            //   85db                 | test                ebx, ebx

        $sequence_8 = { c68554feffff00 c68555feffff00 c685b8ebffff00 84c0 0f84b3010000 8d85b4ebffff }
            // n = 6, score = 200
            //   c68554feffff00       | mov                 byte ptr [ebp - 0x1ac], 0
            //   c68555feffff00       | mov                 byte ptr [ebp - 0x1ab], 0
            //   c685b8ebffff00       | mov                 byte ptr [ebp - 0x1448], 0
            //   84c0                 | test                al, al
            //   0f84b3010000         | je                  0x1b9
            //   8d85b4ebffff         | lea                 eax, [ebp - 0x144c]

        $sequence_9 = { c7042440000000 ff15???????? 83ec08 89c3 }
            // n = 4, score = 200
            //   c7042440000000       | mov                 dword ptr [esp], 0x40
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   89c3                 | mov                 ebx, eax

    condition:
        7 of them and filesize < 90112
}