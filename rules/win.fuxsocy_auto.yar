rule win_fuxsocy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.fuxsocy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fuxsocy"
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
        $sequence_0 = { 8b7c2410 eb0b 8a03 8807 47 }
            // n = 5, score = 200
            //   8b7c2410             | mov                 edi, dword ptr [esp + 0x10]
            //   eb0b                 | jmp                 0xd
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   8807                 | mov                 byte ptr [edi], al
            //   47                   | inc                 edi

        $sequence_1 = { 83c40c c3 83ec0c 33d2 53 55 }
            // n = 6, score = 200
            //   83c40c               | add                 esp, 0xc
            //   c3                   | ret                 
            //   83ec0c               | sub                 esp, 0xc
            //   33d2                 | xor                 edx, edx
            //   53                   | push                ebx
            //   55                   | push                ebp

        $sequence_2 = { 8bcf e8???????? 59 59 ff742434 88442417 53 }
            // n = 7, score = 200
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ff742434             | push                dword ptr [esp + 0x34]
            //   88442417             | mov                 byte ptr [esp + 0x17], al
            //   53                   | push                ebx

        $sequence_3 = { e8???????? 8b4c2410 8bf0 33c0 50 50 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   8bf0                 | mov                 esi, eax
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_4 = { 53 ff15???????? 55 6a00 ff15???????? 5f 5e }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   55                   | push                ebp
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { c744246804000000 894c2464 894c2450 ff15???????? 85c0 }
            // n = 5, score = 200
            //   c744246804000000     | mov                 dword ptr [esp + 0x68], 4
            //   894c2464             | mov                 dword ptr [esp + 0x64], ecx
            //   894c2450             | mov                 dword ptr [esp + 0x50], ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_6 = { 8d8c2468020000 e8???????? 59 84c0 0f8462010000 55 6850020000 }
            // n = 7, score = 200
            //   8d8c2468020000       | lea                 ecx, [esp + 0x268]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f8462010000         | je                  0x168
            //   55                   | push                ebp
            //   6850020000           | push                0x250

        $sequence_7 = { 8975e4 85f6 7426 8365fc00 57 53 }
            // n = 6, score = 200
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   85f6                 | test                esi, esi
            //   7426                 | je                  0x28
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   57                   | push                edi
            //   53                   | push                ebx

        $sequence_8 = { 8b442410 5e 5d 8901 8b44240c 5b }
            // n = 6, score = 200
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   5b                   | pop                 ebx

        $sequence_9 = { c20400 83ec18 56 89542414 66894c2406 e8???????? 8bf0 }
            // n = 7, score = 200
            //   c20400               | ret                 4
            //   83ec18               | sub                 esp, 0x18
            //   56                   | push                esi
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   66894c2406           | mov                 word ptr [esp + 6], cx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

    condition:
        7 of them and filesize < 131072
}