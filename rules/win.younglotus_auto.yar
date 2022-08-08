rule win_younglotus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.younglotus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.younglotus"
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
        $sequence_0 = { 6802000080 e8???????? 83c41c 6a01 }
            // n = 4, score = 1000
            //   6802000080           | push                0x80000002
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   6a01                 | push                1

        $sequence_1 = { 50 ff15???????? 8945f0 6a00 6a00 }
            // n = 5, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_2 = { 8b08 8b11 8955f0 6a10 8d45ec 50 8b4dd4 }
            // n = 7, score = 800
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx
            //   6a10                 | push                0x10
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]

        $sequence_3 = { 8b4dfc 83c101 51 e8???????? 83c40c 8b55fc 52 }
            // n = 7, score = 800
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c101               | add                 ecx, 1
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx

        $sequence_4 = { 8b4dd4 8b5148 52 ff15???????? 85c0 }
            // n = 5, score = 800
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   8b5148               | mov                 edx, dword ptr [ecx + 0x48]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_5 = { 8b45a0 50 8d4de0 51 e8???????? }
            // n = 5, score = 800
            //   8b45a0               | mov                 eax, dword ptr [ebp - 0x60]
            //   50                   | push                eax
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_6 = { 83c001 8945fc ebeb 8b4d10 }
            // n = 4, score = 800
            //   83c001               | add                 eax, 1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ebeb                 | jmp                 0xffffffed
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]

        $sequence_7 = { 8b5104 0355f4 8b45f0 895008 8b4df0 }
            // n = 5, score = 800
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   0355f4               | add                 edx, dword ptr [ebp - 0xc]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   895008               | mov                 dword ptr [eax + 8], edx
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]

        $sequence_8 = { 53 56 57 68???????? ff15???????? 8945dc 68???????? }
            // n = 7, score = 600
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   68????????           |                     

        $sequence_9 = { 8bec 81ecbc010000 56 be???????? 56 }
            // n = 5, score = 400
            //   8bec                 | mov                 ebp, esp
            //   81ecbc010000         | sub                 esp, 0x1bc
            //   56                   | push                esi
            //   be????????           |                     
            //   56                   | push                esi

        $sequence_10 = { 83c41c 8d85e8feffff 6804010000 53 50 }
            // n = 5, score = 400
            //   83c41c               | add                 esp, 0x1c
            //   8d85e8feffff         | lea                 eax, [ebp - 0x118]
            //   6804010000           | push                0x104
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_11 = { 6802000080 e8???????? 83c42c 56 ff15???????? 85c0 }
            // n = 6, score = 400
            //   6802000080           | push                0x80000002
            //   e8????????           |                     
            //   83c42c               | add                 esp, 0x2c
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_12 = { 81ec58010000 56 57 ff7508 e8???????? 85c0 }
            // n = 6, score = 400
            //   81ec58010000         | sub                 esp, 0x158
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_13 = { 8945f8 8b4b3c 034e54 51 }
            // n = 4, score = 400
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4b3c               | mov                 ecx, dword ptr [ebx + 0x3c]
            //   034e54               | add                 ecx, dword ptr [esi + 0x54]
            //   51                   | push                ecx

        $sequence_14 = { 83c628 8b00 0fb74006 3945fc 7c91 5f }
            // n = 6, score = 400
            //   83c628               | add                 esi, 0x28
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   0fb74006             | movzx               eax, word ptr [eax + 6]
            //   3945fc               | cmp                 dword ptr [ebp - 4], eax
            //   7c91                 | jl                  0xffffff93
            //   5f                   | pop                 edi

        $sequence_15 = { f7d8 5e c9 c21000 55 }
            // n = 5, score = 400
            //   f7d8                 | neg                 eax
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c21000               | ret                 0x10
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 106496
}