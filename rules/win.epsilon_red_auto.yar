rule win_epsilon_red_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.epsilon_red."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.epsilon_red"
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
        $sequence_0 = { e8???????? 48837c242000 7c0f 488b442470 488b4c2468 e9???????? 488b542468 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   48837c242000         | mov                 ecx, dword ptr [esp + 0x78]
            //   7c0f                 | dec                 esp
            //   488b442470           | mov                 dword ptr [edx + 0x16c0], edx
            //   488b4c2468           | dec                 esp
            //   e9????????           |                     
            //   488b542468           | cmp                 dword ptr [edx + 0x16c8], edx

        $sequence_1 = { 488b742448 488b1e 488b5610 488b442440 e9???????? 4883f818 0f85ee000000 }
            // n = 7, score = 200
            //   488b742448           | mov                 eax, dword ptr [esp + 0x80]
            //   488b1e               | dec                 eax
            //   488b5610             | mov                 ebx, dword ptr [esp + 0x98]
            //   488b442440           | dec                 eax
            //   e9????????           |                     
            //   4883f818             | lea                 ecx, [ebx + eax]
            //   0f85ee000000         | dec                 eax

        $sequence_2 = { 488d8424a0030000 4829f0 483d28030001 0f8680000000 4881ec08000001 4889ac2400000001 488dac2400000001 }
            // n = 7, score = 200
            //   488d8424a0030000     | cmp                 dh, 0xf0
            //   4829f0               | jae                 0x28e
            //   483d28030001         | mov                 edi, esi
            //   0f8680000000         | dec                 eax
            //   4881ec08000001       | mov                 edx, dword ptr [esp + 0x20]
            //   4889ac2400000001     | movzx               ebx, byte ptr [edx]
            //   488dac2400000001     | dec                 eax

        $sequence_3 = { f00fb15e58 0f94c2 84d2 7492 0f1f00 4885f6 0f8584000000 }
            // n = 7, score = 200
            //   f00fb15e58           | sub                 esp, 0x18
            //   0f94c2               | dec                 eax
            //   84d2                 | mov                 dword ptr [esp + 0x10], ebp
            //   7492                 | dec                 eax
            //   0f1f00               | lea                 ebp, [esp + 0x10]
            //   4885f6               | dec                 eax
            //   0f8584000000         | mov                 eax, dword ptr [esp + 0x20]

        $sequence_4 = { e8???????? 488b7c2420 8407 488b05???????? 833d????????00 0f85d0000000 488907 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   488b7c2420           | mov                 dword ptr [esp + 0x70], edx
            //   8407                 | dec                 ebp
            //   488b05????????       |                     
            //   833d????????00       |                     
            //   0f85d0000000         | cmp                 esi, eax
            //   488907               | jge                 0x764

        $sequence_5 = { ebe1 31db e9???????? 48890c24 c644240801 e8???????? 488b6c2418 }
            // n = 7, score = 200
            //   ebe1                 | test                eax, eax
            //   31db                 | je                  0x17c
            //   e9????????           |                     
            //   48890c24             | jne                 0x1a1
            //   c644240801           | dec                 eax
            //   e8????????           |                     
            //   488b6c2418           | mov                 dword ptr [eax + 8], edx

        $sequence_6 = { f6c104 0f842d010000 83e1fb 884e08 4889442458 488b6c2430 4883c438 }
            // n = 7, score = 200
            //   f6c104               | jl                  0x2d1
            //   0f842d010000         | nop                 
            //   83e1fb               | dec                 eax
            //   884e08               | mov                 edi, dword ptr [esp + 0xe0]
            //   4889442458           | inc                 ebp
            //   488b6c2430           | xor                 eax, eax
            //   4883c438             | jmp                 0x31e

        $sequence_7 = { f0490fc138 4829f2 4885d2 0f845c010000 803d????????00 7408 84c9 }
            // n = 7, score = 200
            //   f0490fc138           | cmp                 dword ptr [ecx + 0xd0], eax
            //   4829f2               | ja                  0xaeb
            //   4885d2               | dec                 eax
            //   0f845c010000         | cmp                 dword ptr [ecx + 0xd8], eax
            //   803d????????00       |                     
            //   7408                 | ja                  0xaf6
            //   84c9                 | cmp                 esi, 4

        $sequence_8 = { 83c69f 4080fe19 7712 4889d6 49b82d30373a30303a30 e9???????? 48895c2430 }
            // n = 7, score = 200
            //   83c69f               | lea                 edi, [ecx + 1]
            //   4080fe19             | dec                 eax
            //   7712                 | mov                 ecx, dword ptr [esp + 0x70]
            //   4889d6               | dec                 eax
            //   49b82d30373a30303a30     | mov    edx, dword ptr [esp + 0x20]
            //   e9????????           |                     
            //   48895c2430           | dec                 esp

        $sequence_9 = { 8b4c2464 894c2408 e8???????? 488b442410 48898424c8000000 0fb75030 0f1f440000 }
            // n = 7, score = 200
            //   8b4c2464             | mov                 dword ptr [esp], 0
            //   894c2408             | dec                 eax
            //   e8????????           |                     
            //   488b442410           | lea                 eax, [0xb9cdb]
            //   48898424c8000000     | dec                 eax
            //   0fb75030             | mov                 dword ptr [esp + 8], eax
            //   0f1f440000           | dec                 eax

    condition:
        7 of them and filesize < 5075968
}