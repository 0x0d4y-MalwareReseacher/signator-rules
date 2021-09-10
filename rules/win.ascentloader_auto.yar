rule win_ascentloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ascentloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ascentloader"
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
        $sequence_0 = { 8945f4 c745ac6b652047 c745b065636b6f c645b400 c78564ffffff76650d0a }
            // n = 5, score = 100
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   c745ac6b652047       | mov                 dword ptr [ebp - 0x54], 0x4720656b
            //   c745b065636b6f       | mov                 dword ptr [ebp - 0x50], 0x6f6b6365
            //   c645b400             | mov                 byte ptr [ebp - 0x4c], 0
            //   c78564ffffff76650d0a     | mov    dword ptr [ebp - 0x9c], 0xa0d6576

        $sequence_1 = { c6856affffff00 f30f7f856cffffff 660f6f05???????? f30f7f857cffffff 660f6f05???????? f30f7f458c 660f6f05???????? }
            // n = 7, score = 100
            //   c6856affffff00       | mov                 byte ptr [ebp - 0x96], 0
            //   f30f7f856cffffff     | movdqu              xmmword ptr [ebp - 0x94], xmm0
            //   660f6f05????????     |                     
            //   f30f7f857cffffff     | movdqu              xmmword ptr [ebp - 0x84], xmm0
            //   660f6f05????????     |                     
            //   f30f7f458c           | movdqu              xmmword ptr [ebp - 0x74], xmm0
            //   660f6f05????????     |                     

        $sequence_2 = { 8b4dfc 83c604 8b55f8 8b06 85c0 75d6 }
            // n = 6, score = 100
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c604               | add                 esi, 4
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   75d6                 | jne                 0xffffffd8

        $sequence_3 = { c745e42e646c6c c645e800 ff15???????? 85c0 750e 8d45dc }
            // n = 6, score = 100
            //   c745e42e646c6c       | mov                 dword ptr [ebp - 0x1c], 0x6c6c642e
            //   c645e800             | mov                 byte ptr [ebp - 0x18], 0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750e                 | jne                 0x10
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]

        $sequence_4 = { 33f6 85ff 7507 33c0 e9???????? 8b473c 8b443878 }
            // n = 7, score = 100
            //   33f6                 | xor                 esi, esi
            //   85ff                 | test                edi, edi
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b473c               | mov                 eax, dword ptr [edi + 0x3c]
            //   8b443878             | mov                 eax, dword ptr [eax + edi + 0x78]

        $sequence_5 = { eb0a b900240000 b8???????? 85c9 7409 8034060a 46 }
            // n = 7, score = 100
            //   eb0a                 | jmp                 0xc
            //   b900240000           | mov                 ecx, 0x2400
            //   b8????????           |                     
            //   85c9                 | test                ecx, ecx
            //   7409                 | je                  0xb
            //   8034060a             | xor                 byte ptr [esi + eax], 0xa
            //   46                   | inc                 esi

        $sequence_6 = { 8d45dc 51 50 ff75d8 8bce e8???????? 83c40c }
            // n = 7, score = 100
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_7 = { 33db 8bf9 53 53 50 ff15???????? 85c0 }
            // n = 7, score = 100
            //   33db                 | xor                 ebx, ebx
            //   8bf9                 | mov                 edi, ecx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_8 = { 8d8d1cfbffff c645cc00 f30f7f45bc e8???????? 8bd0 85d2 7434 }
            // n = 7, score = 100
            //   8d8d1cfbffff         | lea                 ecx, dword ptr [ebp - 0x4e4]
            //   c645cc00             | mov                 byte ptr [ebp - 0x34], 0
            //   f30f7f45bc           | movdqu              xmmword ptr [ebp - 0x44], xmm0
            //   e8????????           |                     
            //   8bd0                 | mov                 edx, eax
            //   85d2                 | test                edx, edx
            //   7434                 | je                  0x36

        $sequence_9 = { 8b4514 40 c745ec53c14000 894df8 8945fc 64a100000000 8945e8 }
            // n = 7, score = 100
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   40                   | inc                 eax
            //   c745ec53c14000       | mov                 dword ptr [ebp - 0x14], 0x40c153
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax

    condition:
        7 of them and filesize < 253952
}