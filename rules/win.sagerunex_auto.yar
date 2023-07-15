rule win_sagerunex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.sagerunex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sagerunex"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 488d542428 488d4c2428 4d8bc1 e8???????? 448b6c2428 85c0 8bd8 }
            // n = 7, score = 100
            //   488d542428           | mov                 ecx, dword ptr [ebx]
            //   488d4c2428           | push                edi
            //   4d8bc1               | dec                 eax
            //   e8????????           |                     
            //   448b6c2428           | sub                 esp, 0x20
            //   85c0                 | inc                 ecx
            //   8bd8                 | mov                 ebx, eax

        $sequence_1 = { 8d040a 418bd4 4403f8 418bc4 418bc9 c1c00d c1c20f }
            // n = 7, score = 100
            //   8d040a               | add                 eax, dword ptr [esp + 0x18]
            //   418bd4               | inc                 ecx
            //   4403f8               | or                  ecx, ecx
            //   418bc4               | inc                 esp
            //   418bc9               | add                 eax, eax
            //   c1c00d               | inc                 ecx
            //   c1c20f               | and                 ecx, ebx

        $sequence_2 = { 8b742428 c1e803 23ce 33e8 418d0410 448b8424a0000000 03e8 }
            // n = 7, score = 100
            //   8b742428             | mov                 eax, ebp
            //   c1e803               | test                eax, eax
            //   23ce                 | je                  0xbc
            //   33e8                 | dec                 eax
            //   418d0410             | cmp                 ecx, eax
            //   448b8424a0000000     | jae                 0x1f2
            //   03e8                 | mov                 eax, esi

        $sequence_3 = { 488bac2450060000 498bcf 85c0 740c e8???????? b886ffffff eb07 }
            // n = 7, score = 100
            //   488bac2450060000     | mov                 ecx, dword ptr [esp + edi*8]
            //   498bcf               | inc                 ebx
            //   85c0                 | dec                 ecx
            //   740c                 | mov                 edi, edi
            //   e8????????           |                     
            //   b886ffffff           | inc                 ecx
            //   eb07                 | mov                 byte ptr [ebp + ecx + 0x4c], al

        $sequence_4 = { 7427 4c8b5b10 4c8d542448 498b44cbf8 4d8b44caf8 493bc0 0f87c2000000 }
            // n = 7, score = 100
            //   7427                 | shr                 eax, 3
            //   4c8b5b10             | xor                 ecx, eax
            //   4c8d542448           | ror                 eax, 7
            //   498b44cbf8           | rol                 ecx, 0xe
            //   4d8b44caf8           | xor                 ecx, eax
            //   493bc0               | mov                 eax, dword ptr [esp + 4]
            //   0f87c2000000         | shr                 eax, 3

        $sequence_5 = { 33d0 c1c10e 418bc6 41c1ee03 c1c807 33c8 }
            // n = 6, score = 100
            //   33d0                 | dec                 eax
            //   c1c10e               | test                eax, eax
            //   418bc6               | dec                 eax
            //   41c1ee03             | dec                 eax
            //   c1c807               | jne                 0x122c
            //   33c8                 | dec                 ebp

        $sequence_6 = { 493bc4 7735 4d85e4 74d1 498d4424ff 492bd0 498d04c0 }
            // n = 7, score = 100
            //   493bc4               | inc                 ecx
            //   7735                 | add                 ecx, 0xca62c1d6
            //   4d85e4               | inc                 ecx
            //   74d1                 | mov                 ebx, eax
            //   498d4424ff           | inc                 esp
            //   492bd0               | xor                 edi, esi
            //   498d04c0             | add                 edx, 0x6d703ef3

        $sequence_7 = { 498bd5 4885c0 7411 0f1f440000 c60200 488d5201 48ffc8 }
            // n = 7, score = 100
            //   498bd5               | jne                 0x10ac
            //   4885c0               | test                eax, eax
            //   7411                 | jne                 0x125b
            //   0f1f440000           | or                  eax, 0xffffffff
            //   c60200               | jmp                 0x12b3
            //   488d5201             | mov                 ecx, eax
            //   48ffc8               | shr                 ecx, 0x18

        $sequence_8 = { 33c8 418bc0 4123c1 440bd0 8d040a 8b4c240c 4403d0 }
            // n = 7, score = 100
            //   33c8                 | dec                 eax
            //   418bc0               | sub                 edx, 8
            //   4123c1               | dec                 eax
            //   440bd0               | dec                 ecx
            //   8d040a               | jne                 0xd74
            //   8b4c240c             | dec                 eax
            //   4403d0               | test                eax, eax

        $sequence_9 = { 488bd9 488d0515080100 488981a0000000 83611000 c7411c01000000 c781c800000001000000 b843000000 }
            // n = 7, score = 100
            //   488bd9               | dec                 esp
            //   488d0515080100       | lea                 eax, [0x33584]
            //   488981a0000000       | dec                 eax
            //   83611000             | mov                 dword ptr [esp + 0x28], eax
            //   c7411c01000000       | dec                 eax
            //   c781c800000001000000     | mov    edx, ebx
            //   b843000000           | dec                 eax

    condition:
        7 of them and filesize < 619520
}