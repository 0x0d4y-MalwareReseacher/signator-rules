rule win_polyglotduke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.polyglotduke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.polyglotduke"
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
        $sequence_0 = { 498bc8 4c8d1579b40000 498bc0 48c1f805 83e11f 498b04c2 486bc958 }
            // n = 7, score = 100
            //   498bc8               | movdqu              xmmword ptr [ebp - 0x24], xmm0
            //   4c8d1579b40000       | dec                 esp
            //   498bc0               | mov                 ebp, edx
            //   48c1f805             | dec                 eax
            //   83e11f               | mov                 ebx, ecx
            //   498b04c2             | dec                 esp
            //   486bc958             | lea                 eax, dword ptr [esp + 0x44]

        $sequence_1 = { 4881ec40010000 488d0d0ee40000 e8???????? 488d0d12e40000 4889442420 e8???????? 488d0d09e40000 }
            // n = 7, score = 100
            //   4881ec40010000       | mov                 esi, edi
            //   488d0d0ee40000       | dec                 eax
            //   e8????????           |                     
            //   488d0d12e40000       | mov                 eax, esp
            //   4889442420           | dec                 eax
            //   e8????????           |                     
            //   488d0d09e40000       | mov                 dword ptr [eax + 8], ebx

        $sequence_2 = { e8???????? 84c0 752f 488bcb }
            // n = 4, score = 100
            //   e8????????           |                     
            //   84c0                 | mov                 ecx, ebp
            //   752f                 | dec                 eax
            //   488bcb               | mov                 ecx, ebx

        $sequence_3 = { 750c 488bce e8???????? 33c0 eb26 }
            // n = 5, score = 100
            //   750c                 | inc                 ecx
            //   488bce               | mov                 ecx, esi
            //   e8????????           |                     
            //   33c0                 | rep stosb           byte ptr es:[edi], al
            //   eb26                 | inc                 esi

        $sequence_4 = { 4889742418 57 4883ec20 33ed 488bd9 488bf9 8d7505 }
            // n = 7, score = 100
            //   4889742418           | lea                 ecx, dword ptr [0xd267]
            //   57                   | dec                 eax
            //   4883ec20             | mov                 ebp, ecx
            //   33ed                 | dec                 eax
            //   488bd9               | test                ecx, ecx
            //   488bf9               | jne                 0x1bd9
            //   8d7505               | xor                 eax, eax

        $sequence_5 = { 84c0 7514 b9770c2b00 ff15???????? c605????????01 ebd3 }
            // n = 6, score = 100
            //   84c0                 | mov                 dword ptr [ebp + 7], ebx
            //   7514                 | dec                 esp
            //   b9770c2b00           | lea                 eax, dword ptr [ebp + 7]
            //   ff15????????         |                     
            //   c605????????01       |                     
            //   ebd3                 | dec                 eax

        $sequence_6 = { 442bc0 488b442450 488d0df9b80000 488b0cc1 44897c2444 4c8b7c2460 498b0c0f }
            // n = 7, score = 100
            //   442bc0               | dec                 eax
            //   488b442450           | mov                 ecx, dword ptr [esi + 8]
            //   488d0df9b80000       | dec                 eax
            //   488b0cc1             | mov                 edx, ebx
            //   44897c2444           | dec                 eax
            //   4c8b7c2460           | mov                 ecx, ebx
            //   498b0c0f             | dec                 eax

        $sequence_7 = { e8???????? 488bcb 4c8bf0 e8???????? 41392e }
            // n = 5, score = 100
            //   e8????????           |                     
            //   488bcb               | mov                 dword ptr [esp + 0x10], esi
            //   4c8bf0               | dec                 eax
            //   e8????????           |                     
            //   41392e               | mov                 dword ptr [esp + 0x18], edi

        $sequence_8 = { 498bd5 f3aa 488bcb e8???????? 83f801 750b 488bcb }
            // n = 7, score = 100
            //   498bd5               | lea                 esp, dword ptr [0xb2de]
            //   f3aa                 | jmp                 0x18ee
            //   488bcb               | dec                 esp
            //   e8????????           |                     
            //   83f801               | lea                 ebp, dword ptr [0x9c5d]
            //   750b                 | dec                 ecx
            //   488bcb               | cmp                 dword ptr [ebp + edi*8], 0

        $sequence_9 = { e9???????? 488bca ff15???????? 83f847 75eb 488bcd ff15???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   488bca               | jmp                 0xd43
            //   ff15????????         |                     
            //   83f847               | cmp                 eax, -1
            //   75eb                 | jne                 0xd43
            //   488bcd               | dec                 esp
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 222784
}