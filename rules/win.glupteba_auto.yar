rule win_glupteba_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.glupteba."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.glupteba"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 83c410 85c0 0f8419010000 b800040000 }
            // n = 4, score = 400
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   0f8419010000         | je                  0x11f
            //   b800040000           | mov                 eax, 0x400

        $sequence_1 = { 5f 5e 5d 5b 8b442400 59 c3 }
            // n = 7, score = 400
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   8b442400             | mov                 eax, dword ptr [esp]
            //   59                   | pop                 ecx
            //   c3                   | ret                 

        $sequence_2 = { 0bfb 33f7 8b7df4 c1e708 0b7dfc 8bda c1e708 }
            // n = 7, score = 400
            //   0bfb                 | or                  edi, ebx
            //   33f7                 | xor                 esi, edi
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   c1e708               | shl                 edi, 8
            //   0b7dfc               | or                  edi, dword ptr [ebp - 4]
            //   8bda                 | mov                 ebx, edx
            //   c1e708               | shl                 edi, 8

        $sequence_3 = { 7668 8b5d08 8a03 84c0 745f 3c20 7505 }
            // n = 7, score = 400
            //   7668                 | jbe                 0x6a
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   84c0                 | test                al, al
            //   745f                 | je                  0x61
            //   3c20                 | cmp                 al, 0x20
            //   7505                 | jne                 7

        $sequence_4 = { 85c0 7561 0fb74508 50 68???????? 8d45f4 50 }
            // n = 7, score = 400
            //   85c0                 | test                eax, eax
            //   7561                 | jne                 0x63
            //   0fb74508             | movzx               eax, word ptr [ebp + 8]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   50                   | push                eax

        $sequence_5 = { 315df8 891f 895df4 8b5df8 }
            // n = 4, score = 400
            //   315df8               | xor                 dword ptr [ebp - 8], ebx
            //   891f                 | mov                 dword ptr [edi], ebx
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]

        $sequence_6 = { 317df8 8b7df0 8b5df8 c1e708 0b7dfc }
            // n = 5, score = 400
            //   317df8               | xor                 dword ptr [ebp - 8], edi
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   c1e708               | shl                 edi, 8
            //   0b7dfc               | or                  edi, dword ptr [ebp - 4]

        $sequence_7 = { 50 53 be???????? 56 ff15???????? 6aff 56 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   53                   | push                ebx
            //   be????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   6aff                 | push                -1
            //   56                   | push                esi

        $sequence_8 = { 00cd 3e46 005e3e 46 }
            // n = 4, score = 100
            //   00cd                 | add                 ch, cl
            //   3e46                 | inc                 esi
            //   005e3e               | add                 byte ptr [esi + 0x3e], bl
            //   46                   | inc                 esi

        $sequence_9 = { 0106 830702 392e 75a0 }
            // n = 4, score = 100
            //   0106                 | add                 dword ptr [esi], eax
            //   830702               | add                 dword ptr [edi], 2
            //   392e                 | cmp                 dword ptr [esi], ebp
            //   75a0                 | jne                 0xffffffa2

        $sequence_10 = { 0107 eb4d 8b02 89442418 }
            // n = 4, score = 100
            //   0107                 | add                 dword ptr [edi], eax
            //   eb4d                 | jmp                 0x4f
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   89442418             | mov                 dword ptr [esp + 0x18], eax

        $sequence_11 = { 0012 3f 46 008bff558bec }
            // n = 4, score = 100
            //   0012                 | add                 byte ptr [edx], dl
            //   3f                   | aas                 
            //   46                   | inc                 esi
            //   008bff558bec         | add                 byte ptr [ebx - 0x1374aa01], cl

        $sequence_12 = { 005e3e 46 00ff 3e46 }
            // n = 4, score = 100
            //   005e3e               | add                 byte ptr [esi + 0x3e], bl
            //   46                   | inc                 esi
            //   00ff                 | add                 bh, bh
            //   3e46                 | inc                 esi

        $sequence_13 = { 00ff 3e46 0012 3f }
            // n = 4, score = 100
            //   00ff                 | add                 bh, bh
            //   3e46                 | inc                 esi
            //   0012                 | add                 byte ptr [edx], dl
            //   3f                   | aas                 

        $sequence_14 = { 0101 03d3 8b4620 8bcb }
            // n = 4, score = 100
            //   0101                 | add                 dword ptr [ecx], eax
            //   03d3                 | add                 edx, ebx
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   8bcb                 | mov                 ecx, ebx

        $sequence_15 = { 00f1 3d46005e3e 46 00cd }
            // n = 4, score = 100
            //   00f1                 | add                 cl, dh
            //   3d46005e3e           | cmp                 eax, 0x3e5e0046
            //   46                   | inc                 esi
            //   00cd                 | add                 ch, cl

    condition:
        7 of them and filesize < 1417216
}