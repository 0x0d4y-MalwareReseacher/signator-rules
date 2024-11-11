rule win_project_wood_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.project_wood."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.project_wood"
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
        $sequence_0 = { 68???????? eb0e 83bd18ffffff01 7513 68???????? 8d86ad000000 }
            // n = 6, score = 100
            //   68????????           |                     
            //   eb0e                 | jmp                 0x10
            //   83bd18ffffff01       | cmp                 dword ptr [ebp - 0xe8], 1
            //   7513                 | jne                 0x15
            //   68????????           |                     
            //   8d86ad000000         | lea                 eax, [esi + 0xad]

        $sequence_1 = { 8bf8 8d45cc 57 897de4 ff75e0 56 53 }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   57                   | push                edi
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   56                   | push                esi
            //   53                   | push                ebx

        $sequence_2 = { 50 ff15???????? a810 0f8526010000 8d45d8 50 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a810                 | test                al, 0x10
            //   0f8526010000         | jne                 0x12c
            //   8d45d8               | lea                 eax, [ebp - 0x28]
            //   50                   | push                eax

        $sequence_3 = { a1???????? 33c9 40 8acf 3bc6 88887f5fe810 a3???????? }
            // n = 7, score = 100
            //   a1????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   40                   | inc                 eax
            //   8acf                 | mov                 cl, bh
            //   3bc6                 | cmp                 eax, esi
            //   88887f5fe810         | mov                 byte ptr [eax + 0x10e85f7f], cl
            //   a3????????           |                     

        $sequence_4 = { 50 ff7508 e8???????? 83c41c 33c0 8dbdedfeffff 889decfeffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   33c0                 | xor                 eax, eax
            //   8dbdedfeffff         | lea                 edi, [ebp - 0x113]
            //   889decfeffff         | mov                 byte ptr [ebp - 0x114], bl

        $sequence_5 = { 50 e8???????? 68???????? e8???????? 40 68???????? 018614090000 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   40                   | inc                 eax
            //   68????????           |                     
            //   018614090000         | add                 dword ptr [esi + 0x914], eax

        $sequence_6 = { e8???????? 8b4de0 b8a3010000 83c40c 3bc8 0f87c8000000 0f84ae000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   b8a3010000           | mov                 eax, 0x1a3
            //   83c40c               | add                 esp, 0xc
            //   3bc8                 | cmp                 ecx, eax
            //   0f87c8000000         | ja                  0xce
            //   0f84ae000000         | je                  0xb4

        $sequence_7 = { 8d85c8fcffff 68???????? 50 ff15???????? 83c410 8d45ec }
            // n = 6, score = 100
            //   8d85c8fcffff         | lea                 eax, [ebp - 0x338]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c410               | add                 esp, 0x10
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_8 = { 50 e8???????? 68???????? e8???????? 01861c090000 8b861c090000 8d8de8fcffff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   01861c090000         | add                 dword ptr [esi + 0x91c], eax
            //   8b861c090000         | mov                 eax, dword ptr [esi + 0x91c]
            //   8d8de8fcffff         | lea                 ecx, [ebp - 0x318]

        $sequence_9 = { 56 e8???????? 83c448 8d45e4 6a14 53 50 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c448               | add                 esp, 0x48
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   6a14                 | push                0x14
            //   53                   | push                ebx
            //   50                   | push                eax

    condition:
        7 of them and filesize < 31137792
}