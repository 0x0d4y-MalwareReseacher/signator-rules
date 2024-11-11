rule win_miniblindingcan_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.miniblindingcan."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miniblindingcan"
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
        $sequence_0 = { 4c8bd1 b83f000000 0f05 c3 4c8bd1 b840000000 0f05 }
            // n = 7, score = 100
            //   4c8bd1               | mov                 eax, 1
            //   b83f000000           | dec                 eax
            //   0f05                 | add                 esp, 0x30
            //   c3                   | pop                 ebx
            //   4c8bd1               | ret                 
            //   b840000000           | dec                 eax
            //   0f05                 | mov                 dword ptr [esp + 8], ebx

        $sequence_1 = { 7715 488d0de0ce0000 410fb7c5 0fbe4c08e0 83e10f eb03 418bca }
            // n = 7, score = 100
            //   7715                 | mov                 edx, 0x17
            //   488d0de0ce0000       | lea                 ecx, [edx + 0x29]
            //   410fb7c5             | dec                 eax
            //   0fbe4c08e0           | lea                 ecx, [0x18f41]
            //   83e10f               | dec                 eax
            //   eb03                 | mov                 edx, eax
            //   418bca               | mov                 edx, 0x17

        $sequence_2 = { 8bd3 498bcc e8???????? 448b6c2438 488bf8 44896c2450 4c8d4608 }
            // n = 7, score = 100
            //   8bd3                 | xor                 ecx, eax
            //   498bcc               | movzx               eax, bl
            //   e8????????           |                     
            //   448b6c2438           | movzx               eax, byte ptr [eax + ebp + 0x20560]
            //   488bf8               | inc                 ecx
            //   44896c2450           | shl                 ecx, 8
            //   4c8d4608             | inc                 esp

        $sequence_3 = { 4883c708 4883c108 482bcf 488b0439 488907 4883c708 493bf8 }
            // n = 7, score = 100
            //   4883c708             | jb                  0x7a0
            //   4883c108             | dec                 eax
            //   482bcf               | lea                 ecx, [esi + ebx]
            //   488b0439             | dec                 eax
            //   488907               | cmp                 ecx, ebx
            //   4883c708             | jb                  0x7a0
            //   493bf8               | dec                 ecx

        $sequence_4 = { 4889742438 488d45e0 4889742430 4c8d8736040000 448bcb 33d2 33c9 }
            // n = 7, score = 100
            //   4889742438           | sub                 esp, 0x850
            //   488d45e0             | push                ebp
            //   4889742430           | push                edi
            //   4c8d8736040000       | inc                 ecx
            //   448bcb               | push                ebp
            //   33d2                 | dec                 eax
            //   33c9                 | lea                 ebp, [esp - 0x480]

        $sequence_5 = { 8bc2 4889742420 c1e81f 03d0 6603d2 66895509 488d55c7 }
            // n = 7, score = 100
            //   8bc2                 | movdqu              xmmword ptr [edi], xmm0
            //   4889742420           | inc                 esp
            //   c1e81f               | movzx               ecx, word ptr [ebx]
            //   03d0                 | dec                 ecx
            //   6603d2               | mov                 ecx, eax
            //   66895509             | and                 edx, 0xf
            //   488d55c7             | js                  0xc8

        $sequence_6 = { 488364246000 488364245800 c60100 488d4c2460 488d1500a20100 33db 215c2450 }
            // n = 7, score = 100
            //   488364246000         | jne                 0x48
            //   488364245800         | dec                 eax
            //   c60100               | sub                 ecx, 2
            //   488d4c2460           | inc                 sp
            //   488d1500a20100       | mov                 dword ptr [ecx], ebp
            //   33db                 | dec                 ecx
            //   215c2450             | dec                 ebx

        $sequence_7 = { ff15???????? e9???????? 488bcb ff15???????? 33c0 488b8c2400250000 4833cc }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   e9????????           |                     
            //   488bcb               | mov                 edx, dword ptr [edi]
            //   ff15????????         |                     
            //   33c0                 | mov                 ecx, 0x40
            //   488b8c2400250000     | inc                 edx
            //   4833cc               | inc                 ecx

        $sequence_8 = { 483bd8 0f87e8020000 0f1003 4803de f30f7f07 440fb70b 498bc8 }
            // n = 7, score = 100
            //   483bd8               | inc                 ecx
            //   0f87e8020000         | mov                 edx, esi
            //   0f1003               | mov                 dword ptr [eax - 0x38], edi
            //   4803de               | inc                 esp
            //   f30f7f07             | mov                 ebp, edi
            //   440fb70b             | mov                 dword ptr [eax + 0x20], edi
            //   498bc8               | inc                 esp

        $sequence_9 = { 4c8bc6 48ffc6 418838 e9???????? 49ffc4 498b0c24 490fafc8 }
            // n = 7, score = 100
            //   4c8bc6               | inc                 ebp
            //   48ffc6               | lea                 ebp, [ecx + 1]
            //   418838               | mov                 edx, ebx
            //   e9????????           |                     
            //   49ffc4               | dec                 ecx
            //   498b0c24             | mov                 ecx, esp
            //   490fafc8             | mov                 ebx, eax

    condition:
        7 of them and filesize < 453632
}