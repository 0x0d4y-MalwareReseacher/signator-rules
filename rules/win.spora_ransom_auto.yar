rule win_spora_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.spora_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spora_ransom"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { ff15???????? ff75f8 ff15???????? 5f 5e 8bc3 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8bc3                 | mov                 eax, ebx

        $sequence_1 = { 668945f2 ff750c 33c0 668945f4 8d45f0 50 }
            // n = 6, score = 200
            //   668945f2             | mov                 word ptr [ebp - 0xe], ax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   33c0                 | xor                 eax, eax
            //   668945f4             | mov                 word ptr [ebp - 0xc], ax
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax

        $sequence_2 = { e8???????? 57 ff15???????? 83c620 ff4d08 75b4 8b7df4 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   83c620               | add                 esi, 0x20
            //   ff4d08               | dec                 dword ptr [ebp + 8]
            //   75b4                 | jne                 0xffffffb6
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]

        $sequence_3 = { 68???????? ff75fc 57 ff35???????? ff15???????? 85c0 }
            // n = 6, score = 200
            //   68????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   57                   | push                edi
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_4 = { 7436 03fb 83ff0c 72ec 33ff }
            // n = 5, score = 200
            //   7436                 | je                  0x38
            //   03fb                 | add                 edi, ebx
            //   83ff0c               | cmp                 edi, 0xc
            //   72ec                 | jb                  0xffffffee
            //   33ff                 | xor                 edi, edi

        $sequence_5 = { ff15???????? 8b442410 83c02c 50 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   83c02c               | add                 eax, 0x2c
            //   50                   | push                eax

        $sequence_6 = { 7402 8b18 56 ff15???????? ff75f8 }
            // n = 5, score = 200
            //   7402                 | je                  4
            //   8b18                 | mov                 ebx, dword ptr [eax]
            //   56                   | push                esi
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_7 = { e8???????? 85c0 7557 394508 7452 8d7714 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7557                 | jne                 0x59
            //   394508               | cmp                 dword ptr [ebp + 8], eax
            //   7452                 | je                  0x54
            //   8d7714               | lea                 esi, dword ptr [edi + 0x14]

        $sequence_8 = { 7438 57 53 56 ff7508 }
            // n = 5, score = 200
            //   7438                 | je                  0x3a
            //   57                   | push                edi
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_9 = { 50 6a08 bb00300000 ff15???????? }
            // n = 4, score = 200
            //   50                   | push                eax
            //   6a08                 | push                8
            //   bb00300000           | mov                 ebx, 0x3000
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 73728
}