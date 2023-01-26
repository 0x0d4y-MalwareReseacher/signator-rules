rule win_hikit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.hikit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hikit"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { ff15???????? 837c243402 7554 8b442428 83f805 754b 8b44242c }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   837c243402           | cmp                 dword ptr [esp + 0x34], 2
            //   7554                 | jne                 0x56
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   83f805               | cmp                 eax, 5
            //   754b                 | jne                 0x4d
            //   8b44242c             | mov                 eax, dword ptr [esp + 0x2c]

        $sequence_1 = { 8b842480000000 0fb600 240f 0fb6c8 48 8b842488000000 0fb6400c }
            // n = 7, score = 100
            //   8b842480000000       | mov                 eax, dword ptr [esp + 0x80]
            //   0fb600               | movzx               eax, byte ptr [eax]
            //   240f                 | and                 al, 0xf
            //   0fb6c8               | movzx               ecx, al
            //   48                   | dec                 eax
            //   8b842488000000       | mov                 eax, dword ptr [esp + 0x88]
            //   0fb6400c             | movzx               eax, byte ptr [eax + 0xc]

        $sequence_2 = { ebe4 48 8b442430 48 83780800 750e 48 }
            // n = 7, score = 100
            //   ebe4                 | jmp                 0xffffffe6
            //   48                   | dec                 eax
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   48                   | dec                 eax
            //   83780800             | cmp                 dword ptr [eax + 8], 0
            //   750e                 | jne                 0x10
            //   48                   | dec                 eax

        $sequence_3 = { 53 56 57 8b7d0c 8b5f38 83fb02 7541 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   8b5f38               | mov                 ebx, dword ptr [edi + 0x38]
            //   83fb02               | cmp                 ebx, 2
            //   7541                 | jne                 0x43

        $sequence_4 = { 7407 33c0 e9???????? 48 83bc244001000000 0f857a010000 c684249001000000 }
            // n = 7, score = 100
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   48                   | dec                 eax
            //   83bc244001000000     | cmp                 dword ptr [esp + 0x140], 0
            //   0f857a010000         | jne                 0x180
            //   c684249001000000     | mov                 byte ptr [esp + 0x190], 0

        $sequence_5 = { e8???????? 85c0 750a b801000000 e9???????? 0fb7550c 81fae8030000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750a                 | jne                 0xc
            //   b801000000           | mov                 eax, 1
            //   e9????????           |                     
            //   0fb7550c             | movzx               edx, word ptr [ebp + 0xc]
            //   81fae8030000         | cmp                 edx, 0x3e8

        $sequence_6 = { e8???????? 83c404 8945ec 8b4dec 890d???????? 6800040000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   890d????????         |                     
            //   6800040000           | push                0x400

        $sequence_7 = { eb53 837e0400 7433 8d4618 50 ff15???????? }
            // n = 6, score = 100
            //   eb53                 | jmp                 0x55
            //   837e0400             | cmp                 dword ptr [esi + 4], 0
            //   7433                 | je                  0x35
            //   8d4618               | lea                 eax, [esi + 0x18]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_8 = { 8b4c2428 48 8b842488000000 48 8b04c8 48 89442450 }
            // n = 7, score = 100
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   48                   | dec                 eax
            //   8b842488000000       | mov                 eax, dword ptr [esp + 0x88]
            //   48                   | dec                 eax
            //   8b04c8               | mov                 eax, dword ptr [eax + ecx*8]
            //   48                   | dec                 eax
            //   89442450             | mov                 dword ptr [esp + 0x50], eax

        $sequence_9 = { 7544 48 8b442458 0fb74802 48 8b442408 0fb700 }
            // n = 7, score = 100
            //   7544                 | jne                 0x46
            //   48                   | dec                 eax
            //   8b442458             | mov                 eax, dword ptr [esp + 0x58]
            //   0fb74802             | movzx               ecx, word ptr [eax + 2]
            //   48                   | dec                 eax
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   0fb700               | movzx               eax, word ptr [eax]

    condition:
        7 of them and filesize < 573440
}