rule win_systembc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.systembc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.systembc"
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
        $sequence_0 = { 8b4518 ab b801000000 5e }
            // n = 4, score = 800
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   b801000000           | mov                 eax, 1
            //   5e                   | pop                 esi

        $sequence_1 = { 8955fc 8975f0 8b049a 8945e8 8b02 8945f8 }
            // n = 6, score = 800
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   8b049a               | mov                 eax, dword ptr [edx + ebx*4]
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_2 = { 64a130000000 8b400c 8b700c 8b5810 8b36 8b7e30 33c9 }
            // n = 7, score = 800
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b700c               | mov                 esi, dword ptr [eax + 0xc]
            //   8b5810               | mov                 ebx, dword ptr [eax + 0x10]
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   8b7e30               | mov                 edi, dword ptr [esi + 0x30]
            //   33c9                 | xor                 ecx, ecx

        $sequence_3 = { e8???????? 68???????? 50 e8???????? ffd0 6a00 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   6a00                 | push                0

        $sequence_4 = { 02c2 368a8c2800fcffff 36888c2b00fcffff 3688942800fcffff 02ca 368a8c2900fcffff 300e }
            // n = 7, score = 800
            //   02c2                 | add                 al, dl
            //   368a8c2800fcffff     | mov                 cl, byte ptr ss:[eax + ebp - 0x400]
            //   36888c2b00fcffff     | mov                 byte ptr ss:[ebx + ebp - 0x400], cl
            //   3688942800fcffff     | mov                 byte ptr ss:[eax + ebp - 0x400], dl
            //   02ca                 | add                 cl, dl
            //   368a8c2900fcffff     | mov                 cl, byte ptr ss:[ecx + ebp - 0x400]
            //   300e                 | xor                 byte ptr [esi], cl

        $sequence_5 = { 50 e8???????? ffd0 8b85f4feffff }
            // n = 4, score = 800
            //   50                   | push                eax
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   8b85f4feffff         | mov                 eax, dword ptr [ebp - 0x10c]

        $sequence_6 = { 895df4 894dec 8955fc 8975f0 }
            // n = 4, score = 800
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi

        $sequence_7 = { 46 4f 75cc 33c0 8dbd00fcffff b940000000 fc }
            // n = 7, score = 800
            //   46                   | inc                 esi
            //   4f                   | dec                 edi
            //   75cc                 | jne                 0xffffffce
            //   33c0                 | xor                 eax, eax
            //   8dbd00fcffff         | lea                 edi, [ebp - 0x400]
            //   b940000000           | mov                 ecx, 0x40
            //   fc                   | cld                 

        $sequence_8 = { e8???????? ffd0 6a00 6a00 6a00 6a00 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_9 = { 6aff ff75d8 e8???????? 8d85d8fdffff }
            // n = 4, score = 800
            //   6aff                 | push                -1
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   e8????????           |                     
            //   8d85d8fdffff         | lea                 eax, [ebp - 0x228]

    condition:
        7 of them and filesize < 57344
}