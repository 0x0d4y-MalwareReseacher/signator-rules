rule win_oldbait_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.oldbait."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.oldbait"
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
        $sequence_0 = { 8a09 888800b01800 ebda 8b45fc 0531b11800 50 8b45f8 }
            // n = 7, score = 400
            //   8a09                 | mov                 cl, byte ptr [ecx]
            //   888800b01800         | mov                 byte ptr [eax + 0x18b000], cl
            //   ebda                 | jmp                 0xffffffdc
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0531b11800           | add                 eax, 0x18b131
            //   50                   | push                eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_1 = { 0145d8 8bb54cffffff 56 ff55d0 }
            // n = 4, score = 400
            //   0145d8               | add                 dword ptr [ebp - 0x28], eax
            //   8bb54cffffff         | mov                 esi, dword ptr [ebp - 0xb4]
            //   56                   | push                esi
            //   ff55d0               | call                dword ptr [ebp - 0x30]

        $sequence_2 = { 55 8bec 8b450c 56 33d2 57 }
            // n = 6, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   33d2                 | xor                 edx, edx
            //   57                   | push                edi

        $sequence_3 = { ff75f8 6a00 ff15???????? 85c0 7505 e9???????? }
            // n = 6, score = 400
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   e9????????           |                     

        $sequence_4 = { 30043a 8b4510 69c061ea0000 3571281424 }
            // n = 4, score = 400
            //   30043a               | xor                 byte ptr [edx + edi], al
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   69c061ea0000         | imul                eax, eax, 0xea61
            //   3571281424           | xor                 eax, 0x24142871

        $sequence_5 = { 05d4db1900 8945f4 ff35???????? ff75fc ff55f4 5f 5e }
            // n = 7, score = 400
            //   05d4db1900           | add                 eax, 0x19dbd4
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   ff35????????         |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff55f4               | call                dword ptr [ebp - 0xc]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_6 = { 0145d8 8b45f0 ff45ec 0fb64004 }
            // n = 4, score = 400
            //   0145d8               | add                 dword ptr [ebp - 0x28], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   ff45ec               | inc                 dword ptr [ebp - 0x14]
            //   0fb64004             | movzx               eax, byte ptr [eax + 4]

        $sequence_7 = { 69c061ea0000 3571281424 42 3bd6 894510 72da 8bc7 }
            // n = 7, score = 400
            //   69c061ea0000         | imul                eax, eax, 0xea61
            //   3571281424           | xor                 eax, 0x24142871
            //   42                   | inc                 edx
            //   3bd6                 | cmp                 edx, esi
            //   894510               | mov                 dword ptr [ebp + 0x10], eax
            //   72da                 | jb                  0xffffffdc
            //   8bc7                 | mov                 eax, edi

        $sequence_8 = { 0145d4 41 c1ea04 75dc }
            // n = 4, score = 400
            //   0145d4               | add                 dword ptr [ebp - 0x2c], eax
            //   41                   | inc                 ecx
            //   c1ea04               | shr                 edx, 4
            //   75dc                 | jne                 0xffffffde

        $sequence_9 = { 0103 01451c 8b06 8bc8 c1e906 }
            // n = 5, score = 400
            //   0103                 | add                 dword ptr [ebx], eax
            //   01451c               | add                 dword ptr [ebp + 0x1c], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   c1e906               | shr                 ecx, 6

        $sequence_10 = { 0145d8 33ff 8d837ff61800 803800 }
            // n = 4, score = 400
            //   0145d8               | add                 dword ptr [ebp - 0x28], eax
            //   33ff                 | xor                 edi, edi
            //   8d837ff61800         | lea                 eax, dword ptr [ebx + 0x18f67f]
            //   803800               | cmp                 byte ptr [eax], 0

        $sequence_11 = { 0145d8 8b45d8 3b45c8 7cc2 }
            // n = 4, score = 400
            //   0145d8               | add                 dword ptr [ebp - 0x28], eax
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   3b45c8               | cmp                 eax, dword ptr [ebp - 0x38]
            //   7cc2                 | jl                  0xffffffc4

        $sequence_12 = { 57 8b7d08 8d70ff 85f6 }
            // n = 4, score = 400
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8d70ff               | lea                 esi, dword ptr [eax - 1]
            //   85f6                 | test                esi, esi

        $sequence_13 = { 01459c 8b45c8 8945f8 eb05 }
            // n = 4, score = 400
            //   01459c               | add                 dword ptr [ebp - 0x64], eax
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   eb05                 | jmp                 7

        $sequence_14 = { 837d1003 8b55f0 0f836bffffff 8b4dfc 837d1000 765c }
            // n = 6, score = 400
            //   837d1003             | cmp                 dword ptr [ebp + 0x10], 3
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   0f836bffffff         | jae                 0xffffff71
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   765c                 | jbe                 0x5e

        $sequence_15 = { 8b4510 8bca 83f101 83e107 d3e8 30043a }
            // n = 6, score = 400
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8bca                 | mov                 ecx, edx
            //   83f101               | xor                 ecx, 1
            //   83e107               | and                 ecx, 7
            //   d3e8                 | shr                 eax, cl
            //   30043a               | xor                 byte ptr [edx + edi], al

        $sequence_16 = { 57 6852020000 68???????? 897dfc }
            // n = 4, score = 100
            //   57                   | push                edi
            //   6852020000           | push                0x252
            //   68????????           |                     
            //   897dfc               | mov                 dword ptr [ebp - 4], edi

        $sequence_17 = { 53 ffd6 ffd0 6a64 6a00 8d8578ffffff }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   ffd0                 | call                eax
            //   6a64                 | push                0x64
            //   6a00                 | push                0
            //   8d8578ffffff         | lea                 eax, dword ptr [ebp - 0x88]

        $sequence_18 = { 6a00 68???????? ff75fc ff55f0 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff55f0               | call                dword ptr [ebp - 0x10]

        $sequence_19 = { ff75fc ff55f0 ff75fc ff55ec 8d45fc 50 68???????? }
            // n = 7, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff55f0               | call                dword ptr [ebp - 0x10]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff55ec               | call                dword ptr [ebp - 0x14]
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_20 = { ff35???????? ffd6 ffd0 8d45ec 50 8d45ec 57 }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   ffd6                 | call                esi
            //   ffd0                 | call                eax
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   57                   | push                edi

        $sequence_21 = { 88450f 8bd0 c0650f03 8b4508 }
            // n = 4, score = 100
            //   88450f               | mov                 byte ptr [ebp + 0xf], al
            //   8bd0                 | mov                 edx, eax
            //   c0650f03             | shl                 byte ptr [ebp + 0xf], 3
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_22 = { 6a01 6a00 6a00 ff75fc ff55f0 6a64 68???????? }
            // n = 7, score = 100
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff55f0               | call                dword ptr [ebp - 0x10]
            //   6a64                 | push                0x64
            //   68????????           |                     

        $sequence_23 = { ffd6 6a64 8945ec ff7508 6a01 6a00 6a00 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   6a64                 | push                0x64
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 172032
}