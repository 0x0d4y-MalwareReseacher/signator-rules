rule win_kagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.kagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kagent"
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
        $sequence_0 = { f7d9 0bc8 51 e8???????? a3???????? c605????????01 b93e000000 }
            // n = 7, score = 400
            //   f7d9                 | neg                 ecx
            //   0bc8                 | or                  ecx, eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   a3????????           |                     
            //   c605????????01       |                     
            //   b93e000000           | mov                 ecx, 0x3e

        $sequence_1 = { 668908 b801000000 ba02000000 f7e2 c645fc03 884b3c 0f90c1 }
            // n = 7, score = 400
            //   668908               | mov                 word ptr [eax], cx
            //   b801000000           | mov                 eax, 1
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   884b3c               | mov                 byte ptr [ebx + 0x3c], cl
            //   0f90c1               | seto                cl

        $sequence_2 = { 50 e8???????? 83c404 89b558fdffff 8b8570fdffff 3bc6 740f }
            // n = 7, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   89b558fdffff         | mov                 dword ptr [ebp - 0x2a8], esi
            //   8b8570fdffff         | mov                 eax, dword ptr [ebp - 0x290]
            //   3bc6                 | cmp                 eax, esi
            //   740f                 | je                  0x11

        $sequence_3 = { 50 8d8570ffffff 8d8d54ffffff e8???????? 57 e8???????? 83c404 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   8d8570ffffff         | lea                 eax, [ebp - 0x90]
            //   8d8d54ffffff         | lea                 ecx, [ebp - 0xac]
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_4 = { ba02000000 f7e2 c645fc06 888bc8000000 0f90c1 f7d9 0bc8 }
            // n = 7, score = 400
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6
            //   888bc8000000         | mov                 byte ptr [ebx + 0xc8], cl
            //   0f90c1               | seto                cl
            //   f7d9                 | neg                 ecx
            //   0bc8                 | or                  ecx, eax

        $sequence_5 = { 85f6 7405 e8???????? 57 e8???????? 8b75f0 83c404 }
            // n = 7, score = 400
            //   85f6                 | test                esi, esi
            //   7405                 | je                  7
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b75f0               | mov                 esi, dword ptr [ebp - 0x10]
            //   83c404               | add                 esp, 4

        $sequence_6 = { 5d c3 837dfc00 7455 8b550c 8b4482fc 668378022d }
            // n = 7, score = 400
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7455                 | je                  0x57
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8b4482fc             | mov                 eax, dword ptr [edx + eax*4 - 4]
            //   668378022d           | cmp                 word ptr [eax + 2], 0x2d

        $sequence_7 = { 56 57 e8???????? 57 e8???????? 3bc3 7403 }
            // n = 7, score = 400
            //   56                   | push                esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   7403                 | je                  5

        $sequence_8 = { c9 c20400 6800040000 ff74240c ff74240c ff15???????? c20800 }
            // n = 7, score = 400
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   6800040000           | push                0x400
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   ff15????????         |                     
            //   c20800               | ret                 8

        $sequence_9 = { 8bec 8b8e84000000 53 8b5d08 57 85c9 7446 }
            // n = 7, score = 400
            //   8bec                 | mov                 ebp, esp
            //   8b8e84000000         | mov                 ecx, dword ptr [esi + 0x84]
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   57                   | push                edi
            //   85c9                 | test                ecx, ecx
            //   7446                 | je                  0x48

    condition:
        7 of them and filesize < 4972544
}