rule win_metadatabin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.metadatabin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.metadatabin"
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
        $sequence_0 = { 8b8424c0000000 89d1 f7e6 89c7 89d8 8b9c2420010000 89d6 }
            // n = 7, score = 100
            //   8b8424c0000000       | mov                 eax, dword ptr [esp + 0xc0]
            //   89d1                 | mov                 ecx, edx
            //   f7e6                 | mul                 esi
            //   89c7                 | mov                 edi, eax
            //   89d8                 | mov                 eax, ebx
            //   8b9c2420010000       | mov                 ebx, dword ptr [esp + 0x120]
            //   89d6                 | mov                 esi, edx

        $sequence_1 = { 89f8 f7e1 89842400010000 8b8424d4030000 89d6 c78424e703000000000000 c78424eb03000000000000 }
            // n = 7, score = 100
            //   89f8                 | mov                 eax, edi
            //   f7e1                 | mul                 ecx
            //   89842400010000       | mov                 dword ptr [esp + 0x100], eax
            //   8b8424d4030000       | mov                 eax, dword ptr [esp + 0x3d4]
            //   89d6                 | mov                 esi, edx
            //   c78424e703000000000000     | mov    dword ptr [esp + 0x3e7], 0
            //   c78424eb03000000000000     | mov    dword ptr [esp + 0x3eb], 0

        $sequence_2 = { 89f1 ba01000000 e8???????? 0f0b 89f9 89fa 29c1 }
            // n = 7, score = 100
            //   89f1                 | mov                 ecx, esi
            //   ba01000000           | mov                 edx, 1
            //   e8????????           |                     
            //   0f0b                 | ud2                 
            //   89f9                 | mov                 ecx, edi
            //   89fa                 | mov                 edx, edi
            //   29c1                 | sub                 ecx, eax

        $sequence_3 = { 89d8 899424b4010000 f7e6 89842408020000 8b842480010000 89d1 f7e6 }
            // n = 7, score = 100
            //   89d8                 | mov                 eax, ebx
            //   899424b4010000       | mov                 dword ptr [esp + 0x1b4], edx
            //   f7e6                 | mul                 esi
            //   89842408020000       | mov                 dword ptr [esp + 0x208], eax
            //   8b842480010000       | mov                 eax, dword ptr [esp + 0x180]
            //   89d1                 | mov                 ecx, edx
            //   f7e6                 | mul                 esi

        $sequence_4 = { 03442440 13742454 13942484010000 138c2498000000 01d8 1374246c 89c3 }
            // n = 7, score = 100
            //   03442440             | add                 eax, dword ptr [esp + 0x40]
            //   13742454             | adc                 esi, dword ptr [esp + 0x54]
            //   13942484010000       | adc                 edx, dword ptr [esp + 0x184]
            //   138c2498000000       | adc                 ecx, dword ptr [esp + 0x98]
            //   01d8                 | add                 eax, ebx
            //   1374246c             | adc                 esi, dword ptr [esp + 0x6c]
            //   89c3                 | mov                 ebx, eax

        $sequence_5 = { 8b45c8 895dc4 8b5ddc f7d6 3345e8 319d68ffffff 8b5d80 }
            // n = 7, score = 100
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   895dc4               | mov                 dword ptr [ebp - 0x3c], ebx
            //   8b5ddc               | mov                 ebx, dword ptr [ebp - 0x24]
            //   f7d6                 | not                 esi
            //   3345e8               | xor                 eax, dword ptr [ebp - 0x18]
            //   319d68ffffff         | xor                 dword ptr [ebp - 0x98], ebx
            //   8b5d80               | mov                 ebx, dword ptr [ebp - 0x80]

        $sequence_6 = { f7e7 89442440 89f0 89942484010000 f7e7 89c3 89d7 }
            // n = 7, score = 100
            //   f7e7                 | mul                 edi
            //   89442440             | mov                 dword ptr [esp + 0x40], eax
            //   89f0                 | mov                 eax, esi
            //   89942484010000       | mov                 dword ptr [esp + 0x184], edx
            //   f7e7                 | mul                 edi
            //   89c3                 | mov                 ebx, eax
            //   89d7                 | mov                 edi, edx

        $sequence_7 = { 8b9c24d0000000 89d6 01f9 83d600 f7e3 01c8 89d7 }
            // n = 7, score = 100
            //   8b9c24d0000000       | mov                 ebx, dword ptr [esp + 0xd0]
            //   89d6                 | mov                 esi, edx
            //   01f9                 | add                 ecx, edi
            //   83d600               | adc                 esi, 0
            //   f7e3                 | mul                 ebx
            //   01c8                 | add                 eax, ecx
            //   89d7                 | mov                 edi, edx

        $sequence_8 = { 8b8da0feffff 034128 13512c 8b4e58 898568feffff 8b8580feffff 038568feffff }
            // n = 7, score = 100
            //   8b8da0feffff         | mov                 ecx, dword ptr [ebp - 0x160]
            //   034128               | add                 eax, dword ptr [ecx + 0x28]
            //   13512c               | adc                 edx, dword ptr [ecx + 0x2c]
            //   8b4e58               | mov                 ecx, dword ptr [esi + 0x58]
            //   898568feffff         | mov                 dword ptr [ebp - 0x198], eax
            //   8b8580feffff         | mov                 eax, dword ptr [ebp - 0x180]
            //   038568feffff         | add                 eax, dword ptr [ebp - 0x198]

        $sequence_9 = { 89d1 f7e3 89c3 89f8 8bbc24d0010000 89d6 01cb }
            // n = 7, score = 100
            //   89d1                 | mov                 ecx, edx
            //   f7e3                 | mul                 ebx
            //   89c3                 | mov                 ebx, eax
            //   89f8                 | mov                 eax, edi
            //   8bbc24d0010000       | mov                 edi, dword ptr [esp + 0x1d0]
            //   89d6                 | mov                 esi, edx
            //   01cb                 | add                 ebx, ecx

    condition:
        7 of them and filesize < 1263616
}