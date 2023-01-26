rule win_afrodita_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.afrodita."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.afrodita"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 83c408 8d4f10 e8???????? f6450801 740b 6a60 57 }
            // n = 7, score = 300
            //   83c408               | add                 esp, 8
            //   8d4f10               | lea                 ecx, [edi + 0x10]
            //   e8????????           |                     
            //   f6450801             | test                byte ptr [ebp + 8], 1
            //   740b                 | je                  0xd
            //   6a60                 | push                0x60
            //   57                   | push                edi

        $sequence_1 = { 8d45d8 50 8d4f78 e8???????? 8d4dd8 e8???????? }
            // n = 6, score = 300
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   50                   | push                eax
            //   8d4f78               | lea                 ecx, [edi + 0x78]
            //   e8????????           |                     
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   e8????????           |                     

        $sequence_2 = { ff5008 8b4e30 bf01000000 8945e4 49 8b45f0 }
            // n = 6, score = 300
            //   ff5008               | call                dword ptr [eax + 8]
            //   8b4e30               | mov                 ecx, dword ptr [esi + 0x30]
            //   bf01000000           | mov                 edi, 1
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   49                   | dec                 ecx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_3 = { 8945b8 898568ffffff 85c0 7409 50 e8???????? }
            // n = 6, score = 300
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   898568ffffff         | mov                 dword ptr [ebp - 0x98], eax
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_4 = { c745b400000000 885db8 66c745b90001 c645bb00 e8???????? 83f811 7707 }
            // n = 7, score = 300
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   885db8               | mov                 byte ptr [ebp - 0x48], bl
            //   66c745b90001         | mov                 word ptr [ebp - 0x47], 0x100
            //   c645bb00             | mov                 byte ptr [ebp - 0x45], 0
            //   e8????????           |                     
            //   83f811               | cmp                 eax, 0x11
            //   7707                 | ja                  9

        $sequence_5 = { e8???????? 83c404 8b559c 3955c4 8b75cc 8bfe 0f4255c4 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b559c               | mov                 edx, dword ptr [ebp - 0x64]
            //   3955c4               | cmp                 dword ptr [ebp - 0x3c], edx
            //   8b75cc               | mov                 esi, dword ptr [ebp - 0x34]
            //   8bfe                 | mov                 edi, esi
            //   0f4255c4             | cmovb               edx, dword ptr [ebp - 0x3c]

        $sequence_6 = { e8???????? ff7508 894304 8d3cb500000000 ff75fc 894308 03c7 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   8d3cb500000000       | lea                 edi, [esi*4]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   894308               | mov                 dword ptr [ebx + 8], eax
            //   03c7                 | add                 eax, edi

        $sequence_7 = { 0f841a010000 80bd75ffffff03 0f850d010000 8d4599 50 8d4590 }
            // n = 6, score = 300
            //   0f841a010000         | je                  0x120
            //   80bd75ffffff03       | cmp                 byte ptr [ebp - 0x8b], 3
            //   0f850d010000         | jne                 0x113
            //   8d4599               | lea                 eax, [ebp - 0x67]
            //   50                   | push                eax
            //   8d4590               | lea                 eax, [ebp - 0x70]

        $sequence_8 = { 2345e4 03ca 3345f4 03c1 8945e4 85db 7437 }
            // n = 7, score = 300
            //   2345e4               | and                 eax, dword ptr [ebp - 0x1c]
            //   03ca                 | add                 ecx, edx
            //   3345f4               | xor                 eax, dword ptr [ebp - 0xc]
            //   03c1                 | add                 eax, ecx
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   85db                 | test                ebx, ebx
            //   7437                 | je                  0x39

        $sequence_9 = { 3bde 0f8559010000 8b4f60 56 ffb57cffffff 8b7584 8b01 }
            // n = 7, score = 300
            //   3bde                 | cmp                 ebx, esi
            //   0f8559010000         | jne                 0x15f
            //   8b4f60               | mov                 ecx, dword ptr [edi + 0x60]
            //   56                   | push                esi
            //   ffb57cffffff         | push                dword ptr [ebp - 0x84]
            //   8b7584               | mov                 esi, dword ptr [ebp - 0x7c]
            //   8b01                 | mov                 eax, dword ptr [ecx]

    condition:
        7 of them and filesize < 2334720
}