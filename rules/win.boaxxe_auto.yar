rule win_boaxxe_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.boaxxe."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.boaxxe"
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
        $sequence_0 = { 8d45ec e8???????? 66837dee08 0f8290000000 33d2 55 68???????? }
            // n = 7, score = 100
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   e8????????           |                     
            //   66837dee08           | cmp                 word ptr [ebp - 0x12], 8
            //   0f8290000000         | jb                  0x96
            //   33d2                 | xor                 edx, edx
            //   55                   | push                ebp
            //   68????????           |                     

        $sequence_1 = { 7d02 8bc3 8bc8 03c9 8b1424 8b06 e8???????? }
            // n = 7, score = 100
            //   7d02                 | jge                 4
            //   8bc3                 | mov                 eax, ebx
            //   8bc8                 | mov                 ecx, eax
            //   03c9                 | add                 ecx, ecx
            //   8b1424               | mov                 edx, dword ptr [esp]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   e8????????           |                     

        $sequence_2 = { 833c2400 750e b001 e8???????? eb05 33c0 890424 }
            // n = 7, score = 100
            //   833c2400             | cmp                 dword ptr [esp], 0
            //   750e                 | jne                 0x10
            //   b001                 | mov                 al, 1
            //   e8????????           |                     
            //   eb05                 | jmp                 7
            //   33c0                 | xor                 eax, eax
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_3 = { e8???????? ff75e8 8bc7 ba03000000 e8???????? 43 83fb0a }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3
            //   e8????????           |                     
            //   43                   | inc                 ebx
            //   83fb0a               | cmp                 ebx, 0xa

        $sequence_4 = { 8b45f4 8b55e8 e8???????? c645f301 eb0f 43 4f }
            // n = 7, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   c645f301             | mov                 byte ptr [ebp - 0xd], 1
            //   eb0f                 | jmp                 0x11
            //   43                   | inc                 ebx
            //   4f                   | dec                 edi

        $sequence_5 = { 8d4ddc ba12000000 e8???????? 8d45dc 50 e8???????? e8???????? }
            // n = 7, score = 100
            //   8d4ddc               | lea                 ecx, [ebp - 0x24]
            //   ba12000000           | mov                 edx, 0x12
            //   e8????????           |                     
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   e8????????           |                     
            //   e8????????           |                     

        $sequence_6 = { ba???????? 8b45fc e8???????? 8b45f4 8bd3 e8???????? 8b03 }
            // n = 7, score = 100
            //   ba????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8bd3                 | mov                 edx, ebx
            //   e8????????           |                     
            //   8b03                 | mov                 eax, dword ptr [ebx]

        $sequence_7 = { 8b4028 e8???????? 33c0 89431c c7432001000000 c7435404000000 eb3c }
            // n = 7, score = 100
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   89431c               | mov                 dword ptr [ebx + 0x1c], eax
            //   c7432001000000       | mov                 dword ptr [ebx + 0x20], 1
            //   c7435404000000       | mov                 dword ptr [ebx + 0x54], 4
            //   eb3c                 | jmp                 0x3e

        $sequence_8 = { ff75e4 ff75e8 683850bc6d e8???????? 83c410 8b45f8 83ec08 }
            // n = 7, score = 100
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   683850bc6d           | push                0x6dbc5038
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   83ec08               | sub                 esp, 8

        $sequence_9 = { c745fc20000000 8d45a0 8b55f0 e8???????? 8b45a0 33c9 8b55f4 }
            // n = 7, score = 100
            //   c745fc20000000       | mov                 dword ptr [ebp - 4], 0x20
            //   8d45a0               | lea                 eax, [ebp - 0x60]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   8b45a0               | mov                 eax, dword ptr [ebp - 0x60]
            //   33c9                 | xor                 ecx, ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 1146880
}