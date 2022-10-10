rule win_bohmini_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.bohmini."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bohmini"
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
        $sequence_0 = { 740c 81feea000000 0f859a000000 8b442420 896c241c 3bc5 }
            // n = 6, score = 100
            //   740c                 | je                  0xe
            //   81feea000000         | cmp                 esi, 0xea
            //   0f859a000000         | jne                 0xa0
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   896c241c             | mov                 dword ptr [esp + 0x1c], ebp
            //   3bc5                 | cmp                 eax, ebp

        $sequence_1 = { 57 33c0 33c9 8a0e }
            // n = 4, score = 100
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax
            //   33c9                 | xor                 ecx, ecx
            //   8a0e                 | mov                 cl, byte ptr [esi]

        $sequence_2 = { 66a5 8d4c2420 55 bf04010000 }
            // n = 4, score = 100
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8d4c2420             | lea                 ecx, [esp + 0x20]
            //   55                   | push                ebp
            //   bf04010000           | mov                 edi, 0x104

        $sequence_3 = { 8b742414 8b3d???????? 56 ffd7 56 c604305c }
            // n = 6, score = 100
            //   8b742414             | mov                 esi, dword ptr [esp + 0x14]
            //   8b3d????????         |                     
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   56                   | push                esi
            //   c604305c             | mov                 byte ptr [eax + esi], 0x5c

        $sequence_4 = { 6a00 89742424 8d9600200000 52 50 6a04 6a00 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   89742424             | mov                 dword ptr [esp + 0x24], esi
            //   8d9600200000         | lea                 edx, [esi + 0x2000]
            //   52                   | push                edx
            //   50                   | push                eax
            //   6a04                 | push                4
            //   6a00                 | push                0

        $sequence_5 = { 3bd1 5f 7556 89442408 8b842420020000 8d542400 }
            // n = 6, score = 100
            //   3bd1                 | cmp                 edx, ecx
            //   5f                   | pop                 edi
            //   7556                 | jne                 0x58
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   8b842420020000       | mov                 eax, dword ptr [esp + 0x220]
            //   8d542400             | lea                 edx, [esp]

        $sequence_6 = { ff15???????? 83f820 7e04 6a01 eb06 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   83f820               | cmp                 eax, 0x20
            //   7e04                 | jle                 6
            //   6a01                 | push                1
            //   eb06                 | jmp                 8

        $sequence_7 = { 05401f0000 50 e8???????? 83c404 }
            // n = 4, score = 100
            //   05401f0000           | add                 eax, 0x1f40
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_8 = { 6a04 6800100000 55 6a00 56 ff15???????? 8bd8 }
            // n = 7, score = 100
            //   6a04                 | push                4
            //   6800100000           | push                0x1000
            //   55                   | push                ebp
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_9 = { 7d13 0596000000 eb03 83c032 }
            // n = 4, score = 100
            //   7d13                 | jge                 0x15
            //   0596000000           | add                 eax, 0x96
            //   eb03                 | jmp                 5
            //   83c032               | add                 eax, 0x32

    condition:
        7 of them and filesize < 139264
}