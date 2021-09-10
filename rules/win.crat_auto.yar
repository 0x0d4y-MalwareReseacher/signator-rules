rule win_crat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.crat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crat"
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
        $sequence_0 = { 448973f0 66448933 e9???????? f0834210ff 7f09 488b0a }
            // n = 6, score = 500
            //   448973f0             | inc                 esp
            //   66448933             | mov                 dword ptr [ebx - 0x10], esi
            //   e9????????           |                     
            //   f0834210ff           | inc                 sp
            //   7f09                 | mov                 dword ptr [ebx], esi
            //   488b0a               | lock add            dword ptr [edx + 0x10], -1

        $sequence_1 = { 483bc8 7406 e8???????? 90 488b542420 }
            // n = 5, score = 500
            //   483bc8               | mov                 dword ptr [ebx - 0x10], esi
            //   7406                 | inc                 sp
            //   e8????????           |                     
            //   90                   | mov                 dword ptr [ebx], esi
            //   488b542420           | lock add            dword ptr [edx + 0x10], -1

        $sequence_2 = { e8???????? 488bd0 488d8da0000000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d8da0000000       | mov                 edx, dword ptr [edi]
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_3 = { 488bd0 488d8d68010000 e8???????? 90 }
            // n = 4, score = 500
            //   488bd0               | je                  0xb
            //   488d8d68010000       | nop                 
            //   e8????????           |                     
            //   90                   | dec                 eax

        $sequence_4 = { e8???????? 488bd0 488d8d20010000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d8d20010000       | lea                 ecx, dword ptr [ebp + 0x188]
            //   e8????????           |                     
            //   90                   | nop                 

        $sequence_5 = { e8???????? 488bd0 488d8d98000000 e8???????? 90 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   488bd0               | sub                 edx, 0x18
            //   488d8d98000000       | or                  eax, 0xffffffff
            //   e8????????           |                     
            //   90                   | lock xadd           dword ptr [edx + 0x10], eax

        $sequence_6 = { e8???????? 488bd0 488d8db0010000 e8???????? }
            // n = 4, score = 500
            //   e8????????           |                     
            //   488bd0               | dec                 eax
            //   488d8db0010000       | mov                 edx, eax
            //   e8????????           |                     

        $sequence_7 = { 488b17 4883ea18 83c8ff f00fc14210 }
            // n = 4, score = 500
            //   488b17               | inc                 esp
            //   4883ea18             | mov                 dword ptr [ebx - 0x10], esi
            //   83c8ff               | inc                 sp
            //   f00fc14210           | mov                 dword ptr [ebx], esi

        $sequence_8 = { ffd0 85c0 750f ff15???????? }
            // n = 4, score = 300
            //   ffd0                 | dec                 eax
            //   85c0                 | dec                 eax
            //   750f                 | inc                 edi
            //   ff15????????         |                     

        $sequence_9 = { 33d2 c1e902 f7f1 eb02 }
            // n = 4, score = 300
            //   33d2                 | jne                 0x40
            //   c1e902               | mov                 ecx, edx
            //   f7f1                 | sub                 ecx, eax
            //   eb02                 | cmp                 ecx, 1

        $sequence_10 = { 8b5608 2bfb 3bca 7547 }
            // n = 4, score = 200
            //   8b5608               | jg                  0x14
            //   2bfb                 | dec                 eax
            //   3bca                 | mov                 ecx, dword ptr [edx]
            //   7547                 | inc                 esp

        $sequence_11 = { 03f8 3bf9 7364 8b1e 3bdf }
            // n = 5, score = 200
            //   03f8                 | mov                 byte ptr [ebp - 4], 2
            //   3bf9                 | mov                 ecx, edi
            //   7364                 | mov                 edx, dword ptr [esi + 0x14]
            //   8b1e                 | sub                 edx, 0x10
            //   3bdf                 | lea                 eax, dword ptr [edx + 0xc]

        $sequence_12 = { 8b5608 3bc2 753e 8bca }
            // n = 4, score = 200
            //   8b5608               | or                  eax, 0xffffffff
            //   3bc2                 | lock xadd           dword ptr [edx + 0x10], eax
            //   753e                 | dec                 eax
            //   8bca                 | dec                 eax

        $sequence_13 = { c645fc02 8bcf 8b5614 83ea10 }
            // n = 4, score = 200
            //   c645fc02             | cmp                 ecx, eax
            //   8bcf                 | je                  0xb
            //   8b5614               | nop                 
            //   83ea10               | dec                 eax

        $sequence_14 = { 8b5608 83ea10 8d420c f00fc138 }
            // n = 4, score = 200
            //   8b5608               | lea                 ecx, dword ptr [ebp + 0x58]
            //   83ea10               | nop                 
            //   8d420c               | call                eax
            //   f00fc138             | test                eax, eax

        $sequence_15 = { 8b5608 2bfb 3bc2 753c 8bca 2bc8 }
            // n = 6, score = 200
            //   8b5608               | dec                 eax
            //   2bfb                 | cmp                 ecx, eax
            //   3bc2                 | je                  8
            //   753c                 | nop                 
            //   8bca                 | dec                 eax
            //   2bc8                 | mov                 edx, dword ptr [esp + 0x20]

        $sequence_16 = { c0e805 a801 7404 8b06 }
            // n = 4, score = 200
            //   c0e805               | mov                 edx, eax
            //   a801                 | dec                 eax
            //   7404                 | lea                 ecx, dword ptr [ebp + 0x40]
            //   8b06                 | nop                 

        $sequence_17 = { e8???????? ffd0 8bf0 eb02 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   ffd0                 | dec                 eax
            //   8bf0                 | lea                 edx, dword ptr [ebx - 0x18]
            //   eb02                 | dec                 eax

        $sequence_18 = { 40 b903000000 8906 8b4324 }
            // n = 4, score = 200
            //   40                   | mov                 eax, edx
            //   b903000000           | sub                 eax, ecx
            //   8906                 | mov                 edx, dword ptr [esi + 8]
            //   8b4324               | sub                 edi, ebx

    condition:
        7 of them and filesize < 4161536
}