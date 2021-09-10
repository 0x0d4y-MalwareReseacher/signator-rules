rule win_taintedscribe_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.taintedscribe."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taintedscribe"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 5d c3 f685a4fbffff10 56 6a5c 57 754c }
            // n = 7, score = 500
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   f685a4fbffff10       | test                byte ptr [ebp - 0x45c], 0x10
            //   56                   | push                esi
            //   6a5c                 | push                0x5c
            //   57                   | push                edi
            //   754c                 | jne                 0x4e

        $sequence_1 = { 5d c20c00 c6461401 5f 895e08 5e 33c0 }
            // n = 7, score = 500
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   c6461401             | mov                 byte ptr [esi + 0x14], 1
            //   5f                   | pop                 edi
            //   895e08               | mov                 dword ptr [esi + 8], ebx
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { c68577fbffff00 c78570fbffff08000000 84d2 7513 8d8dd8feffff }
            // n = 5, score = 500
            //   c68577fbffff00       | mov                 byte ptr [ebp - 0x489], 0
            //   c78570fbffff08000000     | mov    dword ptr [ebp - 0x490], 8
            //   84d2                 | test                dl, dl
            //   7513                 | jne                 0x15
            //   8d8dd8feffff         | lea                 ecx, dword ptr [ebp - 0x128]

        $sequence_3 = { 668b857cfbffff 51 8bcb 668985a4fbffff e8???????? }
            // n = 5, score = 500
            //   668b857cfbffff       | mov                 ax, word ptr [ebp - 0x484]
            //   51                   | push                ecx
            //   8bcb                 | mov                 ecx, ebx
            //   668985a4fbffff       | mov                 word ptr [ebp - 0x45c], ax
            //   e8????????           |                     

        $sequence_4 = { 75f1 6a02 6a00 53 e8???????? 8bf0 }
            // n = 6, score = 500
            //   75f1                 | jne                 0xfffffff3
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_5 = { eb42 83fe01 7514 8b4510 8b8d6cfbffff 50 51 }
            // n = 7, score = 500
            //   eb42                 | jmp                 0x44
            //   83fe01               | cmp                 esi, 1
            //   7514                 | jne                 0x16
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8b8d6cfbffff         | mov                 ecx, dword ptr [ebp - 0x494]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_6 = { 5b 5d c20c00 83f803 7574 }
            // n = 5, score = 500
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   83f803               | cmp                 eax, 3
            //   7574                 | jne                 0x76

        $sequence_7 = { 894328 5e 33c0 5b }
            // n = 4, score = 500
            //   894328               | mov                 dword ptr [ebx + 0x28], eax
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx

        $sequence_8 = { 897e5c 5f 894e3c 894e44 }
            // n = 4, score = 500
            //   897e5c               | mov                 dword ptr [esi + 0x5c], edi
            //   5f                   | pop                 edi
            //   894e3c               | mov                 dword ptr [esi + 0x3c], ecx
            //   894e44               | mov                 dword ptr [esi + 0x44], ecx

        $sequence_9 = { 7407 3d50450000 7507 814da400004000 8b7da4 8b5d9c 8b4580 }
            // n = 7, score = 500
            //   7407                 | je                  9
            //   3d50450000           | cmp                 eax, 0x4550
            //   7507                 | jne                 9
            //   814da400004000       | or                  dword ptr [ebp - 0x5c], 0x400000
            //   8b7da4               | mov                 edi, dword ptr [ebp - 0x5c]
            //   8b5d9c               | mov                 ebx, dword ptr [ebp - 0x64]
            //   8b4580               | mov                 eax, dword ptr [ebp - 0x80]

    condition:
        7 of them and filesize < 524288
}