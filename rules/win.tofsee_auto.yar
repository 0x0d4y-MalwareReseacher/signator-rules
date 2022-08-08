rule win_tofsee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.tofsee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tofsee"
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
        $sequence_0 = { 74e5 8b400c 8b00 8b00 5e c3 }
            // n = 6, score = 400
            //   74e5                 | je                  0xffffffe7
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   5e                   | pop                 esi
            //   c3                   | ret                 

        $sequence_1 = { 59 6a01 8d85c8feffff 68???????? 50 e8???????? 8bf0 }
            // n = 7, score = 400
            //   59                   | pop                 ecx
            //   6a01                 | push                1
            //   8d85c8feffff         | lea                 eax, [ebp - 0x138]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_2 = { e8???????? 8b3e 83c40c 85ff 0f8c8b000000 3bfb 0f8f83000000 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   83c40c               | add                 esp, 0xc
            //   85ff                 | test                edi, edi
            //   0f8c8b000000         | jl                  0x91
            //   3bfb                 | cmp                 edi, ebx
            //   0f8f83000000         | jg                  0x89

        $sequence_3 = { 85f6 741f 56 ff75fc e8???????? 59 59 }
            // n = 7, score = 400
            //   85f6                 | test                esi, esi
            //   741f                 | je                  0x21
            //   56                   | push                esi
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_4 = { 83e001 8d44300b be???????? 56 ff757c 894570 e8???????? }
            // n = 7, score = 400
            //   83e001               | and                 eax, 1
            //   8d44300b             | lea                 eax, [eax + esi + 0xb]
            //   be????????           |                     
            //   56                   | push                esi
            //   ff757c               | push                dword ptr [ebp + 0x7c]
            //   894570               | mov                 dword ptr [ebp + 0x70], eax
            //   e8????????           |                     

        $sequence_5 = { 742f 57 33ff 397e08 7e26 8b460c 8d04b8 }
            // n = 7, score = 400
            //   742f                 | je                  0x31
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   397e08               | cmp                 dword ptr [esi + 8], edi
            //   7e26                 | jle                 0x28
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   8d04b8               | lea                 eax, [eax + edi*4]

        $sequence_6 = { e8???????? 83c40c 85c0 7516 837dfc02 740e }
            // n = 6, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7516                 | jne                 0x18
            //   837dfc02             | cmp                 dword ptr [ebp - 4], 2
            //   740e                 | je                  0x10

        $sequence_7 = { 5f f7ff 8a06 41 46 43 }
            // n = 6, score = 400
            //   5f                   | pop                 edi
            //   f7ff                 | idiv                edi
            //   8a06                 | mov                 al, byte ptr [esi]
            //   41                   | inc                 ecx
            //   46                   | inc                 esi
            //   43                   | inc                 ebx

        $sequence_8 = { ff7518 8938 ff7514 ff7510 51 ff7508 53 }
            // n = 7, score = 400
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   8938                 | mov                 dword ptr [eax], edi
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   51                   | push                ecx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   53                   | push                ebx

        $sequence_9 = { 83c414 50 ff15???????? 8bd8 83fbff 0f84fc000000 e8???????? }
            // n = 7, score = 400
            //   83c414               | add                 esp, 0x14
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   83fbff               | cmp                 ebx, -1
            //   0f84fc000000         | je                  0x102
            //   e8????????           |                     

    condition:
        7 of them and filesize < 147456
}