rule win_unidentified_080_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.unidentified_080."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_080"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 85c0 750a 8b4de8 51 ff15???????? 8b4dfc 33cd }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   750a                 | jne                 0xc
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

        $sequence_1 = { 89857cfeffff 33db 895dfc 899d80feffff 899d84feffff 899d88feffff 899d8cfeffff }
            // n = 7, score = 100
            //   89857cfeffff         | mov                 dword ptr [ebp - 0x184], eax
            //   33db                 | xor                 ebx, ebx
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   899d80feffff         | mov                 dword ptr [ebp - 0x180], ebx
            //   899d84feffff         | mov                 dword ptr [ebp - 0x17c], ebx
            //   899d88feffff         | mov                 dword ptr [ebp - 0x178], ebx
            //   899d8cfeffff         | mov                 dword ptr [ebp - 0x174], ebx

        $sequence_2 = { a1???????? 33c5 50 8d45f4 64a300000000 a1???????? 8b5004 }
            // n = 7, score = 100
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   a1????????           |                     
            //   8b5004               | mov                 edx, dword ptr [eax + 4]

        $sequence_3 = { 33c5 50 8d45f4 64a300000000 8b7508 85f6 7456 }
            // n = 7, score = 100
            //   33c5                 | xor                 eax, ebp
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   85f6                 | test                esi, esi
            //   7456                 | je                  0x58

        $sequence_4 = { 897c2454 3bc3 740f 395c2460 7509 50 }
            // n = 6, score = 100
            //   897c2454             | mov                 dword ptr [esp + 0x54], edi
            //   3bc3                 | cmp                 eax, ebx
            //   740f                 | je                  0x11
            //   395c2460             | cmp                 dword ptr [esp + 0x60], ebx
            //   7509                 | jne                 0xb
            //   50                   | push                eax

        $sequence_5 = { c70009000000 e8???????? ebd1 8bc8 c1f905 8d3c8dc0a20210 8bf0 }
            // n = 7, score = 100
            //   c70009000000         | mov                 dword ptr [eax], 9
            //   e8????????           |                     
            //   ebd1                 | jmp                 0xffffffd3
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   8d3c8dc0a20210       | lea                 edi, [ecx*4 + 0x1002a2c0]
            //   8bf0                 | mov                 esi, eax

        $sequence_6 = { 5d c3 8d5df4 8dbd40fbffff e8???????? 8b9538fbffff 8bcf }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8d5df4               | lea                 ebx, [ebp - 0xc]
            //   8dbd40fbffff         | lea                 edi, [ebp - 0x4c0]
            //   e8????????           |                     
            //   8b9538fbffff         | mov                 edx, dword ptr [ebp - 0x4c8]
            //   8bcf                 | mov                 ecx, edi

        $sequence_7 = { 50 8d8d54ffffff 51 e8???????? 50 8d471c c645fc0d }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d8d54ffffff         | lea                 ecx, [ebp - 0xac]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d471c               | lea                 eax, [edi + 0x1c]
            //   c645fc0d             | mov                 byte ptr [ebp - 4], 0xd

        $sequence_8 = { 5d c20800 56 8bf0 c707???????? 85f6 791c }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   56                   | push                esi
            //   8bf0                 | mov                 esi, eax
            //   c707????????         |                     
            //   85f6                 | test                esi, esi
            //   791c                 | jns                 0x1e

        $sequence_9 = { 0932 0fb6b0d1240210 807c35c400 7409 8b348514240210 0931 0fb6b0ba240210 }
            // n = 7, score = 100
            //   0932                 | or                  dword ptr [edx], esi
            //   0fb6b0d1240210       | movzx               esi, byte ptr [eax + 0x100224d1]
            //   807c35c400           | cmp                 byte ptr [ebp + esi - 0x3c], 0
            //   7409                 | je                  0xb
            //   8b348514240210       | mov                 esi, dword ptr [eax*4 + 0x10022414]
            //   0931                 | or                  dword ptr [ecx], esi
            //   0fb6b0ba240210       | movzx               esi, byte ptr [eax + 0x100224ba]

    condition:
        7 of them and filesize < 392192
}