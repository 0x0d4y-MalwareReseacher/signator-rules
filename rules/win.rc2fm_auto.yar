rule win_rc2fm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.rc2fm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rc2fm"
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
        $sequence_0 = { ff5028 85c0 0f88ec010000 488b8c24f0000000 4c8d4c2470 4c8d05c7330100 33f6 }
            // n = 7, score = 100
            //   ff5028               | sete                cl
            //   85c0                 | xor                 edx, ecx
            //   0f88ec010000         | jne                 0xfc
            //   488b8c24f0000000     | dec                 ebp
            //   4c8d4c2470           | test                ebx, ebx
            //   4c8d05c7330100       | jne                 0xcf
            //   33f6                 | dec                 eax

        $sequence_1 = { 4c8bc7 33d2 ff15???????? eb0f ba02000700 b91b000100 e8???????? }
            // n = 7, score = 100
            //   4c8bc7               | xor                 edx, edx
            //   33d2                 | mov                 al, 1
            //   ff15????????         |                     
            //   eb0f                 | je                  0x1491
            //   ba02000700           | dec                 ebp
            //   b91b000100           | mov                 eax, esp
            //   e8????????           |                     

        $sequence_2 = { 4c8d35d5430000 0f1f440000 448b839c000000 4181f802010000 7729 488bcb e8???????? }
            // n = 7, score = 100
            //   4c8d35d5430000       | dec                 eax
            //   0f1f440000           | mov                 dword ptr [ebx], eax
            //   448b839c000000       | dec                 eax
            //   4181f802010000       | test                eax, eax
            //   7729                 | je                  0x3da
            //   488bcb               | inc                 ebp
            //   e8????????           |                     

        $sequence_3 = { 8d7a02 897c2444 eb42 440fb74583 ba09001000 b900000100 4183c002 }
            // n = 7, score = 100
            //   8d7a02               | je                  0x10f1
            //   897c2444             | dec                 eax
            //   eb42                 | mov                 dword ptr [esp + 0x30], 0
            //   440fb74583           | dec                 eax
            //   ba09001000           | lea                 ecx, dword ptr [ebx + 0x30]
            //   b900000100           | inc                 ebp
            //   4183c002             | xor                 ecx, ecx

        $sequence_4 = { 48894e10 488b4c2470 48014610 4885c9 7407 488b4610 }
            // n = 6, score = 100
            //   48894e10             | jne                 0xaaa
            //   488b4c2470           | jne                 0xac0
            //   48014610             | xor                 eax, eax
            //   4885c9               | nop                 
            //   7407                 | movzx               ecx, byte ptr [esp + eax + 0x40]
            //   488b4610             | movzx               edx, byte ptr [esp + eax + 0x50]

        $sequence_5 = { 488b01 ff5010 eb34 ba03000800 b91a000100 e8???????? 488b4c2438 }
            // n = 7, score = 100
            //   488b01               | je                  0xde3
            //   ff5010               | dec                 esp
            //   eb34                 | mov                 eax, ebp
            //   ba03000800           | dec                 ecx
            //   b91a000100           | mov                 edx, esi
            //   e8????????           |                     
            //   488b4c2438           | dec                 eax

        $sequence_6 = { 4885c0 7431 4533c9 4533c0 33c9 418d5101 48896bf8 }
            // n = 7, score = 100
            //   4885c0               | je                  0x8c1
            //   7431                 | inc                 ebp
            //   4533c9               | xor                 ecx, ecx
            //   4533c0               | dec                 eax
            //   33c9                 | mov                 ecx, ebx
            //   418d5101             | jmp                 0x8db
            //   48896bf8             | dec                 eax

        $sequence_7 = { 418d5001 ff15???????? 488905???????? 4885c0 7518 ff15???????? 4c8bc3 }
            // n = 7, score = 100
            //   418d5001             | mov                 ebx, esi
            //   ff15????????         |                     
            //   488905????????       |                     
            //   4885c0               | dec                 eax
            //   7518                 | mov                 ebp, eax
            //   ff15????????         |                     
            //   4c8bc3               | dec                 eax

        $sequence_8 = { 0fb7d7 4403ea ba08000000 458bc5 4885c0 740e 458bc8 }
            // n = 7, score = 100
            //   0fb7d7               | add                 esp, 0x120
            //   4403ea               | pop                 ebp
            //   ba08000000           | dec                 eax
            //   458bc5               | sub                 esp, 0x520
            //   4885c0               | dec                 eax
            //   740e                 | mov                 edi, edx
            //   458bc8               | mov                 edx, 8

        $sequence_9 = { ff15???????? 488bd8 4885c0 0f844e020000 c60000 0fb6455f 488d4b03 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   488bd8               | je                  0x8dc
            //   4885c0               | cmp                 edx, 5
            //   0f844e020000         | ja                  0x8dc
            //   c60000               | dec                 eax
            //   0fb6455f             | cmp                 dword ptr [ecx + 0x10], 0
            //   488d4b03             | je                  0x8dc

    condition:
        7 of them and filesize < 410624
}