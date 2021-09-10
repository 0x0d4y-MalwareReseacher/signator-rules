rule win_mydogs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.mydogs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mydogs"
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
        $sequence_0 = { 8bd6 81e2fdff0000 83ca02 c1ee08 }
            // n = 4, score = 200
            //   8bd6                 | mov                 edx, esi
            //   81e2fdff0000         | and                 edx, 0xfffd
            //   83ca02               | or                  edx, 2
            //   c1ee08               | shr                 esi, 8

        $sequence_1 = { 68???????? 50 e8???????? 83c408 85c0 75b0 8b7c2418 }
            // n = 7, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   75b0                 | jne                 0xffffffb2
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]

        $sequence_2 = { 83c404 894778 5f 8bc6 5e 5b 8be5 }
            // n = 7, score = 200
            //   83c404               | add                 esp, 4
            //   894778               | mov                 dword ptr [edi + 0x78], eax
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_3 = { 56 8b35???????? ffd6 57 ffd6 8b85a4f9ffff }
            // n = 6, score = 200
            //   56                   | push                esi
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   8b85a4f9ffff         | mov                 eax, dword ptr [ebp - 0x65c]

        $sequence_4 = { 83c40c 8b13 0fb68758af0100 8b8f60af0100 88040a ff03 0fb68759af0100 }
            // n = 7, score = 200
            //   83c40c               | add                 esp, 0xc
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   0fb68758af0100       | movzx               eax, byte ptr [edi + 0x1af58]
            //   8b8f60af0100         | mov                 ecx, dword ptr [edi + 0x1af60]
            //   88040a               | mov                 byte ptr [edx + ecx], al
            //   ff03                 | inc                 dword ptr [ebx]
            //   0fb68759af0100       | movzx               eax, byte ptr [edi + 0x1af59]

        $sequence_5 = { 5e 8d4714 b91e010000 5b 33d2 668910 }
            // n = 6, score = 200
            //   5e                   | pop                 esi
            //   8d4714               | lea                 eax, dword ptr [edi + 0x14]
            //   b91e010000           | mov                 ecx, 0x11e
            //   5b                   | pop                 ebx
            //   33d2                 | xor                 edx, edx
            //   668910               | mov                 word ptr [eax], dx

        $sequence_6 = { e8???????? a3???????? 59 5d c3 e9???????? 3b0d???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   a3????????           |                     
            //   59                   | pop                 ecx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   e9????????           |                     
            //   3b0d????????         |                     

        $sequence_7 = { ff7318 8bcb e8???????? 84c0 756f b800000002 5f }
            // n = 7, score = 200
            //   ff7318               | push                dword ptr [ebx + 0x18]
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   756f                 | jne                 0x71
            //   b800000002           | mov                 eax, 0x2000000
            //   5f                   | pop                 edi

        $sequence_8 = { 6804010000 e8???????? 83c410 8985d8fbffff 50 6804010000 ff15???????? }
            // n = 7, score = 200
            //   6804010000           | push                0x104
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8985d8fbffff         | mov                 dword ptr [ebp - 0x428], eax
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   ff15????????         |                     

        $sequence_9 = { 740d 80bd66fbffff00 0f847a000000 668b856cfbffff 6689b56efbffff a801 750f }
            // n = 7, score = 200
            //   740d                 | je                  0xf
            //   80bd66fbffff00       | cmp                 byte ptr [ebp - 0x49a], 0
            //   0f847a000000         | je                  0x80
            //   668b856cfbffff       | mov                 ax, word ptr [ebp - 0x494]
            //   6689b56efbffff       | mov                 word ptr [ebp - 0x492], si
            //   a801                 | test                al, 1
            //   750f                 | jne                 0x11

    condition:
        7 of them and filesize < 313344
}