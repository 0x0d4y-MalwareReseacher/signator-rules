rule win_lokipws_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.lokipws."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lokipws"
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
        $sequence_0 = { ff37 8945fc e8???????? 68???????? ff37 8945f8 e8???????? }
            // n = 7, score = 300
            //   ff37                 | push                dword ptr [edi]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   e8????????           |                     
            //   68????????           |                     
            //   ff37                 | push                dword ptr [edi]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   e8????????           |                     

        $sequence_1 = { 6a00 6a00 56 e8???????? 56 e8???????? 83c420 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20

        $sequence_2 = { ffd7 50 ffd3 8b4d08 81c13c010000 8945f0 }
            // n = 6, score = 300
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   81c13c010000         | add                 ecx, 0x13c
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_3 = { 56 e8???????? 68???????? 8d8bcc160000 51 ffd0 56 }
            // n = 7, score = 300
            //   56                   | push                esi
            //   e8????????           |                     
            //   68????????           |                     
            //   8d8bcc160000         | lea                 ecx, [ebx + 0x16cc]
            //   51                   | push                ecx
            //   ffd0                 | call                eax
            //   56                   | push                esi

        $sequence_4 = { 56 56 ff750c a3???????? e8???????? 56 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   56                   | push                esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   a3????????           |                     
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_5 = { a5 a5 85c0 750b 6a06 e8???????? 59 }
            // n = 7, score = 300
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   750b                 | jne                 0xd
            //   6a06                 | push                6
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_6 = { 8d8df0fdffff 51 ffd0 57 57 68994b5ddc 6a06 }
            // n = 7, score = 300
            //   8d8df0fdffff         | lea                 ecx, [ebp - 0x210]
            //   51                   | push                ecx
            //   ffd0                 | call                eax
            //   57                   | push                edi
            //   57                   | push                edi
            //   68994b5ddc           | push                0xdc5d4b99
            //   6a06                 | push                6

        $sequence_7 = { 50 668945fe 8d45d0 50 66895dd2 668955d4 66897dd6 }
            // n = 7, score = 300
            //   50                   | push                eax
            //   668945fe             | mov                 word ptr [ebp - 2], ax
            //   8d45d0               | lea                 eax, [ebp - 0x30]
            //   50                   | push                eax
            //   66895dd2             | mov                 word ptr [ebp - 0x2e], bx
            //   668955d4             | mov                 word ptr [ebp - 0x2c], dx
            //   66897dd6             | mov                 word ptr [ebp - 0x2a], di

        $sequence_8 = { 85db 7431 8d4302 50 e8???????? 8bf8 59 }
            // n = 7, score = 300
            //   85db                 | test                ebx, ebx
            //   7431                 | je                  0x33
            //   8d4302               | lea                 eax, [ebx + 2]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx

        $sequence_9 = { 58 6a6f 6689856effffff 66898570ffffff 58 6a75 66898572ffffff }
            // n = 7, score = 300
            //   58                   | pop                 eax
            //   6a6f                 | push                0x6f
            //   6689856effffff       | mov                 word ptr [ebp - 0x92], ax
            //   66898570ffffff       | mov                 word ptr [ebp - 0x90], ax
            //   58                   | pop                 eax
            //   6a75                 | push                0x75
            //   66898572ffffff       | mov                 word ptr [ebp - 0x8e], ax

    condition:
        7 of them and filesize < 1327104
}