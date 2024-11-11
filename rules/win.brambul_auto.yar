rule win_brambul_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.brambul."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.brambul"
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
        $sequence_0 = { 33c9 48 898d4cffffff 7413 33f6 }
            // n = 5, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   48                   | dec                 eax
            //   898d4cffffff         | mov                 dword ptr [ebp - 0xb4], ecx
            //   7413                 | je                  0x15
            //   33f6                 | xor                 esi, esi

        $sequence_1 = { 8a4c0603 880c06 40 3bc7 7cf4 c6043700 }
            // n = 6, score = 100
            //   8a4c0603             | mov                 cl, byte ptr [esi + eax + 3]
            //   880c06               | mov                 byte ptr [esi + eax], cl
            //   40                   | inc                 eax
            //   3bc7                 | cmp                 eax, edi
            //   7cf4                 | jl                  0xfffffff6
            //   c6043700             | mov                 byte ptr [edi + esi], 0

        $sequence_2 = { 5a d3e2 4a 8955e4 83f814 7320 6a1b }
            // n = 7, score = 100
            //   5a                   | pop                 edx
            //   d3e2                 | shl                 edx, cl
            //   4a                   | dec                 edx
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx
            //   83f814               | cmp                 eax, 0x14
            //   7320                 | jae                 0x22
            //   6a1b                 | push                0x1b

        $sequence_3 = { 03f5 8d8c31a1ebd96e 8b7044 8be9 c1ed1d }
            // n = 5, score = 100
            //   03f5                 | add                 esi, ebp
            //   8d8c31a1ebd96e       | lea                 ecx, [ecx + esi + 0x6ed9eba1]
            //   8b7044               | mov                 esi, dword ptr [eax + 0x44]
            //   8be9                 | mov                 ebp, ecx
            //   c1ed1d               | shr                 ebp, 0x1d

        $sequence_4 = { 50 687e660480 56 e8???????? 8b8c241c010000 6a10 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   687e660480           | push                0x8004667e
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b8c241c010000       | mov                 ecx, dword ptr [esp + 0x11c]
            //   6a10                 | push                0x10

        $sequence_5 = { 8bfa 03f2 33fe 33f9 03fb 8bde 8dac2f22619d6d }
            // n = 7, score = 100
            //   8bfa                 | mov                 edi, edx
            //   03f2                 | add                 esi, edx
            //   33fe                 | xor                 edi, esi
            //   33f9                 | xor                 edi, ecx
            //   03fb                 | add                 edi, ebx
            //   8bde                 | mov                 ebx, esi
            //   8dac2f22619d6d       | lea                 ebp, [edi + ebp + 0x6d9d6122]

        $sequence_6 = { e9???????? f6c140 0f8572040000 898db849ffff }
            // n = 4, score = 100
            //   e9????????           |                     
            //   f6c140               | test                cl, 0x40
            //   0f8572040000         | jne                 0x478
            //   898db849ffff         | mov                 dword ptr [ebp - 0xb648], ecx

        $sequence_7 = { 8975ec 895508 8975f8 8945f4 }
            // n = 4, score = 100
            //   8975ec               | mov                 dword ptr [ebp - 0x14], esi
            //   895508               | mov                 dword ptr [ebp + 8], edx
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_8 = { 56 e8???????? 85c0 7e55 68???????? }
            // n = 5, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7e55                 | jle                 0x57
            //   68????????           |                     

        $sequence_9 = { 0fb600 d3e0 094508 ff45fc 3bf3 72e9 6a01 }
            // n = 7, score = 100
            //   0fb600               | movzx               eax, byte ptr [eax]
            //   d3e0                 | shl                 eax, cl
            //   094508               | or                  dword ptr [ebp + 8], eax
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   3bf3                 | cmp                 esi, ebx
            //   72e9                 | jb                  0xffffffeb
            //   6a01                 | push                1

        $sequence_10 = { 8b4dfc 5f 8908 8b450c }
            // n = 4, score = 100
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   5f                   | pop                 edi
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_11 = { 89742424 0f8e3f010000 83fe0c 0f8636010000 668b5302 8b3d???????? 52 }
            // n = 7, score = 100
            //   89742424             | mov                 dword ptr [esp + 0x24], esi
            //   0f8e3f010000         | jle                 0x145
            //   83fe0c               | cmp                 esi, 0xc
            //   0f8636010000         | jbe                 0x13c
            //   668b5302             | mov                 dx, word ptr [ebx + 2]
            //   8b3d????????         |                     
            //   52                   | push                edx

        $sequence_12 = { ffd7 83e00f 83f803 0f8431010000 83f802 7514 668b4302 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   83e00f               | and                 eax, 0xf
            //   83f803               | cmp                 eax, 3
            //   0f8431010000         | je                  0x137
            //   83f802               | cmp                 eax, 2
            //   7514                 | jne                 0x16
            //   668b4302             | mov                 ax, word ptr [ebx + 2]

        $sequence_13 = { 8bf0 81e2ff00ff00 81e6ff00ff00 33d6 33c2 }
            // n = 5, score = 100
            //   8bf0                 | mov                 esi, eax
            //   81e2ff00ff00         | and                 edx, 0xff00ff
            //   81e6ff00ff00         | and                 esi, 0xff00ff
            //   33d6                 | xor                 edx, esi
            //   33c2                 | xor                 eax, edx

        $sequence_14 = { 8bf3 33ea c1ee0f c1e311 0bf3 8b5824 03f2 }
            // n = 7, score = 100
            //   8bf3                 | mov                 esi, ebx
            //   33ea                 | xor                 ebp, edx
            //   c1ee0f               | shr                 esi, 0xf
            //   c1e311               | shl                 ebx, 0x11
            //   0bf3                 | or                  esi, ebx
            //   8b5824               | mov                 ebx, dword ptr [eax + 0x24]
            //   03f2                 | add                 esi, edx

        $sequence_15 = { f3a5 6a00 ff15???????? 83c41c 50 }
            // n = 5, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   83c41c               | add                 esp, 0x1c
            //   50                   | push                eax

    condition:
        7 of them and filesize < 188416
}