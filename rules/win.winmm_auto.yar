rule win_winmm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.winmm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.winmm"
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
        $sequence_0 = { 46 0fb706 0b442414 b963000100 3bc1 0f8f92000000 }
            // n = 6, score = 200
            //   46                   | inc                 esi
            //   0fb706               | movzx               eax, word ptr [esi]
            //   0b442414             | or                  eax, dword ptr [esp + 0x14]
            //   b963000100           | mov                 ecx, 0x10063
            //   3bc1                 | cmp                 eax, ecx
            //   0f8f92000000         | jg                  0x98

        $sequence_1 = { 0f84af000000 2bc1 0f849f000000 2bc1 745a 2dd0ff0000 0f8490000000 }
            // n = 7, score = 200
            //   0f84af000000         | je                  0xb5
            //   2bc1                 | sub                 eax, ecx
            //   0f849f000000         | je                  0xa5
            //   2bc1                 | sub                 eax, ecx
            //   745a                 | je                  0x5c
            //   2dd0ff0000           | sub                 eax, 0xffd0
            //   0f8490000000         | je                  0x96

        $sequence_2 = { 7c02 8bfd 3b7c2428 7f5a 8b7c2428 eb54 }
            // n = 6, score = 200
            //   7c02                 | jl                  4
            //   8bfd                 | mov                 edi, ebp
            //   3b7c2428             | cmp                 edi, dword ptr [esp + 0x28]
            //   7f5a                 | jg                  0x5c
            //   8b7c2428             | mov                 edi, dword ptr [esp + 0x28]
            //   eb54                 | jmp                 0x56

        $sequence_3 = { c3 b9???????? e9???????? b8???????? e8???????? 51 6878010000 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   b9????????           |                     
            //   e9????????           |                     
            //   b8????????           |                     
            //   e8????????           |                     
            //   51                   | push                ecx
            //   6878010000           | push                0x178

        $sequence_4 = { 48 0f8492000000 48 0f849b000000 e9???????? }
            // n = 5, score = 200
            //   48                   | dec                 eax
            //   0f8492000000         | je                  0x98
            //   48                   | dec                 eax
            //   0f849b000000         | je                  0xa1
            //   e9????????           |                     

        $sequence_5 = { 8b5c241c 56 8b74241c 57 8bf9 895c2418 }
            // n = 6, score = 200
            //   8b5c241c             | mov                 ebx, dword ptr [esp + 0x1c]
            //   56                   | push                esi
            //   8b74241c             | mov                 esi, dword ptr [esp + 0x1c]
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   895c2418             | mov                 dword ptr [esp + 0x18], ebx

        $sequence_6 = { 750f 46 46 66833e2a }
            // n = 4, score = 200
            //   750f                 | jne                 0x11
            //   46                   | inc                 esi
            //   46                   | inc                 esi
            //   66833e2a             | cmp                 word ptr [esi], 0x2a

        $sequence_7 = { 663d2a00 750b 8b03 83c304 89442428 eb18 663d2d00 }
            // n = 7, score = 200
            //   663d2a00             | cmp                 ax, 0x2a
            //   750b                 | jne                 0xd
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   83c304               | add                 ebx, 4
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   eb18                 | jmp                 0x1a
            //   663d2d00             | cmp                 ax, 0x2d

        $sequence_8 = { c9 c3 8bc1 838834010000ff 838864010000ff c700???????? }
            // n = 6, score = 200
            //   c9                   | leave               
            //   c3                   | ret                 
            //   8bc1                 | mov                 eax, ecx
            //   838834010000ff       | or                  dword ptr [eax + 0x134], 0xffffffff
            //   838864010000ff       | or                  dword ptr [eax + 0x164], 0xffffffff
            //   c700????????         |                     

        $sequence_9 = { 5b 5f 5e c20400 ff742404 }
            // n = 5, score = 200
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   ff742404             | push                dword ptr [esp + 4]

    condition:
        7 of them and filesize < 278528
}