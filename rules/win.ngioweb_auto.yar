rule win_ngioweb_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ngioweb."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ngioweb"
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
        $sequence_0 = { ff4d0c 807dff00 0f8428feffff eb04 c645ff00 807dff00 7424 }
            // n = 7, score = 500
            //   ff4d0c               | dec                 dword ptr [ebp + 0xc]
            //   807dff00             | cmp                 byte ptr [ebp - 1], 0
            //   0f8428feffff         | je                  0xfffffe2e
            //   eb04                 | jmp                 6
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   807dff00             | cmp                 byte ptr [ebp - 1], 0
            //   7424                 | je                  0x26

        $sequence_1 = { 8b400c 833800 743e 8b00 8b30 83feff 7435 }
            // n = 7, score = 500
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   833800               | cmp                 dword ptr [eax], 0
            //   743e                 | je                  0x40
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   83feff               | cmp                 esi, -1
            //   7435                 | je                  0x37

        $sequence_2 = { 66817ddc0b01 7571 8b4510 2b45cc 6a05 6a05 50 }
            // n = 7, score = 500
            //   66817ddc0b01         | cmp                 word ptr [ebp - 0x24], 0x10b
            //   7571                 | jne                 0x73
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   2b45cc               | sub                 eax, dword ptr [ebp - 0x34]
            //   6a05                 | push                5
            //   6a05                 | push                5
            //   50                   | push                eax

        $sequence_3 = { ff7608 ff750c e8???????? 8bd8 83fbff 0f84b2000000 8d049d0c000000 }
            // n = 7, score = 500
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   83fbff               | cmp                 ebx, -1
            //   0f84b2000000         | je                  0xb8
            //   8d049d0c000000       | lea                 eax, dword ptr [ebx*4 + 0xc]

        $sequence_4 = { 66897534 66c7456e7200 66c7456c6500 66894d6a 66c745686600 66894d66 }
            // n = 6, score = 500
            //   66897534             | mov                 word ptr [ebp + 0x34], si
            //   66c7456e7200         | mov                 word ptr [ebp + 0x6e], 0x72
            //   66c7456c6500         | mov                 word ptr [ebp + 0x6c], 0x65
            //   66894d6a             | mov                 word ptr [ebp + 0x6a], cx
            //   66c745686600         | mov                 word ptr [ebp + 0x68], 0x66
            //   66894d66             | mov                 word ptr [ebp + 0x66], cx

        $sequence_5 = { 33db 8b5508 8b4214 8b4a18 3bc1 7702 8bc1 }
            // n = 7, score = 500
            //   33db                 | xor                 ebx, ebx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   8b4a18               | mov                 ecx, dword ptr [edx + 0x18]
            //   3bc1                 | cmp                 eax, ecx
            //   7702                 | ja                  4
            //   8bc1                 | mov                 eax, ecx

        $sequence_6 = { e8???????? 85c0 750b 57 ff75f0 e8???????? eb03 }
            // n = 7, score = 500
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750b                 | jne                 0xd
            //   57                   | push                edi
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   eb03                 | jmp                 5

        $sequence_7 = { 750c 53 e8???????? 8bf0 85f6 7456 53 }
            // n = 7, score = 500
            //   750c                 | jne                 0xe
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7456                 | je                  0x58
            //   53                   | push                ebx

        $sequence_8 = { 66c7455c7400 66c7455a6900 66c745586700 66c745566900 66c745544400 e8???????? 66c745487900 }
            // n = 7, score = 500
            //   66c7455c7400         | mov                 word ptr [ebp + 0x5c], 0x74
            //   66c7455a6900         | mov                 word ptr [ebp + 0x5a], 0x69
            //   66c745586700         | mov                 word ptr [ebp + 0x58], 0x67
            //   66c745566900         | mov                 word ptr [ebp + 0x56], 0x69
            //   66c745544400         | mov                 word ptr [ebp + 0x54], 0x44
            //   e8????????           |                     
            //   66c745487900         | mov                 word ptr [ebp + 0x48], 0x79

        $sequence_9 = { 395d0c 56 be15e834f7 0f841c010000 6a0a 8d45d8 50 }
            // n = 7, score = 500
            //   395d0c               | cmp                 dword ptr [ebp + 0xc], ebx
            //   56                   | push                esi
            //   be15e834f7           | mov                 esi, 0xf734e815
            //   0f841c010000         | je                  0x122
            //   6a0a                 | push                0xa
            //   8d45d8               | lea                 eax, dword ptr [ebp - 0x28]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 204800
}