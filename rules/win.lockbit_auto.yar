rule win_lockbit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.lockbit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lockbit"
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
        $sequence_0 = { 660fefc1 660fefc2 0f1181a0000000 660f38db8190000000 0f1181b0000000 660f38db8180000000 0f1181c0000000 }
            // n = 7, score = 100
            //   660fefc1             | pxor                xmm0, xmm1
            //   660fefc2             | pxor                xmm0, xmm2
            //   0f1181a0000000       | movups              xmmword ptr [ecx + 0xa0], xmm0
            //   660f38db8190000000     | aesimc    xmm0, xmmword ptr [ecx + 0x90]
            //   0f1181b0000000       | movups              xmmword ptr [ecx + 0xb0], xmm0
            //   660f38db8180000000     | aesimc    xmm0, xmmword ptr [ecx + 0x80]
            //   0f1181c0000000       | movups              xmmword ptr [ecx + 0xc0], xmm0

        $sequence_1 = { 50 6802020000 ff15???????? 85c0 755e 6a08 ff15???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   755e                 | jne                 0x60
            //   6a08                 | push                8
            //   ff15????????         |                     

        $sequence_2 = { e8???????? 83c408 85c0 7408 0580bfffff 5e 5d }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   0580bfffff           | add                 eax, 0xffffbf80
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_3 = { c704240000c841 53 8b1d???????? ffd3 8945b0 85c0 744a }
            // n = 7, score = 100
            //   c704240000c841       | mov                 dword ptr [esp], 0x41c80000
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   ffd3                 | call                ebx
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   85c0                 | test                eax, eax
            //   744a                 | je                  0x4c

        $sequence_4 = { e8???????? 888424ce000000 33ff c68424cf00000000 6690 57 8d8c24cd000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   888424ce000000       | mov                 byte ptr [esp + 0xce], al
            //   33ff                 | xor                 edi, edi
            //   c68424cf00000000     | mov                 byte ptr [esp + 0xcf], 0
            //   6690                 | nop                 
            //   57                   | push                edi
            //   8d8c24cd000000       | lea                 ecx, dword ptr [esp + 0xcd]

        $sequence_5 = { 6a0a 8d8c24ff010000 e8???????? 8d8c24fb010000 c60000 }
            // n = 5, score = 100
            //   6a0a                 | push                0xa
            //   8d8c24ff010000       | lea                 ecx, dword ptr [esp + 0x1ff]
            //   e8????????           |                     
            //   8d8c24fb010000       | lea                 ecx, dword ptr [esp + 0x1fb]
            //   c60000               | mov                 byte ptr [eax], 0

        $sequence_6 = { ff05???????? 8b75f4 47 81ffff000000 0f8c62ffffff 8b75fc }
            // n = 6, score = 100
            //   ff05????????         |                     
            //   8b75f4               | mov                 esi, dword ptr [ebp - 0xc]
            //   47                   | inc                 edi
            //   81ffff000000         | cmp                 edi, 0xff
            //   0f8c62ffffff         | jl                  0xffffff68
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]

        $sequence_7 = { 8d8424b40f0000 50 c78424bc0f000000000000 c78424c00f000000000000 c78424d00f000000000000 c78424d40f000000000000 c78424d80f000000000000 }
            // n = 7, score = 100
            //   8d8424b40f0000       | lea                 eax, dword ptr [esp + 0xfb4]
            //   50                   | push                eax
            //   c78424bc0f000000000000     | mov    dword ptr [esp + 0xfbc], 0
            //   c78424c00f000000000000     | mov    dword ptr [esp + 0xfc0], 0
            //   c78424d00f000000000000     | mov    dword ptr [esp + 0xfd0], 0
            //   c78424d40f000000000000     | mov    dword ptr [esp + 0xfd4], 0
            //   c78424d80f000000000000     | mov    dword ptr [esp + 0xfd8], 0

        $sequence_8 = { c68424e102000000 90 57 8d8c24d5020000 e8???????? 57 8d8c24d5020000 }
            // n = 7, score = 100
            //   c68424e102000000     | mov                 byte ptr [esp + 0x2e1], 0
            //   90                   | nop                 
            //   57                   | push                edi
            //   8d8c24d5020000       | lea                 ecx, dword ptr [esp + 0x2d5]
            //   e8????????           |                     
            //   57                   | push                edi
            //   8d8c24d5020000       | lea                 ecx, dword ptr [esp + 0x2d5]

        $sequence_9 = { 334df4 03f9 8b4dec 03b844284200 03bc05ccfeffff 037df8 03cf }
            // n = 7, score = 100
            //   334df4               | xor                 ecx, dword ptr [ebp - 0xc]
            //   03f9                 | add                 edi, ecx
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   03b844284200         | add                 edi, dword ptr [eax + 0x422844]
            //   03bc05ccfeffff       | add                 edi, dword ptr [ebp + eax - 0x134]
            //   037df8               | add                 edi, dword ptr [ebp - 8]
            //   03cf                 | add                 ecx, edi

    condition:
        7 of them and filesize < 337568
}