rule win_yarat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.yarat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.yarat"
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
        $sequence_0 = { 8b450c 51 03c2 50 6a01 56 e8???????? }
            // n = 7, score = 100
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   03c2                 | add                 eax, edx
            //   50                   | push                eax
            //   6a01                 | push                1
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_1 = { 8b45d8 85c0 741e ff752c ff7528 50 ff75e0 }
            // n = 7, score = 100
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20
            //   ff752c               | push                dword ptr [ebp + 0x2c]
            //   ff7528               | push                dword ptr [ebp + 0x28]
            //   50                   | push                eax
            //   ff75e0               | push                dword ptr [ebp - 0x20]

        $sequence_2 = { 8b8370040000 c6404700 8b8370040000 c70000000000 83be5803000002 7522 83be24040000ff }
            // n = 7, score = 100
            //   8b8370040000         | mov                 eax, dword ptr [ebx + 0x470]
            //   c6404700             | mov                 byte ptr [eax + 0x47], 0
            //   8b8370040000         | mov                 eax, dword ptr [ebx + 0x470]
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   83be5803000002       | cmp                 dword ptr [esi + 0x358], 2
            //   7522                 | jne                 0x24
            //   83be24040000ff       | cmp                 dword ptr [esi + 0x424], -1

        $sequence_3 = { e8???????? 8bd0 83c408 85d2 0f8407020000 8a4a01 42 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bd0                 | mov                 edx, eax
            //   83c408               | add                 esp, 8
            //   85d2                 | test                edx, edx
            //   0f8407020000         | je                  0x20d
            //   8a4a01               | mov                 cl, byte ptr [edx + 1]
            //   42                   | inc                 edx

        $sequence_4 = { 897308 8d4e02 0f1f4000 668b06 83c602 6685c0 75f5 }
            // n = 7, score = 100
            //   897308               | mov                 dword ptr [ebx + 8], esi
            //   8d4e02               | lea                 ecx, [esi + 2]
            //   0f1f4000             | nop                 dword ptr [eax]
            //   668b06               | mov                 ax, word ptr [esi]
            //   83c602               | add                 esi, 2
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7

        $sequence_5 = { 8b4510 ff30 8b4508 05140a0000 50 e8???????? 83c408 }
            // n = 7, score = 100
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   ff30                 | push                dword ptr [eax]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   05140a0000           | add                 eax, 0xa14
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_6 = { c64435d800 eb16 c68570feffff00 8d4dd8 ffb570feffff 56 e8???????? }
            // n = 7, score = 100
            //   c64435d800           | mov                 byte ptr [ebp + esi - 0x28], 0
            //   eb16                 | jmp                 0x18
            //   c68570feffff00       | mov                 byte ptr [ebp - 0x190], 0
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   ffb570feffff         | push                dword ptr [ebp - 0x190]
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_7 = { e8???????? 83c404 ff7714 e8???????? 8b3483 83c404 8d0483 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ff7714               | push                dword ptr [edi + 0x14]
            //   e8????????           |                     
            //   8b3483               | mov                 esi, dword ptr [ebx + eax*4]
            //   83c404               | add                 esp, 4
            //   8d0483               | lea                 eax, [ebx + eax*4]

        $sequence_8 = { 90 f6d7 660f49dc 5b e9???????? f9 8d92615d7c02 }
            // n = 7, score = 100
            //   90                   | nop                 
            //   f6d7                 | not                 bh
            //   660f49dc             | cmovns              bx, sp
            //   5b                   | pop                 ebx
            //   e9????????           |                     
            //   f9                   | stc                 
            //   8d92615d7c02         | lea                 edx, [edx + 0x27c5d61]

        $sequence_9 = { 8b08 8b4508 89881c060000 8bc3 5b 8be5 5d }
            // n = 7, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   89881c060000         | mov                 dword ptr [eax + 0x61c], ecx
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

    condition:
        7 of them and filesize < 8692736
}