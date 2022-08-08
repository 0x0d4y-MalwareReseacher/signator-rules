rule win_stop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.stop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stop"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 57 6a00 8bd9 6a00 6a12 ff33 }
            // n = 6, score = 400
            //   57                   | push                edi
            //   6a00                 | push                0
            //   8bd9                 | mov                 ebx, ecx
            //   6a00                 | push                0
            //   6a12                 | push                0x12
            //   ff33                 | push                dword ptr [ebx]

        $sequence_1 = { 89750c 8d4e08 894d08 894dec c645fc01 85c9 7408 }
            // n = 7, score = 400
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   8d4e08               | lea                 ecx, [esi + 8]
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   85c9                 | test                ecx, ecx
            //   7408                 | je                  0xa

        $sequence_2 = { 83c404 8b4b04 b8abaaaa2a 2b0b f7e9 8bcf }
            // n = 6, score = 400
            //   83c404               | add                 esp, 4
            //   8b4b04               | mov                 ecx, dword ptr [ebx + 4]
            //   b8abaaaa2a           | mov                 eax, 0x2aaaaaab
            //   2b0b                 | sub                 ecx, dword ptr [ebx]
            //   f7e9                 | imul                ecx
            //   8bcf                 | mov                 ecx, edi

        $sequence_3 = { 8bf1 56 6a00 ff7508 68???????? }
            // n = 5, score = 400
            //   8bf1                 | mov                 esi, ecx
            //   56                   | push                esi
            //   6a00                 | push                0
            //   ff7508               | push                dword ptr [ebp + 8]
            //   68????????           |                     

        $sequence_4 = { ff7304 ff15???????? 3d02010000 74c4 }
            // n = 4, score = 400
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102
            //   74c4                 | je                  0xffffffc6

        $sequence_5 = { 8b45f0 8d55e4 52 68???????? 50 }
            // n = 5, score = 400
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8d55e4               | lea                 edx, [ebp - 0x1c]
            //   52                   | push                edx
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_6 = { 85c0 75e8 6a0a ff7304 ff15???????? }
            // n = 5, score = 400
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     

        $sequence_7 = { 50 6a00 6a00 6a48 }
            // n = 4, score = 400
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a48                 | push                0x48

        $sequence_8 = { 51 51 dd1c24 e8???????? dc4de0 }
            // n = 5, score = 400
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   dd1c24               | fstp                qword ptr [esp]
            //   e8????????           |                     
            //   dc4de0               | fmul                qword ptr [ebp - 0x20]

        $sequence_9 = { 85c0 75e8 6a0a ff7304 ff15???????? 3d02010000 }
            // n = 6, score = 400
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102

    condition:
        7 of them and filesize < 6029312
}