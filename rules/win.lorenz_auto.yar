rule win_lorenz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.lorenz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lorenz"
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
        $sequence_0 = { e8???????? ff55f8 eb0a 6a7f ff15???????? 33c0 8be5 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   ff55f8               | call                dword ptr [ebp - 8]
            //   eb0a                 | jmp                 0xc
            //   6a7f                 | push                0x7f
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   8be5                 | mov                 esp, ebp

        $sequence_1 = { 8b4df0 e8???????? 8b55e0 8955f0 ebcf 837df000 742d }
            // n = 7, score = 300
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   8b55e0               | mov                 edx, dword ptr [ebp - 0x20]
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx
            //   ebcf                 | jmp                 0xffffffd1
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0
            //   742d                 | je                  0x2f

        $sequence_2 = { 8b4df8 83c104 e8???????? 8b4df8 e8???????? 8b88c0000000 894de0 }
            // n = 7, score = 300
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   83c104               | add                 ecx, 4
            //   e8????????           |                     
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   e8????????           |                     
            //   8b88c0000000         | mov                 ecx, dword ptr [eax + 0xc0]
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx

        $sequence_3 = { c745fcffffffff 8d4de0 e8???????? 8b4dec e8???????? 0fb655f2 85d2 }
            // n = 7, score = 300
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   e8????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   0fb655f2             | movzx               edx, byte ptr [ebp - 0xe]
            //   85d2                 | test                edx, edx

        $sequence_4 = { 8d4de8 e8???????? eb1c 8b4d08 51 8b4df8 81c100020000 }
            // n = 7, score = 300
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   e8????????           |                     
            //   eb1c                 | jmp                 0x1e
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   81c100020000         | add                 ecx, 0x200

        $sequence_5 = { 8b55f8 83c201 8955f8 8b45f8 3b45ec 7348 8b4df8 }
            // n = 7, score = 300
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   83c201               | add                 edx, 1
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   3b45ec               | cmp                 eax, dword ptr [ebp - 0x14]
            //   7348                 | jae                 0x4a
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_6 = { b901000000 8b55e8 83c204 33c0 f00fb10a 85c0 0f85e5000000 }
            // n = 7, score = 300
            //   b901000000           | mov                 ecx, 1
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   83c204               | add                 edx, 4
            //   33c0                 | xor                 eax, eax
            //   f00fb10a             | lock cmpxchg        dword ptr [edx], ecx
            //   85c0                 | test                eax, eax
            //   0f85e5000000         | jne                 0xeb

        $sequence_7 = { e8???????? 83c40c 8b55fc 8b8280000000 50 8b4dfc 8b5158 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b8280000000         | mov                 eax, dword ptr [edx + 0x80]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5158               | mov                 edx, dword ptr [ecx + 0x58]

        $sequence_8 = { e8???????? 8945f0 68???????? 8d4ddc e8???????? 8b45f8 8b08 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   68????????           |                     
            //   8d4ddc               | lea                 ecx, [ebp - 0x24]
            //   e8????????           |                     
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_9 = { 8b4de8 e8???????? 0fb6c8 85c9 0f85dd000000 8b5514 83e20a }
            // n = 7, score = 300
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   0fb6c8               | movzx               ecx, al
            //   85c9                 | test                ecx, ecx
            //   0f85dd000000         | jne                 0xe3
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   83e20a               | and                 edx, 0xa

    condition:
        7 of them and filesize < 2254848
}