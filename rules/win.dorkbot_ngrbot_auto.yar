rule win_dorkbot_ngrbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.dorkbot_ngrbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dorkbot_ngrbot"
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
        $sequence_0 = { 50 e8???????? 83c404 85c0 7402 43 90 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7402                 | je                  4
            //   43                   | inc                 ebx
            //   90                   | nop                 

        $sequence_1 = { 52 53 ff15???????? 813b53444720 8d45e8 0f85d7010000 50 }
            // n = 7, score = 200
            //   52                   | push                edx
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   813b53444720         | cmp                 dword ptr [ebx], 0x20474453
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   0f85d7010000         | jne                 0x1dd
            //   50                   | push                eax

        $sequence_2 = { 53 ff15???????? 8b5508 50 53 52 ff15???????? }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   52                   | push                edx
            //   ff15????????         |                     

        $sequence_3 = { 1bc0 2345f0 d1ea 50 8b85ccf7ffff 51 52 }
            // n = 7, score = 200
            //   1bc0                 | sbb                 eax, eax
            //   2345f0               | and                 eax, dword ptr [ebp - 0x10]
            //   d1ea                 | shr                 edx, 1
            //   50                   | push                eax
            //   8b85ccf7ffff         | mov                 eax, dword ptr [ebp - 0x834]
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_4 = { 85ff 7515 68???????? 57 e8???????? 83c408 85c0 }
            // n = 7, score = 200
            //   85ff                 | test                edi, edi
            //   7515                 | jne                 0x17
            //   68????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_5 = { 50 51 e8???????? 46 83fe32 7ce7 6a64 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   46                   | inc                 esi
            //   83fe32               | cmp                 esi, 0x32
            //   7ce7                 | jl                  0xffffffe9
            //   6a64                 | push                0x64

        $sequence_6 = { c3 6a04 8d55fc 52 6802100000 68ffff0000 56 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   6a04                 | push                4
            //   8d55fc               | lea                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx
            //   6802100000           | push                0x1002
            //   68ffff0000           | push                0xffff
            //   56                   | push                esi

        $sequence_7 = { 8b4df8 57 51 53 e8???????? 8b5634 }
            // n = 6, score = 200
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   57                   | push                edi
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8b5634               | mov                 edx, dword ptr [esi + 0x34]

        $sequence_8 = { 52 e8???????? 83c404 5f b801000000 5e }
            // n = 6, score = 200
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   5f                   | pop                 edi
            //   b801000000           | mov                 eax, 1
            //   5e                   | pop                 esi

        $sequence_9 = { ba05000000 668955dc eb06 33c0 668945dc 8d4df0 }
            // n = 6, score = 200
            //   ba05000000           | mov                 edx, 5
            //   668955dc             | mov                 word ptr [ebp - 0x24], dx
            //   eb06                 | jmp                 8
            //   33c0                 | xor                 eax, eax
            //   668945dc             | mov                 word ptr [ebp - 0x24], ax
            //   8d4df0               | lea                 ecx, dword ptr [ebp - 0x10]

    condition:
        7 of them and filesize < 638976
}