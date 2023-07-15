rule win_headertip_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.headertip."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.headertip"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { c745f4c0d40100 ff15???????? 53 8d45f4 }
            // n = 4, score = 100
            //   c745f4c0d40100       | mov                 dword ptr [ebp - 0xc], 0x1d4c0
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_1 = { 57 57 ff761c e8???????? 59 59 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   57                   | push                edi
            //   ff761c               | push                dword ptr [esi + 0x1c]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_2 = { 7462 817dfcc8000000 7559 33c0 }
            // n = 4, score = 100
            //   7462                 | je                  0x64
            //   817dfcc8000000       | cmp                 dword ptr [ebp - 4], 0xc8
            //   7559                 | jne                 0x5b
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 885dd7 c645ac47 c645ad65 c645ae74 c645af56 c645b06f c645b16c }
            // n = 7, score = 100
            //   885dd7               | mov                 byte ptr [ebp - 0x29], bl
            //   c645ac47             | mov                 byte ptr [ebp - 0x54], 0x47
            //   c645ad65             | mov                 byte ptr [ebp - 0x53], 0x65
            //   c645ae74             | mov                 byte ptr [ebp - 0x52], 0x74
            //   c645af56             | mov                 byte ptr [ebp - 0x51], 0x56
            //   c645b06f             | mov                 byte ptr [ebp - 0x50], 0x6f
            //   c645b16c             | mov                 byte ptr [ebp - 0x4f], 0x6c

        $sequence_4 = { ffd0 85c0 7503 2145fc 8b45fc eb02 33c0 }
            // n = 7, score = 100
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   7503                 | jne                 5
            //   2145fc               | and                 dword ptr [ebp - 4], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { 750d ff36 ff15???????? 59 33c0 eb03 33c0 }
            // n = 7, score = 100
            //   750d                 | jne                 0xf
            //   ff36                 | push                dword ptr [esi]
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   eb03                 | jmp                 5
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 8b4508 8808 8b450c 8a4df1 8808 8b45f4 8b4d14 }
            // n = 7, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8808                 | mov                 byte ptr [eax], cl
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8a4df1               | mov                 cl, byte ptr [ebp - 0xf]
            //   8808                 | mov                 byte ptr [eax], cl
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

        $sequence_7 = { c705????????50460000 ff15???????? ff35???????? ff15???????? 6817ca2b6e e8???????? 8bf0 }
            // n = 7, score = 100
            //   c705????????50460000     |     
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   6817ca2b6e           | push                0x6e2bca17
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_8 = { 8d450f 50 e8???????? 83c410 }
            // n = 4, score = 100
            //   8d450f               | lea                 eax, [ebp + 0xf]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_9 = { 8b4114 2b410c 03c6 ebea 56 }
            // n = 5, score = 100
            //   8b4114               | mov                 eax, dword ptr [ecx + 0x14]
            //   2b410c               | sub                 eax, dword ptr [ecx + 0xc]
            //   03c6                 | add                 eax, esi
            //   ebea                 | jmp                 0xffffffec
            //   56                   | push                esi

    condition:
        7 of them and filesize < 174080
}