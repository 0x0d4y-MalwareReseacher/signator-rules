rule win_shadowpad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.shadowpad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shadowpad"
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
        $sequence_0 = { 897e04 8b4608 3bc7 740d 50 e8???????? 59 }
            // n = 7, score = 200
            //   897e04               | mov                 dword ptr [esi + 4], edi
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   3bc7                 | cmp                 eax, edi
            //   740d                 | je                  0xf
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { c3 6a0d 58 5f c3 }
            // n = 5, score = 200
            //   c3                   | ret                 
            //   6a0d                 | push                0xd
            //   58                   | pop                 eax
            //   5f                   | pop                 edi
            //   c3                   | ret                 

        $sequence_2 = { 8d45f8 50 8d45e8 e8???????? 8a4586 8845f8 8d45f8 }
            // n = 7, score = 200
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   e8????????           |                     
            //   8a4586               | mov                 al, byte ptr [ebp - 0x7a]
            //   8845f8               | mov                 byte ptr [ebp - 8], al
            //   8d45f8               | lea                 eax, [ebp - 8]

        $sequence_3 = { 8b442440 2b442410 8b4c2444 1b4c2414 781e }
            // n = 5, score = 200
            //   8b442440             | mov                 eax, dword ptr [esp + 0x40]
            //   2b442410             | sub                 eax, dword ptr [esp + 0x10]
            //   8b4c2444             | mov                 ecx, dword ptr [esp + 0x44]
            //   1b4c2414             | sbb                 ecx, dword ptr [esp + 0x14]
            //   781e                 | js                  0x20

        $sequence_4 = { 8d742458 e8???????? 5f 5e 33c0 }
            // n = 5, score = 200
            //   8d742458             | lea                 esi, [esp + 0x58]
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { 803c0700 7403 47 ebba 8b4d08 33c0 }
            // n = 6, score = 200
            //   803c0700             | cmp                 byte ptr [edi + eax], 0
            //   7403                 | je                  5
            //   47                   | inc                 edi
            //   ebba                 | jmp                 0xffffffbc
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 33db be00000100 56 e8???????? 59 8d4df8 }
            // n = 6, score = 200
            //   33db                 | xor                 ebx, ebx
            //   be00000100           | mov                 esi, 0x10000
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8d4df8               | lea                 ecx, [ebp - 8]

        $sequence_7 = { e8???????? 8b45e8 6a02 5b }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   6a02                 | push                2
            //   5b                   | pop                 ebx

        $sequence_8 = { 50 47 e8???????? 85c0 75c3 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   47                   | inc                 edi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   75c3                 | jne                 0xffffffc5

        $sequence_9 = { 32d1 46 8810 3b7508 0f8c74ffffff 5f }
            // n = 6, score = 200
            //   32d1                 | xor                 dl, cl
            //   46                   | inc                 esi
            //   8810                 | mov                 byte ptr [eax], dl
            //   3b7508               | cmp                 esi, dword ptr [ebp + 8]
            //   0f8c74ffffff         | jl                  0xffffff7a
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 188416
}