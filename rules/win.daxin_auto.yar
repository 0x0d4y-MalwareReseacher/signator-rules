rule win_daxin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.daxin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.daxin"
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
        $sequence_0 = { 2bc2 d1f8 99 f7f9 }
            // n = 4, score = 400
            //   2bc2                 | sub                 eax, edx
            //   d1f8                 | sar                 eax, 1
            //   99                   | cdq                 
            //   f7f9                 | idiv                ecx

        $sequence_1 = { 413bd5 7209 438d443500 3bd0 7226 }
            // n = 5, score = 300
            //   413bd5               | shr                 ecx, 0x10
            //   7209                 | rol                 ax, 8
            //   438d443500           | movzx               edx, ax
            //   3bd0                 | inc                 ecx
            //   7226                 | cmp                 edx, ebp

        $sequence_2 = { e9???????? 448b4f04 4533c0 ba02000000 488bcb }
            // n = 5, score = 300
            //   e9????????           |                     
            //   448b4f04             | je                  0x11
            //   4533c0               | dec                 ebp
            //   ba02000000           | mov                 ecx, dword ptr [eax]
            //   488bcb               | je                  0xf

        $sequence_3 = { 448b4004 0fb7c1 c1e910 66c1c008 0fb7d0 }
            // n = 5, score = 300
            //   448b4004             | dec                 ebp
            //   0fb7c1               | test                eax, eax
            //   c1e910               | inc                 esp
            //   66c1c008             | mov                 eax, dword ptr [eax + 4]
            //   0fb7d0               | movzx               eax, cx

        $sequence_4 = { 740d 488bcb e8???????? e9???????? 33c9 }
            // n = 5, score = 300
            //   740d                 | sub                 esp, 0x20
            //   488bcb               | inc                 ebp
            //   e8????????           |                     
            //   e9????????           |                     
            //   33c9                 | xor                 eax, eax

        $sequence_5 = { 7508 488bc8 ff5028 eb02 33c0 }
            // n = 5, score = 300
            //   7508                 | mov                 byte ptr [edi + 8], al
            //   488bc8               | dec                 esp
            //   ff5028               | mov                 eax, dword ptr [ebx + 0x80]
            //   eb02                 | dec                 ebp
            //   33c0                 | test                eax, eax

        $sequence_6 = { 57 4154 4883ec20 4533c0 }
            // n = 4, score = 300
            //   57                   | jb                  0xb
            //   4154                 | inc                 ebx
            //   4883ec20             | lea                 eax, [ebp + esi]
            //   4533c0               | cmp                 edx, eax

        $sequence_7 = { ff15???????? 884708 4c8b8380000000 4d85c0 }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   884708               | mov                 byte ptr [edi + 8], al
            //   4c8b8380000000       | dec                 esp
            //   4d85c0               | mov                 eax, dword ptr [ebx + 0x80]

        $sequence_8 = { 885303 7e1b 8b74241c 8bcf }
            // n = 4, score = 100
            //   885303               | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   7e1b                 | mov                 byte ptr [eax + 0x2a], dl
            //   8b74241c             | mov                 ebx, edx
            //   8bcf                 | mov                 ecx, dword ptr [eax + ebp*4 + 0x14]

        $sequence_9 = { 8854243b 8b54243b 81e2ff000000 03c2 }
            // n = 4, score = 100
            //   8854243b             | pop                 esi
            //   8b54243b             | mov                 byte ptr [esp + 0x3a], dl
            //   81e2ff000000         | mov                 edx, dword ptr [esp + 0x3a]
            //   03c2                 | and                 edx, 0xff

        $sequence_10 = { 88540e07 885c3e08 7cd2 897e04 }
            // n = 4, score = 100
            //   88540e07             | mov                 dword ptr [eax + 0x1c], ecx
            //   885c3e08             | mov                 byte ptr [ebx + 3], dl
            //   7cd2                 | jle                 0x1d
            //   897e04               | mov                 esi, dword ptr [esp + 0x1c]

        $sequence_11 = { 88543908 8a443108 02c2 25ff000000 }
            // n = 4, score = 100
            //   88543908             | mov                 dl, byte ptr [ecx + 9]
            //   8a443108             | mov                 byte ptr [esp + 0x3b], dl
            //   02c2                 | mov                 edx, dword ptr [esp + 0x3b]
            //   25ff000000           | and                 edx, 0xff

        $sequence_12 = { 8854243a 8b54243a 81e2ff000000 03c2 }
            // n = 4, score = 100
            //   8854243a             | shr                 ecx, 2
            //   8b54243a             | mov                 byte ptr [esi + ecx + 7], dl
            //   81e2ff000000         | mov                 byte ptr [esi + edi + 8], bl
            //   03c2                 | jl                  0xffffffd8

        $sequence_13 = { 885017 8bd1 c1e902 f3a5 8bca }
            // n = 5, score = 100
            //   885017               | sar                 eax, 1
            //   8bd1                 | cdq                 
            //   c1e902               | idiv                ecx
            //   f3a5                 | xor                 eax, eax
            //   8bca                 | dec                 ecx

        $sequence_14 = { 88502a 8bda 8b4ca814 2bca }
            // n = 4, score = 100
            //   88502a               | cdq                 
            //   8bda                 | sub                 eax, edx
            //   8b4ca814             | sar                 eax, 1
            //   2bca                 | cdq                 

    condition:
        7 of them and filesize < 3475456
}