rule win_sslmm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.sslmm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sslmm"
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
        $sequence_0 = { 5b 83c420 c21000 8b4c2418 3bcb }
            // n = 5, score = 400
            //   5b                   | pop                 ebx
            //   83c420               | add                 esp, 0x20
            //   c21000               | ret                 0x10
            //   8b4c2418             | mov                 ecx, dword ptr [esp + 0x18]
            //   3bcb                 | cmp                 ecx, ebx

        $sequence_1 = { 8d440c18 8b8c24e8000000 50 51 e8???????? bf???????? 83c9ff }
            // n = 7, score = 400
            //   8d440c18             | lea                 eax, [esp + ecx + 0x18]
            //   8b8c24e8000000       | mov                 ecx, dword ptr [esp + 0xe8]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_2 = { 40 50 53 6aff 57 6a00 }
            // n = 6, score = 400
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   53                   | push                ebx
            //   6aff                 | push                -1
            //   57                   | push                edi
            //   6a00                 | push                0

        $sequence_3 = { 8d442414 81cf12020000 50 51 6a00 6a00 }
            // n = 6, score = 400
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   81cf12020000         | or                  edi, 0x212
            //   50                   | push                eax
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_4 = { 56 66c744240c0200 ff15???????? 83f8ff 8944240c 7516 56 }
            // n = 7, score = 400
            //   56                   | push                esi
            //   66c744240c0200       | mov                 word ptr [esp + 0xc], 2
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   7516                 | jne                 0x18
            //   56                   | push                esi

        $sequence_5 = { 8b442420 50 ff9630010000 895c2420 8b7c2440 8b542434 }
            // n = 6, score = 400
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   50                   | push                eax
            //   ff9630010000         | call                dword ptr [esi + 0x130]
            //   895c2420             | mov                 dword ptr [esp + 0x20], ebx
            //   8b7c2440             | mov                 edi, dword ptr [esp + 0x40]
            //   8b542434             | mov                 edx, dword ptr [esp + 0x34]

        $sequence_6 = { 68c8000000 8bf1 6a00 ffd7 8b1d???????? }
            // n = 5, score = 400
            //   68c8000000           | push                0xc8
            //   8bf1                 | mov                 esi, ecx
            //   6a00                 | push                0
            //   ffd7                 | call                edi
            //   8b1d????????         |                     

        $sequence_7 = { 52 8d4c2430 50 8b542444 }
            // n = 4, score = 400
            //   52                   | push                edx
            //   8d4c2430             | lea                 ecx, [esp + 0x30]
            //   50                   | push                eax
            //   8b542444             | mov                 edx, dword ptr [esp + 0x44]

        $sequence_8 = { 7508 83780405 7502 8bc8 83c00c 4e }
            // n = 6, score = 400
            //   7508                 | jne                 0xa
            //   83780405             | cmp                 dword ptr [eax + 4], 5
            //   7502                 | jne                 4
            //   8bc8                 | mov                 ecx, eax
            //   83c00c               | add                 eax, 0xc
            //   4e                   | dec                 esi

        $sequence_9 = { 5f 33c0 5e 81c4ac010000 }
            // n = 4, score = 400
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   81c4ac010000         | add                 esp, 0x1ac

    condition:
        7 of them and filesize < 188416
}