rule win_grey_energy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.grey_energy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grey_energy"
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
        $sequence_0 = { 8945d4 e8???????? 68???????? 8945d0 }
            // n = 4, score = 500
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   e8????????           |                     
            //   68????????           |                     
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax

        $sequence_1 = { 50 53 53 6800000008 57 53 }
            // n = 6, score = 500
            //   50                   | push                eax
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   6800000008           | push                0x8000000
            //   57                   | push                edi
            //   53                   | push                ebx

        $sequence_2 = { 68???????? 8945cc e8???????? 68???????? 8945d4 e8???????? }
            // n = 6, score = 500
            //   68????????           |                     
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   e8????????           |                     
            //   68????????           |                     
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   e8????????           |                     

        $sequence_3 = { 66890c42 eb14 8b45ec 8b4df8 8b55f0 8b7508 }
            // n = 6, score = 400
            //   66890c42             | mov                 word ptr [edx + eax*2], cx
            //   eb14                 | jmp                 0x16
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_4 = { 8b45f8 0345ec 8808 eb10 }
            // n = 4, score = 400
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0345ec               | add                 eax, dword ptr [ebp - 0x14]
            //   8808                 | mov                 byte ptr [eax], cl
            //   eb10                 | jmp                 0x12

        $sequence_5 = { 6a40 ff15???????? 8945f8 837df800 7507 33c0 e9???????? }
            // n = 7, score = 400
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_6 = { 48 75f9 53 ff15???????? 8b75f8 }
            // n = 5, score = 400
            //   48                   | dec                 eax
            //   75f9                 | jne                 0xfffffffb
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]

        $sequence_7 = { 8b55f0 8b7508 668b1456 66891441 }
            // n = 4, score = 400
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   668b1456             | mov                 dx, word ptr [esi + edx*2]
            //   66891441             | mov                 word ptr [ecx + eax*2], dx

        $sequence_8 = { 8b4d08 0fb70c41 8b45f0 33d2 }
            // n = 4, score = 400
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   0fb70c41             | movzx               ecx, word ptr [ecx + eax*2]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   33d2                 | xor                 edx, edx

        $sequence_9 = { 81e1ff000000 8b45ec 8b55f8 66890c42 }
            // n = 4, score = 400
            //   81e1ff000000         | and                 ecx, 0xff
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   66890c42             | mov                 word ptr [edx + eax*2], cx

        $sequence_10 = { 8b4508 0345f0 0fbe08 8b45f0 }
            // n = 4, score = 400
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0345f0               | add                 eax, dword ptr [ebp - 0x10]
            //   0fbe08               | movsx               ecx, byte ptr [eax]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_11 = { 41 48 75f9 ff75f8 }
            // n = 4, score = 300
            //   41                   | inc                 ecx
            //   48                   | dec                 eax
            //   75f9                 | jne                 0xfffffffb
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_12 = { 41 48 75fa 56 ff15???????? ff75f8 }
            // n = 6, score = 300
            //   41                   | inc                 ecx
            //   48                   | dec                 eax
            //   75fa                 | jne                 0xfffffffc
            //   56                   | push                esi
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_13 = { 50 ff15???????? 85c0 0f88b6000000 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f88b6000000         | js                  0xbc

        $sequence_14 = { ff75fc ff15???????? 395df4 741b ff75f4 ffd6 03c0 }
            // n = 7, score = 200
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   395df4               | cmp                 dword ptr [ebp - 0xc], ebx
            //   741b                 | je                  0x1d
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ffd6                 | call                esi
            //   03c0                 | add                 eax, eax

        $sequence_15 = { 8b4d08 034d14 03c1 0345f8 50 e8???????? 68???????? }
            // n = 7, score = 200
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   034d14               | add                 ecx, dword ptr [ebp + 0x14]
            //   03c1                 | add                 eax, ecx
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_16 = { 68???????? e8???????? 8945b4 68???????? }
            // n = 4, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax
            //   68????????           |                     

    condition:
        7 of them and filesize < 303104
}