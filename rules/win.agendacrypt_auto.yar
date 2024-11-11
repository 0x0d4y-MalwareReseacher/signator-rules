rule win_agendacrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.agendacrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.agendacrypt"
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
        $sequence_0 = { ff75f0 e8???????? 83c404 837dec00 740f a1???????? 56 }
            // n = 7, score = 100
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   837dec00             | cmp                 dword ptr [ebp - 0x14], 0
            //   740f                 | je                  0x11
            //   a1????????           |                     
            //   56                   | push                esi

        $sequence_1 = { c7430c01010000 c7430886f70d01 c74304092a8648 884b10 894330 c70302000000 89d8 }
            // n = 7, score = 100
            //   c7430c01010000       | mov                 dword ptr [ebx + 0xc], 0x101
            //   c7430886f70d01       | mov                 dword ptr [ebx + 8], 0x10df786
            //   c74304092a8648       | mov                 dword ptr [ebx + 4], 0x48862a09
            //   884b10               | mov                 byte ptr [ebx + 0x10], cl
            //   894330               | mov                 dword ptr [ebx + 0x30], eax
            //   c70302000000         | mov                 dword ptr [ebx], 2
            //   89d8                 | mov                 eax, ebx

        $sequence_2 = { 89ce 83f002 0b410c 752f 807e3002 7539 807e2002 }
            // n = 7, score = 100
            //   89ce                 | mov                 esi, ecx
            //   83f002               | xor                 eax, 2
            //   0b410c               | or                  eax, dword ptr [ecx + 0xc]
            //   752f                 | jne                 0x31
            //   807e3002             | cmp                 byte ptr [esi + 0x30], 2
            //   7539                 | jne                 0x3b
            //   807e2002             | cmp                 byte ptr [esi + 0x20], 2

        $sequence_3 = { 8bbc2494000000 83d700 83d200 030cf0 135cf004 8b4508 890cf0 }
            // n = 7, score = 100
            //   8bbc2494000000       | mov                 edi, dword ptr [esp + 0x94]
            //   83d700               | adc                 edi, 0
            //   83d200               | adc                 edx, 0
            //   030cf0               | add                 ecx, dword ptr [eax + esi*8]
            //   135cf004             | adc                 ebx, dword ptr [eax + esi*8 + 4]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   890cf0               | mov                 dword ptr [eax + esi*8], ecx

        $sequence_4 = { a9ffffff7f 7551 ff75f0 e8???????? 83c410 5e 5f }
            // n = 7, score = 100
            //   a9ffffff7f           | test                eax, 0x7fffffff
            //   7551                 | jne                 0x53
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi

        $sequence_5 = { 74e7 8b4e08 8b09 50 ffd1 83c404 8b4e08 }
            // n = 7, score = 100
            //   74e7                 | je                  0xffffffe9
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   50                   | push                eax
            //   ffd1                 | call                ecx
            //   83c404               | add                 esp, 4
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]

        $sequence_6 = { 8d4cde08 29da 894c2420 89542418 8d0cd500000000 51 50 }
            // n = 7, score = 100
            //   8d4cde08             | lea                 ecx, [esi + ebx*8 + 8]
            //   29da                 | sub                 edx, ebx
            //   894c2420             | mov                 dword ptr [esp + 0x20], ecx
            //   89542418             | mov                 dword ptr [esp + 0x18], edx
            //   8d0cd500000000       | lea                 ecx, [edx*8]
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_7 = { e9???????? c68424c803000004 b104 be04000000 31db 31ff 80f904 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c68424c803000004     | mov                 byte ptr [esp + 0x3c8], 4
            //   b104                 | mov                 cl, 4
            //   be04000000           | mov                 esi, 4
            //   31db                 | xor                 ebx, ebx
            //   31ff                 | xor                 edi, edi
            //   80f904               | cmp                 cl, 4

        $sequence_8 = { c745b410764100 8945b8 8d45ec c745bc00474100 8945c0 8d45a0 c745c440ba4100 }
            // n = 7, score = 100
            //   c745b410764100       | mov                 dword ptr [ebp - 0x4c], 0x417610
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   c745bc00474100       | mov                 dword ptr [ebp - 0x44], 0x414700
            //   8945c0               | mov                 dword ptr [ebp - 0x40], eax
            //   8d45a0               | lea                 eax, [ebp - 0x60]
            //   c745c440ba4100       | mov                 dword ptr [ebp - 0x3c], 0x41ba40

        $sequence_9 = { e9???????? 8b55e8 0f1f8000000000 837dcc00 741f 6a02 68???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   0f1f8000000000       | nop                 dword ptr [eax]
            //   837dcc00             | cmp                 dword ptr [ebp - 0x34], 0
            //   741f                 | je                  0x21
            //   6a02                 | push                2
            //   68????????           |                     

    condition:
        7 of them and filesize < 3340288
}