rule win_poslurp_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.poslurp."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poslurp"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 85c0 7513 488b8c2490000000 ff15???????? bb01000000 488bcf }
            // n = 6, score = 100
            //   85c0                 | dec                 eax
            //   7513                 | lea                 eax, [ebp - 2]
            //   488b8c2490000000     | jne                 0x108
            //   ff15????????         |                     
            //   bb01000000           | je                  0x188
            //   488bcf               | dec                 esp

        $sequence_1 = { 4889b424a8020000 4889bc24b0020000 4c89a424b8020000 4c89ac2488020000 4533ed 4c89b42480020000 }
            // n = 6, score = 100
            //   4889b424a8020000     | mov                 word ptr [esp + 0x60], di
            //   4889bc24b0020000     | inc                 sp
            //   4c89a424b8020000     | mov                 dword ptr [esp + 0x62], ecx
            //   4c89ac2488020000     | mov                 word ptr [esp + 0x64], bx
            //   4533ed               | dec                 eax
            //   4c89b42480020000     | mov                 esi, eax

        $sequence_2 = { 488d4d01 488d542420 c644243000 e8???????? }
            // n = 4, score = 100
            //   488d4d01             | nop                 dword ptr [eax]
            //   488d542420           | movzx               eax, word ptr [edx]
            //   c644243000           | dec                 eax
            //   e8????????           |                     

        $sequence_3 = { ff15???????? 488905???????? 488bcb ff15???????? 833d????????00 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   488905????????       |                     
            //   488bcb               | dec                 eax
            //   ff15????????         |                     
            //   833d????????00       |                     

        $sequence_4 = { 418bed 890d???????? 4585c0 0f849f000000 4c8d2503280000 4c8d35bc270000 }
            // n = 6, score = 100
            //   418bed               | not                 ecx
            //   890d????????         |                     
            //   4585c0               | dec                 eax
            //   0f849f000000         | dec                 ecx
            //   4c8d2503280000       | dec                 ecx
            //   4c8d35bc270000       | add                 edx, 2

        $sequence_5 = { 6689445420 41ffc0 48ffc2 4883c9ff }
            // n = 4, score = 100
            //   6689445420           | jne                 0x3f8
            //   41ffc0               | dec                 eax
            //   48ffc2               | mov                 ebx, eax
            //   4883c9ff             | dec                 eax

        $sequence_6 = { ff15???????? 4c8d4c2458 448bc5 488bd6 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   4c8d4c2458           | mov                 ecx, edi
            //   448bc5               | dec                 ebp
            //   488bd6               | cmp                 edi, esi

        $sequence_7 = { 83e911 0f84b6000000 660f1f440000 0fbe06 ffc9 }
            // n = 5, score = 100
            //   83e911               | mov                 dword ptr [ebp + eax*2], ecx
            //   0f84b6000000         | dec                 eax
            //   660f1f440000         | or                  ecx, 0xffffffff
            //   0fbe06               | xor                 eax, eax
            //   ffc9                 | dec                 eax

        $sequence_8 = { 410fb64201 b91f000000 ba01000000 2bc8 410fb602 4983c202 }
            // n = 6, score = 100
            //   410fb64201           | mov                 edx, ebx
            //   b91f000000           | dec                 ecx
            //   ba01000000           | add                 esp, 2
            //   2bc8                 | dec                 eax
            //   410fb602             | sar                 ebx, 1
            //   4983c202             | lea                 eax, [ebx + 1]

        $sequence_9 = { 498b34c6 33c0 418bdc 488bfe 458bc4 498bd4 }
            // n = 6, score = 100
            //   498b34c6             | add                 ecx, eax
            //   33c0                 | inc                 ecx
            //   418bdc               | add                 ecx, 1
            //   488bfe               | mov                 dword ptr [esp + 0x64], eax
            //   458bc4               | inc                 esp
            //   498bd4               | mov                 dword ptr [esp + 0x60], ebx

    condition:
        7 of them and filesize < 50176
}