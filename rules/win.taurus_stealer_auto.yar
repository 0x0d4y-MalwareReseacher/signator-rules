rule win_taurus_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.taurus_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taurus_stealer"
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
        $sequence_0 = { 8a45e9 30440dea 41 83f915 72f3 8d45ea 885dff }
            // n = 7, score = 200
            //   8a45e9               | mov                 al, byte ptr [ebp - 0x17]
            //   30440dea             | xor                 byte ptr [ebp + ecx - 0x16], al
            //   41                   | inc                 ecx
            //   83f915               | cmp                 ecx, 0x15
            //   72f3                 | jb                  0xfffffff5
            //   8d45ea               | lea                 eax, [ebp - 0x16]
            //   885dff               | mov                 byte ptr [ebp - 1], bl

        $sequence_1 = { e8???????? 8d4de1 c60000 e8???????? 50 8d8d38ffffff e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8d4de1               | lea                 ecx, [ebp - 0x1f]
            //   c60000               | mov                 byte ptr [eax], 0
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d8d38ffffff         | lea                 ecx, [ebp - 0xc8]
            //   e8????????           |                     

        $sequence_2 = { 8bce e8???????? 83c61c 3b750c 75f1 5e 5d }
            // n = 7, score = 200
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   83c61c               | add                 esi, 0x1c
            //   3b750c               | cmp                 esi, dword ptr [ebp + 0xc]
            //   75f1                 | jne                 0xfffffff3
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_3 = { 0f2805???????? 0f1145e8 c6400201 8bb760020000 8a45e8 30440de9 41 }
            // n = 7, score = 200
            //   0f2805????????       |                     
            //   0f1145e8             | movups              xmmword ptr [ebp - 0x18], xmm0
            //   c6400201             | mov                 byte ptr [eax + 2], 1
            //   8bb760020000         | mov                 esi, dword ptr [edi + 0x260]
            //   8a45e8               | mov                 al, byte ptr [ebp - 0x18]
            //   30440de9             | xor                 byte ptr [ebp + ecx - 0x17], al
            //   41                   | inc                 ecx

        $sequence_4 = { 51 50 6a00 8bcf e8???????? 50 8d8d44feffff }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   50                   | push                eax
            //   6a00                 | push                0
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d8d44feffff         | lea                 ecx, [ebp - 0x1bc]

        $sequence_5 = { e8???????? 8b75d0 8d8554ffffff 50 8d459c 50 8d8e3c080000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b75d0               | mov                 esi, dword ptr [ebp - 0x30]
            //   8d8554ffffff         | lea                 eax, [ebp - 0xac]
            //   50                   | push                eax
            //   8d459c               | lea                 eax, [ebp - 0x64]
            //   50                   | push                eax
            //   8d8e3c080000         | lea                 ecx, [esi + 0x83c]

        $sequence_6 = { d2ea 8b4dfc d3f8 22d0 8b45f8 8810 8a450f }
            // n = 7, score = 200
            //   d2ea                 | shr                 dl, cl
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   d3f8                 | sar                 eax, cl
            //   22d0                 | and                 dl, al
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8810                 | mov                 byte ptr [eax], dl
            //   8a450f               | mov                 al, byte ptr [ebp + 0xf]

        $sequence_7 = { 03c7 8945f0 8bf0 33c0 8816 8b0c9520874300 47 }
            // n = 7, score = 200
            //   03c7                 | add                 eax, edi
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8bf0                 | mov                 esi, eax
            //   33c0                 | xor                 eax, eax
            //   8816                 | mov                 byte ptr [esi], dl
            //   8b0c9520874300       | mov                 ecx, dword ptr [edx*4 + 0x438720]
            //   47                   | inc                 edi

        $sequence_8 = { c745f42d627f79 8bca 66c745f8472d 8855fa 0fbec0 250f000080 7905 }
            // n = 7, score = 200
            //   c745f42d627f79       | mov                 dword ptr [ebp - 0xc], 0x797f622d
            //   8bca                 | mov                 ecx, edx
            //   66c745f8472d         | mov                 word ptr [ebp - 8], 0x2d47
            //   8855fa               | mov                 byte ptr [ebp - 6], dl
            //   0fbec0               | movsx               eax, al
            //   250f000080           | and                 eax, 0x8000000f
            //   7905                 | jns                 7

        $sequence_9 = { 8986c8020000 e8???????? ff7510 8bcb e8???????? 5f 8bc6 }
            // n = 7, score = 200
            //   8986c8020000         | mov                 dword ptr [esi + 0x2c8], eax
            //   e8????????           |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi

    condition:
        7 of them and filesize < 524288
}