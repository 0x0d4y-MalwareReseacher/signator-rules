rule win_termite_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.termite."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.termite"
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
        $sequence_0 = { 8b55f4 895018 8b4508 8b55f4 8910 b801000000 c9 }
            // n = 7, score = 200
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   895018               | mov                 dword ptr [eax + 0x18], edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8910                 | mov                 dword ptr [eax], edx
            //   b801000000           | mov                 eax, 1
            //   c9                   | leave               

        $sequence_1 = { 8b55e4 89d0 c1e002 01d0 c1e002 05???????? 8b4004 }
            // n = 7, score = 200
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   89d0                 | mov                 eax, edx
            //   c1e002               | shl                 eax, 2
            //   01d0                 | add                 eax, edx
            //   c1e002               | shl                 eax, 2
            //   05????????           |                     
            //   8b4004               | mov                 eax, dword ptr [eax + 4]

        $sequence_2 = { a3???????? a1???????? bbffffffff a3???????? 8d65f4 89d8 }
            // n = 6, score = 200
            //   a3????????           |                     
            //   a1????????           |                     
            //   bbffffffff           | mov                 ebx, 0xffffffff
            //   a3????????           |                     
            //   8d65f4               | lea                 esp, [ebp - 0xc]
            //   89d8                 | mov                 eax, ebx

        $sequence_3 = { 85c9 a3???????? 7422 8b45c8 c1e004 01c7 }
            // n = 6, score = 200
            //   85c9                 | test                ecx, ecx
            //   a3????????           |                     
            //   7422                 | je                  0x24
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   c1e004               | shl                 eax, 4
            //   01c7                 | add                 edi, eax

        $sequence_4 = { b8ffffffff eb4d 8b450c 8b10 a1???????? }
            // n = 5, score = 200
            //   b8ffffffff           | mov                 eax, 0xffffffff
            //   eb4d                 | jmp                 0x4f
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   a1????????           |                     

        $sequence_5 = { 8b45f0 8b4008 8b500c 83ea01 89500c }
            // n = 5, score = 200
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b4008               | mov                 eax, dword ptr [eax + 8]
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   83ea01               | sub                 edx, 1
            //   89500c               | mov                 dword ptr [eax + 0xc], edx

        $sequence_6 = { c745f400000000 e8???????? 8945f0 8b45f0 83f801 740b }
            // n = 6, score = 200
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   83f801               | cmp                 eax, 1
            //   740b                 | je                  0xd

        $sequence_7 = { 55 89e5 57 56 53 83ec2c c745e001000000 }
            // n = 7, score = 200
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   57                   | push                edi
            //   56                   | push                esi
            //   53                   | push                ebx
            //   83ec2c               | sub                 esp, 0x2c
            //   c745e001000000       | mov                 dword ptr [ebp - 0x20], 1

        $sequence_8 = { 55 89e5 83ec28 e8???????? 8945f4 8b45f4 3d4c270000 }
            // n = 7, score = 200
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   83ec28               | sub                 esp, 0x28
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   3d4c270000           | cmp                 eax, 0x274c

        $sequence_9 = { 7507 b8ffffffff eb03 8b4510 c9 c3 55 }
            // n = 7, score = 200
            //   7507                 | jne                 9
            //   b8ffffffff           | mov                 eax, 0xffffffff
            //   eb03                 | jmp                 5
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 312320
}