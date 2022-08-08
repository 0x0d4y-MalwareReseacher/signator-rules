rule win_tiny_turla_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.tiny_turla."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tiny_turla"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { e8???????? 85c0 74bd 488b4dd0 4c8d45e0 488d1582090000 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | je                  0xc6f
            //   74bd                 | mov                 eax, 1
            //   488b4dd0             | dec                 esp
            //   4c8d45e0             | lea                 ebx, [esp + 0xe0]
            //   488d1582090000       | dec                 ecx
            //   e8????????           |                     

        $sequence_1 = { 4183c8ff 488bd7 488bcb ff15???????? 85c0 }
            // n = 5, score = 100
            //   4183c8ff             | jne                 0xa08
            //   488bd7               | dec                 eax
            //   488bcb               | cmp                 dword ptr [ebp - 0x18], 0
            //   ff15????????         |                     
            //   85c0                 | je                  0x9fe

        $sequence_2 = { 488b16 8bd8 894567 41b906000200 488d4577 4533c0 }
            // n = 6, score = 100
            //   488b16               | dec                 esp
            //   8bd8                 | lea                 ecx, [ebp + 0x67]
            //   894567               | test                eax, eax
            //   41b906000200         | dec                 esp
            //   488d4577             | mov                 dword ptr [esp + 0x50], ecx
            //   4533c0               | mov                 bl, 1

        $sequence_3 = { ff15???????? 85c0 0f84b2feffff b801000000 4c8d9c24e0000000 498b5b20 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   85c0                 | dec                 eax
            //   0f84b2feffff         | lea                 ecx, [ebx + 0x20]
            //   b801000000           | inc                 esp
            //   4c8d9c24e0000000     | lea                 eax, [edx + 0x18]
            //   498b5b20             | xor                 edx, edx

        $sequence_4 = { 4c894c2420 488bd7 4c8d4d67 ff15???????? 85c0 7516 }
            // n = 6, score = 100
            //   4c894c2420           | jne                 0x1101
            //   488bd7               | cmp                 dword ptr [esp + 0x30], 4
            //   4c8d4d67             | jne                 0x1101
            //   ff15????????         |                     
            //   85c0                 | mov                 ecx, dword ptr [esp + 0x78]
            //   7516                 | test                eax, eax

        $sequence_5 = { 4883ec38 4c8bfa 4d8bf0 488d542468 }
            // n = 4, score = 100
            //   4883ec38             | je                  0x216
            //   4c8bfa               | inc                 ecx
            //   4d8bf0               | lea                 eax, [eax + edi]
            //   488d542468           | inc                 esp

        $sequence_6 = { 85c0 7516 4533ed bb0b000000 418bc5 85c0 410f45dd }
            // n = 7, score = 100
            //   85c0                 | lea                 eax, [esp + 0x50]
            //   7516                 | mov                 dword ptr [esp + 0x60], 1
            //   4533ed               | dec                 eax
            //   bb0b000000           | lea                 edx, [ebx + 8]
            //   418bc5               | dec                 eax
            //   85c0                 | mov                 ecx, ebx
            //   410f45dd             | test                eax, eax

        $sequence_7 = { c1e104 4889742458 48897c2430 e8???????? }
            // n = 4, score = 100
            //   c1e104               | dec                 eax
            //   4889742458           | lea                 ecx, [ebp - 0x18]
            //   48897c2430           | dec                 eax
            //   e8????????           |                     

        $sequence_8 = { 85c0 7516 4533ed bb0b000000 }
            // n = 4, score = 100
            //   85c0                 | dec                 eax
            //   7516                 | lea                 ecx, [0x930]
            //   4533ed               | test                eax, eax
            //   bb0b000000           | je                  0x55c

        $sequence_9 = { 488d5e10 488bcb e8???????? 4c8933 32db e9???????? 488bcf }
            // n = 7, score = 100
            //   488d5e10             | dec                 eax
            //   488bcb               | mov                 edx, edi
            //   e8????????           |                     
            //   4c8933               | dec                 eax
            //   32db                 | mov                 ecx, ebx
            //   e9????????           |                     
            //   488bcf               | test                eax, eax

    condition:
        7 of them and filesize < 51200
}