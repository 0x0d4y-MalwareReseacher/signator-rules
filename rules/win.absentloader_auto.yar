rule win_absentloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.absentloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.absentloader"
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
        $sequence_0 = { 680cfc05fd 8806 e8???????? 8d8dd8fbffff e8???????? 8d8d50fbffff e8???????? }
            // n = 7, score = 200
            //   680cfc05fd           | push                0xfd05fc0c
            //   8806                 | mov                 byte ptr [esi], al
            //   e8????????           |                     
            //   8d8dd8fbffff         | lea                 ecx, [ebp - 0x428]
            //   e8????????           |                     
            //   8d8d50fbffff         | lea                 ecx, [ebp - 0x4b0]
            //   e8????????           |                     

        $sequence_1 = { 8985acf9ffff e8???????? 8d85b4f9ffff c645fc21 8d8d84f9ffff 50 51 }
            // n = 7, score = 200
            //   8985acf9ffff         | mov                 dword ptr [ebp - 0x654], eax
            //   e8????????           |                     
            //   8d85b4f9ffff         | lea                 eax, [ebp - 0x64c]
            //   c645fc21             | mov                 byte ptr [ebp - 4], 0x21
            //   8d8d84f9ffff         | lea                 ecx, [ebp - 0x67c]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_2 = { 8d8d50fbffff e8???????? 8d8550fbffff c645fc0e bfb81e05fd }
            // n = 5, score = 200
            //   8d8d50fbffff         | lea                 ecx, [ebp - 0x4b0]
            //   e8????????           |                     
            //   8d8550fbffff         | lea                 eax, [ebp - 0x4b0]
            //   c645fc0e             | mov                 byte ptr [ebp - 4], 0xe
            //   bfb81e05fd           | mov                 edi, 0xfd051eb8

        $sequence_3 = { 84c9 75ee 89b564f3ffff 81bd64f3ffff1ca5f60d 8b7018 7408 85ff }
            // n = 7, score = 200
            //   84c9                 | test                cl, cl
            //   75ee                 | jne                 0xfffffff0
            //   89b564f3ffff         | mov                 dword ptr [ebp - 0xc9c], esi
            //   81bd64f3ffff1ca5f60d     | cmp    dword ptr [ebp - 0xc9c], 0xdf6a51c
            //   8b7018               | mov                 esi, dword ptr [eax + 0x18]
            //   7408                 | je                  0xa
            //   85ff                 | test                edi, edi

        $sequence_4 = { e8???????? 8ad0 8d8d74ffffff 895598 e8???????? 8d8d54ffffff e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8ad0                 | mov                 dl, al
            //   8d8d74ffffff         | lea                 ecx, [ebp - 0x8c]
            //   895598               | mov                 dword ptr [ebp - 0x68], edx
            //   e8????????           |                     
            //   8d8d54ffffff         | lea                 ecx, [ebp - 0xac]
            //   e8????????           |                     

        $sequence_5 = { 8b5508 33c0 ab ab ab 8975e4 8975e8 }
            // n = 7, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   33c0                 | xor                 eax, eax
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi

        $sequence_6 = { 0f2805???????? 8bcb 889d06faffff 0f118540f9ffff 6a1c 58 }
            // n = 6, score = 200
            //   0f2805????????       |                     
            //   8bcb                 | mov                 ecx, ebx
            //   889d06faffff         | mov                 byte ptr [ebp - 0x5fa], bl
            //   0f118540f9ffff       | movups              xmmword ptr [ebp - 0x6c0], xmm0
            //   6a1c                 | push                0x1c
            //   58                   | pop                 eax

        $sequence_7 = { 6689859afbffff 64a130000000 8b400c 8b400c 8b7818 8b4f3c 8b543978 }
            // n = 7, score = 200
            //   6689859afbffff       | mov                 word ptr [ebp - 0x466], ax
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b7818               | mov                 edi, dword ptr [eax + 0x18]
            //   8b4f3c               | mov                 ecx, dword ptr [edi + 0x3c]
            //   8b543978             | mov                 edx, dword ptr [ecx + edi + 0x78]

        $sequence_8 = { 8bcb 8b7004 8b00 8b38 e8???????? 33c0 }
            // n = 6, score = 200
            //   8bcb                 | mov                 ecx, ebx
            //   8b7004               | mov                 esi, dword ptr [eax + 4]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { bb44a706fd 53 e8???????? 833d????????ff 59 7522 56 }
            // n = 7, score = 200
            //   bb44a706fd           | mov                 ebx, 0xfd06a744
            //   53                   | push                ebx
            //   e8????????           |                     
            //   833d????????ff       |                     
            //   59                   | pop                 ecx
            //   7522                 | jne                 0x24
            //   56                   | push                esi

    condition:
        7 of them and filesize < 794624
}