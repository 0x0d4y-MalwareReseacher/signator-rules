rule win_smominru_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.smominru."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.smominru"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { c745fcfeffffff e8???????? 8b45cc e8???????? }
            // n = 4, score = 100
            //   c745fcfeffffff       | mov                 dword ptr [ebp - 4], 0xfffffffe
            //   e8????????           |                     
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   e8????????           |                     

        $sequence_1 = { ff15???????? 85c0 0f8d76d9b07b 50 e8???????? 33c0 c9 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8d76d9b07b         | jge                 0x7bb0d97c
            //   50                   | push                eax
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   c9                   | leave               

        $sequence_2 = { 8b45bc 03c7 3bc7 0f828e47ab7b 3bd8 0f878647ab7b }
            // n = 6, score = 100
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]
            //   03c7                 | add                 eax, edi
            //   3bc7                 | cmp                 eax, edi
            //   0f828e47ab7b         | jb                  0x7bab4794
            //   3bd8                 | cmp                 ebx, eax
            //   0f878647ab7b         | ja                  0x7bab478c

        $sequence_3 = { 8d7f00 55 54 5d 56 57 }
            // n = 6, score = 100
            //   8d7f00               | lea                 edi, [edi]
            //   55                   | push                ebp
            //   54                   | push                esp
            //   5d                   | pop                 ebp
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_4 = { 8b55c8 3bd6 0f858017ac7b 8b5dd4 }
            // n = 4, score = 100
            //   8b55c8               | mov                 edx, dword ptr [ebp - 0x38]
            //   3bd6                 | cmp                 edx, esi
            //   0f858017ac7b         | jne                 0x7bac1786
            //   8b5dd4               | mov                 ebx, dword ptr [ebp - 0x2c]

        $sequence_5 = { 0f85514ac17b 53 33db f6464801 0f85884ac17b }
            // n = 5, score = 100
            //   0f85514ac17b         | jne                 0x7bc14a57
            //   53                   | push                ebx
            //   33db                 | xor                 ebx, ebx
            //   f6464801             | test                byte ptr [esi + 0x48], 1
            //   0f85884ac17b         | jne                 0x7bc14a8e

        $sequence_6 = { 8b85f0fdffff 894620 8bc3 5b 8b4dfc 33cd }
            // n = 6, score = 100
            //   8b85f0fdffff         | mov                 eax, dword ptr [ebp - 0x210]
            //   894620               | mov                 dword ptr [esi + 0x20], eax
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

        $sequence_7 = { 0f844a4ac17b 3bc3 0f846d4ac17b 8a4807 }
            // n = 4, score = 100
            //   0f844a4ac17b         | je                  0x7bc14a50
            //   3bc3                 | cmp                 eax, ebx
            //   0f846d4ac17b         | je                  0x7bc14a73
            //   8a4807               | mov                 cl, byte ptr [eax + 7]

        $sequence_8 = { 8d43f8 80780705 0f848992c17b f640073f }
            // n = 4, score = 100
            //   8d43f8               | lea                 eax, [ebx - 8]
            //   80780705             | cmp                 byte ptr [eax + 7], 5
            //   0f848992c17b         | je                  0x7bc1928f
            //   f640073f             | test                byte ptr [eax + 7], 0x3f

        $sequence_9 = { 85f6 0f84173ea97b 6a00 56 e8???????? 85c0 0f8412b5ac7b }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   0f84173ea97b         | je                  0x7ba93e1d
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8412b5ac7b         | je                  0x7bacb518

    condition:
        7 of them and filesize < 163840
}