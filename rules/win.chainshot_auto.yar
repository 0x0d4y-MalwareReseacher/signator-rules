rule win_chainshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.chainshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chainshot"
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
        $sequence_0 = { c745d410660000 8955d8 e8???????? 85c0 }
            // n = 4, score = 300
            //   c745d410660000       | push                eax
            //   8955d8               | mov                 esi, 0x800000b2
            //   e8????????           |                     
            //   85c0                 | lea                 eax, dword ptr [ebp - 0xc]

        $sequence_1 = { 81e100000040 f7d9 1bc0 83e010 83c010 c3 85c9 }
            // n = 7, score = 300
            //   81e100000040         | mov                 eax, ecx
            //   f7d9                 | dec                 eax
            //   1bc0                 | js                  0xc6d
            //   83e010               | dec                 eax
            //   83c010               | mov                 ecx, dword ptr [esp + 0x28]
            //   c3                   | dec                 ecx
            //   85c9                 | mov                 dword ptr [esp], ecx

        $sequence_2 = { 0f8490010000 83e819 0f8481000000 ffc8 7468 }
            // n = 5, score = 300
            //   0f8490010000         | dec                 ecx
            //   83e819               | sub                 al, 0x76
            //   0f8481000000         | sbb                 esp, dword ptr [esi + 0x1c65ecc3]
            //   ffc8                 | or                  eax, 0xec8348
            //   7468                 | mov                 dword ptr [ecx], eax

        $sequence_3 = { 0f843a110000 ffc8 7427 83e803 }
            // n = 4, score = 300
            //   0f843a110000         | cmp                 esi, ebx
            //   ffc8                 | jae                 0x8b2
            //   7427                 | movzx               eax, byte ptr [edx]
            //   83e803               | dec                 esp

        $sequence_4 = { eb13 bb16000080 eb0c bb15000080 }
            // n = 4, score = 300
            //   eb13                 | mov                 ecx, dword ptr [ebx + 0xa0]
            //   bb16000080           | dec                 eax
            //   eb0c                 | lea                 eax, dword ptr [0xd45b]
            //   bb15000080           | dec                 eax

        $sequence_5 = { 8d4a02 b8abaaaaaa f7e1 d1ea }
            // n = 4, score = 300
            //   8d4a02               | mov                 eax, dword ptr [ebx*4 + 0x817860]
            //   b8abaaaaaa           | mov                 edi, edi
            //   f7e1                 | mov                 dword ptr [eax], esi
            //   d1ea                 | add                 eax, 4

        $sequence_6 = { 7408 ffd0 8905???????? bb39000080 eb38 }
            // n = 5, score = 300
            //   7408                 | je                  0x1738
            //   ffd0                 | add                 edi, 2
            //   8905????????         |                     
            //   bb39000080           | movzx               eax, word ptr [ebx + edi]
            //   eb38                 | push                eax

        $sequence_7 = { 7509 8bd7 b907000080 eb2a }
            // n = 4, score = 300
            //   7509                 | pop                 ebx
            //   8bd7                 | cmp                 byte ptr [eax], 3
            //   b907000080           | je                  0x11b
            //   eb2a                 | dec                 eax

        $sequence_8 = { 85c9 7515 b90a060080 33d2 }
            // n = 4, score = 300
            //   85c9                 | jmp                 0x629
            //   7515                 | test                eax, eax
            //   b90a060080           | jne                 0x66a
            //   33d2                 | mov                 ecx, 0x80000605

        $sequence_9 = { 7433 ffc9 7438 ffc9 }
            // n = 4, score = 300
            //   7433                 | mov                 eax, esp
            //   ffc9                 | je                  0xbf
            //   7438                 | test                esi, esi
            //   ffc9                 | je                  0xbf

    condition:
        7 of them and filesize < 802816
}