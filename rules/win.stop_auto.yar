rule win_stop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.stop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stop"
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
        $sequence_0 = { ff7508 68???????? 6a00 6a00 ff15???????? 33c9 894604 }
            // n = 7, score = 400
            //   ff7508               | push                dword ptr [ebp + 8]
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   33c9                 | xor                 ecx, ecx
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_1 = { 57 6a00 8bd9 6a00 6a12 ff33 }
            // n = 6, score = 400
            //   57                   | push                edi
            //   6a00                 | push                0
            //   8bd9                 | mov                 ebx, ecx
            //   6a00                 | push                0
            //   6a12                 | push                0x12
            //   ff33                 | push                dword ptr [ebx]

        $sequence_2 = { 89750c 8d4e08 894d08 894dec c645fc01 85c9 7408 }
            // n = 7, score = 400
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   8d4e08               | lea                 ecx, [esi + 8]
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   85c9                 | test                ecx, ecx
            //   7408                 | je                  0xa

        $sequence_3 = { 56 e8???????? 83c40c 8bce ff7508 e8???????? }
            // n = 6, score = 400
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bce                 | mov                 ecx, esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_4 = { 68???????? 6a00 6a00 ff15???????? 33c9 894604 85c0 }
            // n = 7, score = 400
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   33c9                 | xor                 ecx, ecx
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   85c0                 | test                eax, eax

        $sequence_5 = { 85c0 75e8 6a0a ff7304 ff15???????? 3d02010000 74c4 }
            // n = 7, score = 400
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102
            //   74c4                 | je                  0xffffffc6

        $sequence_6 = { 83c102 eb84 6a0c 68???????? e8???????? 8b7d08 }
            // n = 6, score = 400
            //   83c102               | add                 ecx, 2
            //   eb84                 | jmp                 0xffffff86
            //   6a0c                 | push                0xc
            //   68????????           |                     
            //   e8????????           |                     
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]

        $sequence_7 = { 8b35???????? 8b3d???????? 6a01 6a00 6a00 6a00 }
            // n = 6, score = 400
            //   8b35????????         |                     
            //   8b3d????????         |                     
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_8 = { 51 51 dd1c24 e8???????? dc4de0 }
            // n = 5, score = 400
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   dd1c24               | fstp                qword ptr [esp]
            //   e8????????           |                     
            //   dc4de0               | fmul                qword ptr [ebp - 0x20]

        $sequence_9 = { ff750c ff7508 ffd0 5d c3 8b0d???????? }
            // n = 6, score = 400
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     

    condition:
        7 of them and filesize < 6029312
}