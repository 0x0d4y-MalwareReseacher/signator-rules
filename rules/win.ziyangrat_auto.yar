rule win_ziyangrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.ziyangrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ziyangrat"
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
        $sequence_0 = { c644243174 c64424325c c644243357 c644243469 88542435 c644243664 884c2437 }
            // n = 7, score = 200
            //   c644243174           | mov                 byte ptr [esp + 0x31], 0x74
            //   c64424325c           | mov                 byte ptr [esp + 0x32], 0x5c
            //   c644243357           | mov                 byte ptr [esp + 0x33], 0x57
            //   c644243469           | mov                 byte ptr [esp + 0x34], 0x69
            //   88542435             | mov                 byte ptr [esp + 0x35], dl
            //   c644243664           | mov                 byte ptr [esp + 0x36], 0x64
            //   884c2437             | mov                 byte ptr [esp + 0x37], cl

        $sequence_1 = { 40 25ff0f0000 49 8944241c 894c2418 7409 }
            // n = 6, score = 200
            //   40                   | inc                 eax
            //   25ff0f0000           | and                 eax, 0xfff
            //   49                   | dec                 ecx
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   894c2418             | mov                 dword ptr [esp + 0x18], ecx
            //   7409                 | je                  0xb

        $sequence_2 = { 83f8ff 7516 56 e8???????? 85c0 7505 83c8ff }
            // n = 7, score = 200
            //   83f8ff               | cmp                 eax, -1
            //   7516                 | jne                 0x18
            //   56                   | push                esi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_3 = { 51 e8???????? 8b500c 8b02 8b08 51 e8???????? }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_4 = { 55 8bec b8e4090200 e8???????? 53 56 57 }
            // n = 7, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b8e4090200           | mov                 eax, 0x209e4
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_5 = { 89542455 8b08 a1???????? 8d542448 52 }
            // n = 5, score = 200
            //   89542455             | mov                 dword ptr [esp + 0x55], edx
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   a1????????           |                     
            //   8d542448             | lea                 edx, [esp + 0x48]
            //   52                   | push                edx

        $sequence_6 = { b905000000 8bfa 8bf0 33ed f3a6 7410 40 }
            // n = 7, score = 200
            //   b905000000           | mov                 ecx, 5
            //   8bfa                 | mov                 edi, edx
            //   8bf0                 | mov                 esi, eax
            //   33ed                 | xor                 ebp, ebp
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   7410                 | je                  0x12
            //   40                   | inc                 eax

        $sequence_7 = { c644242b3a c644242e20 c644242f48 885c2430 885c2431 c644243250 c64424332f }
            // n = 7, score = 200
            //   c644242b3a           | mov                 byte ptr [esp + 0x2b], 0x3a
            //   c644242e20           | mov                 byte ptr [esp + 0x2e], 0x20
            //   c644242f48           | mov                 byte ptr [esp + 0x2f], 0x48
            //   885c2430             | mov                 byte ptr [esp + 0x30], bl
            //   885c2431             | mov                 byte ptr [esp + 0x31], bl
            //   c644243250           | mov                 byte ptr [esp + 0x32], 0x50
            //   c64424332f           | mov                 byte ptr [esp + 0x33], 0x2f

        $sequence_8 = { 50 8bf1 ff15???????? 85c0 0f841b010000 81fe4c4f0000 0f87e6000000 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8bf1                 | mov                 esi, ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f841b010000         | je                  0x121
            //   81fe4c4f0000         | cmp                 esi, 0x4f4c
            //   0f87e6000000         | ja                  0xec

        $sequence_9 = { 80f910 52 50 7550 ffd5 8b54241e }
            // n = 6, score = 200
            //   80f910               | cmp                 cl, 0x10
            //   52                   | push                edx
            //   50                   | push                eax
            //   7550                 | jne                 0x52
            //   ffd5                 | call                ebp
            //   8b54241e             | mov                 edx, dword ptr [esp + 0x1e]

    condition:
        7 of them and filesize < 188416
}