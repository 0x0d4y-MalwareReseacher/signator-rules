rule win_locky_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.locky."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.locky"
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
        $sequence_0 = { 51 51 8b00 6a00 8d4d0c 51 ff750c }
            // n = 7, score = 2100
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   6a00                 | push                0
            //   8d4d0c               | lea                 ecx, [ebp + 0xc]
            //   51                   | push                ecx
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_1 = { 760a 68???????? e8???????? a1???????? 2b05???????? 6a1c }
            // n = 6, score = 2100
            //   760a                 | jbe                 0xc
            //   68????????           |                     
            //   e8????????           |                     
            //   a1????????           |                     
            //   2b05????????         |                     
            //   6a1c                 | push                0x1c

        $sequence_2 = { 50 c745f8???????? e8???????? 8d85f0fdffff 50 }
            // n = 5, score = 2100
            //   50                   | push                eax
            //   c745f8????????       |                     
            //   e8????????           |                     
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   50                   | push                eax

        $sequence_3 = { 99 83e207 8d3c02 33d2 42 c1ff03 663bca }
            // n = 7, score = 2100
            //   99                   | cdq                 
            //   83e207               | and                 edx, 7
            //   8d3c02               | lea                 edi, [edx + eax]
            //   33d2                 | xor                 edx, edx
            //   42                   | inc                 edx
            //   c1ff03               | sar                 edi, 3
            //   663bca               | cmp                 cx, dx

        $sequence_4 = { 99 5e f7fe 8bf0 81fe48922409 760a 68???????? }
            // n = 7, score = 2100
            //   99                   | cdq                 
            //   5e                   | pop                 esi
            //   f7fe                 | idiv                esi
            //   8bf0                 | mov                 esi, eax
            //   81fe48922409         | cmp                 esi, 0x9249248
            //   760a                 | jbe                 0xc
            //   68????????           |                     

        $sequence_5 = { 6a00 ff15???????? 85c0 751e ff15???????? c745f8???????? }
            // n = 6, score = 2100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   751e                 | jne                 0x20
            //   ff15????????         |                     
            //   c745f8????????       |                     

        $sequence_6 = { 8907 8bc7 c9 c20400 ff15???????? 8945fc }
            // n = 6, score = 2100
            //   8907                 | mov                 dword ptr [edi], eax
            //   8bc7                 | mov                 eax, edi
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_7 = { 7314 8b4e1c 8b431c 3bc8 7c0a }
            // n = 5, score = 2100
            //   7314                 | jae                 0x16
            //   8b4e1c               | mov                 ecx, dword ptr [esi + 0x1c]
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]
            //   3bc8                 | cmp                 ecx, eax
            //   7c0a                 | jl                  0xc

        $sequence_8 = { 5b c21000 e9???????? 8bff 55 8bec 56 }
            // n = 7, score = 1400
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   e9????????           |                     
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   56                   | push                esi

        $sequence_9 = { 03d8 8b442408 f7e1 03d3 5b c21000 e9???????? }
            // n = 7, score = 1400
            //   03d8                 | add                 ebx, eax
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   f7e1                 | mul                 ecx
            //   03d3                 | add                 edx, ebx
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   e9????????           |                     

        $sequence_10 = { 66ab e9???????? 8d12 e9???????? }
            // n = 4, score = 700
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   e9????????           |                     
            //   8d12                 | lea                 edx, [edx]
            //   e9????????           |                     

        $sequence_11 = { ebcf 90 8d36 90 }
            // n = 4, score = 700
            //   ebcf                 | jmp                 0xffffffd1
            //   90                   | nop                 
            //   8d36                 | lea                 esi, [esi]
            //   90                   | nop                 

        $sequence_12 = { 5e c21000 8bff 55 8bec 33c0 8b4d08 }
            // n = 7, score = 700
            //   5e                   | pop                 esi
            //   c21000               | ret                 0x10
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_13 = { 6a61 e9???????? 90 58 }
            // n = 4, score = 700
            //   6a61                 | push                0x61
            //   e9????????           |                     
            //   90                   | nop                 
            //   58                   | pop                 eax

        $sequence_14 = { 6a63 e9???????? 90 8d36 }
            // n = 4, score = 700
            //   6a63                 | push                0x63
            //   e9????????           |                     
            //   90                   | nop                 
            //   8d36                 | lea                 esi, [esi]

        $sequence_15 = { 66ab e9???????? 58 90 e9???????? 90 }
            // n = 6, score = 700
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   e9????????           |                     
            //   58                   | pop                 eax
            //   90                   | nop                 
            //   e9????????           |                     
            //   90                   | nop                 

        $sequence_16 = { 66ab 90 e9???????? 8d00 }
            // n = 4, score = 700
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   90                   | nop                 
            //   e9????????           |                     
            //   8d00                 | lea                 eax, [eax]

    condition:
        7 of them and filesize < 1122304
}