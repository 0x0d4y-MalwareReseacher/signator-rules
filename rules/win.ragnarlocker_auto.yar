rule win_ragnarlocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.ragnarlocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ragnarlocker"
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
        $sequence_0 = { 33d2 8b4dd4 8bf1 0fa4c119 c1ee07 c1e019 0bd1 }
            // n = 7, score = 300
            //   33d2                 | xor                 edx, edx
            //   8b4dd4               | mov                 ecx, dword ptr [ebp - 0x2c]
            //   8bf1                 | mov                 esi, ecx
            //   0fa4c119             | shld                ecx, eax, 0x19
            //   c1ee07               | shr                 esi, 7
            //   c1e019               | shl                 eax, 0x19
            //   0bd1                 | or                  edx, ecx

        $sequence_1 = { 33ff 33f6 66660f1f840000000000 8bc6 8a9c3500ffffff 33d2 0fb6cb }
            // n = 7, score = 300
            //   33ff                 | xor                 edi, edi
            //   33f6                 | xor                 esi, esi
            //   66660f1f840000000000     | nop    word ptr [eax + eax]
            //   8bc6                 | mov                 eax, esi
            //   8a9c3500ffffff       | mov                 bl, byte ptr [ebp + esi - 0x100]
            //   33d2                 | xor                 edx, edx
            //   0fb6cb               | movzx               ecx, bl

        $sequence_2 = { 317dc0 33f6 8b55f4 8bfa 8b4de8 }
            // n = 5, score = 300
            //   317dc0               | xor                 dword ptr [ebp - 0x40], edi
            //   33f6                 | xor                 esi, esi
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8bfa                 | mov                 edi, edx
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]

        $sequence_3 = { 57 ff15???????? 85c0 0f852cffffff 57 ff15???????? 6a28 }
            // n = 7, score = 300
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f852cffffff         | jne                 0xffffff32
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6a28                 | push                0x28

        $sequence_4 = { c1e108 0bc8 894b28 0fb64f13 0fb64712 c1e108 0bc8 }
            // n = 7, score = 300
            //   c1e108               | shl                 ecx, 8
            //   0bc8                 | or                  ecx, eax
            //   894b28               | mov                 dword ptr [ebx + 0x28], ecx
            //   0fb64f13             | movzx               ecx, byte ptr [edi + 0x13]
            //   0fb64712             | movzx               eax, byte ptr [edi + 0x12]
            //   c1e108               | shl                 ecx, 8
            //   0bc8                 | or                  ecx, eax

        $sequence_5 = { 234dac 33f1 8b45e4 8b4df0 03de 13fa 035d88 }
            // n = 7, score = 300
            //   234dac               | and                 ecx, dword ptr [ebp - 0x54]
            //   33f1                 | xor                 esi, ecx
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   03de                 | add                 ebx, esi
            //   13fa                 | adc                 edi, edx
            //   035d88               | add                 ebx, dword ptr [ebp - 0x78]

        $sequence_6 = { 72f2 8b5df8 8b7df4 57 c6043900 ff15???????? 50 }
            // n = 7, score = 300
            //   72f2                 | jb                  0xfffffff4
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   57                   | push                edi
            //   c6043900             | mov                 byte ptr [ecx + edi], 0
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_7 = { 7cd8 ff75f8 ff15???????? 5f 5e b001 5b }
            // n = 7, score = 300
            //   7cd8                 | jl                  0xffffffda
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   b001                 | mov                 al, 1
            //   5b                   | pop                 ebx

        $sequence_8 = { 33f1 03d7 8b7df4 13fe 0355fc 8955e8 }
            // n = 6, score = 300
            //   33f1                 | xor                 esi, ecx
            //   03d7                 | add                 edx, edi
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   13fe                 | adc                 edi, esi
            //   0355fc               | add                 edx, dword ptr [ebp - 4]
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx

        $sequence_9 = { 0fa4ca1e c1ef02 8975e8 33f6 0bf2 c1e11e 3175f4 }
            // n = 7, score = 300
            //   0fa4ca1e             | shld                edx, ecx, 0x1e
            //   c1ef02               | shr                 edi, 2
            //   8975e8               | mov                 dword ptr [ebp - 0x18], esi
            //   33f6                 | xor                 esi, esi
            //   0bf2                 | or                  esi, edx
            //   c1e11e               | shl                 ecx, 0x1e
            //   3175f4               | xor                 dword ptr [ebp - 0xc], esi

    condition:
        7 of them and filesize < 147456
}