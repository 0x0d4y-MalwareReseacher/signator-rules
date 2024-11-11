rule win_recordbreaker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.recordbreaker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.recordbreaker"
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
        $sequence_0 = { 8bc8 e8???????? 8bd3 8bc8 e8???????? 8b15???????? 8bc8 }
            // n = 7, score = 700
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8bd3                 | mov                 edx, ebx
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8b15????????         |                     
            //   8bc8                 | mov                 ecx, eax

        $sequence_1 = { 85d2 7425 8b450c b9feffff7f 2bc6 57 }
            // n = 6, score = 700
            //   85d2                 | test                edx, edx
            //   7425                 | je                  0x27
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   b9feffff7f           | mov                 ecx, 0x7ffffffe
            //   2bc6                 | sub                 eax, esi
            //   57                   | push                edi

        $sequence_2 = { 6a00 8d4514 50 6aff ff35???????? }
            // n = 5, score = 700
            //   6a00                 | push                0
            //   8d4514               | lea                 eax, [ebp + 0x14]
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   ff35????????         |                     

        $sequence_3 = { 8365f800 a1???????? c745f464000000 53 56 }
            // n = 5, score = 700
            //   8365f800             | and                 dword ptr [ebp - 8], 0
            //   a1????????           |                     
            //   c745f464000000       | mov                 dword ptr [ebp - 0xc], 0x64
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_4 = { ff35???????? 57 ff15???????? 8b7508 83c410 8bd7 }
            // n = 6, score = 700
            //   ff35????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   83c410               | add                 esp, 0x10
            //   8bd7                 | mov                 edx, edi

        $sequence_5 = { 33c0 50 6800000008 6a02 50 50 }
            // n = 6, score = 700
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   6800000008           | push                0x8000000
            //   6a02                 | push                2
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_6 = { 83c414 85c0 790f 53 ff15???????? }
            // n = 5, score = 700
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   790f                 | jns                 0x11
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_7 = { 57 8906 ff15???????? 53 ff15???????? 33c0 }
            // n = 6, score = 700
            //   57                   | push                edi
            //   8906                 | mov                 dword ptr [esi], eax
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax

        $sequence_8 = { c1e704 037d14 40 8901 }
            // n = 4, score = 700
            //   c1e704               | shl                 edi, 4
            //   037d14               | add                 edi, dword ptr [ebp + 0x14]
            //   40                   | inc                 eax
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_9 = { ff7510 ff750c 56 e8???????? 83c414 56 ff15???????? }
            // n = 7, score = 700
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   56                   | push                esi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 232312
}