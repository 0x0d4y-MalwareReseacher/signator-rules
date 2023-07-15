rule win_crosswalk_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.crosswalk."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crosswalk"
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
        $sequence_0 = { 33f6 8d6e20 8bcd e8???????? }
            // n = 4, score = 1300
            //   33f6                 | add                 edx, eax
            //   8d6e20               | inc                 ecx
            //   8bcd                 | sub                 edi, 1
            //   e8????????           |                     

        $sequence_1 = { 4883ec28 4885c9 7402 ffd1 }
            // n = 4, score = 1300
            //   4883ec28             | inc                 ecx
            //   4885c9               | mov                 eax, eax
            //   7402                 | imul                ecx
            //   ffd1                 | add                 edx, ecx

        $sequence_2 = { ff15???????? 448bf0 4533c9 4533c0 }
            // n = 4, score = 1300
            //   ff15????????         |                     
            //   448bf0               | mov                 eax, esi
            //   4533c9               | xor                 edx, edx
            //   4533c0               | inc                 ecx

        $sequence_3 = { 458d7ee0 418bd7 ff15???????? 4821742420 }
            // n = 4, score = 1300
            //   458d7ee0             | imul                ecx
            //   418bd7               | add                 edx, ecx
            //   ff15????????         |                     
            //   4821742420           | sar                 edx, 0xb

        $sequence_4 = { 03d1 c1fa0b 8bc2 c1e81f 03d0 69c2890e0000 }
            // n = 6, score = 1300
            //   03d1                 | add                 edx, ecx
            //   c1fa0b               | sar                 edx, 0xb
            //   8bc2                 | mov                 eax, edx
            //   c1e81f               | shr                 eax, 0x1f
            //   03d0                 | add                 edx, eax
            //   69c2890e0000         | imul                eax, edx, 0xe89

        $sequence_5 = { 458bc6 33d2 488bc8 e8???????? 4533c9 4533c0 33d2 }
            // n = 7, score = 1300
            //   458bc6               | dec                 ecx
            //   33d2                 | inc                 eax
            //   488bc8               | ror                 edx, cl
            //   e8????????           |                     
            //   4533c9               | add                 edx, eax
            //   4533c0               | sar                 edx, 0xb
            //   33d2                 | mov                 eax, edx

        $sequence_6 = { 418bc0 f7e9 03d1 c1fa0b }
            // n = 4, score = 1300
            //   418bc0               | sub                 edi, 1
            //   f7e9                 | xor                 edx, edx
            //   03d1                 | inc                 ecx
            //   c1fa0b               | movsx               eax, byte ptr [eax]

        $sequence_7 = { 33d2 410fbe00 49ffc0 d3ca 03d0 4183ef01 75ef }
            // n = 7, score = 1300
            //   33d2                 | mov                 eax, edx
            //   410fbe00             | xor                 edx, edx
            //   49ffc0               | inc                 ecx
            //   d3ca                 | movsx               eax, byte ptr [eax]
            //   03d0                 | dec                 ecx
            //   4183ef01             | inc                 eax
            //   75ef                 | ror                 edx, cl

        $sequence_8 = { c745e0185b4100 e9???????? c745e0145b4100 eba2 894ddc }
            // n = 5, score = 200
            //   c745e0185b4100       | mov                 dword ptr [ebp - 0x20], 0x415b18
            //   e9????????           |                     
            //   c745e0145b4100       | mov                 dword ptr [ebp - 0x20], 0x415b14
            //   eba2                 | jmp                 0xffffffa4
            //   894ddc               | mov                 dword ptr [ebp - 0x24], ecx

        $sequence_9 = { 0f84b2000000 85f6 0f84aa000000 6a00 56 ff15???????? 6a00 }
            // n = 7, score = 200
            //   0f84b2000000         | je                  0xb8
            //   85f6                 | test                esi, esi
            //   0f84aa000000         | je                  0xb0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_10 = { 83e801 0f859b010000 c745e0185b4100 8b4508 8bcf 8b7510 }
            // n = 6, score = 200
            //   83e801               | sub                 eax, 1
            //   0f859b010000         | jne                 0x1a1
            //   c745e0185b4100       | mov                 dword ptr [ebp - 0x20], 0x415b18
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bcf                 | mov                 ecx, edi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]

        $sequence_11 = { c1f906 6bd030 8b45fc 03148d808e4100 8b00 }
            // n = 5, score = 200
            //   c1f906               | sar                 ecx, 6
            //   6bd030               | imul                edx, eax, 0x30
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03148d808e4100       | add                 edx, dword ptr [ecx*4 + 0x418e80]
            //   8b00                 | mov                 eax, dword ptr [eax]

        $sequence_12 = { 6bf630 8b0c8d808e4100 80643128fd 5f }
            // n = 4, score = 200
            //   6bf630               | imul                esi, esi, 0x30
            //   8b0c8d808e4100       | mov                 ecx, dword ptr [ecx*4 + 0x418e80]
            //   80643128fd           | and                 byte ptr [ecx + esi + 0x28], 0xfd
            //   5f                   | pop                 edi

        $sequence_13 = { 6af6 ff15???????? 8b04bd808e4100 834c0318ff 33c0 eb16 }
            // n = 6, score = 200
            //   6af6                 | push                -0xa
            //   ff15????????         |                     
            //   8b04bd808e4100       | mov                 eax, dword ptr [edi*4 + 0x418e80]
            //   834c0318ff           | or                  dword ptr [ebx + eax + 0x18], 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   eb16                 | jmp                 0x18

        $sequence_14 = { 03348d808e4100 837e18ff 740c 837e18fe 7406 }
            // n = 5, score = 200
            //   03348d808e4100       | add                 esi, dword ptr [ecx*4 + 0x418e80]
            //   837e18ff             | cmp                 dword ptr [esi + 0x18], -1
            //   740c                 | je                  0xe
            //   837e18fe             | cmp                 dword ptr [esi + 0x18], -2
            //   7406                 | je                  8

        $sequence_15 = { be???????? c745ec24234100 57 8d3c85fcffffff 8975cc 8d041f 8975d0 }
            // n = 7, score = 200
            //   be????????           |                     
            //   c745ec24234100       | mov                 dword ptr [ebp - 0x14], 0x412324
            //   57                   | push                edi
            //   8d3c85fcffffff       | lea                 edi, [eax*4 - 4]
            //   8975cc               | mov                 dword ptr [ebp - 0x34], esi
            //   8d041f               | lea                 eax, [edi + ebx]
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi

    condition:
        7 of them and filesize < 286720
}