rule win_redleaves_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.redleaves."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redleaves"
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
        $sequence_0 = { 47 657449 7041 64647254 }
            // n = 4, score = 400
            //   47                   | inc                 edi
            //   657449               | je                  0x4c
            //   7041                 | jo                  0x43
            //   64647254             | jb                  0x58

        $sequence_1 = { 8d64241c d2c0 8a01 9c }
            // n = 4, score = 400
            //   8d64241c             | lea                 esp, [esp + 0x1c]
            //   d2c0                 | rol                 al, cl
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   9c                   | pushfd              

        $sequence_2 = { 0f85edffffff 89d0 29f8 5f 5b }
            // n = 5, score = 400
            //   0f85edffffff         | jne                 0xfffffff3
            //   89d0                 | mov                 eax, edx
            //   29f8                 | sub                 eax, edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_3 = { 59 89f9 8d64241c d2c0 }
            // n = 4, score = 400
            //   59                   | pop                 ecx
            //   89f9                 | mov                 ecx, edi
            //   8d64241c             | lea                 esp, [esp + 0x1c]
            //   d2c0                 | rol                 al, cl

        $sequence_4 = { 57 54 53 51 7565 }
            // n = 5, score = 400
            //   57                   | push                edi
            //   54                   | push                esp
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   7565                 | jne                 0x67

        $sequence_5 = { 9c 894504 9c 9c }
            // n = 4, score = 400
            //   9c                   | pushfd              
            //   894504               | mov                 dword ptr [ebp + 4], eax
            //   9c                   | pushfd              
            //   9c                   | pushfd              

        $sequence_6 = { 7565 7279 55 7365 7254 }
            // n = 5, score = 400
            //   7565                 | jne                 0x67
            //   7279                 | jb                  0x7b
            //   55                   | push                ebp
            //   7365                 | jae                 0x67
            //   7254                 | jb                  0x56

        $sequence_7 = { 9c 8f442428 880424 e8???????? }
            // n = 4, score = 300
            //   9c                   | pushfd              
            //   8f442428             | pop                 dword ptr [esp + 0x28]
            //   880424               | mov                 byte ptr [esp], al
            //   e8????????           |                     

        $sequence_8 = { 33c0 68fe000000 668985acfdffff 8d85aefdffff 53 50 e8???????? }
            // n = 7, score = 300
            //   33c0                 | xor                 eax, eax
            //   68fe000000           | push                0xfe
            //   668985acfdffff       | mov                 word ptr [ebp - 0x254], ax
            //   8d85aefdffff         | lea                 eax, [ebp - 0x252]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { 50 e8???????? 83c40c 6a01 6a1a }
            // n = 5, score = 300
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6a01                 | push                1
            //   6a1a                 | push                0x1a

        $sequence_10 = { 56 8b7510 57 8b7d18 8d4db4 }
            // n = 5, score = 300
            //   56                   | push                esi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   57                   | push                edi
            //   8b7d18               | mov                 edi, dword ptr [ebp + 0x18]
            //   8d4db4               | lea                 ecx, [ebp - 0x4c]

        $sequence_11 = { 8906 85c0 7427 68???????? }
            // n = 4, score = 300
            //   8906                 | mov                 dword ptr [esi], eax
            //   85c0                 | test                eax, eax
            //   7427                 | je                  0x29
            //   68????????           |                     

        $sequence_12 = { 8986ec010000 8996f0010000 c786fc01000001000000 83a6f801000000 }
            // n = 4, score = 300
            //   8986ec010000         | mov                 dword ptr [esi + 0x1ec], eax
            //   8996f0010000         | mov                 dword ptr [esi + 0x1f0], edx
            //   c786fc01000001000000     | mov    dword ptr [esi + 0x1fc], 1
            //   83a6f801000000       | and                 dword ptr [esi + 0x1f8], 0

        $sequence_13 = { 8987d4010000 eb03 33f6 46 }
            // n = 4, score = 300
            //   8987d4010000         | mov                 dword ptr [edi + 0x1d4], eax
            //   eb03                 | jmp                 5
            //   33f6                 | xor                 esi, esi
            //   46                   | inc                 esi

        $sequence_14 = { 56 8b750c 8bda 2bf1 85db 740f }
            // n = 6, score = 300
            //   56                   | push                esi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8bda                 | mov                 ebx, edx
            //   2bf1                 | sub                 esi, ecx
            //   85db                 | test                ebx, ebx
            //   740f                 | je                  0x11

        $sequence_15 = { 54 9c 60 9c }
            // n = 4, score = 300
            //   54                   | push                esp
            //   9c                   | pushfd              
            //   60                   | pushal              
            //   9c                   | pushfd              

        $sequence_16 = { 8986e0010000 834dfcff 8b96dc010000 85d2 }
            // n = 4, score = 300
            //   8986e0010000         | mov                 dword ptr [esi + 0x1e0], eax
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   8b96dc010000         | mov                 edx, dword ptr [esi + 0x1dc]
            //   85d2                 | test                edx, edx

    condition:
        7 of them and filesize < 1679360
}