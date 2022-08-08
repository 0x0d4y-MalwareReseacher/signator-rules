rule win_helauto_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.helauto."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.helauto"
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
        $sequence_0 = { 50 ff15???????? 69c060ea0000 83c430 3d60ea0000 a3???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   69c060ea0000         | imul                eax, eax, 0xea60
            //   83c430               | add                 esp, 0x30
            //   3d60ea0000           | cmp                 eax, 0xea60
            //   a3????????           |                     

        $sequence_1 = { 389da8f8ffff 7437 83f8ff 7432 6a14 58 3945f8 }
            // n = 7, score = 100
            //   389da8f8ffff         | cmp                 byte ptr [ebp - 0x758], bl
            //   7437                 | je                  0x39
            //   83f8ff               | cmp                 eax, -1
            //   7432                 | je                  0x34
            //   6a14                 | push                0x14
            //   58                   | pop                 eax
            //   3945f8               | cmp                 dword ptr [ebp - 8], eax

        $sequence_2 = { c3 8b442408 2b442404 8d440002 85c0 }
            // n = 5, score = 100
            //   c3                   | ret                 
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   2b442404             | sub                 eax, dword ptr [esp + 4]
            //   8d440002             | lea                 eax, [eax + eax + 2]
            //   85c0                 | test                eax, eax

        $sequence_3 = { 56 56 68bb010000 68???????? 50 8945ec }
            // n = 6, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   68bb010000           | push                0x1bb
            //   68????????           |                     
            //   50                   | push                eax
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax

        $sequence_4 = { e8???????? 59 8945fc 6a14 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   6a14                 | push                0x14

        $sequence_5 = { e9???????? a1???????? 8945f4 8d45f4 50 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   a1????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   50                   | push                eax

        $sequence_6 = { d80d???????? e8???????? 68???????? 8bf0 ff15???????? }
            // n = 5, score = 100
            //   d80d????????         |                     
            //   e8????????           |                     
            //   68????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     

        $sequence_7 = { aa 8bca 33c0 8dbd99f7ffff }
            // n = 4, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8bca                 | mov                 ecx, edx
            //   33c0                 | xor                 eax, eax
            //   8dbd99f7ffff         | lea                 edi, [ebp - 0x867]

        $sequence_8 = { 68???????? e9???????? 6a04 8d85a8f3ffff 68???????? 50 }
            // n = 6, score = 100
            //   68????????           |                     
            //   e9????????           |                     
            //   6a04                 | push                4
            //   8d85a8f3ffff         | lea                 eax, [ebp - 0xc58]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_9 = { 68???????? 50 ffd7 83c40c 85c0 7518 56 }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7518                 | jne                 0x1a
            //   56                   | push                esi

    condition:
        7 of them and filesize < 57344
}