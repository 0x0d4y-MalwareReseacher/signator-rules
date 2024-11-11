rule win_monero_miner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.monero_miner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.monero_miner"
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
        $sequence_0 = { 8b542408 8b442404 85d2 7416 85c0 7412 8b08 }
            // n = 7, score = 100
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   85d2                 | test                edx, edx
            //   7416                 | je                  0x18
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_1 = { e8???????? 837b0c10 0f840a090000 8b4308 c7430c10000000 b9ffffffff 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   837b0c10             | cmp                 dword ptr [ebx + 0xc], 0x10
            //   0f840a090000         | je                  0x910
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   c7430c10000000       | mov                 dword ptr [ebx + 0xc], 0x10
            //   b9ffffffff           | mov                 ecx, 0xffffffff
            //   85c0                 | test                eax, eax

        $sequence_2 = { 8b5e54 8b4e50 89442438 89df 21cf 83ffff 0f849efeffff }
            // n = 7, score = 100
            //   8b5e54               | mov                 ebx, dword ptr [esi + 0x54]
            //   8b4e50               | mov                 ecx, dword ptr [esi + 0x50]
            //   89442438             | mov                 dword ptr [esp + 0x38], eax
            //   89df                 | mov                 edi, ebx
            //   21cf                 | and                 edi, ecx
            //   83ffff               | cmp                 edi, -1
            //   0f849efeffff         | je                  0xfffffea4

        $sequence_3 = { 8d442440 31c9 e8???????? 8d942480000000 8d842400010000 b901000000 e8???????? }
            // n = 7, score = 100
            //   8d442440             | lea                 eax, [esp + 0x40]
            //   31c9                 | xor                 ecx, ecx
            //   e8????????           |                     
            //   8d942480000000       | lea                 edx, [esp + 0x80]
            //   8d842400010000       | lea                 eax, [esp + 0x100]
            //   b901000000           | mov                 ecx, 1
            //   e8????????           |                     

        $sequence_4 = { c683f846000000 8983d8460000 8b8340010000 8983e8460000 8b83ec470000 890424 ff15???????? }
            // n = 7, score = 100
            //   c683f846000000       | mov                 byte ptr [ebx + 0x46f8], 0
            //   8983d8460000         | mov                 dword ptr [ebx + 0x46d8], eax
            //   8b8340010000         | mov                 eax, dword ptr [ebx + 0x140]
            //   8983e8460000         | mov                 dword ptr [ebx + 0x46e8], eax
            //   8b83ec470000         | mov                 eax, dword ptr [ebx + 0x47ec]
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     

        $sequence_5 = { c644242900 c644242a01 e9???????? 8b842468010000 8b00 890424 ff15???????? }
            // n = 7, score = 100
            //   c644242900           | mov                 byte ptr [esp + 0x29], 0
            //   c644242a01           | mov                 byte ptr [esp + 0x2a], 1
            //   e9????????           |                     
            //   8b842468010000       | mov                 eax, dword ptr [esp + 0x168]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     

        $sequence_6 = { 8b5c2420 8b742424 85db 7442 8b5348 85d2 7418 }
            // n = 7, score = 100
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   8b742424             | mov                 esi, dword ptr [esp + 0x24]
            //   85db                 | test                ebx, ebx
            //   7442                 | je                  0x44
            //   8b5348               | mov                 edx, dword ptr [ebx + 0x48]
            //   85d2                 | test                edx, edx
            //   7418                 | je                  0x1a

        $sequence_7 = { 8b4c2440 31fd 31d3 034c2418 89ac2440040000 8b7c2444 137c241c }
            // n = 7, score = 100
            //   8b4c2440             | mov                 ecx, dword ptr [esp + 0x40]
            //   31fd                 | xor                 ebp, edi
            //   31d3                 | xor                 ebx, edx
            //   034c2418             | add                 ecx, dword ptr [esp + 0x18]
            //   89ac2440040000       | mov                 dword ptr [esp + 0x440], ebp
            //   8b7c2444             | mov                 edi, dword ptr [esp + 0x44]
            //   137c241c             | adc                 edi, dword ptr [esp + 0x1c]

        $sequence_8 = { 0f29bc2400010000 85d2 0f851e080000 8b7d08 8b5930 8b4f34 89de }
            // n = 7, score = 100
            //   0f29bc2400010000     | movaps              xmmword ptr [esp + 0x100], xmm7
            //   85d2                 | test                edx, edx
            //   0f851e080000         | jne                 0x824
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b5930               | mov                 ebx, dword ptr [ecx + 0x30]
            //   8b4f34               | mov                 ecx, dword ptr [edi + 0x34]
            //   89de                 | mov                 esi, ebx

        $sequence_9 = { c1eb18 09d9 8b74240c 31ca 8b4c2414 c1e510 c1e618 }
            // n = 7, score = 100
            //   c1eb18               | shr                 ebx, 0x18
            //   09d9                 | or                  ecx, ebx
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   31ca                 | xor                 edx, ecx
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   c1e510               | shl                 ebp, 0x10
            //   c1e618               | shl                 esi, 0x18

    condition:
        7 of them and filesize < 1425408
}