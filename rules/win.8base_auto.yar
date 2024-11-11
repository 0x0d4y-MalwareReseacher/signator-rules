rule win_8base_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.8base."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.8base"
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
        $sequence_0 = { ffd6 8d8c2420010000 51 ffd7 8d942440110000 }
            // n = 5, score = 100
            //   ffd6                 | call                esi
            //   8d8c2420010000       | lea                 ecx, [esp + 0x120]
            //   51                   | push                ecx
            //   ffd7                 | call                edi
            //   8d942440110000       | lea                 edx, [esp + 0x1140]

        $sequence_1 = { f8 290c67 98 a6 73c2 }
            // n = 5, score = 100
            //   f8                   | clc                 
            //   290c67               | sub                 dword ptr [edi], ecx
            //   98                   | cwde                
            //   a6                   | cmpsb               byte ptr [esi], byte ptr es:[edi]
            //   73c2                 | jae                 0xffffffc4

        $sequence_2 = { 68ff000000 e8???????? 59 59 8b7508 8d34f588b34200 391e }
            // n = 7, score = 100
            //   68ff000000           | push                0xff
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d34f588b34200       | lea                 esi, [esi*8 + 0x42b388]
            //   391e                 | cmp                 dword ptr [esi], ebx

        $sequence_3 = { 75b9 e8???????? a1???????? a3???????? ffd0 }
            // n = 5, score = 100
            //   75b9                 | jne                 0xffffffbb
            //   e8????????           |                     
            //   a1????????           |                     
            //   a3????????           |                     
            //   ffd0                 | call                eax

        $sequence_4 = { c684249c00000002 50 c7442410043a4000 e8???????? }
            // n = 4, score = 100
            //   c684249c00000002     | mov                 byte ptr [esp + 0x9c], 2
            //   50                   | push                eax
            //   c7442410043a4000     | mov                 dword ptr [esp + 0x10], 0x403a04
            //   e8????????           |                     

        $sequence_5 = { d3ea 89542414 8b442434 01442414 8b442424 31442410 }
            // n = 6, score = 100
            //   d3ea                 | shr                 edx, cl
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   8b442434             | mov                 eax, dword ptr [esp + 0x34]
            //   01442414             | add                 dword ptr [esp + 0x14], eax
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   31442410             | xor                 dword ptr [esp + 0x10], eax

        $sequence_6 = { ff15???????? 8b442414 40 3d???????? 89442414 0f8c0effffff 8b35???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   40                   | inc                 eax
            //   3d????????           |                     
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   0f8c0effffff         | jl                  0xffffff14
            //   8b35????????         |                     

        $sequence_7 = { 894c2438 89542434 e8???????? a1???????? 814424283f020000 }
            // n = 5, score = 100
            //   894c2438             | mov                 dword ptr [esp + 0x38], ecx
            //   89542434             | mov                 dword ptr [esp + 0x34], edx
            //   e8????????           |                     
            //   a1????????           |                     
            //   814424283f020000     | add                 dword ptr [esp + 0x28], 0x23f

        $sequence_8 = { 6689442416 33c9 668954241a 8d442434 50 66894c241c 8b4c241c }
            // n = 7, score = 100
            //   6689442416           | mov                 word ptr [esp + 0x16], ax
            //   33c9                 | xor                 ecx, ecx
            //   668954241a           | mov                 word ptr [esp + 0x1a], dx
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   50                   | push                eax
            //   66894c241c           | mov                 word ptr [esp + 0x1c], cx
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]

        $sequence_9 = { 899c24ac000000 3bfb 7449 8b8424b8000000 56 8d742418 }
            // n = 6, score = 100
            //   899c24ac000000       | mov                 dword ptr [esp + 0xac], ebx
            //   3bfb                 | cmp                 edi, ebx
            //   7449                 | je                  0x4b
            //   8b8424b8000000       | mov                 eax, dword ptr [esp + 0xb8]
            //   56                   | push                esi
            //   8d742418             | lea                 esi, [esp + 0x18]

    condition:
        7 of them and filesize < 10838016
}