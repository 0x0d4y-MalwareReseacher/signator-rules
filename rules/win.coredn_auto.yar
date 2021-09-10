rule win_coredn_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.coredn."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.coredn"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 56 8d45fc 8bf1 50 e8???????? 85c0 }
            // n = 6, score = 600
            //   56                   | push                esi
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   8bf1                 | mov                 esi, ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 8d0416 85c0 7420 8a040f 84c0 7419 8801 }
            // n = 7, score = 400
            //   8d0416               | lea                 eax, dword ptr [esi + edx]
            //   85c0                 | test                eax, eax
            //   7420                 | je                  0x22
            //   8a040f               | mov                 al, byte ptr [edi + ecx]
            //   84c0                 | test                al, al
            //   7419                 | je                  0x1b
            //   8801                 | mov                 byte ptr [ecx], al

        $sequence_2 = { 50 e8???????? 83c408 53 8bce }
            // n = 5, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   53                   | push                ebx
            //   8bce                 | mov                 ecx, esi

        $sequence_3 = { ba02000000 57 8d7920 33c9 8bc7 }
            // n = 5, score = 400
            //   ba02000000           | mov                 edx, 2
            //   57                   | push                edi
            //   8d7920               | lea                 edi, dword ptr [ecx + 0x20]
            //   33c9                 | xor                 ecx, ecx
            //   8bc7                 | mov                 eax, edi

        $sequence_4 = { 41 84c0 75f9 2bca 7444 }
            // n = 5, score = 400
            //   41                   | inc                 ecx
            //   84c0                 | test                al, al
            //   75f9                 | jne                 0xfffffffb
            //   2bca                 | sub                 ecx, edx
            //   7444                 | je                  0x46

        $sequence_5 = { 7506 48 bf7a000780 c60000 8bc7 5f 5b }
            // n = 7, score = 400
            //   7506                 | jne                 8
            //   48                   | dec                 eax
            //   bf7a000780           | mov                 edi, 0x8007007a
            //   c60000               | mov                 byte ptr [eax], 0
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_6 = { 83ec14 53 56 8bf2 8bd9 895df4 8b06 }
            // n = 7, score = 400
            //   83ec14               | sub                 esp, 0x14
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bf2                 | mov                 esi, edx
            //   8bd9                 | mov                 ebx, ecx
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_7 = { ff75fc 53 e8???????? ff75fc c6041f00 e8???????? 83c41c }
            // n = 7, score = 400
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   c6041f00             | mov                 byte ptr [edi + ebx], 0
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c

        $sequence_8 = { 5d c20400 85d2 750d 8851ff b87a000780 5e }
            // n = 7, score = 400
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   85d2                 | test                edx, edx
            //   750d                 | jne                 0xf
            //   8851ff               | mov                 byte ptr [ecx - 1], dl
            //   b87a000780           | mov                 eax, 0x8007007a
            //   5e                   | pop                 esi

        $sequence_9 = { 42 ff75ec 8b7df0 f7d8 83e003 c60200 }
            // n = 6, score = 400
            //   42                   | inc                 edx
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   f7d8                 | neg                 eax
            //   83e003               | and                 eax, 3
            //   c60200               | mov                 byte ptr [edx], 0

        $sequence_10 = { 0f847c010000 85c0 0f8474010000 7823 66660f1f840000000000 8b0e 0fbe4419ff }
            // n = 7, score = 400
            //   0f847c010000         | je                  0x182
            //   85c0                 | test                eax, eax
            //   0f8474010000         | je                  0x17a
            //   7823                 | js                  0x25
            //   66660f1f840000000000     | nop    word ptr [eax + eax]
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   0fbe4419ff           | movsx               eax, byte ptr [ecx + ebx - 1]

        $sequence_11 = { 53 2bf8 e8???????? 57 ff75fc 53 }
            // n = 6, score = 400
            //   53                   | push                ebx
            //   2bf8                 | sub                 edi, eax
            //   e8????????           |                     
            //   57                   | push                edi
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   53                   | push                ebx

        $sequence_12 = { 5e 5d c20400 c60100 33c0 }
            // n = 5, score = 400
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   c60100               | mov                 byte ptr [ecx], 0
            //   33c0                 | xor                 eax, eax

        $sequence_13 = { 8808 8bc7 5f 5b 5e 8be5 5d }
            // n = 7, score = 400
            //   8808                 | mov                 byte ptr [eax], cl
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_14 = { 6a00 50 e8???????? 8b4e08 8d5701 83c40c ff36 }
            // n = 7, score = 400
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   8d5701               | lea                 edx, dword ptr [edi + 1]
            //   83c40c               | add                 esp, 0xc
            //   ff36                 | push                dword ptr [esi]

        $sequence_15 = { 8945fc 85c0 0f842a010000 8b0e 8bd0 57 8bfb }
            // n = 7, score = 400
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85c0                 | test                eax, eax
            //   0f842a010000         | je                  0x130
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8bd0                 | mov                 edx, eax
            //   57                   | push                edi
            //   8bfb                 | mov                 edi, ebx

        $sequence_16 = { 84db 741c 8818 4a 40 83e901 }
            // n = 6, score = 400
            //   84db                 | test                bl, bl
            //   741c                 | je                  0x1e
            //   8818                 | mov                 byte ptr [eax], bl
            //   4a                   | dec                 edx
            //   40                   | inc                 eax
            //   83e901               | sub                 ecx, 1

        $sequence_17 = { 57 85d2 7438 8b7d08 befeffff7f 2bf2 }
            // n = 6, score = 400
            //   57                   | push                edi
            //   85d2                 | test                edx, edx
            //   7438                 | je                  0x3a
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   befeffff7f           | mov                 esi, 0x7ffffffe
            //   2bf2                 | sub                 esi, edx

        $sequence_18 = { 03d1 2bf0 85d2 7423 8a1c06 84db }
            // n = 6, score = 400
            //   03d1                 | add                 edx, ecx
            //   2bf0                 | sub                 esi, eax
            //   85d2                 | test                edx, edx
            //   7423                 | je                  0x25
            //   8a1c06               | mov                 bl, byte ptr [esi + eax]
            //   84db                 | test                bl, bl

        $sequence_19 = { 8bd0 57 8bfb 83f904 7e70 8bd9 }
            // n = 6, score = 400
            //   8bd0                 | mov                 edx, eax
            //   57                   | push                edi
            //   8bfb                 | mov                 edi, ebx
            //   83f904               | cmp                 ecx, 4
            //   7e70                 | jle                 0x72
            //   8bd9                 | mov                 ebx, ecx

        $sequence_20 = { 8b06 880a 42 83f802 7e21 0fb64702 }
            // n = 6, score = 400
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   880a                 | mov                 byte ptr [edx], cl
            //   42                   | inc                 edx
            //   83f802               | cmp                 eax, 2
            //   7e21                 | jle                 0x23
            //   0fb64702             | movzx               eax, byte ptr [edi + 2]

        $sequence_21 = { 8bec 56 8b7508 ba04010000 2bf1 }
            // n = 5, score = 400
            //   8bec                 | mov                 ebp, esp
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   ba04010000           | mov                 edx, 0x104
            //   2bf1                 | sub                 esi, ecx

        $sequence_22 = { 8b06 42 803c0200 75ca 8b4608 }
            // n = 5, score = 400
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   42                   | inc                 edx
            //   803c0200             | cmp                 byte ptr [edx + eax], 0
            //   75ca                 | jne                 0xffffffcc
            //   8b4608               | mov                 eax, dword ptr [esi + 8]

    condition:
        7 of them and filesize < 385024
}