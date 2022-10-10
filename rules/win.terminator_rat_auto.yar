rule win_terminator_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.terminator_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.terminator_rat"
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
        $sequence_0 = { 53 8d8700fcffff 56 50 }
            // n = 4, score = 500
            //   53                   | push                ebx
            //   8d8700fcffff         | lea                 eax, [edi - 0x400]
            //   56                   | push                esi
            //   50                   | push                eax

        $sequence_1 = { 83f8ff 7411 50 8d8700fcffff 50 33f6 e8???????? }
            // n = 7, score = 500
            //   83f8ff               | cmp                 eax, -1
            //   7411                 | je                  0x13
            //   50                   | push                eax
            //   8d8700fcffff         | lea                 eax, [edi - 0x400]
            //   50                   | push                eax
            //   33f6                 | xor                 esi, esi
            //   e8????????           |                     

        $sequence_2 = { ffd6 85c0 742f 8b400c }
            // n = 4, score = 500
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   742f                 | je                  0x31
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]

        $sequence_3 = { ff556d 8be8 5f 8b07 50 c1e810 03f8 }
            // n = 7, score = 500
            //   ff556d               | call                dword ptr [ebp + 0x6d]
            //   8be8                 | mov                 ebp, eax
            //   5f                   | pop                 edi
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   50                   | push                eax
            //   c1e810               | shr                 eax, 0x10
            //   03f8                 | add                 edi, eax

        $sequence_4 = { 8bfc 81ec00040000 56 be00040000 }
            // n = 4, score = 500
            //   8bfc                 | mov                 edi, esp
            //   81ec00040000         | sub                 esp, 0x400
            //   56                   | push                esi
            //   be00040000           | mov                 esi, 0x400

        $sequence_5 = { 57 8bfc 81ec04040000 53 56 33db }
            // n = 6, score = 500
            //   57                   | push                edi
            //   8bfc                 | mov                 edi, esp
            //   81ec04040000         | sub                 esp, 0x404
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx

        $sequence_6 = { 8b4b0c ac 3459 c0c803 3448 c0c803 }
            // n = 6, score = 500
            //   8b4b0c               | mov                 ecx, dword ptr [ebx + 0xc]
            //   ac                   | lodsb               al, byte ptr [esi]
            //   3459                 | xor                 al, 0x59
            //   c0c803               | ror                 al, 3
            //   3448                 | xor                 al, 0x48
            //   c0c803               | ror                 al, 3

        $sequence_7 = { 746d 8b400c 8b00 3918 7464 }
            // n = 5, score = 500
            //   746d                 | je                  0x6f
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   3918                 | cmp                 dword ptr [eax], ebx
            //   7464                 | je                  0x66

        $sequence_8 = { 56 ff5565 85c0 7403 894569 61 }
            // n = 6, score = 500
            //   56                   | push                esi
            //   ff5565               | call                dword ptr [ebp + 0x65]
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5
            //   894569               | mov                 dword ptr [ebp + 0x69], eax
            //   61                   | popal               

        $sequence_9 = { 33d2 8957fc 85c0 7412 8b08 6a01 49 }
            // n = 7, score = 500
            //   33d2                 | xor                 edx, edx
            //   8957fc               | mov                 dword ptr [edi - 4], edx
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   6a01                 | push                1
            //   49                   | dec                 ecx

    condition:
        7 of them and filesize < 73728
}