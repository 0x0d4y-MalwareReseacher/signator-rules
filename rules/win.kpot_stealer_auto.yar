rule win_kpot_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.kpot_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kpot_stealer"
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
        $sequence_0 = { 0bc1 0fb64f04 c1e208 0bca 0fb65707 c1e208 0bd6 }
            // n = 7, score = 500
            //   0bc1                 | or                  eax, ecx
            //   0fb64f04             | movzx               ecx, byte ptr [edi + 4]
            //   c1e208               | shl                 edx, 8
            //   0bca                 | or                  ecx, edx
            //   0fb65707             | movzx               edx, byte ptr [edi + 7]
            //   c1e208               | shl                 edx, 8
            //   0bd6                 | or                  edx, esi

        $sequence_1 = { 83f80f 7703 6a0f 58 3d00e00100 7605 83c8ff }
            // n = 7, score = 500
            //   83f80f               | cmp                 eax, 0xf
            //   7703                 | ja                  5
            //   6a0f                 | push                0xf
            //   58                   | pop                 eax
            //   3d00e00100           | cmp                 eax, 0x1e000
            //   7605                 | jbe                 7
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_2 = { ff15???????? 85c0 7406 395df8 0f95c3 ff75fc ff15???????? }
            // n = 7, score = 500
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx
            //   0f95c3               | setne               bl
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     

        $sequence_3 = { 8b4508 6a00 56 e8???????? 8b5604 8b0e 8bc2 }
            // n = 7, score = 500
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b5604               | mov                 edx, dword ptr [esi + 4]
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8bc2                 | mov                 eax, edx

        $sequence_4 = { 89560c 6a10 5a 8bce e8???????? }
            // n = 5, score = 500
            //   89560c               | mov                 dword ptr [esi + 0xc], edx
            //   6a10                 | push                0x10
            //   5a                   | pop                 edx
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_5 = { 8365f400 c745f039300000 c745fc00010000 57 }
            // n = 4, score = 500
            //   8365f400             | and                 dword ptr [ebp - 0xc], 0
            //   c745f039300000       | mov                 dword ptr [ebp - 0x10], 0x3039
            //   c745fc00010000       | mov                 dword ptr [ebp - 4], 0x100
            //   57                   | push                edi

        $sequence_6 = { 8bf2 81e600001000 0bce c1e914 81e300000600 8bf2 81e600e00100 }
            // n = 7, score = 500
            //   8bf2                 | mov                 esi, edx
            //   81e600001000         | and                 esi, 0x100000
            //   0bce                 | or                  ecx, esi
            //   c1e914               | shr                 ecx, 0x14
            //   81e300000600         | and                 ebx, 0x60000
            //   8bf2                 | mov                 esi, edx
            //   81e600e00100         | and                 esi, 0x1e000

        $sequence_7 = { 8bf0 7504 33c0 eb31 83feff 750a 8b4d08 }
            // n = 7, score = 500
            //   8bf0                 | mov                 esi, eax
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb31                 | jmp                 0x33
            //   83feff               | cmp                 esi, -1
            //   750a                 | jne                 0xc
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_8 = { 250f0f0f0f 33d0 c1e004 33c8 8bc2 }
            // n = 5, score = 500
            //   250f0f0f0f           | and                 eax, 0xf0f0f0f
            //   33d0                 | xor                 edx, eax
            //   c1e004               | shl                 eax, 4
            //   33c8                 | xor                 ecx, eax
            //   8bc2                 | mov                 eax, edx

        $sequence_9 = { c1e108 ff7514 0bc1 0fb64f02 ff7510 c1e110 }
            // n = 6, score = 500
            //   c1e108               | shl                 ecx, 8
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   0bc1                 | or                  eax, ecx
            //   0fb64f02             | movzx               ecx, byte ptr [edi + 2]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   c1e110               | shl                 ecx, 0x10

    condition:
        7 of them and filesize < 219136
}