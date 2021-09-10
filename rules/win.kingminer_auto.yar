rule win_kingminer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.kingminer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kingminer"
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
        $sequence_0 = { 50 ffd7 ff15???????? 6a01 ff15???????? 6a01 ff15???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   ff15????????         |                     

        $sequence_1 = { 50 ff15???????? 8b4f50 51 8b8db0feffff e8???????? 8b95d8feffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4f50               | mov                 ecx, dword ptr [edi + 0x50]
            //   51                   | push                ecx
            //   8b8db0feffff         | mov                 ecx, dword ptr [ebp - 0x150]
            //   e8????????           |                     
            //   8b95d8feffff         | mov                 edx, dword ptr [ebp - 0x128]

        $sequence_2 = { 85c0 756b 6810010000 8d85ecfeffff 57 }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   756b                 | jne                 0x6d
            //   6810010000           | push                0x110
            //   8d85ecfeffff         | lea                 eax, dword ptr [ebp - 0x114]
            //   57                   | push                edi

        $sequence_3 = { 57 ff15???????? ff15???????? 57 57 57 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   ff15????????         |                     
            //   ff15????????         |                     
            //   57                   | push                edi
            //   57                   | push                edi
            //   57                   | push                edi

        $sequence_4 = { 5e 8be5 5d c3 8b7078 }
            // n = 5, score = 100
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b7078               | mov                 esi, dword ptr [eax + 0x78]

        $sequence_5 = { 8915???????? 5f 5b 5e 8b4dfc 33cd e8???????? }
            // n = 7, score = 100
            //   8915????????         |                     
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp
            //   e8????????           |                     

        $sequence_6 = { 03c8 8d543112 eb5c 8d45cc 50 56 }
            // n = 6, score = 100
            //   03c8                 | add                 ecx, eax
            //   8d543112             | lea                 edx, dword ptr [ecx + esi + 0x12]
            //   eb5c                 | jmp                 0x5e
            //   8d45cc               | lea                 eax, dword ptr [ebp - 0x34]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_7 = { 8d550c 52 e8???????? 83c414 85c0 }
            // n = 5, score = 100
            //   8d550c               | lea                 edx, dword ptr [ebp + 0xc]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax

        $sequence_8 = { 6a00 6a00 6a00 6a00 ff15???????? 6a01 ff15???????? }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   ff15????????         |                     

        $sequence_9 = { 83791000 7514 8b4f3c 8b17 394a38 740a }
            // n = 6, score = 100
            //   83791000             | cmp                 dword ptr [ecx + 0x10], 0
            //   7514                 | jne                 0x16
            //   8b4f3c               | mov                 ecx, dword ptr [edi + 0x3c]
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   394a38               | cmp                 dword ptr [edx + 0x38], ecx
            //   740a                 | je                  0xc

    condition:
        7 of them and filesize < 165888
}