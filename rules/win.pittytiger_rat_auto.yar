rule win_pittytiger_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.pittytiger_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pittytiger_rat"
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
        $sequence_0 = { 7503 56 ffd3 6a50 68???????? 68???????? }
            // n = 6, score = 100
            //   7503                 | jne                 5
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   6a50                 | push                0x50
            //   68????????           |                     
            //   68????????           |                     

        $sequence_1 = { 85c0 0f843d010000 8d8520fcffff 56 50 8d852cffffff 50 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f843d010000         | je                  0x143
            //   8d8520fcffff         | lea                 eax, [ebp - 0x3e0]
            //   56                   | push                esi
            //   50                   | push                eax
            //   8d852cffffff         | lea                 eax, [ebp - 0xd4]
            //   50                   | push                eax

        $sequence_2 = { 83c40c 8d45f4 50 6819010200 53 68???????? }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   50                   | push                eax
            //   6819010200           | push                0x20119
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_3 = { ff7508 e8???????? 8d8600020000 50 8d85f8fbffff 68???????? 50 }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8d8600020000         | lea                 eax, [esi + 0x200]
            //   50                   | push                eax
            //   8d85f8fbffff         | lea                 eax, [ebp - 0x408]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_4 = { 750a 68???????? e9???????? 8d85f8fdffff 56 }
            // n = 5, score = 100
            //   750a                 | jne                 0xc
            //   68????????           |                     
            //   e9????????           |                     
            //   8d85f8fdffff         | lea                 eax, [ebp - 0x208]
            //   56                   | push                esi

        $sequence_5 = { 3bc3 a3???????? 74d1 8d459c }
            // n = 4, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   a3????????           |                     
            //   74d1                 | je                  0xffffffd3
            //   8d459c               | lea                 eax, [ebp - 0x64]

        $sequence_6 = { 58 8903 eb2d 8d85fcfeffff 50 e8???????? }
            // n = 6, score = 100
            //   58                   | pop                 eax
            //   8903                 | mov                 dword ptr [ebx], eax
            //   eb2d                 | jmp                 0x2f
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_7 = { 0f85e8000000 8d45f4 897df4 50 8d85e0feffff 50 }
            // n = 6, score = 100
            //   0f85e8000000         | jne                 0xee
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi
            //   50                   | push                eax
            //   8d85e0feffff         | lea                 eax, [ebp - 0x120]
            //   50                   | push                eax

        $sequence_8 = { be00010000 aa 56 8d85d0fdffff }
            // n = 4, score = 100
            //   be00010000           | mov                 esi, 0x100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   56                   | push                esi
            //   8d85d0fdffff         | lea                 eax, [ebp - 0x230]

        $sequence_9 = { 8945f0 33ff 397df0 743c 397df8 }
            // n = 5, score = 100
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   33ff                 | xor                 edi, edi
            //   397df0               | cmp                 dword ptr [ebp - 0x10], edi
            //   743c                 | je                  0x3e
            //   397df8               | cmp                 dword ptr [ebp - 8], edi

    condition:
        7 of them and filesize < 2162688
}