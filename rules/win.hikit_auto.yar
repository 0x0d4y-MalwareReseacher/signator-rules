rule win_hikit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.hikit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hikit"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { ff15???????? 85c0 756c ff15???????? 6800080000 6a00 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   756c                 | jne                 0x6e
            //   ff15????????         |                     
            //   6800080000           | push                0x800
            //   6a00                 | push                0

        $sequence_1 = { 48 8b442420 83b84801000001 7578 8b4c2428 48 8b442420 }
            // n = 7, score = 100
            //   48                   | dec                 eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   83b84801000001       | cmp                 dword ptr [eax + 0x148], 1
            //   7578                 | jne                 0x7a
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   48                   | dec                 eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]

        $sequence_2 = { c784244801000000000000 c784246001000000000000 c784243801000000000000 48 c784247801000000000000 48 c784244001000000000000 }
            // n = 7, score = 100
            //   c784244801000000000000     | mov    dword ptr [esp + 0x148], 0
            //   c784246001000000000000     | mov    dword ptr [esp + 0x160], 0
            //   c784243801000000000000     | mov    dword ptr [esp + 0x138], 0
            //   48                   | dec                 eax
            //   c784247801000000000000     | mov    dword ptr [esp + 0x178], 0
            //   48                   | dec                 eax
            //   c784244001000000000000     | mov    dword ptr [esp + 0x140], 0

        $sequence_3 = { 89442438 8b442478 39442438 7321 8b542438 }
            // n = 5, score = 100
            //   89442438             | mov                 dword ptr [esp + 0x38], eax
            //   8b442478             | mov                 eax, dword ptr [esp + 0x78]
            //   39442438             | cmp                 dword ptr [esp + 0x38], eax
            //   7321                 | jae                 0x23
            //   8b542438             | mov                 edx, dword ptr [esp + 0x38]

        $sequence_4 = { 48 8b442450 8b4008 8b8950100000 2bc8 48 8b442460 }
            // n = 7, score = 100
            //   48                   | dec                 eax
            //   8b442450             | mov                 eax, dword ptr [esp + 0x50]
            //   8b4008               | mov                 eax, dword ptr [eax + 8]
            //   8b8950100000         | mov                 ecx, dword ptr [ecx + 0x1050]
            //   2bc8                 | sub                 ecx, eax
            //   48                   | dec                 eax
            //   8b442460             | mov                 eax, dword ptr [esp + 0x60]

        $sequence_5 = { c7407001000000 48 8b4c2430 8b442458 }
            // n = 4, score = 100
            //   c7407001000000       | mov                 dword ptr [eax + 0x70], 1
            //   48                   | dec                 eax
            //   8b4c2430             | mov                 ecx, dword ptr [esp + 0x30]
            //   8b442458             | mov                 eax, dword ptr [esp + 0x58]

        $sequence_6 = { 33c0 2145fc 85d2 0f84a1000000 53 56 8b421c }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   2145fc               | and                 dword ptr [ebp - 4], eax
            //   85d2                 | test                edx, edx
            //   0f84a1000000         | je                  0xa7
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b421c               | mov                 eax, dword ptr [edx + 0x1c]

        $sequence_7 = { 8b4c243c c7473000000000 5f 5e 5b 33cc 33c0 }
            // n = 7, score = 100
            //   8b4c243c             | mov                 ecx, dword ptr [esp + 0x3c]
            //   c7473000000000       | mov                 dword ptr [edi + 0x30], 0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   33cc                 | xor                 ecx, esp
            //   33c0                 | xor                 eax, eax

        $sequence_8 = { 395df4 7507 8b45f8 3bc3 7512 ff75fc }
            // n = 6, score = 100
            //   395df4               | cmp                 dword ptr [ebp - 0xc], ebx
            //   7507                 | jne                 9
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   3bc3                 | cmp                 eax, ebx
            //   7512                 | jne                 0x14
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_9 = { 83c414 ebc9 8bc8 c1f905 8d1c8d40540210 8bf0 83e61f }
            // n = 7, score = 100
            //   83c414               | add                 esp, 0x14
            //   ebc9                 | jmp                 0xffffffcb
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   8d1c8d40540210       | lea                 ebx, [ecx*4 + 0x10025440]
            //   8bf0                 | mov                 esi, eax
            //   83e61f               | and                 esi, 0x1f

    condition:
        7 of them and filesize < 573440
}