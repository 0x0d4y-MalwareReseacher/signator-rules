rule win_ddkong_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.ddkong."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ddkong"
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
        $sequence_0 = { ff95e8feffff 85c0 0f842b010000 6a04 8d85b4feffff 50 6a0c }
            // n = 7, score = 100
            //   ff95e8feffff         | call                dword ptr [ebp - 0x118]
            //   85c0                 | test                eax, eax
            //   0f842b010000         | je                  0x131
            //   6a04                 | push                4
            //   8d85b4feffff         | lea                 eax, [ebp - 0x14c]
            //   50                   | push                eax
            //   6a0c                 | push                0xc

        $sequence_1 = { c645be79 c645bf44 c645c065 c645c173 c645c263 c645c372 }
            // n = 6, score = 100
            //   c645be79             | mov                 byte ptr [ebp - 0x42], 0x79
            //   c645bf44             | mov                 byte ptr [ebp - 0x41], 0x44
            //   c645c065             | mov                 byte ptr [ebp - 0x40], 0x65
            //   c645c173             | mov                 byte ptr [ebp - 0x3f], 0x73
            //   c645c263             | mov                 byte ptr [ebp - 0x3e], 0x63
            //   c645c372             | mov                 byte ptr [ebp - 0x3d], 0x72

        $sequence_2 = { c645fb6c 885dfc c645e477 c645e573 c645e632 }
            // n = 5, score = 100
            //   c645fb6c             | mov                 byte ptr [ebp - 5], 0x6c
            //   885dfc               | mov                 byte ptr [ebp - 4], bl
            //   c645e477             | mov                 byte ptr [ebp - 0x1c], 0x77
            //   c645e573             | mov                 byte ptr [ebp - 0x1b], 0x73
            //   c645e632             | mov                 byte ptr [ebp - 0x1a], 0x32

        $sequence_3 = { 8985e4feffff 8d850cffffff 50 8d45f0 50 c6850cffffff57 }
            // n = 6, score = 100
            //   8985e4feffff         | mov                 dword ptr [ebp - 0x11c], eax
            //   8d850cffffff         | lea                 eax, [ebp - 0xf4]
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   c6850cffffff57       | mov                 byte ptr [ebp - 0xf4], 0x57

        $sequence_4 = { 8b54381c 8d048a 8b0438 03c7 5f }
            // n = 5, score = 100
            //   8b54381c             | mov                 edx, dword ptr [eax + edi + 0x1c]
            //   8d048a               | lea                 eax, [edx + ecx*4]
            //   8b0438               | mov                 eax, dword ptr [eax + edi]
            //   03c7                 | add                 eax, edi
            //   5f                   | pop                 edi

        $sequence_5 = { 8065e700 8d45dc 50 53 ffd7 50 }
            // n = 6, score = 100
            //   8065e700             | and                 byte ptr [ebp - 0x19], 0
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   50                   | push                eax

        $sequence_6 = { 8945f8 ffd6 50 ffd7 8065ee00 8945f4 }
            // n = 6, score = 100
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8065ee00             | and                 byte ptr [ebp - 0x12], 0
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_7 = { c645dc72 c645dd65 c645de61 c645df64 ffd6 50 }
            // n = 6, score = 100
            //   c645dc72             | mov                 byte ptr [ebp - 0x24], 0x72
            //   c645dd65             | mov                 byte ptr [ebp - 0x23], 0x65
            //   c645de61             | mov                 byte ptr [ebp - 0x22], 0x61
            //   c645df64             | mov                 byte ptr [ebp - 0x21], 0x64
            //   ffd6                 | call                esi
            //   50                   | push                eax

        $sequence_8 = { 83ec24 53 55 56 8b35???????? 8d442420 }
            // n = 6, score = 100
            //   83ec24               | sub                 esp, 0x24
            //   53                   | push                ebx
            //   55                   | push                ebp
            //   56                   | push                esi
            //   8b35????????         |                     
            //   8d442420             | lea                 eax, [esp + 0x20]

        $sequence_9 = { 8d45f0 50 c6850cffffff57 c6850dffffff6f c6850effffff77 c6850fffffff36 }
            // n = 6, score = 100
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   c6850cffffff57       | mov                 byte ptr [ebp - 0xf4], 0x57
            //   c6850dffffff6f       | mov                 byte ptr [ebp - 0xf3], 0x6f
            //   c6850effffff77       | mov                 byte ptr [ebp - 0xf2], 0x77
            //   c6850fffffff36       | mov                 byte ptr [ebp - 0xf1], 0x36

    condition:
        7 of them and filesize < 81920
}