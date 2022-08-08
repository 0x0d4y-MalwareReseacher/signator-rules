rule win_miragefox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.miragefox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miragefox"
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
        $sequence_0 = { f3a5 ff2495084f2900 8bc7 ba03000000 83e904 720c 83e003 }
            // n = 7, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff2495084f2900       | jmp                 dword ptr [edx*4 + 0x294f08]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3
            //   83e904               | sub                 ecx, 4
            //   720c                 | jb                  0xe
            //   83e003               | and                 eax, 3

        $sequence_1 = { c605????????01 59 ff35???????? ffd3 8365f000 ff75ec e8???????? }
            // n = 7, score = 100
            //   c605????????01       |                     
            //   59                   | pop                 ecx
            //   ff35????????         |                     
            //   ffd3                 | call                ebx
            //   8365f000             | and                 dword ptr [ebp - 0x10], 0
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   e8????????           |                     

        $sequence_2 = { ff75e8 ff15???????? 6a01 58 5f }
            // n = 5, score = 100
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   58                   | pop                 eax
            //   5f                   | pop                 edi

        $sequence_3 = { 56 50 8d85f576ffff c685f476ffff03 50 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   50                   | push                eax
            //   8d85f576ffff         | lea                 eax, [ebp - 0x890b]
            //   c685f476ffff03       | mov                 byte ptr [ebp - 0x890c], 3
            //   50                   | push                eax

        $sequence_4 = { 83c418 85c0 744a ff45f0 ff35???????? ff15???????? 834dfcff }
            // n = 7, score = 100
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   744a                 | je                  0x4c
            //   ff45f0               | inc                 dword ptr [ebp - 0x10]
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff

        $sequence_5 = { e8???????? 8b4508 83c40c 8985d4beffff 8bc6 6a02 53 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c40c               | add                 esp, 0xc
            //   8985d4beffff         | mov                 dword ptr [ebp - 0x412c], eax
            //   8bc6                 | mov                 eax, esi
            //   6a02                 | push                2
            //   53                   | push                ebx

        $sequence_6 = { 50 ffb52cfbffff 6a00 ff15???????? }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ffb52cfbffff         | push                dword ptr [ebp - 0x4d4]
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_7 = { 741f 8d4d1c e8???????? 8b7008 8d4d2c e8???????? 8b7808 }
            // n = 7, score = 100
            //   741f                 | je                  0x21
            //   8d4d1c               | lea                 ecx, [ebp + 0x1c]
            //   e8????????           |                     
            //   8b7008               | mov                 esi, dword ptr [eax + 8]
            //   8d4d2c               | lea                 ecx, [ebp + 0x2c]
            //   e8????????           |                     
            //   8b7808               | mov                 edi, dword ptr [eax + 8]

        $sequence_8 = { 8d04c0 8b0c8d20f52a00 8a448104 83e040 c3 55 }
            // n = 6, score = 100
            //   8d04c0               | lea                 eax, [eax + eax*8]
            //   8b0c8d20f52a00       | mov                 ecx, dword ptr [ecx*4 + 0x2af520]
            //   8a448104             | mov                 al, byte ptr [ecx + eax*4 + 4]
            //   83e040               | and                 eax, 0x40
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_9 = { 83c424 89b5f8feffff 8d85f476ffff 50 b9???????? e8???????? }
            // n = 6, score = 100
            //   83c424               | add                 esp, 0x24
            //   89b5f8feffff         | mov                 dword ptr [ebp - 0x108], esi
            //   8d85f476ffff         | lea                 eax, [ebp - 0x890c]
            //   50                   | push                eax
            //   b9????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 286720
}