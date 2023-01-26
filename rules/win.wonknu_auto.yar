rule win_wonknu_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.wonknu."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wonknu"
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
        $sequence_0 = { e8???????? 8bfc b901050000 f3a5 8bcb e8???????? 803b00 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8bfc                 | mov                 edi, esp
            //   b901050000           | mov                 ecx, 0x501
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   803b00               | cmp                 byte ptr [ebx], 0

        $sequence_1 = { eb08 c6840550ffffff00 8d8550ffffff 50 }
            // n = 4, score = 200
            //   eb08                 | jmp                 0xa
            //   c6840550ffffff00     | mov                 byte ptr [ebp + eax - 0xb0], 0
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   50                   | push                eax

        $sequence_2 = { 8bfc b901050000 f3a5 8bcb }
            // n = 4, score = 200
            //   8bfc                 | mov                 edi, esp
            //   b901050000           | mov                 ecx, 0x501
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx

        $sequence_3 = { 8bfc b901050000 f3a5 8bcb e8???????? 803b00 }
            // n = 6, score = 200
            //   8bfc                 | mov                 edi, esp
            //   b901050000           | mov                 ecx, 0x501
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   803b00               | cmp                 byte ptr [ebx], 0

        $sequence_4 = { f3a5 8bcb e8???????? 803b00 }
            // n = 4, score = 200
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   803b00               | cmp                 byte ptr [ebx], 0

        $sequence_5 = { 8bfc b901050000 f3a5 8bcb e8???????? }
            // n = 5, score = 200
            //   8bfc                 | mov                 edi, esp
            //   b901050000           | mov                 ecx, 0x501
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     

        $sequence_6 = { 6a04 50 ff15???????? 68???????? }
            // n = 4, score = 200
            //   6a04                 | push                4
            //   50                   | push                eax
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_7 = { eb08 c6840550ffffff00 8d8550ffffff 50 e8???????? }
            // n = 5, score = 200
            //   eb08                 | jmp                 0xa
            //   c6840550ffffff00     | mov                 byte ptr [ebp + eax - 0xb0], 0
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { c6840550ffffff00 8d8550ffffff 50 e8???????? }
            // n = 4, score = 200
            //   c6840550ffffff00     | mov                 byte ptr [ebp + eax - 0xb0], 0
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { e8???????? 8bfc b901050000 f3a5 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   8bfc                 | mov                 edi, esp
            //   b901050000           | mov                 ecx, 0x501
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]

    condition:
        7 of them and filesize < 540672
}