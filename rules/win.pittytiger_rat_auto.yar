rule win_pittytiger_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.pittytiger_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pittytiger_rat"
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
        $sequence_0 = { 85c0 7415 68???????? ff750c ff15???????? 59 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17
            //   68????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff15????????         |                     
            //   59                   | pop                 ecx

        $sequence_1 = { 8b35???????? 68???????? 50 ffd6 68???????? 8bf8 ff75f8 }
            // n = 7, score = 100
            //   8b35????????         |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   ff75f8               | push                dword ptr [ebp - 8]

        $sequence_2 = { 50 57 c745b851756572 c745bc79536572 c745c076696365 c745c453746174 885dca }
            // n = 7, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   c745b851756572       | mov                 dword ptr [ebp - 0x48], 0x72657551
            //   c745bc79536572       | mov                 dword ptr [ebp - 0x44], 0x72655379
            //   c745c076696365       | mov                 dword ptr [ebp - 0x40], 0x65636976
            //   c745c453746174       | mov                 dword ptr [ebp - 0x3c], 0x74617453
            //   885dca               | mov                 byte ptr [ebp - 0x36], bl

        $sequence_3 = { c745c474546950 c745c811111111 33c0 807405b811 40 83f810 72f5 }
            // n = 7, score = 100
            //   c745c474546950       | mov                 dword ptr [ebp - 0x3c], 0x50695474
            //   c745c811111111       | mov                 dword ptr [ebp - 0x38], 0x11111111
            //   33c0                 | xor                 eax, eax
            //   807405b811           | xor                 byte ptr [ebp + eax - 0x48], 0x11
            //   40                   | inc                 eax
            //   83f810               | cmp                 eax, 0x10
            //   72f5                 | jb                  0xfffffff7

        $sequence_4 = { 83c420 43 83c674 ff45f4 3b5df8 }
            // n = 5, score = 100
            //   83c420               | add                 esp, 0x20
            //   43                   | inc                 ebx
            //   83c674               | add                 esi, 0x74
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   3b5df8               | cmp                 ebx, dword ptr [ebp - 8]

        $sequence_5 = { 8dbdd8fcffff 6a34 f3a5 59 33c0 8dbd0cfdffff 8b35???????? }
            // n = 7, score = 100
            //   8dbdd8fcffff         | lea                 edi, dword ptr [ebp - 0x328]
            //   6a34                 | push                0x34
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax
            //   8dbd0cfdffff         | lea                 edi, dword ptr [ebp - 0x2f4]
            //   8b35????????         |                     

        $sequence_6 = { ff7594 ff15???????? 85c0 0f845a010000 8d8524fdffff }
            // n = 5, score = 100
            //   ff7594               | push                dword ptr [ebp - 0x6c]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f845a010000         | je                  0x160
            //   8d8524fdffff         | lea                 eax, dword ptr [ebp - 0x2dc]

        $sequence_7 = { 8d85ecfbffff 50 8d45f0 50 8d8558f7ffff 53 }
            // n = 6, score = 100
            //   8d85ecfbffff         | lea                 eax, dword ptr [ebp - 0x414]
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   8d8558f7ffff         | lea                 eax, dword ptr [ebp - 0x8a8]
            //   53                   | push                ebx

        $sequence_8 = { 68???????? 53 ff7508 e8???????? 83c40c 8d85f8fbffff }
            // n = 6, score = 100
            //   68????????           |                     
            //   53                   | push                ebx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85f8fbffff         | lea                 eax, dword ptr [ebp - 0x408]

        $sequence_9 = { ffd7 8d85f8fbffff 50 53 ff7508 e8???????? 8d8600020000 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   8d85f8fbffff         | lea                 eax, dword ptr [ebp - 0x408]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8d8600020000         | lea                 eax, dword ptr [esi + 0x200]

    condition:
        7 of them and filesize < 2162688
}