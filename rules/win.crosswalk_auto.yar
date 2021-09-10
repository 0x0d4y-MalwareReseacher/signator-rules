rule win_crosswalk_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.crosswalk."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crosswalk"
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
        $sequence_0 = { 4c8bc6 33d2 410fbe00 49ffc0 }
            // n = 4, score = 1300
            //   4c8bc6               | inc                 eax
            //   33d2                 | ror                 edx, cl
            //   410fbe00             | add                 edx, eax
            //   49ffc0               | inc                 ecx

        $sequence_1 = { d3ca 03d0 4183ef01 75ef }
            // n = 4, score = 1300
            //   d3ca                 | imul                eax, edx, 0xe89
            //   03d0                 | cmp                 ecx, eax
            //   4183ef01             | add                 edx, ecx
            //   75ef                 | sar                 edx, 0xb

        $sequence_2 = { 458d7ee0 418bd7 ff15???????? 4821742420 }
            // n = 4, score = 1300
            //   458d7ee0             | mov                 eax, esi
            //   418bd7               | xor                 edx, edx
            //   ff15????????         |                     
            //   4821742420           | inc                 ecx

        $sequence_3 = { 4883ec28 4885c9 7402 ffd1 }
            // n = 4, score = 1300
            //   4883ec28             | sub                 edi, 1
            //   4885c9               | jne                 0xfffffff9
            //   7402                 | sar                 edx, 0xb
            //   ffd1                 | mov                 eax, edx

        $sequence_4 = { 33d2 488bc8 e8???????? 4533c9 4533c0 33d2 }
            // n = 6, score = 1300
            //   33d2                 | inc                 ecx
            //   488bc8               | mov                 eax, 0x8ce6568d
            //   e8????????           |                     
            //   4533c9               | inc                 ecx
            //   4533c0               | mov                 eax, eax
            //   33d2                 | imul                ecx

        $sequence_5 = { 410fbe00 49ffc0 d3ca 03d0 }
            // n = 4, score = 1300
            //   410fbe00             | inc                 ecx
            //   49ffc0               | movsx               eax, byte ptr [eax]
            //   d3ca                 | dec                 ecx
            //   03d0                 | inc                 eax

        $sequence_6 = { 41b88d56e68c 418bc0 f7e9 03d1 c1fa0b }
            // n = 5, score = 1300
            //   41b88d56e68c         | ror                 edx, cl
            //   418bc0               | add                 edx, eax
            //   f7e9                 | inc                 ecx
            //   03d1                 | sub                 edi, 1
            //   c1fa0b               | jne                 0xfffffff1

        $sequence_7 = { 8bc2 c1e81f 03d0 69c2890e0000 }
            // n = 4, score = 1300
            //   8bc2                 | sub                 edi, 1
            //   c1e81f               | inc                 ecx
            //   03d0                 | mov                 eax, eax
            //   69c2890e0000         | imul                ecx

        $sequence_8 = { 7719 ff2485a2364000 6a04 58 }
            // n = 4, score = 200
            //   7719                 | ror                 edx, cl
            //   ff2485a2364000       | dec                 eax
            //   6a04                 | test                ecx, ecx
            //   58                   | je                  4

        $sequence_9 = { 8b0cc50c644100 894de4 85c9 7455 8b4510 }
            // n = 5, score = 200
            //   8b0cc50c644100       | mov                 eax, edx
            //   894de4               | shr                 eax, 0x1f
            //   85c9                 | inc                 ebp
            //   7455                 | lea                 edi, dword ptr [esi - 0x20]
            //   8b4510               | inc                 ecx

        $sequence_10 = { 8955e0 8b048d808e4100 0fb6441028 83e001 747c 57 e8???????? }
            // n = 7, score = 200
            //   8955e0               | mov                 ecx, eax
            //   8b048d808e4100       | inc                 ebp
            //   0fb6441028           | xor                 ecx, ecx
            //   83e001               | dec                 esp
            //   747c                 | mov                 eax, esi
            //   57                   | xor                 edx, edx
            //   e8????????           |                     

        $sequence_11 = { 8b049d808e4100 0fb6440828 83e001 7469 56 e8???????? 59 }
            // n = 7, score = 200
            //   8b049d808e4100       | mov                 edx, edi
            //   0fb6440828           | dec                 eax
            //   83e001               | and                 dword ptr [esp + 0x20], esi
            //   7469                 | dec                 eax
            //   56                   | mov                 ecx, eax
            //   e8????????           |                     
            //   59                   | inc                 ebp

        $sequence_12 = { ff15???????? 8b04bd808e4100 834c0318ff 33c0 eb16 e8???????? }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8b04bd808e4100       | inc                 ecx
            //   834c0318ff           | movsx               eax, byte ptr [eax]
            //   33c0                 | dec                 ecx
            //   eb16                 | inc                 eax
            //   e8????????           |                     

        $sequence_13 = { 8b45e0 8d4e0c 6a06 8d90fc814100 5f 668b02 8d5202 }
            // n = 7, score = 200
            //   8b45e0               | inc                 ecx
            //   8d4e0c               | sub                 edi, 1
            //   6a06                 | jne                 0xfffffff7
            //   8d90fc814100         | inc                 ebp
            //   5f                   | mov                 eax, esi
            //   668b02               | xor                 edx, edx
            //   8d5202               | dec                 eax

        $sequence_14 = { 7443 83e801 0f8501010000 c745e0245b4100 8b4508 8bcf 8b7510 }
            // n = 7, score = 200
            //   7443                 | call                ecx
            //   83e801               | mov                 eax, 1
            //   0f8501010000         | inc                 ecx
            //   c745e0245b4100       | mov                 eax, eax
            //   8b4508               | imul                ecx
            //   8bcf                 | add                 edx, ecx
            //   8b7510               | sar                 edx, 0xb

        $sequence_15 = { 3998f8814100 0f84ea000000 41 83c030 }
            // n = 4, score = 200
            //   3998f8814100         | xor                 ecx, ecx
            //   0f84ea000000         | inc                 ebp
            //   41                   | xor                 eax, eax
            //   83c030               | xor                 edx, edx

    condition:
        7 of them and filesize < 286720
}