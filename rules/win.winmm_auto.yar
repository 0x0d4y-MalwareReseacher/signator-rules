rule win_winmm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.winmm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.winmm"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 7f5a 8b7c2428 eb54 83c308 bf80000000 8d8538010000 eb2d }
            // n = 7, score = 200
            //   7f5a                 | jg                  0x5c
            //   8b7c2428             | mov                 edi, dword ptr [esp + 0x28]
            //   eb54                 | jmp                 0x56
            //   83c308               | add                 ebx, 8
            //   bf80000000           | mov                 edi, 0x80
            //   8d8538010000         | lea                 eax, [ebp + 0x138]
            //   eb2d                 | jmp                 0x2f

        $sequence_1 = { 56 57 8b703c 03f0 56 e8???????? 668b7606 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b703c               | mov                 esi, dword ptr [eax + 0x3c]
            //   03f0                 | add                 esi, eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   668b7606             | mov                 si, word ptr [esi + 6]

        $sequence_2 = { 0f8fdb000000 0f8400010000 83e847 0f84c2000000 83e811 0f84ee000000 83e80c }
            // n = 7, score = 200
            //   0f8fdb000000         | jg                  0xe1
            //   0f8400010000         | je                  0x106
            //   83e847               | sub                 eax, 0x47
            //   0f84c2000000         | je                  0xc8
            //   83e811               | sub                 eax, 0x11
            //   0f84ee000000         | je                  0xf4
            //   83e80c               | sub                 eax, 0xc

        $sequence_3 = { 897c2414 0f84a5020000 55 66833e25 0f8585020000 6a02 5d }
            // n = 7, score = 200
            //   897c2414             | mov                 dword ptr [esp + 0x14], edi
            //   0f84a5020000         | je                  0x2ab
            //   55                   | push                ebp
            //   66833e25             | cmp                 word ptr [esi], 0x25
            //   0f8585020000         | jne                 0x28b
            //   6a02                 | push                2
            //   5d                   | pop                 ebp

        $sequence_4 = { 83e810 758a 8b03 83c304 85c0 741a }
            // n = 6, score = 200
            //   83e810               | sub                 eax, 0x10
            //   758a                 | jne                 0xffffff8c
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   83c304               | add                 ebx, 4
            //   85c0                 | test                eax, eax
            //   741a                 | je                  0x1c

        $sequence_5 = { 6a00 89462c ff15???????? 8bce 894604 e8???????? 85c0 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   89462c               | mov                 dword ptr [esi + 0x2c], eax
            //   ff15????????         |                     
            //   8bce                 | mov                 ecx, esi
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_6 = { 46 66833e00 0f8561fdffff 8b7c2418 5d ff74240c 8bcf }
            // n = 7, score = 200
            //   46                   | inc                 esi
            //   66833e00             | cmp                 word ptr [esi], 0
            //   0f8561fdffff         | jne                 0xfffffd67
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   5d                   | pop                 ebp
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   8bcf                 | mov                 ecx, edi

        $sequence_7 = { 46 46 66833e2a 752d 8b2b 83c304 46 }
            // n = 7, score = 200
            //   46                   | inc                 esi
            //   46                   | inc                 esi
            //   66833e2a             | cmp                 word ptr [esi], 0x2a
            //   752d                 | jne                 0x2f
            //   8b2b                 | mov                 ebp, dword ptr [ebx]
            //   83c304               | add                 ebx, 4
            //   46                   | inc                 esi

        $sequence_8 = { 85c0 59 74be 46 }
            // n = 4, score = 200
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   74be                 | je                  0xffffffc0
            //   46                   | inc                 esi

        $sequence_9 = { 745a 2dd0ff0000 0f8490000000 2bc1 0f8490000000 }
            // n = 5, score = 200
            //   745a                 | je                  0x5c
            //   2dd0ff0000           | sub                 eax, 0xffd0
            //   0f8490000000         | je                  0x96
            //   2bc1                 | sub                 eax, ecx
            //   0f8490000000         | je                  0x96

    condition:
        7 of them and filesize < 278528
}