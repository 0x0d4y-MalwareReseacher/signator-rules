rule win_unidentified_087_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.unidentified_087."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_087"
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
        $sequence_0 = { 48637004 4803f1 488bce e8???????? 48895e48 48c7465000000000 b220 }
            // n = 7, score = 200
            //   48637004             | mov                 byte ptr [ebp + 7], 0
            //   4803f1               | dec                 esp
            //   488bce               | mov                 dword ptr [ebp + 0xf], ebp
            //   e8????????           |                     
            //   48895e48             | dec                 eax
            //   48c7465000000000     | arpl                word ptr [eax + 4], si
            //   b220                 | dec                 eax

        $sequence_1 = { e8???????? 498bcd ff15???????? 448b6c2434 4c8bbc2468020000 4533f6 ff15???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   498bcd               | mov                 ebx, dword ptr [esp + 0x50]
            //   ff15????????         |                     
            //   448b6c2434           | mov                 ecx, dword ptr [esp + 0x60]
            //   4c8bbc2468020000     | xor                 edx, edx
            //   4533f6               | inc                 ecx
            //   ff15????????         |                     

        $sequence_2 = { 83ca04 4533c0 e8???????? 90 eb00 488bc3 488b5c2450 }
            // n = 7, score = 200
            //   83ca04               | add                 esi, ecx
            //   4533c0               | dec                 eax
            //   e8????????           |                     
            //   90                   | mov                 ecx, esi
            //   eb00                 | dec                 eax
            //   488bc3               | mov                 dword ptr [esi + 0x48], ebx
            //   488b5c2450           | dec                 eax

        $sequence_3 = { 8b4c2460 890d???????? 33d2 41b808020000 488d4dd0 e8???????? 41b804010000 }
            // n = 7, score = 200
            //   8b4c2460             | mov                 dword ptr [esi + 0x50], 0
            //   890d????????         |                     
            //   33d2                 | mov                 dl, 0x20
            //   41b808020000         | or                  edx, 4
            //   488d4dd0             | inc                 ebp
            //   e8????????           |                     
            //   41b804010000         | xor                 eax, eax

        $sequence_4 = { 48833d????????10 480f432d???????? 440fbee6 4c8bc3 418bd4 488bcd e8???????? }
            // n = 7, score = 200
            //   48833d????????10     |                     
            //   480f432d????????     |                     
            //   440fbee6             | mov                 eax, 0x104
            //   4c8bc3               | mov                 dword ptr [eax + 0x18], edi
            //   418bd4               | dec                 eax
            //   488bcd               | mov                 dword ptr [ecx + 0x18], 7
            //   e8????????           |                     

        $sequence_5 = { 897818 48c7411807000000 48897910 668939 c7401801000000 }
            // n = 5, score = 200
            //   897818               | nop                 
            //   48c7411807000000     | jmp                 6
            //   48897910             | dec                 eax
            //   668939               | mov                 eax, ebx
            //   c7401801000000       | dec                 eax

        $sequence_6 = { 8a84191d010000 4288840170790200 ffc7 ebde 488b05???????? }
            // n = 5, score = 200
            //   8a84191d010000       | mov                 eax, 0x208
            //   4288840170790200     | dec                 eax
            //   ffc7                 | lea                 ecx, [ebp - 0x30]
            //   ebde                 | inc                 ecx
            //   488b05????????       |                     

        $sequence_7 = { e8???????? 90 4c896def c645f700 4c896dff c6450700 4c896d0f }
            // n = 7, score = 200
            //   e8????????           |                     
            //   90                   | nop                 
            //   4c896def             | dec                 esp
            //   c645f700             | mov                 dword ptr [ebp - 0x11], ebp
            //   4c896dff             | mov                 byte ptr [ebp - 9], 0
            //   c6450700             | dec                 esp
            //   4c896d0f             | mov                 dword ptr [ebp - 1], ebp

        $sequence_8 = { 8b421c ffd0 c745fc01000000 eb74 }
            // n = 4, score = 100
            //   8b421c               | inc                 edx
            //   ffd0                 | mov                 byte ptr [ecx + eax + 0x27970], al
            //   c745fc01000000       | inc                 edi
            //   eb74                 | jmp                 0xffffffea

        $sequence_9 = { 32c0 e9???????? 8b8d54ffffff 6aff 51 }
            // n = 5, score = 100
            //   32c0                 | dec                 eax
            //   e9????????           |                     
            //   8b8d54ffffff         | mov                 ecx, ebp
            //   6aff                 | dec                 eax
            //   51                   | mov                 ebx, eax

        $sequence_10 = { 8b0d???????? a1???????? 85c9 740d 8939 8b0d???????? a1???????? }
            // n = 7, score = 100
            //   8b0d????????         |                     
            //   a1????????           |                     
            //   85c9                 | mov                 cl, byte ptr [eax + ebx + 0x11d]
            //   740d                 | mov                 byte ptr [eax + 0x10020798], cl
            //   8939                 | mov                 eax, dword ptr [edx + 0x1c]
            //   8b0d????????         |                     
            //   a1????????           |                     

        $sequence_11 = { 8945e4 3d00010000 7d10 8a8c181d010000 888898070210 }
            // n = 5, score = 100
            //   8945e4               | dec                 esp
            //   3d00010000           | mov                 edi, dword ptr [esp + 0x268]
            //   7d10                 | inc                 ebp
            //   8a8c181d010000       | xor                 esi, esi
            //   888898070210         | mov                 al, byte ptr [ecx + ebx + 0x11d]

        $sequence_12 = { 85c0 0f84be000000 6800040000 8d54242c 6a00 52 }
            // n = 6, score = 100
            //   85c0                 | inc                 esp
            //   0f84be000000         | movsx               esp, dh
            //   6800040000           | dec                 esp
            //   8d54242c             | mov                 eax, ebx
            //   6a00                 | inc                 ecx
            //   52                   | mov                 edx, esp

        $sequence_13 = { 52 50 ff15???????? 8d8c2478010000 51 }
            // n = 5, score = 100
            //   52                   | cmp                 dword ptr [ebp - 0x64], 0
            //   50                   | mov                 dword ptr [ebp - 0x1c], eax
            //   ff15????????         |                     
            //   8d8c2478010000       | cmp                 eax, 0x100
            //   51                   | jge                 0x17

        $sequence_14 = { 52 c745fc00000000 e8???????? c645fc01 837d9c00 }
            // n = 5, score = 100
            //   52                   | dec                 ecx
            //   c745fc00000000       | mov                 ecx, ebp
            //   e8????????           |                     
            //   c645fc01             | inc                 esp
            //   837d9c00             | mov                 ebp, dword ptr [esp + 0x34]

        $sequence_15 = { 83c404 6a00 6a00 53 8bf8 57 6aff }
            // n = 7, score = 100
            //   83c404               | inc                 ebp
            //   6a00                 | test                ebp, ebp
            //   6a00                 | je                  0x11
            //   53                   | movzx               eax, di
            //   8bf8                 | push                edx
            //   57                   | mov                 dword ptr [ebp - 4], 0
            //   6aff                 | mov                 byte ptr [ebp - 4], 1

    condition:
        7 of them and filesize < 462848
}