rule win_blacksoul_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.blacksoul."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blacksoul"
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
        $sequence_0 = { 0f84f4070000 8b7594 8a45a7 46 }
            // n = 4, score = 200
            //   0f84f4070000         | je                  0x7fa
            //   8b7594               | mov                 esi, dword ptr [ebp - 0x6c]
            //   8a45a7               | mov                 al, byte ptr [ebp - 0x59]
            //   46                   | inc                 esi

        $sequence_1 = { 895de0 894de4 668945d0 895dfc 895dc8 }
            // n = 5, score = 200
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   668945d0             | mov                 word ptr [ebp - 0x30], ax
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   895dc8               | mov                 dword ptr [ebp - 0x38], ebx

        $sequence_2 = { 8bcb ff7604 53 e8???????? }
            // n = 4, score = 200
            //   8bcb                 | mov                 ecx, ebx
            //   ff7604               | push                dword ptr [esi + 4]
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_3 = { 398d6cffffff 7f08 ff857cffffff eb18 85c0 }
            // n = 5, score = 200
            //   398d6cffffff         | cmp                 dword ptr [ebp - 0x94], ecx
            //   7f08                 | jg                  0xa
            //   ff857cffffff         | inc                 dword ptr [ebp - 0x84]
            //   eb18                 | jmp                 0x1a
            //   85c0                 | test                eax, eax

        $sequence_4 = { c60630 89b57cffffff 46 8975a0 }
            // n = 4, score = 200
            //   c60630               | mov                 byte ptr [esi], 0x30
            //   89b57cffffff         | mov                 dword ptr [ebp - 0x84], esi
            //   46                   | inc                 esi
            //   8975a0               | mov                 dword ptr [ebp - 0x60], esi

        $sequence_5 = { 59 84c0 743d 807b0400 7507 8bcb }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   743d                 | je                  0x3f
            //   807b0400             | cmp                 byte ptr [ebx + 4], 0
            //   7507                 | jne                 9
            //   8bcb                 | mov                 ecx, ebx

        $sequence_6 = { e8???????? 8b7d18 8d4d8c 8b450c 8b5d10 898578ffffff }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8b7d18               | mov                 edi, dword ptr [ebp + 0x18]
            //   8d4d8c               | lea                 ecx, [ebp - 0x74]
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b5d10               | mov                 ebx, dword ptr [ebp + 0x10]
            //   898578ffffff         | mov                 dword ptr [ebp - 0x88], eax

        $sequence_7 = { 0f84fc070000 ff758c 57 e8???????? 59 59 }
            // n = 6, score = 200
            //   0f84fc070000         | je                  0x802
            //   ff758c               | push                dword ptr [ebp - 0x74]
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 1823640
}