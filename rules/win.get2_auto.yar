rule win_get2_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.get2."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.get2"
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
        $sequence_0 = { 8975d0 33ff 8975cc 897dd4 }
            // n = 4, score = 1000
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi
            //   33ff                 | xor                 edi, edi
            //   8975cc               | mov                 dword ptr [ebp - 0x34], esi
            //   897dd4               | mov                 dword ptr [ebp - 0x2c], edi

        $sequence_1 = { 895dfc e8???????? c645fc02 eb0b 8d45d8 }
            // n = 5, score = 1000
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   e8????????           |                     
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   eb0b                 | jmp                 0xd
            //   8d45d8               | lea                 eax, [ebp - 0x28]

        $sequence_2 = { 59 57 53 8d4dd8 e8???????? 8bc6 }
            // n = 6, score = 1000
            //   59                   | pop                 ecx
            //   57                   | push                edi
            //   53                   | push                ebx
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   e8????????           |                     
            //   8bc6                 | mov                 eax, esi

        $sequence_3 = { 33db c745ec07000000 43 897de8 33c0 895dd4 }
            // n = 6, score = 1000
            //   33db                 | xor                 ebx, ebx
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   43                   | inc                 ebx
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   33c0                 | xor                 eax, eax
            //   895dd4               | mov                 dword ptr [ebp - 0x2c], ebx

        $sequence_4 = { 8d8d24ffffff e8???????? 59 8bc8 }
            // n = 4, score = 1000
            //   8d8d24ffffff         | lea                 ecx, [ebp - 0xdc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bc8                 | mov                 ecx, eax

        $sequence_5 = { 8be5 5d c20400 68d0000000 b8???????? e8???????? 8bf1 }
            // n = 7, score = 1000
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   68d0000000           | push                0xd0
            //   b8????????           |                     
            //   e8????????           |                     
            //   8bf1                 | mov                 esi, ecx

        $sequence_6 = { 807d0c00 0f859a000000 f6c104 7430 8d4c2404 e8???????? 8d4c240c }
            // n = 7, score = 1000
            //   807d0c00             | cmp                 byte ptr [ebp + 0xc], 0
            //   0f859a000000         | jne                 0xa0
            //   f6c104               | test                cl, 4
            //   7430                 | je                  0x32
            //   8d4c2404             | lea                 ecx, [esp + 4]
            //   e8????????           |                     
            //   8d4c240c             | lea                 ecx, [esp + 0xc]

        $sequence_7 = { 8bf1 8975bc 8b4508 8d4dd8 50 e8???????? }
            // n = 6, score = 1000
            //   8bf1                 | mov                 esi, ecx
            //   8975bc               | mov                 dword ptr [ebp - 0x44], esi
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 483b4630 0f83c8060000 488b5e28 488b1cc3 48ffc8 }
            // n = 5, score = 100
            //   483b4630             | dec                 esp
            //   0f83c8060000         | lea                 ecx, [0xffff9a89]
            //   488b5e28             | dec                 eax
            //   488b1cc3             | mov                 dword ptr [esp + 0x20], edx
            //   48ffc8               | dec                 esp

        $sequence_9 = { 4032ff 4c896c2430 44896c2428 44896c2420 4533c9 }
            // n = 5, score = 100
            //   4032ff               | lea                 edx, [ebp - 0x49]
            //   4c896c2430           | dec                 eax
            //   44896c2428           | lea                 ecx, [ebp + 0xf]
            //   44896c2420           | dec                 eax
            //   4533c9               | cmp                 dword ptr [eax + 0x18], 0x10

        $sequence_10 = { 90 488d8b88010000 48c7411807000000 48897910 4883791808 }
            // n = 5, score = 100
            //   90                   | mov                 dword ptr [esp + 0x28], ebp
            //   488d8b88010000       | inc                 esp
            //   48c7411807000000     | mov                 dword ptr [esp + 0x20], ebp
            //   48897910             | inc                 ebp
            //   4883791808           | xor                 ecx, ecx

        $sequence_11 = { 4533f6 488d4577 488bfa 44897577 488bf1 4889442420 }
            // n = 6, score = 100
            //   4533f6               | lea                 eax, [esi + 0x20]
            //   488d4577             | dec                 ebp
            //   488bfa               | mov                 esp, edi
            //   44897577             | dec                 eax
            //   488bf1               | mov                 ebx, ebp
            //   4889442420           | nop                 

        $sequence_12 = { 4c8d0d899affff 4889542420 4c8d4620 4d8be7 488bdd }
            // n = 5, score = 100
            //   4c8d0d899affff       | inc                 eax
            //   4889542420           | xor                 bh, bh
            //   4c8d4620             | dec                 esp
            //   4d8be7               | mov                 dword ptr [esp + 0x30], ebp
            //   488bdd               | inc                 esp

        $sequence_13 = { 488d55b7 488d4d0f e8???????? 4883781810 }
            // n = 4, score = 100
            //   488d55b7             | dec                 eax
            //   488d4d0f             | lea                 ecx, [0x2864a]
            //   e8????????           |                     
            //   4883781810           | dec                 eax

        $sequence_14 = { 755d f605????????01 7554 488b9290000000 488d0d4a860200 e8???????? }
            // n = 6, score = 100
            //   755d                 | jne                 0x5f
            //   f605????????01       |                     
            //   7554                 | jne                 0x56
            //   488b9290000000       | dec                 eax
            //   488d0d4a860200       | mov                 edx, dword ptr [edx + 0x90]
            //   e8????????           |                     

        $sequence_15 = { 4883bda800000008 480f439590000000 41b900000001 448b85a0000000 498bcc }
            // n = 5, score = 100
            //   4883bda800000008     | dec                 eax
            //   480f439590000000     | lea                 ecx, [ebx + 0x188]
            //   41b900000001         | dec                 eax
            //   448b85a0000000       | mov                 dword ptr [ecx + 0x18], 7
            //   498bcc               | dec                 eax

    condition:
        7 of them and filesize < 720896
}