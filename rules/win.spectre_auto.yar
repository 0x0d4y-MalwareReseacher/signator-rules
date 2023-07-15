rule win_spectre_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.spectre."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spectre"
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
        $sequence_0 = { 8d442410 50 8d442420 50 e8???????? 8b442418 8b7c2424 }
            // n = 7, score = 100
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   50                   | push                eax
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   8b7c2424             | mov                 edi, dword ptr [esp + 0x24]

        $sequence_1 = { ff7010 51 8d4de4 e8???????? 8d4dcc e8???????? 8d4508 }
            // n = 7, score = 100
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   51                   | push                ecx
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   e8????????           |                     
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   e8????????           |                     
            //   8d4508               | lea                 eax, [ebp + 8]

        $sequence_2 = { 59 83a424f400000000 89b424f8000000 c68424e400000000 8d8c24b0210000 e8???????? 8b8c24a4210000 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   83a424f400000000     | and                 dword ptr [esp + 0xf4], 0
            //   89b424f8000000       | mov                 dword ptr [esp + 0xf8], esi
            //   c68424e400000000     | mov                 byte ptr [esp + 0xe4], 0
            //   8d8c24b0210000       | lea                 ecx, [esp + 0x21b0]
            //   e8????????           |                     
            //   8b8c24a4210000       | mov                 ecx, dword ptr [esp + 0x21a4]

        $sequence_3 = { bf???????? a1???????? c745f0283d1824 c745f428282c2e c745f822346047 3b8104000000 7f12 }
            // n = 7, score = 100
            //   bf????????           |                     
            //   a1????????           |                     
            //   c745f0283d1824       | mov                 dword ptr [ebp - 0x10], 0x24183d28
            //   c745f428282c2e       | mov                 dword ptr [ebp - 0xc], 0x2e2c2828
            //   c745f822346047       | mov                 dword ptr [ebp - 8], 0x47603422
            //   3b8104000000         | cmp                 eax, dword ptr [ecx + 4]
            //   7f12                 | jg                  0x14

        $sequence_4 = { 68???????? 50 8d44245c 50 e8???????? 8d4c2448 83c40c }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   8d44245c             | lea                 eax, [esp + 0x5c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d4c2448             | lea                 ecx, [esp + 0x48]
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { 8b5c2420 8d4c2468 e8???????? 6a18 59 3bfe 0f84a9050000 }
            // n = 7, score = 100
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   8d4c2468             | lea                 ecx, [esp + 0x68]
            //   e8????????           |                     
            //   6a18                 | push                0x18
            //   59                   | pop                 ecx
            //   3bfe                 | cmp                 edi, esi
            //   0f84a9050000         | je                  0x5af

        $sequence_6 = { e8???????? 8bf8 59 85ff 741d 8b4d0c 53 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx
            //   85ff                 | test                edi, edi
            //   741d                 | je                  0x1f
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   53                   | push                ebx

        $sequence_7 = { e8???????? c9 c3 53 8b5c240c 55 bd???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c9                   | leave               
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   8b5c240c             | mov                 ebx, dword ptr [esp + 0xc]
            //   55                   | push                ebp
            //   bd????????           |                     

        $sequence_8 = { 833d????????10 8bcf ff35???????? 0f4335???????? 56 e8???????? 8d4d87 }
            // n = 7, score = 100
            //   833d????????10       |                     
            //   8bcf                 | mov                 ecx, edi
            //   ff35????????         |                     
            //   0f4335????????       |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   8d4d87               | lea                 ecx, [ebp - 0x79]

        $sequence_9 = { 3bc7 7239 8b8c24d4000000 40 89442414 894c2418 3d00100000 }
            // n = 7, score = 100
            //   3bc7                 | cmp                 eax, edi
            //   7239                 | jb                  0x3b
            //   8b8c24d4000000       | mov                 ecx, dword ptr [esp + 0xd4]
            //   40                   | inc                 eax
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   894c2418             | mov                 dword ptr [esp + 0x18], ecx
            //   3d00100000           | cmp                 eax, 0x1000

    condition:
        7 of them and filesize < 990208
}