rule win_r77_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.r77."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.r77"
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
        $sequence_0 = { 740c 8b4f0c e8???????? 85c0 }
            // n = 4, score = 200
            //   740c                 | je                  0xe
            //   8b4f0c               | mov                 ecx, dword ptr [edi + 0xc]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 740b 8b0f e8???????? 85c0 }
            // n = 4, score = 200
            //   740b                 | je                  0xd
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_2 = { c745c4367e0010 a1???????? 8d4dc0 33c1 8945c8 8b4518 }
            // n = 6, score = 100
            //   c745c4367e0010       | mov                 dword ptr [ebp - 0x3c], 0x10007e36
            //   a1????????           |                     
            //   8d4dc0               | lea                 ecx, [ebp - 0x40]
            //   33c1                 | xor                 eax, ecx
            //   8945c8               | mov                 dword ptr [ebp - 0x38], eax
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]

        $sequence_3 = { 8bc1 83e13f c1e806 6bc938 8b0485f8a00110 f644082801 }
            // n = 6, score = 100
            //   8bc1                 | mov                 eax, ecx
            //   83e13f               | and                 ecx, 0x3f
            //   c1e806               | shr                 eax, 6
            //   6bc938               | imul                ecx, ecx, 0x38
            //   8b0485f8a00110       | mov                 eax, dword ptr [eax*4 + 0x1001a0f8]
            //   f644082801           | test                byte ptr [eax + ecx + 0x28], 1

        $sequence_4 = { 4885c0 0f84d3010000 448b4754 488bd3 488bc8 e8???????? 440fb74f14 }
            // n = 7, score = 100
            //   4885c0               | lea                 eax, [0x20d30]
            //   0f84d3010000         | dec                 eax
            //   448b4754             | lea                 edx, [0x1bbe9]
            //   488bd3               | dec                 eax
            //   488bc8               | lea                 ecx, [0x1bbfa]
            //   e8????????           |                     
            //   440fb74f14           | dec                 esp

        $sequence_5 = { 4156 4157 4883ec20 488bd9 bab80a4c53 }
            // n = 5, score = 100
            //   4156                 | dec                 eax
            //   4157                 | test                ecx, ecx
            //   4883ec20             | je                  0x14
            //   488bd9               | dec                 eax
            //   bab80a4c53           | mov                 ecx, dword ptr [ecx + 0x18]

        $sequence_6 = { 488bcd ff15???????? bb01000000 488bcf ff15???????? 4c8d9c2430020000 }
            // n = 6, score = 100
            //   488bcd               | dec                 eax
            //   ff15????????         |                     
            //   bb01000000           | mov                 ecx, ebp
            //   488bcf               | mov                 ebx, 1
            //   ff15????????         |                     
            //   4c8d9c2430020000     | dec                 eax

        $sequence_7 = { 4c8d05300d0200 488d15e9bb0100 488d0dfabb0100 e8???????? 4c8d0d1a0c0000 4c8d05070d0200 }
            // n = 6, score = 100
            //   4c8d05300d0200       | inc                 ecx
            //   488d15e9bb0100       | push                esi
            //   488d0dfabb0100       | inc                 ecx
            //   e8????????           |                     
            //   4c8d0d1a0c0000       | push                edi
            //   4c8d05070d0200       | dec                 eax

        $sequence_8 = { 33db 488b0d???????? 4885c9 7412 488b4918 }
            // n = 5, score = 100
            //   33db                 | mov                 ecx, edi
            //   488b0d????????       |                     
            //   4885c9               | dec                 esp
            //   7412                 | lea                 ebx, [esp + 0x230]
            //   488b4918             | xor                 ebx, ebx

        $sequence_9 = { 33c0 bb0a020000 89452c 53 50 }
            // n = 5, score = 100
            //   33c0                 | xor                 eax, eax
            //   bb0a020000           | mov                 ebx, 0x20a
            //   89452c               | mov                 dword ptr [ebp + 0x2c], eax
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_10 = { 8b04bdf8a00110 807c182800 7d47 8b750c 807e1400 }
            // n = 5, score = 100
            //   8b04bdf8a00110       | mov                 eax, dword ptr [edi*4 + 0x1001a0f8]
            //   807c182800           | cmp                 byte ptr [eax + ebx + 0x28], 0
            //   7d47                 | jge                 0x49
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   807e1400             | cmp                 byte ptr [esi + 0x14], 0

        $sequence_11 = { c1ef03 85ff 741b 56 57 }
            // n = 5, score = 100
            //   c1ef03               | shr                 edi, 3
            //   85ff                 | test                edi, edi
            //   741b                 | je                  0x1d
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_12 = { 0f858b000000 837c246404 0f8580000000 448b742468 33c9 }
            // n = 5, score = 100
            //   0f858b000000         | sub                 esp, 0x20
            //   837c246404           | dec                 eax
            //   0f8580000000         | mov                 ebx, ecx
            //   448b742468           | mov                 edx, 0x534c0ab8
            //   33c9                 | dec                 esp

        $sequence_13 = { 6a40 8b45f4 50 8b4dec }
            // n = 4, score = 100
            //   6a40                 | push                0x40
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

    condition:
        7 of them and filesize < 350208
}