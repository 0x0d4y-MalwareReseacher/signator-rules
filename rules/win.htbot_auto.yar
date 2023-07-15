rule win_htbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.htbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.htbot"
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
        $sequence_0 = { 8b7c2434 33db 8d74243c e8???????? 3bfb 8b4c2430 8919 }
            // n = 7, score = 100
            //   8b7c2434             | mov                 edi, dword ptr [esp + 0x34]
            //   33db                 | xor                 ebx, ebx
            //   8d74243c             | lea                 esi, [esp + 0x3c]
            //   e8????????           |                     
            //   3bfb                 | cmp                 edi, ebx
            //   8b4c2430             | mov                 ecx, dword ptr [esp + 0x30]
            //   8919                 | mov                 dword ptr [ecx], ebx

        $sequence_1 = { ff15???????? 89442408 85c0 8b44240c 7527 8b4c2404 6a04 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   85c0                 | test                eax, eax
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   7527                 | jne                 0x29
            //   8b4c2404             | mov                 ecx, dword ptr [esp + 4]
            //   6a04                 | push                4

        $sequence_2 = { 8b41f4 8b0b 8b51f4 03c7 3bc6 0f8cdf000000 3bc2 }
            // n = 7, score = 100
            //   8b41f4               | mov                 eax, dword ptr [ecx - 0xc]
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   8b51f4               | mov                 edx, dword ptr [ecx - 0xc]
            //   03c7                 | add                 eax, edi
            //   3bc6                 | cmp                 eax, esi
            //   0f8cdf000000         | jl                  0xe5
            //   3bc2                 | cmp                 eax, edx

        $sequence_3 = { e9???????? 8a4603 3c01 7550 83fd0a 0f8c07010000 8b7e04 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8a4603               | mov                 al, byte ptr [esi + 3]
            //   3c01                 | cmp                 al, 1
            //   7550                 | jne                 0x52
            //   83fd0a               | cmp                 ebp, 0xa
            //   0f8c07010000         | jl                  0x10d
            //   8b7e04               | mov                 edi, dword ptr [esi + 4]

        $sequence_4 = { 8b01 8b5004 55 ffd2 8b442428 8b8c2448100000 }
            // n = 6, score = 100
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   55                   | push                ebp
            //   ffd2                 | call                edx
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   8b8c2448100000       | mov                 ecx, dword ptr [esp + 0x1048]

        $sequence_5 = { 8b8c2438040000 33cc e8???????? 81c448040000 c3 6857000780 }
            // n = 6, score = 100
            //   8b8c2438040000       | mov                 ecx, dword ptr [esp + 0x438]
            //   33cc                 | xor                 ecx, esp
            //   e8????????           |                     
            //   81c448040000         | add                 esp, 0x448
            //   c3                   | ret                 
            //   6857000780           | push                0x80070057

        $sequence_6 = { c644242c04 e8???????? 8d542418 56 52 8bc8 c644243405 }
            // n = 7, score = 100
            //   c644242c04           | mov                 byte ptr [esp + 0x2c], 4
            //   e8????????           |                     
            //   8d542418             | lea                 edx, [esp + 0x18]
            //   56                   | push                esi
            //   52                   | push                edx
            //   8bc8                 | mov                 ecx, eax
            //   c644243405           | mov                 byte ptr [esp + 0x34], 5

        $sequence_7 = { 895d00 e8???????? 6a00 6a00 }
            // n = 4, score = 100
            //   895d00               | mov                 dword ptr [ebp], ebx
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_8 = { 83c410 c64424640b 8b08 8b37 8d41f0 83ee10 }
            // n = 6, score = 100
            //   83c410               | add                 esp, 0x10
            //   c64424640b           | mov                 byte ptr [esp + 0x64], 0xb
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b37                 | mov                 esi, dword ptr [edi]
            //   8d41f0               | lea                 eax, [ecx - 0x10]
            //   83ee10               | sub                 esi, 0x10

        $sequence_9 = { 50 e8???????? 83c408 85c0 0f8439010000 2b03 83f8ff }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f8439010000         | je                  0x13f
            //   2b03                 | sub                 eax, dword ptr [ebx]
            //   83f8ff               | cmp                 eax, -1

    condition:
        7 of them and filesize < 196608
}