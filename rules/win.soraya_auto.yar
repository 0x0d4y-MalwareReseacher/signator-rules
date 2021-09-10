rule win_soraya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.soraya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.soraya"
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
        $sequence_0 = { ff15???????? 8d48bf 80f919 77f2 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8d48bf               | lea                 ecx, dword ptr [eax - 0x41]
            //   80f919               | cmp                 cl, 0x19
            //   77f2                 | ja                  0xfffffff4

        $sequence_1 = { 83bea400000000 766b 8b86a0000000 03c3 }
            // n = 4, score = 100
            //   83bea400000000       | push                eax
            //   766b                 | pop                 ecx
            //   8b86a0000000         | pop                 ecx
            //   03c3                 | cmp                 eax, 7

        $sequence_2 = { ffd0 85c0 7412 83bc248000000000 7508 }
            // n = 5, score = 100
            //   ffd0                 | lea                 edx, dword ptr [ebp + 0x50]
            //   85c0                 | dec                 esp
            //   7412                 | mov                 eax, eax
            //   83bc248000000000     | inc                 ebp
            //   7508                 | xor                 ecx, ecx

        $sequence_3 = { 8a0408 8b55f4 34af 046f }
            // n = 4, score = 100
            //   8a0408               | add                 eax, ebx
            //   8b55f4               | mov                 edi, eax
            //   34af                 | push                edi
            //   046f                 | push                dword ptr [ebp - 4]

        $sequence_4 = { 57 ff15???????? 8945ec 85c0 0f84bb000000 8b4dcc 8365f400 }
            // n = 7, score = 100
            //   57                   | lea                 eax, dword ptr [esi - 0x50]
            //   ff15????????         |                     
            //   8945ec               | mov                 ah, 2
            //   85c0                 | ret                 
            //   0f84bb000000         | mov                 ah, 0x80
            //   8b4dcc               | ret                 
            //   8365f400             | lea                 eax, dword ptr [edi + esi + 2]

        $sequence_5 = { 8b0d???????? a1???????? 33d2 f7f1 bbdc2ce338 }
            // n = 5, score = 100
            //   8b0d????????         |                     
            //   a1????????           |                     
            //   33d2                 | mov                 ecx, dword ptr [ebp - 0x14]
            //   f7f1                 | xor                 eax, esi
            //   bbdc2ce338           | xor                 eax, edx

        $sequence_6 = { 742a 8b4508 8bb8d8010000 8b7508 }
            // n = 4, score = 100
            //   742a                 | add                 al, 0x6f
            //   8b4508               | add                 eax, dword ptr [ebp + 8]
            //   8bb8d8010000         | push                eax
            //   8b7508               | mov                 eax, dword ptr [ebp - 4]

        $sequence_7 = { 33c2 8945b4 8145b471790600 c7451c3c230600 }
            // n = 4, score = 100
            //   33c2                 | mov                 dword ptr [ebp - 0x18], eax
            //   8945b4               | cmp                 ecx, eax
            //   8145b471790600       | jne                 0x17
            //   c7451c3c230600       | mov                 eax, dword ptr [ebp - 8]

        $sequence_8 = { 488bf0 4885c0 0f8441020000 448bcb 458bc5 }
            // n = 5, score = 100
            //   488bf0               | mov                 ecx, dword ptr [ebp + 0x150]
            //   4885c0               | jmp                 0x27
            //   0f8441020000         | call                eax
            //   448bcb               | test                eax, eax
            //   458bc5               | je                  0x14

        $sequence_9 = { b402 c3 b480 c3 }
            // n = 4, score = 100
            //   b402                 | xor                 ebx, ebx
            //   c3                   | test                ebx, ebx
            //   b480                 | je                  0x2e4
            //   c3                   | mov                 edx, 0xa

        $sequence_10 = { 3bc8 7513 8b45f8 33c6 2bc3 50 }
            // n = 6, score = 100
            //   3bc8                 | je                  0xc3
            //   7513                 | mov                 ecx, dword ptr [ebp - 0x34]
            //   8b45f8               | and                 dword ptr [ebp - 0xc], 0
            //   33c6                 | cmp                 dword ptr [esi + 0xa4], 0
            //   2bc3                 | jbe                 0x74
            //   50                   | mov                 eax, dword ptr [esi + 0xa0]

        $sequence_11 = { 034508 50 e8???????? 8b45fc 8b4dec 33c6 }
            // n = 6, score = 100
            //   034508               | call                esi
            //   50                   | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b45fc               | mov                 dword ptr [ebp - 0x10], eax
            //   8b4dec               | mov                 eax, dword ptr [ebp + 0x14]
            //   33c6                 | add                 eax, dword ptr [ebp + 0xc]

        $sequence_12 = { 7305 66b80810 c3 b403 c3 e8???????? 7303 }
            // n = 7, score = 100
            //   7305                 | jne                 0xffffff5f
            //   66b80810             | or                  dl, 4
            //   c3                   | push                ebx
            //   b403                 | push                esi
            //   c3                   | mov                 esi, dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   7303                 | xor                 ebx, ebx

        $sequence_13 = { ff15???????? 85c0 7530 488b4c2430 897c2428 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   85c0                 | dec                 ebp
            //   7530                 | sub                 eax, esi
            //   488b4c2430           | movzx               eax, word ptr [ecx]
            //   897c2428             | test                eax, eax

        $sequence_14 = { 740a 663d0500 0f8559ffffff 80ca04 }
            // n = 4, score = 100
            //   740a                 | mov                 esi, eax
            //   663d0500             | dec                 eax
            //   0f8559ffffff         | test                eax, eax
            //   80ca04               | je                  0x247

        $sequence_15 = { 8d443702 50 e8???????? 59 59 83f807 }
            // n = 6, score = 100
            //   8d443702             | lea                 ecx, dword ptr [eax - 0x41]
            //   50                   | cmp                 cl, 0x19
            //   e8????????           |                     
            //   59                   | ja                  0xfffffff4
            //   59                   | je                  0xc
            //   83f807               | cmp                 ax, 5

        $sequence_16 = { 33d2 85c0 7422 4d8bc2 498d4e5e 4d2bc6 0fb701 }
            // n = 7, score = 100
            //   33d2                 | xor                 edx, edx
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24
            //   4d8bc2               | dec                 ebp
            //   498d4e5e             | mov                 eax, edx
            //   4d2bc6               | dec                 ecx
            //   0fb701               | lea                 ecx, dword ptr [esi + 0x5e]

        $sequence_17 = { 8945f0 8b4514 03450c 8945e8 }
            // n = 4, score = 100
            //   8945f0               | jae                 9
            //   8b4514               | push                edi
            //   03450c               | mov                 dword ptr [ebp - 0x14], eax
            //   8945e8               | test                eax, eax

        $sequence_18 = { 53 56 8b750c 33db 8d46b0 }
            // n = 5, score = 100
            //   53                   | inc                 esp
            //   56                   | mov                 ecx, ebx
            //   8b750c               | inc                 ebp
            //   33db                 | mov                 eax, ebp
            //   8d46b0               | jb                  0xfffffff5

        $sequence_19 = { 57 8bf0 0fbdc1 c1d30b 0fbdc1 8b8294010000 }
            // n = 6, score = 100
            //   57                   | xor                 eax, esi
            //   8bf0                 | sub                 eax, ebx
            //   0fbdc1               | push                eax
            //   c1d30b               | mov                 al, byte ptr [eax + ecx]
            //   0fbdc1               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b8294010000         | xor                 al, 0xaf

        $sequence_20 = { 488d0defedffff e8???????? 488364242000 488d5550 4c8bc0 4533c9 33c9 }
            // n = 7, score = 100
            //   488d0defedffff       | jne                 0x32
            //   e8????????           |                     
            //   488364242000         | dec                 eax
            //   488d5550             | mov                 ecx, dword ptr [esp + 0x30]
            //   4c8bc0               | mov                 dword ptr [esp + 0x28], edi
            //   4533c9               | dec                 eax
            //   33c9                 | lea                 ecx, dword ptr [0xffffedef]

        $sequence_21 = { 750f 488b8d50010000 ff15???????? eb25 }
            // n = 4, score = 100
            //   750f                 | dec                 eax
            //   488b8d50010000       | and                 dword ptr [esp + 0x20], 0
            //   ff15????????         |                     
            //   eb25                 | dec                 eax

        $sequence_22 = { e9???????? 488b742460 4c8b15???????? 4533f6 85ff }
            // n = 5, score = 100
            //   e9????????           |                     
            //   488b742460           | xor                 ecx, ecx
            //   4c8b15????????       |                     
            //   4533f6               | jne                 0x11
            //   85ff                 | dec                 eax

    condition:
        7 of them and filesize < 188416
}