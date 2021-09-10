rule win_byeby_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.byeby."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.byeby"
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
        $sequence_0 = { c1f805 8bf7 83e61f c1e606 03348518ab0110 8975dc 8b02 }
            // n = 7, score = 100
            //   c1f805               | sar                 eax, 5
            //   8bf7                 | mov                 esi, edi
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   03348518ab0110       | add                 esi, dword ptr [eax*4 + 0x1001ab18]
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_1 = { 89442438 8d442438 50 68???????? ffd7 40 }
            // n = 6, score = 100
            //   89442438             | mov                 dword ptr [esp + 0x38], eax
            //   8d442438             | lea                 eax, dword ptr [esp + 0x38]
            //   50                   | push                eax
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   40                   | inc                 eax

        $sequence_2 = { e8???????? 8b35???????? 8d8424d0000000 83c40c 68???????? 50 ffd6 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b35????????         |                     
            //   8d8424d0000000       | lea                 eax, dword ptr [esp + 0xd0]
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_3 = { 6a00 50 c745f865786500 c685e8feffff00 e8???????? 83c40c 8d85e8feffff }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   50                   | push                eax
            //   c745f865786500       | mov                 dword ptr [ebp - 8], 0x657865
            //   c685e8feffff00       | mov                 byte ptr [ebp - 0x118], 0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85e8feffff         | lea                 eax, dword ptr [ebp - 0x118]

        $sequence_4 = { 50 e8???????? 8b1d???????? 8d85ccfeffff 83c418 50 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b1d????????         |                     
            //   8d85ccfeffff         | lea                 eax, dword ptr [ebp - 0x134]
            //   83c418               | add                 esp, 0x18
            //   50                   | push                eax

        $sequence_5 = { c1ff05 83e61f c1e606 8b0cbd18ab0110 f6440e0401 743d }
            // n = 6, score = 100
            //   c1ff05               | sar                 edi, 5
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   8b0cbd18ab0110       | mov                 ecx, dword ptr [edi*4 + 0x1001ab18]
            //   f6440e0401           | test                byte ptr [esi + ecx + 4], 1
            //   743d                 | je                  0x3f

        $sequence_6 = { 6a00 ff15???????? a3???????? 8d44240c 50 ff35???????? }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   a3????????           |                     
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   50                   | push                eax
            //   ff35????????         |                     

        $sequence_7 = { 8bc8 e8???????? 8bf8 eb02 33ff 6a38 }
            // n = 6, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   eb02                 | jmp                 4
            //   33ff                 | xor                 edi, edi
            //   6a38                 | push                0x38

        $sequence_8 = { ff15???????? 6a00 8d442438 50 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   8d442438             | lea                 eax, dword ptr [esp + 0x38]
            //   50                   | push                eax

        $sequence_9 = { 50 ff15???????? 50 ff95b8fbffff 85c0 7508 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff95b8fbffff         | call                dword ptr [ebp - 0x448]
            //   85c0                 | test                eax, eax
            //   7508                 | jne                 0xa

    condition:
        7 of them and filesize < 253952
}