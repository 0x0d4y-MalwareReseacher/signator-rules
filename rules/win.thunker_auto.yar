rule win_thunker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.thunker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.thunker"
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
        $sequence_0 = { 8b8500efffff 8985d4edffff 668b8504efffff 668985d2edffff e9???????? 0fbe8500efffff 50 }
            // n = 7, score = 100
            //   8b8500efffff         | mov                 eax, dword ptr [ebp - 0x1100]
            //   8985d4edffff         | mov                 dword ptr [ebp - 0x122c], eax
            //   668b8504efffff       | mov                 ax, word ptr [ebp - 0x10fc]
            //   668985d2edffff       | mov                 word ptr [ebp - 0x122e], ax
            //   e9????????           |                     
            //   0fbe8500efffff       | movsx               eax, byte ptr [ebp - 0x1100]
            //   50                   | push                eax

        $sequence_1 = { 0f848b000000 8385f8fdffff07 68???????? ffb5f8fdffff e8???????? 83c408 }
            // n = 6, score = 100
            //   0f848b000000         | je                  0x91
            //   8385f8fdffff07       | add                 dword ptr [ebp - 0x208], 7
            //   68????????           |                     
            //   ffb5f8fdffff         | push                dword ptr [ebp - 0x208]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_2 = { 83feff 7456 8d85fcfeffff 50 }
            // n = 4, score = 100
            //   83feff               | cmp                 esi, -1
            //   7456                 | je                  0x58
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax

        $sequence_3 = { 50 e8???????? 83c410 837dfc00 75c9 56 e8???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   75c9                 | jne                 0xffffffcb
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_4 = { 50 57 e8???????? 83a5e8edffff00 }
            // n = 4, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   83a5e8edffff00       | and                 dword ptr [ebp - 0x1218], 0

        $sequence_5 = { e8???????? e8???????? ff7510 ff750c ff7508 a1???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   e8????????           |                     
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   a1????????           |                     

        $sequence_6 = { 57 ff7508 e8???????? 8985e4fdffff }
            // n = 4, score = 100
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8985e4fdffff         | mov                 dword ptr [ebp - 0x21c], eax

        $sequence_7 = { 50 8d45c0 50 e8???????? 6a0a 8d45b0 50 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a0a                 | push                0xa
            //   8d45b0               | lea                 eax, [ebp - 0x50]
            //   50                   | push                eax

        $sequence_8 = { 83c40c 8d8544edffff 50 e8???????? 8985c4edffff }
            // n = 5, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8d8544edffff         | lea                 eax, [ebp - 0x12bc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8985c4edffff         | mov                 dword ptr [ebp - 0x123c], eax

        $sequence_9 = { 89043500000000 09c0 7502 eb3a 53 }
            // n = 5, score = 100
            //   89043500000000       | mov                 dword ptr [esi], eax
            //   09c0                 | or                  eax, eax
            //   7502                 | jne                 4
            //   eb3a                 | jmp                 0x3c
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 73728
}