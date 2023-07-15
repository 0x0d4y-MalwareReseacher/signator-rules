rule win_lcpdot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.lcpdot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lcpdot"
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
        $sequence_0 = { 488b7c2430 4533c9 4533c0 33d2 488bcf 89742438 ff15???????? }
            // n = 7, score = 100
            //   488b7c2430           | mov                 dword ptr [ebp + 0x90], 0
            //   4533c9               | dec                 eax
            //   4533c0               | mov                 dword ptr [ebp + 0x98], 0
            //   33d2                 | dec                 eax
            //   488bcf               | mov                 dword ptr [ebp + 0x78], 0
            //   89742438             | dec                 eax
            //   ff15????????         |                     

        $sequence_1 = { 48895808 e8???????? 33c0 488b5c2440 4883c430 5f }
            // n = 6, score = 100
            //   48895808             | mov                 ecx, edi
            //   e8????????           |                     
            //   33c0                 | dec                 eax
            //   488b5c2440           | sar                 ecx, 5
            //   4883c430             | inc                 ecx
            //   5f                   | and                 ebx, 0x1f

        $sequence_2 = { 4533c9 897c2428 897c2420 48897c2430 e8???????? 85c0 7518 }
            // n = 7, score = 100
            //   4533c9               | jne                 0x6d1
            //   897c2428             | dec                 eax
            //   897c2420             | mov                 ecx, eax
            //   48897c2430           | mov                 dword ptr [esp + 0x48], 3
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   7518                 | mov                 dword ptr [esp + 0x50], edi

        $sequence_3 = { 488b4c2448 4533c9 458d4104 488d5608 ff15???????? 4c8b442448 488b4c2440 }
            // n = 7, score = 100
            //   488b4c2448           | dec                 esp
            //   4533c9               | mov                 eax, dword ptr [ecx]
            //   458d4104             | mov                 edx, 1
            //   488d5608             | inc                 ecx
            //   ff15????????         |                     
            //   4c8b442448           | call                dword ptr [eax]
            //   488b4c2440           | dec                 eax

        $sequence_4 = { 4883ec28 e8???????? 4885c0 7509 488d05df2e0100 eb04 }
            // n = 6, score = 100
            //   4883ec28             | mov                 eax, dword ptr [ebx + 8]
            //   e8????????           |                     
            //   4885c0               | dec                 esp
            //   7509                 | mov                 dword ptr [eax], ebx
            //   488d05df2e0100       | inc                 ecx
            //   eb04                 | cmp                 ebx, esp

        $sequence_5 = { 488d0d4fde0000 e8???????? 85c0 755a }
            // n = 4, score = 100
            //   488d0d4fde0000       | mov                 dword ptr [esp + 0x72], eax
            //   e8????????           |                     
            //   85c0                 | mov                 word ptr [esp + 0x76], ax
            //   755a                 | inc                 sp

        $sequence_6 = { 7408 8bcb ff15???????? e8???????? 488d157ede0000 }
            // n = 5, score = 100
            //   7408                 | dec                 eax
            //   8bcb                 | add                 edx, esi
            //   ff15????????         |                     
            //   e8????????           |                     
            //   488d157ede0000       | inc                 esp

        $sequence_7 = { 48897010 57 4883ec60 488bf1 44894018 498bf9 488bda }
            // n = 7, score = 100
            //   48897010             | lea                 ebx, [esp + 0x30]
            //   57                   | dec                 eax
            //   4883ec60             | sub                 ebx, eax
            //   488bf1               | nop                 word ptr [eax + eax]
            //   44894018             | inc                 ecx
            //   498bf9               | movzx               eax, byte ptr [ebx]
            //   488bda               | dec                 ecx

        $sequence_8 = { e8???????? 85c0 745d 8b5c2438 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   745d                 | mov                 edi, ebp
            //   8b5c2438             | dec                 ecx

        $sequence_9 = { 741e 448b4538 4585c0 7415 488d153f320100 488d8c2440020000 ff15???????? }
            // n = 7, score = 100
            //   741e                 | mov                 dword ptr [ebp + 8], 0xff
            //   448b4538             | dec                 eax
            //   4585c0               | mov                 dword ptr [ebp + 0x10], 0
            //   7415                 | dec                 eax
            //   488d153f320100       | mov                 dword ptr [ebp + 0x18], 0
            //   488d8c2440020000     | mov                 dword ptr [ecx + 0xc8], 1
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 257024
}