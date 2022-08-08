rule win_dnespy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.dnespy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dnespy"
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
        $sequence_0 = { 89855cffffff 8955c0 8945c4 394e04 754c 8b16 }
            // n = 6, score = 200
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   8955c0               | mov                 dword ptr [ebp - 0x40], edx
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   394e04               | cmp                 dword ptr [esi + 4], ecx
            //   754c                 | jne                 0x4e
            //   8b16                 | mov                 edx, dword ptr [esi]

        $sequence_1 = { 8b8d78ffffff 42 8bc1 81fa00100000 722a 8b49fc 83c223 }
            // n = 7, score = 200
            //   8b8d78ffffff         | mov                 ecx, dword ptr [ebp - 0x88]
            //   42                   | inc                 edx
            //   8bc1                 | mov                 eax, ecx
            //   81fa00100000         | cmp                 edx, 0x1000
            //   722a                 | jb                  0x2c
            //   8b49fc               | mov                 ecx, dword ptr [ecx - 4]
            //   83c223               | add                 edx, 0x23

        $sequence_2 = { 6609a8b8160000 03cb 8988bc160000 8b542420 8b5c242c 3b90a0160000 0f8287fcffff }
            // n = 7, score = 200
            //   6609a8b8160000       | or                  word ptr [eax + 0x16b8], bp
            //   03cb                 | add                 ecx, ebx
            //   8988bc160000         | mov                 dword ptr [eax + 0x16bc], ecx
            //   8b542420             | mov                 edx, dword ptr [esp + 0x20]
            //   8b5c242c             | mov                 ebx, dword ptr [esp + 0x2c]
            //   3b90a0160000         | cmp                 edx, dword ptr [eax + 0x16a0]
            //   0f8287fcffff         | jb                  0xfffffc8d

        $sequence_3 = { 894664 894668 8b442464 6a38 68???????? ff742474 99 }
            // n = 7, score = 200
            //   894664               | mov                 dword ptr [esi + 0x64], eax
            //   894668               | mov                 dword ptr [esi + 0x68], eax
            //   8b442464             | mov                 eax, dword ptr [esp + 0x64]
            //   6a38                 | push                0x38
            //   68????????           |                     
            //   ff742474             | push                dword ptr [esp + 0x74]
            //   99                   | cdq                 

        $sequence_4 = { c1e604 8b45c4 03f7 8945d8 8938 897804 }
            // n = 6, score = 200
            //   c1e604               | shl                 esi, 4
            //   8b45c4               | mov                 eax, dword ptr [ebp - 0x3c]
            //   03f7                 | add                 esi, edi
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8938                 | mov                 dword ptr [eax], edi
            //   897804               | mov                 dword ptr [eax + 4], edi

        $sequence_5 = { e8???????? 83c40c 8944243c 85c0 0f8480000000 83ff01 7518 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax
            //   85c0                 | test                eax, eax
            //   0f8480000000         | je                  0x86
            //   83ff01               | cmp                 edi, 1
            //   7518                 | jne                 0x1a

        $sequence_6 = { a1???????? 33c4 89842408010100 8b84241c010100 53 }
            // n = 5, score = 200
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89842408010100       | mov                 dword ptr [esp + 0x10108], eax
            //   8b84241c010100       | mov                 eax, dword ptr [esp + 0x1011c]
            //   53                   | push                ebx

        $sequence_7 = { be99ffffff 8d442410 50 ff742470 8d442444 50 e8???????? }
            // n = 7, score = 200
            //   be99ffffff           | mov                 esi, 0xffffff99
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   50                   | push                eax
            //   ff742470             | push                dword ptr [esp + 0x70]
            //   8d442444             | lea                 eax, [esp + 0x44]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 83c40c c6040600 8b75e8 eb0e 6a00 51 ff75e0 }
            // n = 7, score = 200
            //   83c40c               | add                 esp, 0xc
            //   c6040600             | mov                 byte ptr [esi + eax], 0
            //   8b75e8               | mov                 esi, dword ptr [ebp - 0x18]
            //   eb0e                 | jmp                 0x10
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   ff75e0               | push                dword ptr [ebp - 0x20]

        $sequence_9 = { 837f2400 0f8472090000 8b771c 85f6 0f8467090000 393e 0f855f090000 }
            // n = 7, score = 200
            //   837f2400             | cmp                 dword ptr [edi + 0x24], 0
            //   0f8472090000         | je                  0x978
            //   8b771c               | mov                 esi, dword ptr [edi + 0x1c]
            //   85f6                 | test                esi, esi
            //   0f8467090000         | je                  0x96d
            //   393e                 | cmp                 dword ptr [esi], edi
            //   0f855f090000         | jne                 0x965

    condition:
        7 of them and filesize < 794624
}