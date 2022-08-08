rule win_computrace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.computrace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.computrace"
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
        $sequence_0 = { 8b4804 894a04 eb06 8b5004 895104 832000 83600400 }
            // n = 7, score = 200
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]
            //   894a04               | mov                 dword ptr [edx + 4], ecx
            //   eb06                 | jmp                 8
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   895104               | mov                 dword ptr [ecx + 4], edx
            //   832000               | and                 dword ptr [eax], 0
            //   83600400             | and                 dword ptr [eax + 4], 0

        $sequence_1 = { 3bc7 89860c1b0000 7411 ff7514 ffb60c1b0000 ff15???????? eb06 }
            // n = 7, score = 200
            //   3bc7                 | cmp                 eax, edi
            //   89860c1b0000         | mov                 dword ptr [esi + 0x1b0c], eax
            //   7411                 | je                  0x13
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ffb60c1b0000         | push                dword ptr [esi + 0x1b0c]
            //   ff15????????         |                     
            //   eb06                 | jmp                 8

        $sequence_2 = { 56 8b742408 56 e8???????? 8a54240c 8d86a03b0000 }
            // n = 6, score = 200
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   56                   | push                esi
            //   e8????????           |                     
            //   8a54240c             | mov                 dl, byte ptr [esp + 0xc]
            //   8d86a03b0000         | lea                 eax, [esi + 0x3ba0]

        $sequence_3 = { 8945d8 85c0 0f84bd000000 68???????? 53 ffd6 8945d4 }
            // n = 7, score = 200
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   85c0                 | test                eax, eax
            //   0f84bd000000         | je                  0xc3
            //   68????????           |                     
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_4 = { 833d????????00 56 751f 6a00 8d85fcfeffff 50 e8???????? }
            // n = 7, score = 200
            //   833d????????00       |                     
            //   56                   | push                esi
            //   751f                 | jne                 0x21
            //   6a00                 | push                0
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 7506 3bdf 7d02 8bfb 8bc3 }
            // n = 5, score = 200
            //   7506                 | jne                 8
            //   3bdf                 | cmp                 ebx, edi
            //   7d02                 | jge                 4
            //   8bfb                 | mov                 edi, ebx
            //   8bc3                 | mov                 eax, ebx

        $sequence_6 = { 64a300000000 c3 8d442404 50 6a01 }
            // n = 5, score = 200
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   c3                   | ret                 
            //   8d442404             | lea                 eax, [esp + 4]
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_7 = { 83c00c 50 6a40 ff15???????? 8bf0 85f6 740f }
            // n = 7, score = 200
            //   83c00c               | add                 eax, 0xc
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   740f                 | je                  0x11

        $sequence_8 = { 8b0f 0af6 750f 43 51 8bc4 50 }
            // n = 7, score = 200
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   0af6                 | or                  dh, dh
            //   750f                 | jne                 0x11
            //   43                   | inc                 ebx
            //   51                   | push                ecx
            //   8bc4                 | mov                 eax, esp
            //   50                   | push                eax

        $sequence_9 = { 8b750c 8b7d10 8b1f 837d0c00 750b 8b35???????? bb05000000 }
            // n = 7, score = 200
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   8b1f                 | mov                 ebx, dword ptr [edi]
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   750b                 | jne                 0xd
            //   8b35????????         |                     
            //   bb05000000           | mov                 ebx, 5

    condition:
        7 of them and filesize < 73728
}