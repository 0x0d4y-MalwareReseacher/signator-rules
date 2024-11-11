rule win_corebot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.corebot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.corebot"
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
        $sequence_0 = { 31f6 46 8918 89f0 83c40c 5e 5f }
            // n = 7, score = 1100
            //   31f6                 | xor                 esi, esi
            //   46                   | inc                 esi
            //   8918                 | mov                 dword ptr [eax], ebx
            //   89f0                 | mov                 eax, esi
            //   83c40c               | add                 esp, 0xc
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_1 = { 31f6 8955e8 894dec 43 8b4dec 8d55f0 e8???????? }
            // n = 7, score = 1100
            //   31f6                 | xor                 esi, esi
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   43                   | inc                 ebx
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8d55f0               | lea                 edx, [ebp - 0x10]
            //   e8????????           |                     

        $sequence_2 = { 0fb618 895de8 c745ec07000000 8d141b 84db 8955e8 }
            // n = 6, score = 1100
            //   0fb618               | movzx               ebx, byte ptr [eax]
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   8d141b               | lea                 edx, [ebx + ebx]
            //   84db                 | test                bl, bl
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx

        $sequence_3 = { 31c0 40 8932 5e c3 31c0 ebfa }
            // n = 7, score = 1100
            //   31c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   8932                 | mov                 dword ptr [edx], esi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   31c0                 | xor                 eax, eax
            //   ebfa                 | jmp                 0xfffffffc

        $sequence_4 = { 50 e8???????? 83c404 29f7 01f3 8b75ec 56 }
            // n = 7, score = 1100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   29f7                 | sub                 edi, esi
            //   01f3                 | add                 ebx, esi
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   56                   | push                esi

        $sequence_5 = { 50 ff15???????? 85c0 7418 8b0e }
            // n = 5, score = 1100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   8b0e                 | mov                 ecx, dword ptr [esi]

        $sequence_6 = { 51 ff15???????? 85c0 0f95c0 eb08 c70600000000 31c0 }
            // n = 7, score = 1100
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f95c0               | setne               al
            //   eb08                 | jmp                 0xa
            //   c70600000000         | mov                 dword ptr [esi], 0
            //   31c0                 | xor                 eax, eax

        $sequence_7 = { 0fb610 8955e8 c745ec07000000 8d0412 84d2 8945e8 783f }
            // n = 7, score = 1100
            //   0fb610               | movzx               edx, byte ptr [eax]
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   8d0412               | lea                 eax, [edx + edx]
            //   84d2                 | test                dl, dl
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   783f                 | js                  0x41

        $sequence_8 = { e8???????? 807e5800 7509 ff7654 ff15???????? 807e5000 }
            // n = 6, score = 1000
            //   e8????????           |                     
            //   807e5800             | cmp                 byte ptr [esi + 0x58], 0
            //   7509                 | jne                 0xb
            //   ff7654               | push                dword ptr [esi + 0x54]
            //   ff15????????         |                     
            //   807e5000             | cmp                 byte ptr [esi + 0x50], 0

        $sequence_9 = { ff15???????? 8d4634 50 ff15???????? 8d4e0c e8???????? }
            // n = 6, score = 1000
            //   ff15????????         |                     
            //   8d4634               | lea                 eax, [esi + 0x34]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d4e0c               | lea                 ecx, [esi + 0xc]
            //   e8????????           |                     

        $sequence_10 = { eb10 6800800000 6a00 56 }
            // n = 4, score = 1000
            //   eb10                 | jmp                 0x12
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   56                   | push                esi

        $sequence_11 = { ff7010 ff7014 e8???????? 8b45e0 }
            // n = 4, score = 1000
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   ff7014               | push                dword ptr [eax + 0x14]
            //   e8????????           |                     
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]

        $sequence_12 = { 85ff 740f 57 ff7508 }
            // n = 4, score = 1000
            //   85ff                 | test                edi, edi
            //   740f                 | je                  0x11
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_13 = { ff15???????? 807e5000 7509 ff764c ff15???????? 8d4634 50 }
            // n = 7, score = 1000
            //   ff15????????         |                     
            //   807e5000             | cmp                 byte ptr [esi + 0x50], 0
            //   7509                 | jne                 0xb
            //   ff764c               | push                dword ptr [esi + 0x4c]
            //   ff15????????         |                     
            //   8d4634               | lea                 eax, [esi + 0x34]
            //   50                   | push                eax

        $sequence_14 = { ff742428 e8???????? 8b442424 8d4c2410 }
            // n = 4, score = 1000
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   e8????????           |                     
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   8d4c2410             | lea                 ecx, [esp + 0x10]

        $sequence_15 = { 85c0 7515 8b4624 3b4620 }
            // n = 4, score = 1000
            //   85c0                 | test                eax, eax
            //   7515                 | jne                 0x17
            //   8b4624               | mov                 eax, dword ptr [esi + 0x24]
            //   3b4620               | cmp                 eax, dword ptr [esi + 0x20]

    condition:
        7 of them and filesize < 1302528
}