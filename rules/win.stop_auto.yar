rule win_stop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.stop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stop"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 85c0 75e8 6a0a ff7304 ff15???????? }
            // n = 5, score = 600
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     

        $sequence_1 = { e8???????? 83c404 8b4b04 b8abaaaa2a }
            // n = 4, score = 600
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b4b04               | mov                 ecx, dword ptr [ebx + 4]
            //   b8abaaaa2a           | mov                 eax, 0x2aaaaaab

        $sequence_2 = { ff750c ff7508 ffd0 5d c3 8b0d???????? }
            // n = 6, score = 600
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     

        $sequence_3 = { 6a00 8bd9 6a00 6a12 }
            // n = 4, score = 600
            //   6a00                 | push                0
            //   8bd9                 | mov                 ebx, ecx
            //   6a00                 | push                0
            //   6a12                 | push                0x12

        $sequence_4 = { 89750c 8d4e08 894d08 894dec c645fc01 85c9 7408 }
            // n = 7, score = 600
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   8d4e08               | lea                 ecx, [esi + 8]
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   85c9                 | test                ecx, ecx
            //   7408                 | je                  0xa

        $sequence_5 = { 56 e8???????? 83c40c 8bce ff7508 }
            // n = 5, score = 600
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bce                 | mov                 ecx, esi
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_6 = { 33c0 c7463c07000000 c7463800000000 66894628 837e2408 }
            // n = 5, score = 600
            //   33c0                 | xor                 eax, eax
            //   c7463c07000000       | mov                 dword ptr [esi + 0x3c], 7
            //   c7463800000000       | mov                 dword ptr [esi + 0x38], 0
            //   66894628             | mov                 word ptr [esi + 0x28], ax
            //   837e2408             | cmp                 dword ptr [esi + 0x24], 8

        $sequence_7 = { ffd6 85c0 75e2 6a64 }
            // n = 4, score = 600
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   75e2                 | jne                 0xffffffe4
            //   6a64                 | push                0x64

        $sequence_8 = { ffd6 85c0 741e 837de412 }
            // n = 4, score = 600
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20
            //   837de412             | cmp                 dword ptr [ebp - 0x1c], 0x12

        $sequence_9 = { 85c0 75e8 6a0a ff7304 ff15???????? 3d02010000 }
            // n = 6, score = 600
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102

    condition:
        7 of them and filesize < 6029312
}