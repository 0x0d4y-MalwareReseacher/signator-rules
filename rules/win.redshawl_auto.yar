rule win_redshawl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.redshawl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redshawl"
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
        $sequence_0 = { 0f84b3020000 e8???????? 33db 488d54245c 488b88c0000000 488d0563860000 }
            // n = 6, score = 100
            //   0f84b3020000         | dec                 eax
            //   e8????????           |                     
            //   33db                 | lea                 ecx, [0x1724]
            //   488d54245c           | dec                 eax
            //   488b88c0000000       | mov                 ecx, dword ptr [ebp + 0xb8]
            //   488d0563860000       | nop                 

        $sequence_1 = { 8bb424a0000000 448bc6 8bd7 488d0d12990000 }
            // n = 4, score = 100
            //   8bb424a0000000       | dec                 eax
            //   448bc6               | mov                 ebx, eax
            //   8bd7                 | dec                 ebp
            //   488d0d12990000       | test                esp, esp

        $sequence_2 = { 742e 488d1596a10000 488bcf ff15???????? 488d156ea10000 }
            // n = 5, score = 100
            //   742e                 | lea                 edx, [eax + ecx*8]
            //   488d1596a10000       | inc                 edx
            //   488bcf               | movsx               edx, byte ptr [edx + ecx + 0xb9a0]
            //   ff15????????         |                     
            //   488d156ea10000       | sar                 edx, 4

        $sequence_3 = { e8???????? 4c8d546d00 4c8d1d58c70000 49c1e204 bd04000000 4f8d442a10 498bc8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4c8d546d00           | dec                 eax
            //   4c8d1d58c70000       | lea                 edx, [0xbb43]
            //   49c1e204             | dec                 eax
            //   bd04000000           | mov                 dword ptr [ecx + eax], edx
            //   4f8d442a10           | dec                 eax
            //   498bc8               | add                 edx, 0x30

        $sequence_4 = { e8???????? 488d1568ba0000 413bc7 7428 83f8fe 7423 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   488d1568ba0000       | dec                 eax
            //   413bc7               | imul                ecx, ecx, 0x58
            //   7428                 | dec                 eax
            //   83f8fe               | add                 ecx, dword ptr [edx + eax*8]
            //   7423                 | jmp                 0x610

        $sequence_5 = { 488d0529c20000 483bf8 740e 833f00 7509 }
            // n = 5, score = 100
            //   488d0529c20000       | inc                 ecx
            //   483bf8               | test                byte ptr [eax + 0x38], 0x7f
            //   740e                 | jmp                 0x124
            //   833f00               | dec                 esp
            //   7509                 | lea                 esp, [0x93bc]

        $sequence_6 = { 4883ec30 b84d5a0000 663905dad9ffff 7404 33db eb38 }
            // n = 6, score = 100
            //   4883ec30             | dec                 ebx
            //   b84d5a0000           | mov                 eax, dword ptr [esi + ebp*8]
            //   663905dad9ffff       | dec                 ecx
            //   7404                 | inc                 ebx
            //   33db                 | dec                 eax
            //   eb38                 | inc                 ecx

        $sequence_7 = { 7577 b801000000 ff05???????? f743180c010000 7563 4c8d251ac70000 4863f8 }
            // n = 7, score = 100
            //   7577                 | mov                 byte ptr [ebp - 0x56], 0
            //   b801000000           | mov                 dword ptr [ebp - 0x40], 0x72657375
            //   ff05????????         |                     
            //   f743180c010000       | mov                 dword ptr [ebp - 0x3c], 0x2e766e65
            //   7563                 | mov                 dword ptr [ebp - 0x38], 0x6c6c64
            //   4c8d251ac70000       | mov                 dword ptr [ebp - 0x50], 0x776c6873
            //   4863f8               | mov                 dword ptr [ebp - 0x4c], 0x2e697061

        $sequence_8 = { 33d2 8d4a02 ffd0 4c8be0 4889442430 }
            // n = 5, score = 100
            //   33d2                 | mov                 ecx, dword ptr [ebx + 0xa0]
            //   8d4a02               | dec                 eax
            //   ffd0                 | lea                 eax, [0x8fa3]
            //   4c8be0               | je                  0x5d
            //   4889442430           | mov                 eax, dword ptr [esp + 0x48]

        $sequence_9 = { 0f8584010000 8a0b 33c0 80f90a 0f94c0 8944244c 488d0502860000 }
            // n = 7, score = 100
            //   0f8584010000         | jne                 0x42
            //   8a0b                 | dec                 eax
            //   33c0                 | lea                 eax, [0xba6f]
            //   80f90a               | dec                 eax
            //   0f94c0               | mov                 dword ptr [esp + 8], ebx
            //   8944244c             | dec                 eax
            //   488d0502860000       | mov                 dword ptr [esp + 0x10], esi

    condition:
        7 of them and filesize < 174080
}