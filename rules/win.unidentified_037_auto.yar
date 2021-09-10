rule win_unidentified_037_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.unidentified_037."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_037"
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
        $sequence_0 = { ff15???????? 85c0 7543 8b442418 8b4c2414 8b542410 50 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7543                 | jne                 0x45
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   50                   | push                eax

        $sequence_1 = { 66c704720000 8b44240c 85c0 7505 a1???????? 50 ff15???????? }
            // n = 7, score = 100
            //   66c704720000         | mov                 word ptr [edx + esi*2], 0
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { e8???????? 8a8d9c000000 8974246c 8db59d000000 89442460 884c2470 8bfe }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8a8d9c000000         | mov                 cl, byte ptr [ebp + 0x9c]
            //   8974246c             | mov                 dword ptr [esp + 0x6c], esi
            //   8db59d000000         | lea                 esi, dword ptr [ebp + 0x9d]
            //   89442460             | mov                 dword ptr [esp + 0x60], eax
            //   884c2470             | mov                 byte ptr [esp + 0x70], cl
            //   8bfe                 | mov                 edi, esi

        $sequence_3 = { 0f8790000000 ff248d94900010 83f80e 0f8580000000 8d8574fdffff 56 8b35???????? }
            // n = 7, score = 100
            //   0f8790000000         | ja                  0x96
            //   ff248d94900010       | jmp                 dword ptr [ecx*4 + 0x10009094]
            //   83f80e               | cmp                 eax, 0xe
            //   0f8580000000         | jne                 0x86
            //   8d8574fdffff         | lea                 eax, dword ptr [ebp - 0x28c]
            //   56                   | push                esi
            //   8b35????????         |                     

        $sequence_4 = { 53 56 8bf1 33db 8974240c 8806 895e04 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   33db                 | xor                 ebx, ebx
            //   8974240c             | mov                 dword ptr [esp + 0xc], esi
            //   8806                 | mov                 byte ptr [esi], al
            //   895e04               | mov                 dword ptr [esi + 4], ebx

        $sequence_5 = { 68???????? 50 b81c100000 64892500000000 e8???????? 56 57 }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   b81c100000           | mov                 eax, 0x101c
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   e8????????           |                     
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_6 = { 5f 5e 5d 33c0 5b 83c424 c20400 }
            // n = 7, score = 100
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   83c424               | add                 esp, 0x24
            //   c20400               | ret                 4

        $sequence_7 = { 8a1e 84d9 7457 33c9 8a4e01 8bd9 8ac8 }
            // n = 7, score = 100
            //   8a1e                 | mov                 bl, byte ptr [esi]
            //   84d9                 | test                cl, bl
            //   7457                 | je                  0x59
            //   33c9                 | xor                 ecx, ecx
            //   8a4e01               | mov                 cl, byte ptr [esi + 1]
            //   8bd9                 | mov                 ebx, ecx
            //   8ac8                 | mov                 cl, al

        $sequence_8 = { 68???????? 52 ffd6 8d45ec 8d8da8f6ffff 50 51 }
            // n = 7, score = 100
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   8d8da8f6ffff         | lea                 ecx, dword ptr [ebp - 0x958]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_9 = { 8d4508 50 ff15???????? 8d7c0002 8bc7 83c003 24fc }
            // n = 7, score = 100
            //   8d4508               | lea                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d7c0002             | lea                 edi, dword ptr [eax + eax + 2]
            //   8bc7                 | mov                 eax, edi
            //   83c003               | add                 eax, 3
            //   24fc                 | and                 al, 0xfc

    condition:
        7 of them and filesize < 167936
}