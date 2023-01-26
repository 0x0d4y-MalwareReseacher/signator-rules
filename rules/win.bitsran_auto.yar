rule win_bitsran_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.bitsran."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bitsran"
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
        $sequence_0 = { 5d c3 56 e8???????? 83c8ff 5e 8b4dfc }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c8ff               | or                  eax, 0xffffffff
            //   5e                   | pop                 esi
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_1 = { 50 6a00 8d8d7cfcffff 51 52 e8???????? 8d85e4fcffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6a00                 | push                0
            //   8d8d7cfcffff         | lea                 ecx, [ebp - 0x384]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   e8????????           |                     
            //   8d85e4fcffff         | lea                 eax, [ebp - 0x31c]

        $sequence_2 = { 7516 8b4734 394508 7509 85c0 740a 83f808 }
            // n = 7, score = 100
            //   7516                 | jne                 0x18
            //   8b4734               | mov                 eax, dword ptr [edi + 0x34]
            //   394508               | cmp                 dword ptr [ebp + 8], eax
            //   7509                 | jne                 0xb
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   83f808               | cmp                 eax, 8

        $sequence_3 = { 85f6 75ac c785b4f9ffff00000005 eb34 c785b4f9ffff00100000 }
            // n = 5, score = 100
            //   85f6                 | test                esi, esi
            //   75ac                 | jne                 0xffffffae
            //   c785b4f9ffff00000005     | mov    dword ptr [ebp - 0x64c], 0x5000000
            //   eb34                 | jmp                 0x36
            //   c785b4f9ffff00100000     | mov    dword ptr [ebp - 0x64c], 0x1000

        $sequence_4 = { c7856cfcffff44000000 c78598fcffff01000000 ffd7 85c0 753c }
            // n = 5, score = 100
            //   c7856cfcffff44000000     | mov    dword ptr [ebp - 0x394], 0x44
            //   c78598fcffff01000000     | mov    dword ptr [ebp - 0x368], 1
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   753c                 | jne                 0x3e

        $sequence_5 = { c1ea05 05bc070000 83e20f 8945f4 4a }
            // n = 5, score = 100
            //   c1ea05               | shr                 edx, 5
            //   05bc070000           | add                 eax, 0x7bc
            //   83e20f               | and                 edx, 0xf
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   4a                   | dec                 edx

        $sequence_6 = { 7413 83ceff eb1c 89411c ebe3 }
            // n = 5, score = 100
            //   7413                 | je                  0x15
            //   83ceff               | or                  esi, 0xffffffff
            //   eb1c                 | jmp                 0x1e
            //   89411c               | mov                 dword ptr [ecx + 0x1c], eax
            //   ebe3                 | jmp                 0xffffffe5

        $sequence_7 = { 5f b89affffff 5b 8be5 5d c3 395f18 }
            // n = 7, score = 100
            //   5f                   | pop                 edi
            //   b89affffff           | mov                 eax, 0xffffff9a
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   395f18               | cmp                 dword ptr [edi + 0x18], ebx

        $sequence_8 = { 8b8de8fcffff 89481c 8b95e4fcffff 52 e8???????? 8b95e4fcffff 8bf8 }
            // n = 7, score = 100
            //   8b8de8fcffff         | mov                 ecx, dword ptr [ebp - 0x318]
            //   89481c               | mov                 dword ptr [eax + 0x1c], ecx
            //   8b95e4fcffff         | mov                 edx, dword ptr [ebp - 0x31c]
            //   52                   | push                edx
            //   e8????????           |                     
            //   8b95e4fcffff         | mov                 edx, dword ptr [ebp - 0x31c]
            //   8bf8                 | mov                 edi, eax

        $sequence_9 = { 8b35???????? bf0a000000 6a00 6a00 6a00 68???????? }
            // n = 6, score = 100
            //   8b35????????         |                     
            //   bf0a000000           | mov                 edi, 0xa
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

    condition:
        7 of them and filesize < 344064
}