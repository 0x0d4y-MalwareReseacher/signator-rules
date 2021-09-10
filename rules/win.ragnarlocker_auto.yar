rule win_ragnarlocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ragnarlocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ragnarlocker"
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
        $sequence_0 = { 8bec 51 8b450c 53 56 57 8d1c80 }
            // n = 7, score = 300
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d1c80               | lea                 ebx, dword ptr [eax + eax*4]

        $sequence_1 = { 8bfa c1ef07 0fa4ca19 0bf2 c1e119 31750c 0bf9 }
            // n = 7, score = 300
            //   8bfa                 | mov                 edi, edx
            //   c1ef07               | shr                 edi, 7
            //   0fa4ca19             | shld                edx, ecx, 0x19
            //   0bf2                 | or                  esi, edx
            //   c1e119               | shl                 ecx, 0x19
            //   31750c               | xor                 dword ptr [ebp + 0xc], esi
            //   0bf9                 | or                  edi, ecx

        $sequence_2 = { 8d4d10 51 8d8d4cf5ffff 51 6804010000 50 }
            // n = 6, score = 300
            //   8d4d10               | lea                 ecx, dword ptr [ebp + 0x10]
            //   51                   | push                ecx
            //   8d8d4cf5ffff         | lea                 ecx, dword ptr [ebp - 0xab4]
            //   51                   | push                ecx
            //   6804010000           | push                0x104
            //   50                   | push                eax

        $sequence_3 = { 0f47d1 52 ffd6 8d45e8 50 6a24 8d45bc }
            // n = 7, score = 300
            //   0f47d1               | cmova               edx, ecx
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   6a24                 | push                0x24
            //   8d45bc               | lea                 eax, dword ptr [ebp - 0x44]

        $sequence_4 = { 83412001 0f94c0 014124 85f6 }
            // n = 4, score = 300
            //   83412001             | add                 dword ptr [ecx + 0x20], 1
            //   0f94c0               | sete                al
            //   014124               | add                 dword ptr [ecx + 0x24], eax
            //   85f6                 | test                esi, esi

        $sequence_5 = { 8bf9 0facd112 c1e70e c1ea12 0bfa 8975d8 }
            // n = 6, score = 300
            //   8bf9                 | mov                 edi, ecx
            //   0facd112             | shrd                ecx, edx, 0x12
            //   c1e70e               | shl                 edi, 0xe
            //   c1ea12               | shr                 edx, 0x12
            //   0bfa                 | or                  edi, edx
            //   8975d8               | mov                 dword ptr [ebp - 0x28], esi

        $sequence_6 = { 8b4df4 234dec 8b55e4 33f1 03d7 8b7df0 13fe }
            // n = 7, score = 300
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   234dec               | and                 ecx, dword ptr [ebp - 0x14]
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   33f1                 | xor                 esi, ecx
            //   03d7                 | add                 edx, edi
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   13fe                 | adc                 edi, esi

        $sequence_7 = { 33fe 33d9 c1ea06 8b4da8 33fa 8b55f8 03cb }
            // n = 7, score = 300
            //   33fe                 | xor                 edi, esi
            //   33d9                 | xor                 ebx, ecx
            //   c1ea06               | shr                 edx, 6
            //   8b4da8               | mov                 ecx, dword ptr [ebp - 0x58]
            //   33fa                 | xor                 edi, edx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   03cb                 | add                 ecx, ebx

        $sequence_8 = { 99 c1e308 0bf2 0bd8 89b530ffffff 8b45a0 }
            // n = 6, score = 300
            //   99                   | cdq                 
            //   c1e308               | shl                 ebx, 8
            //   0bf2                 | or                  esi, edx
            //   0bd8                 | or                  ebx, eax
            //   89b530ffffff         | mov                 dword ptr [ebp - 0xd0], esi
            //   8b45a0               | mov                 eax, dword ptr [ebp - 0x60]

        $sequence_9 = { 0bfa 8975fc 8b55ec 33df 33f6 0bf1 8b4dd8 }
            // n = 7, score = 300
            //   0bfa                 | or                  edi, edx
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   33df                 | xor                 ebx, edi
            //   33f6                 | xor                 esi, esi
            //   0bf1                 | or                  esi, ecx
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]

    condition:
        7 of them and filesize < 147456
}