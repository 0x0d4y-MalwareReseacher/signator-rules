rule win_aurora_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.aurora."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.aurora"
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
        $sequence_0 = { 397e14 7332 51 57 }
            // n = 4, score = 300
            //   397e14               | cmp                 dword ptr [esi + 0x14], edi
            //   7332                 | jae                 0x34
            //   51                   | push                ecx
            //   57                   | push                edi

        $sequence_1 = { 6690 8a5dff 83fa10 b9???????? 0f430d???????? }
            // n = 5, score = 300
            //   6690                 | nop                 
            //   8a5dff               | mov                 bl, byte ptr [ebp - 1]
            //   83fa10               | cmp                 edx, 0x10
            //   b9????????           |                     
            //   0f430d????????       |                     

        $sequence_2 = { 33ff 89b5c8feffff 89bde8feffff 899decfeffff }
            // n = 4, score = 300
            //   33ff                 | xor                 edi, edi
            //   89b5c8feffff         | mov                 dword ptr [ebp - 0x138], esi
            //   89bde8feffff         | mov                 dword ptr [ebp - 0x118], edi
            //   899decfeffff         | mov                 dword ptr [ebp - 0x114], ebx

        $sequence_3 = { 48 8945c0 8b4714 83f810 7204 }
            // n = 5, score = 300
            //   48                   | dec                 eax
            //   8945c0               | mov                 dword ptr [ebp - 0x40], eax
            //   8b4714               | mov                 eax, dword ptr [edi + 0x14]
            //   83f810               | cmp                 eax, 0x10
            //   7204                 | jb                  6

        $sequence_4 = { 2bf2 745a 8b4310 85c0 7453 837b1410 }
            // n = 6, score = 300
            //   2bf2                 | sub                 esi, edx
            //   745a                 | je                  0x5c
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   85c0                 | test                eax, eax
            //   7453                 | je                  0x55
            //   837b1410             | cmp                 dword ptr [ebx + 0x14], 0x10

        $sequence_5 = { 85ff 75da 837e1410 897e10 720d 8b06 }
            // n = 6, score = 300
            //   85ff                 | test                edi, edi
            //   75da                 | jne                 0xffffffdc
            //   837e1410             | cmp                 dword ptr [esi + 0x14], 0x10
            //   897e10               | mov                 dword ptr [esi + 0x10], edi
            //   720d                 | jb                  0xf
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_6 = { 8d4e04 50 e8???????? c745fc01000000 8b4dec }
            // n = 5, score = 300
            //   8d4e04               | lea                 ecx, [esi + 4]
            //   50                   | push                eax
            //   e8????????           |                     
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

        $sequence_7 = { 7204 8b03 eb02 8bc3 8d3c10 0f1f8000000000 85f6 }
            // n = 7, score = 300
            //   7204                 | jb                  6
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   eb02                 | jmp                 4
            //   8bc3                 | mov                 eax, ebx
            //   8d3c10               | lea                 edi, [eax + edx]
            //   0f1f8000000000       | nop                 dword ptr [eax]
            //   85f6                 | test                esi, esi

        $sequence_8 = { 64a300000000 8bda 8bf1 8975dc c745d800000000 }
            // n = 5, score = 300
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8bda                 | mov                 ebx, edx
            //   8bf1                 | mov                 esi, ecx
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   c745d800000000       | mov                 dword ptr [ebp - 0x28], 0

        $sequence_9 = { a1???????? 33c5 50 8d45f4 64a300000000 c745ec00000000 83ec18 }
            // n = 7, score = 300
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   83ec18               | sub                 esp, 0x18

    condition:
        7 of them and filesize < 827392
}