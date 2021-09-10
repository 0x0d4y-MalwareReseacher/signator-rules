rule win_doublefantasy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.doublefantasy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.doublefantasy"
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
        $sequence_0 = { ff15???????? ebb0 53 ffd7 59 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   ebb0                 | jmp                 0xffffffb2
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   59                   | pop                 ecx

        $sequence_1 = { 8b442404 0fb608 c1e902 8a91908c2700 8b4c2408 8811 33d2 }
            // n = 7, score = 200
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   0fb608               | movzx               ecx, byte ptr [eax]
            //   c1e902               | shr                 ecx, 2
            //   8a91908c2700         | mov                 dl, byte ptr [ecx + 0x278c90]
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]
            //   8811                 | mov                 byte ptr [ecx], dl
            //   33d2                 | xor                 edx, edx

        $sequence_2 = { c68094a3270000 ff35???????? ff35???????? e8???????? 83c414 e8???????? eb7c }
            // n = 7, score = 200
            //   c68094a3270000       | mov                 byte ptr [eax + 0x27a394], 0
            //   ff35????????         |                     
            //   ff35????????         |                     
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   e8????????           |                     
            //   eb7c                 | jmp                 0x7e

        $sequence_3 = { c1e202 0bd6 8a92908c2700 eb02 b23d }
            // n = 5, score = 200
            //   c1e202               | shl                 edx, 2
            //   0bd6                 | or                  edx, esi
            //   8a92908c2700         | mov                 dl, byte ptr [edx + 0x278c90]
            //   eb02                 | jmp                 4
            //   b23d                 | mov                 dl, 0x3d

        $sequence_4 = { 7416 56 68???????? 8d45d4 }
            // n = 4, score = 200
            //   7416                 | je                  0x18
            //   56                   | push                esi
            //   68????????           |                     
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]

        $sequence_5 = { 83e203 c1e204 0bd6 837c241001 8a92908c2700 885101 }
            // n = 6, score = 200
            //   83e203               | and                 edx, 3
            //   c1e204               | shl                 edx, 4
            //   0bd6                 | or                  edx, esi
            //   837c241001           | cmp                 dword ptr [esp + 0x10], 1
            //   8a92908c2700         | mov                 dl, byte ptr [edx + 0x278c90]
            //   885101               | mov                 byte ptr [ecx + 1], dl

        $sequence_6 = { 0fb606 83f860 0f8fd4010000 0f84b1010000 }
            // n = 4, score = 200
            //   0fb606               | movzx               eax, byte ptr [esi]
            //   83f860               | cmp                 eax, 0x60
            //   0f8fd4010000         | jg                  0x1da
            //   0f84b1010000         | je                  0x1b7

        $sequence_7 = { c70305000000 eb06 c70301000000 8b45fc 5f }
            // n = 5, score = 200
            //   c70305000000         | mov                 dword ptr [ebx], 5
            //   eb06                 | jmp                 8
            //   c70301000000         | mov                 dword ptr [ebx], 1
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   5f                   | pop                 edi

        $sequence_8 = { e8???????? 8b4605 c68094a3270000 ff35???????? ff35???????? }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8b4605               | mov                 eax, dword ptr [esi + 5]
            //   c68094a3270000       | mov                 byte ptr [eax + 0x27a394], 0
            //   ff35????????         |                     
            //   ff35????????         |                     

        $sequence_9 = { 891485a4ab2700 40 3bc1 72f1 }
            // n = 4, score = 200
            //   891485a4ab2700       | mov                 dword ptr [eax*4 + 0x27aba4], edx
            //   40                   | inc                 eax
            //   3bc1                 | cmp                 eax, ecx
            //   72f1                 | jb                  0xfffffff3

        $sequence_10 = { eb0a 6804010000 68???????? 68???????? ff15???????? 83c40c 837de000 }
            // n = 7, score = 200
            //   eb0a                 | jmp                 0xc
            //   6804010000           | push                0x104
            //   68????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0

        $sequence_11 = { 33c0 85c9 7616 8da42400000000 8d50fd 891485a4ab2700 }
            // n = 6, score = 200
            //   33c0                 | xor                 eax, eax
            //   85c9                 | test                ecx, ecx
            //   7616                 | jbe                 0x18
            //   8da42400000000       | lea                 esp, dword ptr [esp]
            //   8d50fd               | lea                 edx, dword ptr [eax - 3]
            //   891485a4ab2700       | mov                 dword ptr [eax*4 + 0x27aba4], edx

        $sequence_12 = { 51 8b45e0 83c02c 50 ff750c ffd3 }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   83c02c               | add                 eax, 0x2c
            //   50                   | push                eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ffd3                 | call                ebx

        $sequence_13 = { 894804 8b4de4 8b4108 8945bc }
            // n = 4, score = 200
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   8b4108               | mov                 eax, dword ptr [ecx + 8]
            //   8945bc               | mov                 dword ptr [ebp - 0x44], eax

        $sequence_14 = { 0fb6c0 8a80ad8c2700 eb02 32c0 }
            // n = 4, score = 200
            //   0fb6c0               | movzx               eax, al
            //   8a80ad8c2700         | mov                 al, byte ptr [eax + 0x278cad]
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al

        $sequence_15 = { 8945e0 3bc3 0f852d010000 6805010000 }
            // n = 4, score = 200
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   3bc3                 | cmp                 eax, ebx
            //   0f852d010000         | jne                 0x133
            //   6805010000           | push                0x105

    condition:
        7 of them and filesize < 172032
}