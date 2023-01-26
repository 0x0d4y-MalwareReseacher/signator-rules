rule win_azorult_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.azorult."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.azorult"
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
        $sequence_0 = { 68???????? 8d858cfdffff 8d562c b904010000 e8???????? ffb58cfdffff 8d8590fdffff }
            // n = 7, score = 1200
            //   68????????           |                     
            //   8d858cfdffff         | lea                 eax, [ebp - 0x274]
            //   8d562c               | lea                 edx, [esi + 0x2c]
            //   b904010000           | mov                 ecx, 0x104
            //   e8????????           |                     
            //   ffb58cfdffff         | push                dword ptr [ebp - 0x274]
            //   8d8590fdffff         | lea                 eax, [ebp - 0x270]

        $sequence_1 = { 59 59 648910 e9???????? 8d45f4 50 }
            // n = 6, score = 1200
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   648910               | mov                 dword ptr fs:[eax], edx
            //   e9????????           |                     
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   50                   | push                eax

        $sequence_2 = { 56 8b45fc e8???????? 8bc8 8d5301 }
            // n = 5, score = 1200
            //   56                   | push                esi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   8d5301               | lea                 edx, [ebx + 1]

        $sequence_3 = { 03d0 8bf2 8b45fc e8???????? 3bf8 }
            // n = 5, score = 1200
            //   03d0                 | add                 edx, eax
            //   8bf2                 | mov                 esi, edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   3bf8                 | cmp                 edi, eax

        $sequence_4 = { 8b45f8 33d2 e8???????? 7464 }
            // n = 4, score = 1200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   33d2                 | xor                 edx, edx
            //   e8????????           |                     
            //   7464                 | je                  0x66

        $sequence_5 = { 8945f8 8d55f4 8bc3 e8???????? }
            // n = 4, score = 1200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8d55f4               | lea                 edx, [ebp - 0xc]
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     

        $sequence_6 = { 55 68???????? 64ff30 648920 53 b9???????? ba???????? }
            // n = 7, score = 1200
            //   55                   | push                ebp
            //   68????????           |                     
            //   64ff30               | push                dword ptr fs:[eax]
            //   648920               | mov                 dword ptr fs:[eax], esp
            //   53                   | push                ebx
            //   b9????????           |                     
            //   ba????????           |                     

        $sequence_7 = { 56 894df4 8955f8 8945fc 8b7508 8d45fc }
            // n = 6, score = 1200
            //   56                   | push                esi
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_8 = { 7506 ff05???????? 56 e8???????? }
            // n = 4, score = 900
            //   7506                 | jne                 8
            //   ff05????????         |                     
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_9 = { 53 e8???????? 59 56 e8???????? 59 8bc7 }
            // n = 7, score = 900
            //   53                   | push                ebx
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bc7                 | mov                 eax, edi

        $sequence_10 = { e8???????? 59 8b45f4 40 }
            // n = 4, score = 600
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   40                   | inc                 eax

        $sequence_11 = { 50 e8???????? 59 8bd8 33c0 }
            // n = 5, score = 600
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bd8                 | mov                 ebx, eax
            //   33c0                 | xor                 eax, eax

        $sequence_12 = { 85db 7404 8bc3 eb07 }
            // n = 4, score = 500
            //   85db                 | test                ebx, ebx
            //   7404                 | je                  6
            //   8bc3                 | mov                 eax, ebx
            //   eb07                 | jmp                 9

        $sequence_13 = { 014110 5f 5e 5b }
            // n = 4, score = 200
            //   014110               | add                 dword ptr [ecx + 0x10], eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_14 = { 011f 59 8bc3 c1e003 01866caf0100 }
            // n = 5, score = 200
            //   011f                 | add                 dword ptr [edi], ebx
            //   59                   | pop                 ecx
            //   8bc3                 | mov                 eax, ebx
            //   c1e003               | shl                 eax, 3
            //   01866caf0100         | add                 dword ptr [esi + 0x1af6c], eax

        $sequence_15 = { 014f18 8b4714 85c0 0f854e010000 }
            // n = 4, score = 200
            //   014f18               | add                 dword ptr [edi + 0x18], ecx
            //   8b4714               | mov                 eax, dword ptr [edi + 0x14]
            //   85c0                 | test                eax, eax
            //   0f854e010000         | jne                 0x154

    condition:
        7 of them and filesize < 1753088
}