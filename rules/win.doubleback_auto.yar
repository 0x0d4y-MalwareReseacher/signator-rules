rule win_doubleback_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.doubleback."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.doubleback"
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
        $sequence_0 = { eb42 b9e3050000 eb3b b90b070000 }
            // n = 4, score = 400
            //   eb42                 | je                  0x1b9c
            //   b9e3050000           | mov                 dword ptr [ebp - 8], ebx
            //   eb3b                 | mov                 esi, eax
            //   b90b070000           | test                esi, esi

        $sequence_1 = { 3dab3f0000 755e b9ad060000 eb57 b9a7060000 eb50 b947060000 }
            // n = 7, score = 400
            //   3dab3f0000           | test                ebx, ebx
            //   755e                 | je                  0x1e3a
            //   b9ad060000           | push                ebx
            //   eb57                 | mov                 edi, eax
            //   b9a7060000           | mov                 dword ptr [ebp - 0x1c], edi
            //   eb50                 | test                ebx, ebx
            //   b947060000           | je                  0x1d8a

        $sequence_2 = { b9ad060000 eb57 b9a7060000 eb50 }
            // n = 4, score = 400
            //   b9ad060000           | jne                 0x10ca
            //   eb57                 | mov                 ecx, eax
            //   b9a7060000           | mov                 edx, esi
            //   eb50                 | call                esi

        $sequence_3 = { 7446 3d00280000 7438 3d5a290000 }
            // n = 4, score = 400
            //   7446                 | dec                 esp
            //   3d00280000           | mov                 esp, ecx
            //   7438                 | dec                 eax
            //   3d5a290000           | mov                 dword ptr [esp + 0x30], ebx

        $sequence_4 = { 7438 3d5a290000 742a 3d39380000 }
            // n = 4, score = 400
            //   7438                 | mov                 eax, ebp
            //   3d5a290000           | inc                 ecx
            //   742a                 | mov                 dword ptr [edx + 4], 0x206c6c
            //   3d39380000           | dec                 ecx

        $sequence_5 = { eb3b b90b070000 eb34 2d63450000 }
            // n = 4, score = 400
            //   eb3b                 | je                  0x1b52
            //   b90b070000           | mov                 eax, dword ptr [ebx]
            //   eb34                 | mov                 esi, eax
            //   2d63450000           | test                esi, esi

        $sequence_6 = { eb57 b9a7060000 eb50 b947060000 eb49 b9e7050000 }
            // n = 6, score = 400
            //   eb57                 | pop                 edx
            //   b9a7060000           | push                0x3b
            //   eb50                 | pop                 eax
            //   b947060000           | push                0x24
            //   eb49                 | mov                 word ptr [ebx + 0x12], dx
            //   b9e7050000           | mov                 word ptr [ebx + 0x14], ax

        $sequence_7 = { eb50 b947060000 eb49 b9e7050000 eb42 }
            // n = 5, score = 400
            //   eb50                 | mov                 eax, edx
            //   b947060000           | jne                 0x1b43
            //   eb49                 | inc                 ecx
            //   b9e7050000           | mov                 edx, esi
            //   eb42                 | inc                 esp

        $sequence_8 = { eb50 b947060000 eb49 b9e7050000 eb42 b9e3050000 eb3b }
            // n = 7, score = 400
            //   eb50                 | mov                 edx, dword ptr [ecx + 0x30]
            //   b947060000           | dec                 eax
            //   eb49                 | mov                 dword ptr [esp + 0x50], eax
            //   b9e7050000           | mov                 dword ptr [esp + 0x30], 0xf
            //   eb42                 | mov                 dword ptr [esp + 0x34], 0x16
            //   b9e3050000           | dec                 ecx
            //   eb3b                 | arpl                word ptr [edx + 0x3c], ax

        $sequence_9 = { 742a 3d39380000 741c 3dd73a0000 740e 3dab3f0000 }
            // n = 6, score = 400
            //   742a                 | mov                 byte ptr [esi], cl
            //   3d39380000           | mov                 dword ptr [ebx + edi], eax
            //   741c                 | inc                 ebp
            //   3dd73a0000           | mov                 eax, dword ptr [edx]
            //   740e                 | inc                 sp
            //   3dab3f0000           | add                 ebx, eax

    condition:
        7 of them and filesize < 106496
}