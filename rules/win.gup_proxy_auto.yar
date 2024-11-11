rule win_gup_proxy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.gup_proxy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gup_proxy"
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
        $sequence_0 = { 0fb6cb 33d1 8a8c15fcf9ffff 8b95f4f9ffff 300c02 }
            // n = 5, score = 100
            //   0fb6cb               | movzx               ecx, bl
            //   33d1                 | xor                 edx, ecx
            //   8a8c15fcf9ffff       | mov                 cl, byte ptr [ebp + edx - 0x604]
            //   8b95f4f9ffff         | mov                 edx, dword ptr [ebp - 0x60c]
            //   300c02               | xor                 byte ptr [edx + eax], cl

        $sequence_1 = { 33f6 ffb640834100 ff15???????? 898640834100 }
            // n = 4, score = 100
            //   33f6                 | xor                 esi, esi
            //   ffb640834100         | push                dword ptr [esi + 0x418340]
            //   ff15????????         |                     
            //   898640834100         | mov                 dword ptr [esi + 0x418340], eax

        $sequence_2 = { c74424480f000000 c744244400000000 c644243400 e8???????? c784242002000000000000 8d4c2444 }
            // n = 6, score = 100
            //   c74424480f000000     | mov                 dword ptr [esp + 0x48], 0xf
            //   c744244400000000     | mov                 dword ptr [esp + 0x44], 0
            //   c644243400           | mov                 byte ptr [esp + 0x34], 0
            //   e8????????           |                     
            //   c784242002000000000000     | mov    dword ptr [esp + 0x220], 0
            //   8d4c2444             | lea                 ecx, [esp + 0x44]

        $sequence_3 = { 99 2bc2 8bf0 d1fe 6a55 ff34f5903a4100 }
            // n = 6, score = 100
            //   99                   | cdq                 
            //   2bc2                 | sub                 eax, edx
            //   8bf0                 | mov                 esi, eax
            //   d1fe                 | sar                 esi, 1
            //   6a55                 | push                0x55
            //   ff34f5903a4100       | push                dword ptr [esi*8 + 0x413a90]

        $sequence_4 = { 0f57c0 c745dc00000000 b802000000 8bf2 f30f7f45e8 6a50 }
            // n = 6, score = 100
            //   0f57c0               | xorps               xmm0, xmm0
            //   c745dc00000000       | mov                 dword ptr [ebp - 0x24], 0
            //   b802000000           | mov                 eax, 2
            //   8bf2                 | mov                 esi, edx
            //   f30f7f45e8           | movdqu              xmmword ptr [ebp - 0x18], xmm0
            //   6a50                 | push                0x50

        $sequence_5 = { 8bfa 8bf1 837f1410 7207 8b07 8945fc }
            // n = 6, score = 100
            //   8bfa                 | mov                 edi, edx
            //   8bf1                 | mov                 esi, ecx
            //   837f1410             | cmp                 dword ptr [edi + 0x14], 0x10
            //   7207                 | jb                  9
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_6 = { 83f801 7c1a 0103 8b8ddcf5ffff 50 8d85f4f7ffff 50 }
            // n = 7, score = 100
            //   83f801               | cmp                 eax, 1
            //   7c1a                 | jl                  0x1c
            //   0103                 | add                 dword ptr [ebx], eax
            //   8b8ddcf5ffff         | mov                 ecx, dword ptr [ebp - 0xa24]
            //   50                   | push                eax
            //   8d85f4f7ffff         | lea                 eax, [ebp - 0x80c]
            //   50                   | push                eax

        $sequence_7 = { f30f7f851cffffff 660f6f05???????? f30f7f852cffffff 660f6f05???????? f30f7f853cffffff 660f6f05???????? f30f7f854cffffff }
            // n = 7, score = 100
            //   f30f7f851cffffff     | movdqu              xmmword ptr [ebp - 0xe4], xmm0
            //   660f6f05????????     |                     
            //   f30f7f852cffffff     | movdqu              xmmword ptr [ebp - 0xd4], xmm0
            //   660f6f05????????     |                     
            //   f30f7f853cffffff     | movdqu              xmmword ptr [ebp - 0xc4], xmm0
            //   660f6f05????????     |                     
            //   f30f7f854cffffff     | movdqu              xmmword ptr [ebp - 0xb4], xmm0

        $sequence_8 = { 660f6f05???????? f30f7f850cfaffff 56 660f6f05???????? f30f7f851cfaffff }
            // n = 5, score = 100
            //   660f6f05????????     |                     
            //   f30f7f850cfaffff     | movdqu              xmmword ptr [ebp - 0x5f4], xmm0
            //   56                   | push                esi
            //   660f6f05????????     |                     
            //   f30f7f851cfaffff     | movdqu              xmmword ptr [ebp - 0x5e4], xmm0

        $sequence_9 = { 8a4806 8a4007 0fb6f0 c1e608 0fb6c1 03f0 0fb6c2 }
            // n = 7, score = 100
            //   8a4806               | mov                 cl, byte ptr [eax + 6]
            //   8a4007               | mov                 al, byte ptr [eax + 7]
            //   0fb6f0               | movzx               esi, al
            //   c1e608               | shl                 esi, 8
            //   0fb6c1               | movzx               eax, cl
            //   03f0                 | add                 esi, eax
            //   0fb6c2               | movzx               eax, dl

    condition:
        7 of them and filesize < 247808
}