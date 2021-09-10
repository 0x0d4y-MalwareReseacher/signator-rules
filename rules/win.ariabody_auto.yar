rule win_ariabody_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ariabody."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ariabody"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 50 ff75fc e8???????? 83c40c 85db }
            // n = 5, score = 300
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85db                 | test                ebx, ebx

        $sequence_1 = { 8d0c30 ffd1 8bc6 5f }
            // n = 4, score = 300
            //   8d0c30               | lea                 ecx, dword ptr [eax + esi]
            //   ffd1                 | call                ecx
            //   8bc6                 | mov                 eax, esi
            //   5f                   | pop                 edi

        $sequence_2 = { ff75d9 8d45cc 50 57 }
            // n = 4, score = 300
            //   ff75d9               | push                dword ptr [ebp - 0x27]
            //   8d45cc               | lea                 eax, dword ptr [ebp - 0x34]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_3 = { eb13 8b16 8bcf e8???????? }
            // n = 4, score = 300
            //   eb13                 | jmp                 0x15
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_4 = { 57 8bd9 e8???????? 8bf8 893b }
            // n = 5, score = 300
            //   57                   | push                edi
            //   8bd9                 | mov                 ebx, ecx
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   893b                 | mov                 dword ptr [ebx], edi

        $sequence_5 = { 0138 115804 eb02 0138 }
            // n = 4, score = 300
            //   0138                 | add                 dword ptr [eax], edi
            //   115804               | adc                 dword ptr [eax + 4], ebx
            //   eb02                 | jmp                 4
            //   0138                 | add                 dword ptr [eax], edi

        $sequence_6 = { 7406 3ac3 7402 32c3 88040a }
            // n = 5, score = 300
            //   7406                 | je                  8
            //   3ac3                 | cmp                 al, bl
            //   7402                 | je                  4
            //   32c3                 | xor                 al, bl
            //   88040a               | mov                 byte ptr [edx + ecx], al

        $sequence_7 = { ff5304 8bf8 893e eb13 }
            // n = 4, score = 300
            //   ff5304               | call                dword ptr [ebx + 4]
            //   8bf8                 | mov                 edi, eax
            //   893e                 | mov                 dword ptr [esi], edi
            //   eb13                 | jmp                 0x15

        $sequence_8 = { 8a441918 42888401307e0100 ffc2 ebe1 897c2420 }
            // n = 5, score = 100
            //   8a441918             | test                eax, eax
            //   42888401307e0100     | jne                 0xe1
            //   ffc2                 | dec                 eax
            //   ebe1                 | lea                 edx, dword ptr [0x7ce8]
            //   897c2420             | inc                 ecx

        $sequence_9 = { 41ff97a0010000 4889e0 4889f1 450fb64d00 4889f2 450fb66d01 4533cd }
            // n = 7, score = 100
            //   41ff97a0010000       | dec                 esp
            //   4889e0               | lea                 eax, dword ptr [0x7d33]
            //   4889f1               | mov                 edx, edi
            //   450fb64d00           | inc                 ecx
            //   4889f2               | call                dword ptr [edi + 0x1a0]
            //   450fb66d01           | dec                 eax
            //   4533cd               | mov                 eax, esp

        $sequence_10 = { 418944de10 e8???????? ffc7 418944de08 89f8 }
            // n = 5, score = 100
            //   418944de10           | mov                 edx, esi
            //   e8????????           |                     
            //   ffc7                 | inc                 ebp
            //   418944de08           | movzx               ebp, byte ptr [ebp + 1]
            //   89f8                 | inc                 ebp

        $sequence_11 = { 498bd6 ff15???????? 418d7fe7 85c0 7519 4c8d05337d0000 8bd7 }
            // n = 7, score = 100
            //   498bd6               | dec                 ecx
            //   ff15????????         |                     
            //   418d7fe7             | mov                 edx, esi
            //   85c0                 | inc                 ecx
            //   7519                 | lea                 edi, dword ptr [edi - 0x19]
            //   4c8d05337d0000       | test                eax, eax
            //   8bd7                 | jne                 0x1d

        $sequence_12 = { e8???????? 85c0 0f85d9000000 488d15e87c0000 41b810200100 488bcd }
            // n = 6, score = 100
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   0f85d9000000         | mov                 ecx, esi
            //   488d15e87c0000       | inc                 ebp
            //   41b810200100         | movzx               ecx, byte ptr [ebp]
            //   488bcd               | dec                 eax

        $sequence_13 = { 488d0de38bffff 4a8b8ce9808a0100 f644310880 7469 488b0c31 488d55e8 ff15???????? }
            // n = 7, score = 100
            //   488d0de38bffff       | inc                 edi
            //   4a8b8ce9808a0100     | inc                 ecx
            //   f644310880           | mov                 dword ptr [esi + ebx*8 + 8], eax
            //   7469                 | mov                 eax, edi
            //   488b0c31             | dec                 eax
            //   488d55e8             | lea                 edx, dword ptr [0x787d]
            //   ff15????????         |                     

        $sequence_14 = { 488905???????? ff15???????? 488d157d780000 483305???????? }
            // n = 4, score = 100
            //   488905????????       |                     
            //   ff15????????         |                     
            //   488d157d780000       | xor                 ecx, ebp
            //   483305????????       |                     

        $sequence_15 = { e8???????? 48894500 4885c0 0f84b0010000 4883c508 48837d0000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   48894500             | mov                 eax, 0x12010
            //   4885c0               | dec                 eax
            //   0f84b0010000         | mov                 ecx, ebp
            //   4883c508             | inc                 ecx
            //   48837d0000           | mov                 dword ptr [esi + ebx*8 + 0x10], eax

    condition:
        7 of them and filesize < 253952
}