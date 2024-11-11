rule win_bouncer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.bouncer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bouncer"
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
        $sequence_0 = { ff15???????? 3bc3 0f84dd060000 8b4de4 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   3bc3                 | cmp                 eax, ebx
            //   0f84dd060000         | je                  0x6e3
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]

        $sequence_1 = { ff30 ff15???????? 39750c 50 }
            // n = 4, score = 200
            //   ff30                 | push                dword ptr [eax]
            //   ff15????????         |                     
            //   39750c               | cmp                 dword ptr [ebp + 0xc], esi
            //   50                   | push                eax

        $sequence_2 = { 50 8d8584fdffff 50 ff760c ff15???????? 85c0 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   8d8584fdffff         | lea                 eax, [ebp - 0x27c]
            //   50                   | push                eax
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_3 = { bfc8000000 8d8534ffffff 57 50 ff36 }
            // n = 5, score = 200
            //   bfc8000000           | mov                 edi, 0xc8
            //   8d8534ffffff         | lea                 eax, [ebp - 0xcc]
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff36                 | push                dword ptr [esi]

        $sequence_4 = { e9???????? 80f912 7533 6a08 6a08 ff15???????? 50 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   80f912               | cmp                 cl, 0x12
            //   7533                 | jne                 0x35
            //   6a08                 | push                8
            //   6a08                 | push                8
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_5 = { 57 8b30 56 e8???????? 8b3d???????? 59 bbc8000000 }
            // n = 7, score = 200
            //   57                   | push                edi
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b3d????????         |                     
            //   59                   | pop                 ecx
            //   bbc8000000           | mov                 ebx, 0xc8

        $sequence_6 = { 03c7 50 ff7508 e8???????? 83f8ff 0f8406010000 }
            // n = 6, score = 200
            //   03c7                 | add                 eax, edi
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   0f8406010000         | je                  0x10c

        $sequence_7 = { a1???????? 8b3d???????? 3bc6 7404 50 ffd7 59 }
            // n = 7, score = 200
            //   a1????????           |                     
            //   8b3d????????         |                     
            //   3bc6                 | cmp                 eax, esi
            //   7404                 | je                  6
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   59                   | pop                 ecx

        $sequence_8 = { 8945ec 8d45f0 c745ac44000000 50 8d45ac 50 56 }
            // n = 7, score = 200
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   c745ac44000000       | mov                 dword ptr [ebp - 0x54], 0x44
            //   50                   | push                eax
            //   8d45ac               | lea                 eax, [ebp - 0x54]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_9 = { 8b8485a064ffff 3b45cc 0f8cbe090000 40 8945cc e9???????? 80f902 }
            // n = 7, score = 200
            //   8b8485a064ffff       | mov                 eax, dword ptr [ebp + eax*4 - 0x9b60]
            //   3b45cc               | cmp                 eax, dword ptr [ebp - 0x34]
            //   0f8cbe090000         | jl                  0x9c4
            //   40                   | inc                 eax
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   e9????????           |                     
            //   80f902               | cmp                 cl, 2

    condition:
        7 of them and filesize < 335872
}