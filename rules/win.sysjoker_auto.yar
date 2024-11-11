rule win_sysjoker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.sysjoker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sysjoker"
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
        $sequence_0 = { 51 8bc8 e8???????? c645fc08 8d4d8c 8b75a0 83fe10 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   c645fc08             | mov                 byte ptr [ebp - 4], 8
            //   8d4d8c               | lea                 ecx, [ebp - 0x74]
            //   8b75a0               | mov                 esi, dword ptr [ebp - 0x60]
            //   83fe10               | cmp                 esi, 0x10

        $sequence_1 = { 8bc8 85c9 0f8462070000 8b01 ff500c 83c010 8945a0 }
            // n = 7, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   85c9                 | test                ecx, ecx
            //   0f8462070000         | je                  0x768
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff500c               | call                dword ptr [eax + 0xc]
            //   83c010               | add                 eax, 0x10
            //   8945a0               | mov                 dword ptr [ebp - 0x60], eax

        $sequence_2 = { b802000000 e9???????? d9ee 84cd 0f84e2ba0000 d9e0 }
            // n = 6, score = 100
            //   b802000000           | mov                 eax, 2
            //   e9????????           |                     
            //   d9ee                 | fldz                
            //   84cd                 | test                ch, cl
            //   0f84e2ba0000         | je                  0xbae8
            //   d9e0                 | fchs                

        $sequence_3 = { 84c0 0f8496000000 8b45ec 81780424499204 0f849f000000 8b38 8945e4 }
            // n = 7, score = 100
            //   84c0                 | test                al, al
            //   0f8496000000         | je                  0x9c
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   81780424499204       | cmp                 dword ptr [eax + 4], 0x4924924
            //   0f849f000000         | je                  0xa5
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax

        $sequence_4 = { 38450b 0f45c2 0bc8 890e 8bc7 5f 5e }
            // n = 7, score = 100
            //   38450b               | cmp                 byte ptr [ebp + 0xb], al
            //   0f45c2               | cmovne              eax, edx
            //   0bc8                 | or                  ecx, eax
            //   890e                 | mov                 dword ptr [esi], ecx
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { e8???????? 8bc8 85c9 0f84f2030000 8b01 8b400c ffd0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   85c9                 | test                ecx, ecx
            //   0f84f2030000         | je                  0x3f8
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   ffd0                 | call                eax

        $sequence_6 = { c745d40f000000 c645c000 8b55ec 83fa10 0f8221060000 8b4dd8 42 }
            // n = 7, score = 100
            //   c745d40f000000       | mov                 dword ptr [ebp - 0x2c], 0xf
            //   c645c000             | mov                 byte ptr [ebp - 0x40], 0
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   83fa10               | cmp                 edx, 0x10
            //   0f8221060000         | jb                  0x627
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   42                   | inc                 edx

        $sequence_7 = { 56 8b7508 8bd9 57 85f6 7832 8b3b }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8bd9                 | mov                 ebx, ecx
            //   57                   | push                edi
            //   85f6                 | test                esi, esi
            //   7832                 | js                  0x34
            //   8b3b                 | mov                 edi, dword ptr [ebx]

        $sequence_8 = { 50 e8???????? 8b75e4 807e0d00 750e 8d4610 50 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b75e4               | mov                 esi, dword ptr [ebp - 0x1c]
            //   807e0d00             | cmp                 byte ptr [esi + 0xd], 0
            //   750e                 | jne                 0x10
            //   8d4610               | lea                 eax, [esi + 0x10]
            //   50                   | push                eax

        $sequence_9 = { c645fc1c e9???????? 52 51 e8???????? 83c408 e9???????? }
            // n = 7, score = 100
            //   c645fc1c             | mov                 byte ptr [ebp - 4], 0x1c
            //   e9????????           |                     
            //   52                   | push                edx
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   e9????????           |                     

    condition:
        7 of them and filesize < 832512
}