rule win_himan_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.himan."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.himan"
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
        $sequence_0 = { 330c9d94886e00 8b58f0 33cb 8bdf c1eb10 81e3ff000000 895c2438 }
            // n = 7, score = 100
            //   330c9d94886e00       | xor                 ecx, dword ptr [ebx*4 + 0x6e8894]
            //   8b58f0               | mov                 ebx, dword ptr [eax - 0x10]
            //   33cb                 | xor                 ecx, ebx
            //   8bdf                 | mov                 ebx, edi
            //   c1eb10               | shr                 ebx, 0x10
            //   81e3ff000000         | and                 ebx, 0xff
            //   895c2438             | mov                 dword ptr [esp + 0x38], ebx

        $sequence_1 = { 8bd6 c1ea10 81e2ff000000 c1ed18 8b1495bcc26e00 3314adbcc66e00 8b2c9dbcbe6e00 }
            // n = 7, score = 100
            //   8bd6                 | mov                 edx, esi
            //   c1ea10               | shr                 edx, 0x10
            //   81e2ff000000         | and                 edx, 0xff
            //   c1ed18               | shr                 ebp, 0x18
            //   8b1495bcc26e00       | mov                 edx, dword ptr [edx*4 + 0x6ec2bc]
            //   3314adbcc66e00       | xor                 edx, dword ptr [ebp*4 + 0x6ec6bc]
            //   8b2c9dbcbe6e00       | mov                 ebp, dword ptr [ebx*4 + 0x6ebebc]

        $sequence_2 = { 81e1ff000000 c1eb08 8b0c8d94906e00 81e3ff000000 330c9d948c6e00 8bde c1eb18 }
            // n = 7, score = 100
            //   81e1ff000000         | and                 ecx, 0xff
            //   c1eb08               | shr                 ebx, 8
            //   8b0c8d94906e00       | mov                 ecx, dword ptr [ecx*4 + 0x6e9094]
            //   81e3ff000000         | and                 ebx, 0xff
            //   330c9d948c6e00       | xor                 ecx, dword ptr [ebx*4 + 0x6e8c94]
            //   8bde                 | mov                 ebx, esi
            //   c1eb18               | shr                 ebx, 0x18

        $sequence_3 = { 8b75f4 8bd1 8d7dfc c1e902 }
            // n = 4, score = 100
            //   8b75f4               | mov                 esi, dword ptr [ebp - 0xc]
            //   8bd1                 | mov                 edx, ecx
            //   8d7dfc               | lea                 edi, [ebp - 4]
            //   c1e902               | shr                 ecx, 2

        $sequence_4 = { 8d8dbcfbffff 51 ffd3 8bf0 46 8d0436 83c003 }
            // n = 7, score = 100
            //   8d8dbcfbffff         | lea                 ecx, [ebp - 0x444]
            //   51                   | push                ecx
            //   ffd3                 | call                ebx
            //   8bf0                 | mov                 esi, eax
            //   46                   | inc                 esi
            //   8d0436               | lea                 eax, [esi + esi]
            //   83c003               | add                 eax, 3

        $sequence_5 = { 55 56 57 b910000000 33c0 8d7c246c }
            // n = 6, score = 100
            //   55                   | push                ebp
            //   56                   | push                esi
            //   57                   | push                edi
            //   b910000000           | mov                 ecx, 0x10
            //   33c0                 | xor                 eax, eax
            //   8d7c246c             | lea                 edi, [esp + 0x6c]

        $sequence_6 = { c1ea02 83e23f a4 7c0b 83fa40 7d06 8a541428 }
            // n = 7, score = 100
            //   c1ea02               | shr                 edx, 2
            //   83e23f               | and                 edx, 0x3f
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   7c0b                 | jl                  0xd
            //   83fa40               | cmp                 edx, 0x40
            //   7d06                 | jge                 8
            //   8a541428             | mov                 dl, byte ptr [esp + edx + 0x28]

        $sequence_7 = { 8b542444 8d0c00 8b442410 51 53 6a01 }
            // n = 6, score = 100
            //   8b542444             | mov                 edx, dword ptr [esp + 0x44]
            //   8d0c00               | lea                 ecx, [eax + eax]
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   6a01                 | push                1

        $sequence_8 = { 50 ff15???????? 8d4c246c 68???????? }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d4c246c             | lea                 ecx, [esp + 0x6c]
            //   68????????           |                     

        $sequence_9 = { c21800 8b4514 50 ff15???????? 33c0 8da5b0f3ffff }
            // n = 6, score = 100
            //   c21800               | ret                 0x18
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   8da5b0f3ffff         | lea                 esp, [ebp - 0xc50]

    condition:
        7 of them and filesize < 139264
}