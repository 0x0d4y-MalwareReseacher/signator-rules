rule win_afrodita_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.afrodita."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.afrodita"
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
        $sequence_0 = { 33c5 50 8d45f4 64a300000000 33c0 8d4db8 6a03 }
            // n = 7, score = 300
            //   33c5                 | xor                 eax, ebp
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   33c0                 | xor                 eax, eax
            //   8d4db8               | lea                 ecx, dword ptr [ebp - 0x48]
            //   6a03                 | push                3

        $sequence_1 = { c745e800000000 52 68???????? 8b01 68???????? 8b4004 ffd0 }
            // n = 7, score = 300
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0
            //   52                   | push                edx
            //   68????????           |                     
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   68????????           |                     
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   ffd0                 | call                eax

        $sequence_2 = { 0f114c30c0 8b75ec 0f104c31c0 8b7508 660fefc8 0f1040e0 0f1149c0 }
            // n = 7, score = 300
            //   0f114c30c0           | movups              xmmword ptr [eax + esi - 0x40], xmm1
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   0f104c31c0           | movups              xmm1, xmmword ptr [ecx + esi - 0x40]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   660fefc8             | pxor                xmm1, xmm0
            //   0f1040e0             | movups              xmm0, xmmword ptr [eax - 0x20]
            //   0f1149c0             | movups              xmmword ptr [ecx - 0x40], xmm1

        $sequence_3 = { b8abaaaa2a f7e9 c1fa02 8bc2 c1e81f 03c2 8945cc }
            // n = 7, score = 300
            //   b8abaaaa2a           | mov                 eax, 0x2aaaaaab
            //   f7e9                 | imul                ecx
            //   c1fa02               | sar                 edx, 2
            //   8bc2                 | mov                 eax, edx
            //   c1e81f               | shr                 eax, 0x1f
            //   03c2                 | add                 eax, edx
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax

        $sequence_4 = { 8d8d68ffffff 8ad8 e8???????? 8d8d50ffffff e8???????? 8d4dc8 e8???????? }
            // n = 7, score = 300
            //   8d8d68ffffff         | lea                 ecx, dword ptr [ebp - 0x98]
            //   8ad8                 | mov                 bl, al
            //   e8????????           |                     
            //   8d8d50ffffff         | lea                 ecx, dword ptr [ebp - 0xb0]
            //   e8????????           |                     
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]
            //   e8????????           |                     

        $sequence_5 = { c1e702 2bd7 0f84ba000000 03cf 03df 895d0c eb03 }
            // n = 7, score = 300
            //   c1e702               | shl                 edi, 2
            //   2bd7                 | sub                 edx, edi
            //   0f84ba000000         | je                  0xc0
            //   03cf                 | add                 ecx, edi
            //   03df                 | add                 ebx, edi
            //   895d0c               | mov                 dword ptr [ebp + 0xc], ebx
            //   eb03                 | jmp                 5

        $sequence_6 = { 83f810 0f85c5000000 8d85c8feffff 50 8d8d18ffffff e8???????? 53 }
            // n = 7, score = 300
            //   83f810               | cmp                 eax, 0x10
            //   0f85c5000000         | jne                 0xcb
            //   8d85c8feffff         | lea                 eax, dword ptr [ebp - 0x138]
            //   50                   | push                eax
            //   8d8d18ffffff         | lea                 ecx, dword ptr [ebp - 0xe8]
            //   e8????????           |                     
            //   53                   | push                ebx

        $sequence_7 = { e8???????? 3bc6 0f827d010000 8bcb e8???????? 83c007 c78564ffffffffffffff }
            // n = 7, score = 300
            //   e8????????           |                     
            //   3bc6                 | cmp                 eax, esi
            //   0f827d010000         | jb                  0x183
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   83c007               | add                 eax, 7
            //   c78564ffffffffffffff     | mov    dword ptr [ebp - 0x9c], 0xffffffff

        $sequence_8 = { 8d45b0 50 e8???????? 834dfcff 8d4dd8 e8???????? 8b4508 }
            // n = 7, score = 300
            //   8d45b0               | lea                 eax, dword ptr [ebp - 0x50]
            //   50                   | push                eax
            //   e8????????           |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   8d4dd8               | lea                 ecx, dword ptr [ebp - 0x28]
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_9 = { 8b45a4 03ca 03c1 eb03 8b461c 8bd0 }
            // n = 6, score = 300
            //   8b45a4               | mov                 eax, dword ptr [ebp - 0x5c]
            //   03ca                 | add                 ecx, edx
            //   03c1                 | add                 eax, ecx
            //   eb03                 | jmp                 5
            //   8b461c               | mov                 eax, dword ptr [esi + 0x1c]
            //   8bd0                 | mov                 edx, eax

    condition:
        7 of them and filesize < 2334720
}