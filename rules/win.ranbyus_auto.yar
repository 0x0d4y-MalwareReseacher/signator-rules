rule win_ranbyus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.ranbyus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ranbyus"
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
        $sequence_0 = { ff7608 e8???????? 89460c 8b06 59 894604 }
            // n = 6, score = 1100
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   59                   | pop                 ecx
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_1 = { a1???????? 85c0 751c 6a04 e8???????? }
            // n = 5, score = 1100
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   751c                 | jne                 0x1e
            //   6a04                 | push                4
            //   e8????????           |                     

        $sequence_2 = { 59 ff7608 e8???????? 897e08 }
            // n = 4, score = 1100
            //   59                   | pop                 ecx
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   897e08               | mov                 dword ptr [esi + 8], edi

        $sequence_3 = { e8???????? 59 8b4e05 89410b 8b4605 39780b 7407 }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b4e05               | mov                 ecx, dword ptr [esi + 5]
            //   89410b               | mov                 dword ptr [ecx + 0xb], eax
            //   8b4605               | mov                 eax, dword ptr [esi + 5]
            //   39780b               | cmp                 dword ptr [eax + 0xb], edi
            //   7407                 | je                  9

        $sequence_4 = { a3???????? 8a4576 a2???????? 8b45e8 a3???????? }
            // n = 5, score = 1100
            //   a3????????           |                     
            //   8a4576               | mov                 al, byte ptr [ebp + 0x76]
            //   a2????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   a3????????           |                     

        $sequence_5 = { a3???????? 8a4576 a2???????? 8b45e8 a3???????? e8???????? }
            // n = 6, score = 1100
            //   a3????????           |                     
            //   8a4576               | mov                 al, byte ptr [ebp + 0x76]
            //   a2????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   a3????????           |                     
            //   e8????????           |                     

        $sequence_6 = { 0f84c5000000 3c5c 75f1 84c0 0f84b9000000 46 }
            // n = 6, score = 1100
            //   0f84c5000000         | je                  0xcb
            //   3c5c                 | cmp                 al, 0x5c
            //   75f1                 | jne                 0xfffffff3
            //   84c0                 | test                al, al
            //   0f84b9000000         | je                  0xbf
            //   46                   | inc                 esi

        $sequence_7 = { 751b 46 8a06 84c0 740c }
            // n = 5, score = 1100
            //   751b                 | jne                 0x1d
            //   46                   | inc                 esi
            //   8a06                 | mov                 al, byte ptr [esi]
            //   84c0                 | test                al, al
            //   740c                 | je                  0xe

        $sequence_8 = { 7405 48 75f7 eb01 }
            // n = 4, score = 1100
            //   7405                 | je                  7
            //   48                   | dec                 eax
            //   75f7                 | jne                 0xfffffff9
            //   eb01                 | jmp                 3

        $sequence_9 = { 5f eb03 83c8ff 5e 5b c3 e8???????? }
            // n = 7, score = 1100
            //   5f                   | pop                 edi
            //   eb03                 | jmp                 5
            //   83c8ff               | or                  eax, 0xffffffff
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   e8????????           |                     

    condition:
        7 of them and filesize < 638976
}