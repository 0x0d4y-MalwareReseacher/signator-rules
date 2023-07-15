rule win_lazardoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.lazardoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lazardoor"
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
        $sequence_0 = { 4883ec38 488d05e5ab0000 41b91b000000 4889442420 e8???????? }
            // n = 5, score = 100
            //   4883ec38             | cmp                 edi, dword ptr [ecx + 6]
            //   488d05e5ab0000       | jae                 0x29b
            //   41b91b000000         | dec                 eax
            //   4889442420           | add                 edi, ecx
            //   e8????????           |                     

        $sequence_1 = { 8905???????? 486305???????? 4869d008020000 48c7c0ffffffff 4803d6 }
            // n = 5, score = 100
            //   8905????????         |                     
            //   486305????????       |                     
            //   4869d008020000       | lea                 eax, [0xfffea017]
            //   48c7c0ffffffff       | dec                 edx
            //   4803d6               | mov                 edx, dword ptr [eax + 0x27630]

        $sequence_2 = { e8???????? 488d4da0 c745a01c010000 ff15???????? 85c0 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   488d4da0             | mov                 dword ptr [esp + 0x20], eax
            //   c745a01c010000       | dec                 ecx
            //   ff15????????         |                     
            //   85c0                 | mov                 ecx, edi

        $sequence_3 = { 4c8bdc 55 56 4155 4157 498dabf8feffff 4881ece8010000 }
            // n = 7, score = 100
            //   4c8bdc               | jne                 0x1199
            //   55                   | dec                 eax
            //   56                   | mov                 dword ptr [esp + 0x20], ebx
            //   4155                 | test                eax, eax
            //   4157                 | je                  0x1178
            //   498dabf8feffff       | dec                 ebp
            //   4881ece8010000       | test                esp, esp

        $sequence_4 = { 8bfd 8d41ff 3dffff9f00 0f8727010000 8bd1 b940000000 ff15???????? }
            // n = 7, score = 100
            //   8bfd                 | inc                 ecx
            //   8d41ff               | push                edi
            //   3dffff9f00           | dec                 eax
            //   0f8727010000         | sub                 esp, 0x20
            //   8bd1                 | dec                 ecx
            //   b940000000           | mov                 esi, ecx
            //   ff15????????         |                     

        $sequence_5 = { 4883ec20 488d05ef2c0100 488bf9 488901 8bda 4883c108 }
            // n = 6, score = 100
            //   4883ec20             | inc                 esp
            //   488d05ef2c0100       | mov                 dword ptr [esp + 0x48], ebp
            //   488bf9               | inc                 ecx
            //   488901               | mov                 eax, 0x104
            //   8bda                 | inc                 ebp
            //   4883c108             | mov                 esi, ebp

        $sequence_6 = { 48c1f806 488d0d68130100 4183e23f 4903e8 498bf0 }
            // n = 5, score = 100
            //   48c1f806             | dec                 eax
            //   488d0d68130100       | lea                 ecx, [0x2a282]
            //   4183e23f             | inc                 esp
            //   4903e8               | lea                 esi, [edx*4 + 0x68]
            //   498bf0               | inc                 ecx

        $sequence_7 = { 813d????????dcf79f00 761c 498bce ff15???????? 498bcf ff15???????? ba5a540000 }
            // n = 7, score = 100
            //   813d????????dcf79f00     |     
            //   761c                 | movsx               eax, byte ptr [ecx + esi + 0x1a588]
            //   498bce               | inc                 edx
            //   ff15????????         |                     
            //   498bcf               | mov                 cl, byte ptr [ecx + esi + 0x1a598]
            //   ff15????????         |                     
            //   ba5a540000           | dec                 esp

        $sequence_8 = { 488d0d0bdf0000 488b45d8 488908 488d0dad860100 488b45d8 8990a8030000 488b45d8 }
            // n = 7, score = 100
            //   488d0d0bdf0000       | inc                 esp
            //   488b45d8             | mov                 esi, eax
            //   488908               | dec                 eax
            //   488d0dad860100       | mov                 edi, dword ptr [esi + 8]
            //   488b45d8             | movzx               ebx, word ptr [ecx + 0x14]
            //   8990a8030000         | dec                 eax
            //   488b45d8             | add                 ebx, 0x24

        $sequence_9 = { 488b03 4885c0 7419 4533c0 488bcf 418d5001 ffd0 }
            // n = 7, score = 100
            //   488b03               | inc                 ecx
            //   4885c0               | add                 esi, -0x22
            //   7419                 | dec                 ebp
            //   4533c0               | test                eax, eax
            //   488bcf               | inc                 ecx
            //   418d5001             | mov                 bl, 1
            //   ffd0                 | dec                 esp

    condition:
        7 of them and filesize < 405504
}