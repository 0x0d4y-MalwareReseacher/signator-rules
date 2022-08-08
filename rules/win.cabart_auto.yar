rule win_cabart_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.cabart."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cabart"
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
        $sequence_0 = { eb03 6a50 5e 53 53 53 }
            // n = 6, score = 300
            //   eb03                 | jmp                 5
            //   6a50                 | push                0x50
            //   5e                   | pop                 esi
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_1 = { 56 57 8b7d10 ff37 ff15???????? 83f804 7d0a }
            // n = 7, score = 300
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   ff37                 | push                dword ptr [edi]
            //   ff15????????         |                     
            //   83f804               | cmp                 eax, 4
            //   7d0a                 | jge                 0xc

        $sequence_2 = { 89442414 ffd6 8bf8 85db 750a 68b90b0000 e8???????? }
            // n = 7, score = 300
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   ffd6                 | call                esi
            //   8bf8                 | mov                 edi, eax
            //   85db                 | test                ebx, ebx
            //   750a                 | jne                 0xc
            //   68b90b0000           | push                0xbb9
            //   e8????????           |                     

        $sequence_3 = { 33c0 57 8bd1 85c9 7e0f 66833c535c }
            // n = 6, score = 300
            //   33c0                 | xor                 eax, eax
            //   57                   | push                edi
            //   8bd1                 | mov                 edx, ecx
            //   85c9                 | test                ecx, ecx
            //   7e0f                 | jle                 0x11
            //   66833c535c           | cmp                 word ptr [ebx + edx*2], 0x5c

        $sequence_4 = { e8???????? 83c40c 3bc7 740d 6800800000 57 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   3bc7                 | cmp                 eax, edi
            //   740d                 | je                  0xf
            //   6800800000           | push                0x8000
            //   57                   | push                edi

        $sequence_5 = { 33c0 83e911 7411 49 7407 49 0f859a000000 }
            // n = 7, score = 300
            //   33c0                 | xor                 eax, eax
            //   83e911               | sub                 ecx, 0x11
            //   7411                 | je                  0x13
            //   49                   | dec                 ecx
            //   7407                 | je                  9
            //   49                   | dec                 ecx
            //   0f859a000000         | jne                 0xa0

        $sequence_6 = { 83c40c 3bc7 740d 6800800000 }
            // n = 4, score = 300
            //   83c40c               | add                 esp, 0xc
            //   3bc7                 | cmp                 eax, edi
            //   740d                 | je                  0xf
            //   6800800000           | push                0x8000

        $sequence_7 = { 3bcf 7732 3bc3 7620 8d4df0 51 }
            // n = 6, score = 300
            //   3bcf                 | cmp                 ecx, edi
            //   7732                 | ja                  0x34
            //   3bc3                 | cmp                 eax, ebx
            //   7620                 | jbe                 0x22
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   51                   | push                ecx

        $sequence_8 = { 395d10 740f 6800800000 53 ff7510 ff15???????? 33c0 }
            // n = 7, score = 300
            //   395d10               | cmp                 dword ptr [ebp + 0x10], ebx
            //   740f                 | je                  0x11
            //   6800800000           | push                0x8000
            //   53                   | push                ebx
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 8be8 ffd6 68???????? 89442414 ffd6 }
            // n = 5, score = 300
            //   8be8                 | mov                 ebp, eax
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   ffd6                 | call                esi

    condition:
        7 of them and filesize < 32768
}