rule win_makop_ransomware_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.makop_ransomware."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.makop_ransomware"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { eb02 33f6 803d????????00 751f 803d????????00 7516 80fb01 }
            // n = 7, score = 100
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   803d????????00       |                     
            //   751f                 | jne                 0x21
            //   803d????????00       |                     
            //   7516                 | jne                 0x18
            //   80fb01               | cmp                 bl, 1

        $sequence_1 = { 52 50 51 e8???????? 8b542430 83c40c 68e0930400 }
            // n = 7, score = 100
            //   52                   | push                edx
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   83c40c               | add                 esp, 0xc
            //   68e0930400           | push                0x493e0

        $sequence_2 = { 52 66c7060802 66c746041066 c6460820 }
            // n = 4, score = 100
            //   52                   | push                edx
            //   66c7060802           | mov                 word ptr [esi], 0x208
            //   66c746041066         | mov                 word ptr [esi + 4], 0x6610
            //   c6460820             | mov                 byte ptr [esi + 8], 0x20

        $sequence_3 = { 56 ff15???????? 85c0 750b 8906 32c0 5e }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750b                 | jne                 0xd
            //   8906                 | mov                 dword ptr [esi], eax
            //   32c0                 | xor                 al, al
            //   5e                   | pop                 esi

        $sequence_4 = { 83c001 84c9 75f7 2bc7 83e801 39442404 720a }
            // n = 7, score = 100
            //   83c001               | add                 eax, 1
            //   84c9                 | test                cl, cl
            //   75f7                 | jne                 0xfffffff9
            //   2bc7                 | sub                 eax, edi
            //   83e801               | sub                 eax, 1
            //   39442404             | cmp                 dword ptr [esp + 4], eax
            //   720a                 | jb                  0xc

        $sequence_5 = { ffd6 85ff 740f 85db 740b 837c242000 7404 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   85ff                 | test                edi, edi
            //   740f                 | je                  0x11
            //   85db                 | test                ebx, ebx
            //   740b                 | je                  0xd
            //   837c242000           | cmp                 dword ptr [esp + 0x20], 0
            //   7404                 | je                  6

        $sequence_6 = { 8b2d???????? 3beb 742e 8b4524 3bc3 7407 50 }
            // n = 7, score = 100
            //   8b2d????????         |                     
            //   3beb                 | cmp                 ebp, ebx
            //   742e                 | je                  0x30
            //   8b4524               | mov                 eax, dword ptr [ebp + 0x24]
            //   3bc3                 | cmp                 eax, ebx
            //   7407                 | je                  9
            //   50                   | push                eax

        $sequence_7 = { 7416 e8???????? 6a00 e8???????? 83c404 }
            // n = 5, score = 100
            //   7416                 | je                  0x18
            //   e8????????           |                     
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_8 = { e8???????? 8b442418 83c40c 8b4f0c }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   83c40c               | add                 esp, 0xc
            //   8b4f0c               | mov                 ecx, dword ptr [edi + 0xc]

        $sequence_9 = { 742f 33c0 3906 763d 8d4c2448 }
            // n = 5, score = 100
            //   742f                 | je                  0x31
            //   33c0                 | xor                 eax, eax
            //   3906                 | cmp                 dword ptr [esi], eax
            //   763d                 | jbe                 0x3f
            //   8d4c2448             | lea                 ecx, [esp + 0x48]

    condition:
        7 of them and filesize < 107520
}