rule win_bart_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.bart."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bart"
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
        $sequence_0 = { 56 57 8bf9 8d3402 c1fe04 46 c1e604 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8d3402               | lea                 esi, [edx + eax]
            //   c1fe04               | sar                 esi, 4
            //   46                   | inc                 esi
            //   c1e604               | shl                 esi, 4

        $sequence_1 = { 89b8a4af0600 8b4348 6689887e0e0000 8b4348 89b870af0600 8d8394000000 8b4b48 }
            // n = 7, score = 100
            //   89b8a4af0600         | mov                 dword ptr [eax + 0x6afa4], edi
            //   8b4348               | mov                 eax, dword ptr [ebx + 0x48]
            //   6689887e0e0000       | mov                 word ptr [eax + 0xe7e], cx
            //   8b4348               | mov                 eax, dword ptr [ebx + 0x48]
            //   89b870af0600         | mov                 dword ptr [eax + 0x6af70], edi
            //   8d8394000000         | lea                 eax, [ebx + 0x94]
            //   8b4b48               | mov                 ecx, dword ptr [ebx + 0x48]

        $sequence_2 = { 894704 894f08 8b5304 8b0b 50 e8???????? 83c40c }
            // n = 7, score = 100
            //   894704               | mov                 dword ptr [edi + 4], eax
            //   894f08               | mov                 dword ptr [edi + 8], ecx
            //   8b5304               | mov                 edx, dword ptr [ebx + 4]
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_3 = { 0f846e040000 8b8574ffffff 8d4dbc 8bd6 0fb600 50 56 }
            // n = 7, score = 100
            //   0f846e040000         | je                  0x474
            //   8b8574ffffff         | mov                 eax, dword ptr [ebp - 0x8c]
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   8bd6                 | mov                 edx, esi
            //   0fb600               | movzx               eax, byte ptr [eax]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_4 = { 88040b 8bc7 895f04 5f 5e }
            // n = 5, score = 100
            //   88040b               | mov                 byte ptr [ebx + ecx], al
            //   8bc7                 | mov                 eax, edi
            //   895f04               | mov                 dword ptr [edi + 4], ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { 89442418 49 33d2 894c2410 8bce 8d7a05 8b742418 }
            // n = 7, score = 100
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   49                   | dec                 ecx
            //   33d2                 | xor                 edx, edx
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx
            //   8bce                 | mov                 ecx, esi
            //   8d7a05               | lea                 edi, [edx + 5]
            //   8b742418             | mov                 esi, dword ptr [esp + 0x18]

        $sequence_6 = { 83fe03 7cbe 8b4de8 33f6 8b5dd8 85db 0f85edfeffff }
            // n = 7, score = 100
            //   83fe03               | cmp                 esi, 3
            //   7cbe                 | jl                  0xffffffc0
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   33f6                 | xor                 esi, esi
            //   8b5dd8               | mov                 ebx, dword ptr [ebp - 0x28]
            //   85db                 | test                ebx, ebx
            //   0f85edfeffff         | jne                 0xfffffef3

        $sequence_7 = { ffd7 8a4608 8845ff 8d45ff 6a01 50 53 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   8a4608               | mov                 al, byte ptr [esi + 8]
            //   8845ff               | mov                 byte ptr [ebp - 1], al
            //   8d45ff               | lea                 eax, [ebp - 1]
            //   6a01                 | push                1
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_8 = { 8945ec 8bce 8b4320 8945f0 8b4324 8945f4 }
            // n = 6, score = 100
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8bce                 | mov                 ecx, esi
            //   8b4320               | mov                 eax, dword ptr [ebx + 0x20]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b4324               | mov                 eax, dword ptr [ebx + 0x24]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_9 = { 8d8d14ffffff e8???????? 8d8514ffffff 50 57 }
            // n = 5, score = 100
            //   8d8d14ffffff         | lea                 ecx, [ebp - 0xec]
            //   e8????????           |                     
            //   8d8514ffffff         | lea                 eax, [ebp - 0xec]
            //   50                   | push                eax
            //   57                   | push                edi

    condition:
        7 of them and filesize < 163840
}