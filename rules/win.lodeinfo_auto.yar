rule win_lodeinfo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.lodeinfo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lodeinfo"
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
        $sequence_0 = { 8b08 8bf2 8975fc 85c9 0f85e4000000 8b4004 8945f4 }
            // n = 7, score = 200
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8bf2                 | mov                 esi, edx
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   85c9                 | test                ecx, ecx
            //   0f85e4000000         | jne                 0xea
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_1 = { 0fb7c0 8945d4 8bc7 2bc3 99 }
            // n = 5, score = 200
            //   0fb7c0               | movzx               eax, ax
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   8bc7                 | mov                 eax, edi
            //   2bc3                 | sub                 eax, ebx
            //   99                   | cdq                 

        $sequence_2 = { fec8 2245fc d2e0 85d2 0f85e5000000 5f }
            // n = 6, score = 200
            //   fec8                 | dec                 al
            //   2245fc               | and                 al, byte ptr [ebp - 4]
            //   d2e0                 | shl                 al, cl
            //   85d2                 | test                edx, edx
            //   0f85e5000000         | jne                 0xeb
            //   5f                   | pop                 edi

        $sequence_3 = { 8b4e08 0fb647ff 88449102 8b4608 c6449003ff }
            // n = 5, score = 200
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   0fb647ff             | movzx               eax, byte ptr [edi - 1]
            //   88449102             | mov                 byte ptr [ecx + edx*4 + 2], al
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   c6449003ff           | mov                 byte ptr [eax + edx*4 + 3], 0xff

        $sequence_4 = { 894e14 0fb64f02 0fb64703 c1e108 03c8 894e18 }
            // n = 6, score = 200
            //   894e14               | mov                 dword ptr [esi + 0x14], ecx
            //   0fb64f02             | movzx               ecx, byte ptr [edi + 2]
            //   0fb64703             | movzx               eax, byte ptr [edi + 3]
            //   c1e108               | shl                 ecx, 8
            //   03c8                 | add                 ecx, eax
            //   894e18               | mov                 dword ptr [esi + 0x18], ecx

        $sequence_5 = { c7406801000000 c7407c00000000 c7808800000000000000 c7808400000000000000 c7808000000000000000 }
            // n = 5, score = 200
            //   c7406801000000       | mov                 dword ptr [eax + 0x68], 1
            //   c7407c00000000       | mov                 dword ptr [eax + 0x7c], 0
            //   c7808800000000000000     | mov    dword ptr [eax + 0x88], 0
            //   c7808400000000000000     | mov    dword ptr [eax + 0x84], 0
            //   c7808000000000000000     | mov    dword ptr [eax + 0x80], 0

        $sequence_6 = { 8b55f4 8d0cb8 0fb601 8802 8b55f8 0fb64101 5f }
            // n = 7, score = 200
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8d0cb8               | lea                 ecx, [eax + edi*4]
            //   0fb601               | movzx               eax, byte ptr [ecx]
            //   8802                 | mov                 byte ptr [edx], al
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   0fb64101             | movzx               eax, byte ptr [ecx + 1]
            //   5f                   | pop                 edi

        $sequence_7 = { 50 e8???????? 83c404 ba???????? ff7670 51 b9???????? }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ba????????           |                     
            //   ff7670               | push                dword ptr [esi + 0x70]
            //   51                   | push                ecx
            //   b9????????           |                     

        $sequence_8 = { 7528 0fb64d0f 0fb642ff c1e108 03c8 3b4b18 7516 }
            // n = 7, score = 200
            //   7528                 | jne                 0x2a
            //   0fb64d0f             | movzx               ecx, byte ptr [ebp + 0xf]
            //   0fb642ff             | movzx               eax, byte ptr [edx - 1]
            //   c1e108               | shl                 ecx, 8
            //   03c8                 | add                 ecx, eax
            //   3b4b18               | cmp                 ecx, dword ptr [ebx + 0x18]
            //   7516                 | jne                 0x18

        $sequence_9 = { 81feffffff7f 0f87cb000000 8bd1 b8ffffff7f d1ea 2bc2 3bc8 }
            // n = 7, score = 200
            //   81feffffff7f         | cmp                 esi, 0x7fffffff
            //   0f87cb000000         | ja                  0xd1
            //   8bd1                 | mov                 edx, ecx
            //   b8ffffff7f           | mov                 eax, 0x7fffffff
            //   d1ea                 | shr                 edx, 1
            //   2bc2                 | sub                 eax, edx
            //   3bc8                 | cmp                 ecx, eax

    condition:
        7 of them and filesize < 712704
}