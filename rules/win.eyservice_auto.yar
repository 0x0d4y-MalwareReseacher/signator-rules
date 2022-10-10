rule win_eyservice_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.eyservice."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.eyservice"
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
        $sequence_0 = { 6aff 50 ff15???????? 85c0 757e 8b4624 }
            // n = 6, score = 100
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   757e                 | jne                 0x80
            //   8b4624               | mov                 eax, dword ptr [esi + 0x24]

        $sequence_1 = { 68???????? c705????????01000000 ffd7 83c40c 8d542438 68???????? 52 }
            // n = 7, score = 100
            //   68????????           |                     
            //   c705????????01000000     |     
            //   ffd7                 | call                edi
            //   83c40c               | add                 esp, 0xc
            //   8d542438             | lea                 edx, [esp + 0x38]
            //   68????????           |                     
            //   52                   | push                edx

        $sequence_2 = { 56 56 ffd7 50 a3???????? ffd5 a1???????? }
            // n = 7, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   a3????????           |                     
            //   ffd5                 | call                ebp
            //   a1????????           |                     

        $sequence_3 = { c744243814000000 ff15???????? 85c0 0f85ba000000 8b442414 8d4c2420 51 }
            // n = 7, score = 100
            //   c744243814000000     | mov                 dword ptr [esp + 0x38], 0x14
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f85ba000000         | jne                 0xc0
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8d4c2420             | lea                 ecx, [esp + 0x20]
            //   51                   | push                ecx

        $sequence_4 = { ff15???????? 8d4e20 c744241400000000 e8???????? 8b44241c 8906 c7460400000000 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d4e20               | lea                 ecx, [esi + 0x20]
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0
            //   e8????????           |                     
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   8906                 | mov                 dword ptr [esi], eax
            //   c7460400000000       | mov                 dword ptr [esi + 4], 0

        $sequence_5 = { 8b4308 050000ff8f 83f801 7708 c744242001000000 8b430c 8b742478 }
            // n = 7, score = 100
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   050000ff8f           | add                 eax, 0x8fff0000
            //   83f801               | cmp                 eax, 1
            //   7708                 | ja                  0xa
            //   c744242001000000     | mov                 dword ptr [esp + 0x20], 1
            //   8b430c               | mov                 eax, dword ptr [ebx + 0xc]
            //   8b742478             | mov                 esi, dword ptr [esp + 0x78]

        $sequence_6 = { 8b4204 03c6 83780800 c744241800000000 750f 8b402c 85c0 }
            // n = 7, score = 100
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   03c6                 | add                 eax, esi
            //   83780800             | cmp                 dword ptr [eax + 8], 0
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   750f                 | jne                 0x11
            //   8b402c               | mov                 eax, dword ptr [eax + 0x2c]
            //   85c0                 | test                eax, eax

        $sequence_7 = { 899ec0000000 8986c8000000 8900 8d86d4000000 898ecc000000 899ed0000000 8986d8000000 }
            // n = 7, score = 100
            //   899ec0000000         | mov                 dword ptr [esi + 0xc0], ebx
            //   8986c8000000         | mov                 dword ptr [esi + 0xc8], eax
            //   8900                 | mov                 dword ptr [eax], eax
            //   8d86d4000000         | lea                 eax, [esi + 0xd4]
            //   898ecc000000         | mov                 dword ptr [esi + 0xcc], ecx
            //   899ed0000000         | mov                 dword ptr [esi + 0xd0], ebx
            //   8986d8000000         | mov                 dword ptr [esi + 0xd8], eax

        $sequence_8 = { 83f801 7409 b807000000 5e c20400 6a01 68???????? }
            // n = 7, score = 100
            //   83f801               | cmp                 eax, 1
            //   7409                 | je                  0xb
            //   b807000000           | mov                 eax, 7
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   6a01                 | push                1
            //   68????????           |                     

        $sequence_9 = { e8???????? 8bc8 83c404 894dec c645fc01 3bcb 7409 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   83c404               | add                 esp, 4
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   3bcb                 | cmp                 ecx, ebx
            //   7409                 | je                  0xb

    condition:
        7 of them and filesize < 452608
}