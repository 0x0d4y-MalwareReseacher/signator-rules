rule win_adhubllka_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.adhubllka."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.adhubllka"
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
        $sequence_0 = { 33f8 8945e0 c1c707 8b4508 8b4da8 48 }
            // n = 6, score = 500
            //   33f8                 | xor                 edi, eax
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   c1c707               | rol                 edi, 7
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4da8               | mov                 ecx, dword ptr [ebp - 0x58]
            //   48                   | dec                 eax

        $sequence_1 = { e8???????? 0f108560ffffff 8d9598fcffff 8d8d60ffffff 0f118598fcffff 0f108570ffffff 0f1185a8fcffff }
            // n = 7, score = 500
            //   e8????????           |                     
            //   0f108560ffffff       | movups              xmm0, xmmword ptr [ebp - 0xa0]
            //   8d9598fcffff         | lea                 edx, [ebp - 0x368]
            //   8d8d60ffffff         | lea                 ecx, [ebp - 0xa0]
            //   0f118598fcffff       | movups              xmmword ptr [ebp - 0x368], xmm0
            //   0f108570ffffff       | movups              xmm0, xmmword ptr [ebp - 0x90]
            //   0f1185a8fcffff       | movups              xmmword ptr [ebp - 0x358], xmm0

        $sequence_2 = { 0f104c3e30 83c740 660fefc8 0f1149d0 3b7df4 72a5 8b5310 }
            // n = 7, score = 500
            //   0f104c3e30           | movups              xmm1, xmmword ptr [esi + edi + 0x30]
            //   83c740               | add                 edi, 0x40
            //   660fefc8             | pxor                xmm1, xmm0
            //   0f1149d0             | movups              xmmword ptr [ecx - 0x30], xmm1
            //   3b7df4               | cmp                 edi, dword ptr [ebp - 0xc]
            //   72a5                 | jb                  0xffffffa7
            //   8b5310               | mov                 edx, dword ptr [ebx + 0x10]

        $sequence_3 = { 335dac 895dac 8d3c33 8bdf 897db8 c1cb0e 335d94 }
            // n = 7, score = 500
            //   335dac               | xor                 ebx, dword ptr [ebp - 0x54]
            //   895dac               | mov                 dword ptr [ebp - 0x54], ebx
            //   8d3c33               | lea                 edi, [ebx + esi]
            //   8bdf                 | mov                 ebx, edi
            //   897db8               | mov                 dword ptr [ebp - 0x48], edi
            //   c1cb0e               | ror                 ebx, 0xe
            //   335d94               | xor                 ebx, dword ptr [ebp - 0x6c]

        $sequence_4 = { 25000f0000 c705????????01000000 3d000f0000 8b45d4 0f94c1 }
            // n = 5, score = 500
            //   25000f0000           | and                 eax, 0xf00
            //   c705????????01000000     |     
            //   3d000f0000           | cmp                 eax, 0xf00
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   0f94c1               | sete                cl

        $sequence_5 = { 8bc7 83e03f 6bc838 8b049568b34100 8b440818 83f8ff 7409 }
            // n = 7, score = 500
            //   8bc7                 | mov                 eax, edi
            //   83e03f               | and                 eax, 0x3f
            //   6bc838               | imul                ecx, eax, 0x38
            //   8b049568b34100       | mov                 eax, dword ptr [edx*4 + 0x41b368]
            //   8b440818             | mov                 eax, dword ptr [eax + ecx + 0x18]
            //   83f8ff               | cmp                 eax, -1
            //   7409                 | je                  0xb

        $sequence_6 = { 8945dc 8b458c 03c7 c1c207 8bc8 334d84 c1c110 }
            // n = 7, score = 500
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   8b458c               | mov                 eax, dword ptr [ebp - 0x74]
            //   03c7                 | add                 eax, edi
            //   c1c207               | rol                 edx, 7
            //   8bc8                 | mov                 ecx, eax
            //   334d84               | xor                 ecx, dword ptr [ebp - 0x7c]
            //   c1c110               | rol                 ecx, 0x10

        $sequence_7 = { 0bc8 8a5f1c 8b45f8 894830 897034 }
            // n = 5, score = 500
            //   0bc8                 | or                  ecx, eax
            //   8a5f1c               | mov                 bl, byte ptr [edi + 0x1c]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   894830               | mov                 dword ptr [eax + 0x30], ecx
            //   897034               | mov                 dword ptr [eax + 0x34], esi

        $sequence_8 = { c1fa1f 23d1 8bca c1e119 294df8 8b4df4 03ca }
            // n = 7, score = 500
            //   c1fa1f               | sar                 edx, 0x1f
            //   23d1                 | and                 edx, ecx
            //   8bca                 | mov                 ecx, edx
            //   c1e119               | shl                 ecx, 0x19
            //   294df8               | sub                 dword ptr [ebp - 8], ecx
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   03ca                 | add                 ecx, edx

        $sequence_9 = { c1e910 33ce 8bc1 884c2417 c1e818 88442414 8bc1 }
            // n = 7, score = 500
            //   c1e910               | shr                 ecx, 0x10
            //   33ce                 | xor                 ecx, esi
            //   8bc1                 | mov                 eax, ecx
            //   884c2417             | mov                 byte ptr [esp + 0x17], cl
            //   c1e818               | shr                 eax, 0x18
            //   88442414             | mov                 byte ptr [esp + 0x14], al
            //   8bc1                 | mov                 eax, ecx

    condition:
        7 of them and filesize < 253952
}