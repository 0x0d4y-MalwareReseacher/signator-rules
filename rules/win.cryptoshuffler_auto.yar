rule win_cryptoshuffler_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.cryptoshuffler."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cryptoshuffler"
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
        $sequence_0 = { 8b4dd8 33db 660fd645e0 8b410c 8b4df4 }
            // n = 5, score = 100
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   33db                 | xor                 ebx, ebx
            //   660fd645e0           | movq                qword ptr [ebp - 0x20], xmm0
            //   8b410c               | mov                 eax, dword ptr [ecx + 0xc]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_1 = { e9???????? c745dc02000000 c745e0e44d0210 8b4508 8bcf 8b7510 dd00 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   c745dc02000000       | mov                 dword ptr [ebp - 0x24], 2
            //   c745e0e44d0210       | mov                 dword ptr [ebp - 0x20], 0x10024de4
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bcf                 | mov                 ecx, edi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   dd00                 | fld                 qword ptr [eax]

        $sequence_2 = { 660fd645bc 8b55bc e8???????? 8b75e0 83c40c 897508 e9???????? }
            // n = 7, score = 100
            //   660fd645bc           | movq                qword ptr [ebp - 0x44], xmm0
            //   8b55bc               | mov                 edx, dword ptr [ebp - 0x44]
            //   e8????????           |                     
            //   8b75e0               | mov                 esi, dword ptr [ebp - 0x20]
            //   83c40c               | add                 esp, 0xc
            //   897508               | mov                 dword ptr [ebp + 8], esi
            //   e9????????           |                     

        $sequence_3 = { 0f87ca010000 3bc8 730c ff33 8bce 50 }
            // n = 6, score = 100
            //   0f87ca010000         | ja                  0x1d0
            //   3bc8                 | cmp                 ecx, eax
            //   730c                 | jae                 0xe
            //   ff33                 | push                dword ptr [ebx]
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax

        $sequence_4 = { 33d2 897dd8 83cbff 8945d4 8b0f 8bf1 894df4 }
            // n = 7, score = 100
            //   33d2                 | xor                 edx, edx
            //   897dd8               | mov                 dword ptr [ebp - 0x28], edi
            //   83cbff               | or                  ebx, 0xffffffff
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   8bf1                 | mov                 esi, ecx
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx

        $sequence_5 = { 8b1d???????? 56 8b35???????? 57 8b3d???????? 6a00 8d45ec }
            // n = 7, score = 100
            //   8b1d????????         |                     
            //   56                   | push                esi
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   6a00                 | push                0
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_6 = { 7338 8b07 3bc6 7732 2bf0 b8abaaaa2a }
            // n = 6, score = 100
            //   7338                 | jae                 0x3a
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   3bc6                 | cmp                 eax, esi
            //   7732                 | ja                  0x34
            //   2bf0                 | sub                 esi, eax
            //   b8abaaaa2a           | mov                 eax, 0x2aaaaaab

        $sequence_7 = { 895d90 8b4de4 8d45b4 6a04 03cb 6a00 50 }
            // n = 7, score = 100
            //   895d90               | mov                 dword ptr [ebp - 0x70], ebx
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   8d45b4               | lea                 eax, [ebp - 0x4c]
            //   6a04                 | push                4
            //   03cb                 | add                 ecx, ebx
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_8 = { 53 51 52 e8???????? 8b06 8b4e08 3bc1 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   52                   | push                edx
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   3bc1                 | cmp                 eax, ecx

        $sequence_9 = { ff15???????? 8b35???????? 50 8d842414030000 50 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   50                   | push                eax
            //   8d842414030000       | lea                 eax, [esp + 0x314]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 425984
}