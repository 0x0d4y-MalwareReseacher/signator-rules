rule win_varenyky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.varenyky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.varenyky"
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
        $sequence_0 = { c784240c0100001c010000 ffd0 68ff030000 8d942455040000 53 }
            // n = 5, score = 100
            //   c784240c0100001c010000     | mov    dword ptr [esp + 0x10c], 0x11c
            //   ffd0                 | call                eax
            //   68ff030000           | push                0x3ff
            //   8d942455040000       | lea                 edx, [esp + 0x455]
            //   53                   | push                ebx

        $sequence_1 = { 83c408 85c0 0f847d020000 c60000 40 }
            // n = 5, score = 100
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f847d020000         | je                  0x283
            //   c60000               | mov                 byte ptr [eax], 0
            //   40                   | inc                 eax

        $sequence_2 = { ffd6 85c0 0f8e45020000 0fb74b08 51 ff15???????? 6a00 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   0f8e45020000         | jle                 0x24b
            //   0fb74b08             | movzx               ecx, word ptr [ebx + 8]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_3 = { c1f905 8d1c8d401efd00 8bf0 83e61f c1e606 8b0b }
            // n = 6, score = 100
            //   c1f905               | sar                 ecx, 5
            //   8d1c8d401efd00       | lea                 ebx, [ecx*4 + 0xfd1e40]
            //   8bf0                 | mov                 esi, eax
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   8b0b                 | mov                 ecx, dword ptr [ebx]

        $sequence_4 = { ff15???????? 85c0 7518 8bc6 5e 8b8c24a8010000 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7518                 | jne                 0x1a
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   8b8c24a8010000       | mov                 ecx, dword ptr [esp + 0x1a8]

        $sequence_5 = { 56 ff15???????? 8d9424d0000000 52 33f6 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8d9424d0000000       | lea                 edx, [esp + 0xd0]
            //   52                   | push                edx
            //   33f6                 | xor                 esi, esi

        $sequence_6 = { 40 50 894c2424 894c2428 e8???????? 85c0 0f8528020000 }
            // n = 7, score = 100
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   894c2424             | mov                 dword ptr [esp + 0x24], ecx
            //   894c2428             | mov                 dword ptr [esp + 0x28], ecx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8528020000         | jne                 0x22e

        $sequence_7 = { 8a8c181d010000 888870f94000 40 ebe6 ff35???????? ff15???????? }
            // n = 6, score = 100
            //   8a8c181d010000       | mov                 cl, byte ptr [eax + ebx + 0x11d]
            //   888870f94000         | mov                 byte ptr [eax + 0x40f970], cl
            //   40                   | inc                 eax
            //   ebe6                 | jmp                 0xffffffe8
            //   ff35????????         |                     
            //   ff15????????         |                     

        $sequence_8 = { 8d44241b 50 55 ffd7 85c0 }
            // n = 5, score = 100
            //   8d44241b             | lea                 eax, [esp + 0x1b]
            //   50                   | push                eax
            //   55                   | push                ebp
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax

        $sequence_9 = { 51 6a01 6a00 56 52 }
            // n = 5, score = 100
            //   51                   | push                ecx
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   56                   | push                esi
            //   52                   | push                edx

    condition:
        7 of them and filesize < 24846336
}