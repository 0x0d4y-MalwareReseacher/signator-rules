rule win_rctrl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.rctrl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rctrl"
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
        $sequence_0 = { 8bc6 8b8fb4000000 894774 85c9 0f84cc000000 }
            // n = 5, score = 100
            //   8bc6                 | mov                 eax, esi
            //   8b8fb4000000         | mov                 ecx, dword ptr [edi + 0xb4]
            //   894774               | mov                 dword ptr [edi + 0x74], eax
            //   85c9                 | test                ecx, ecx
            //   0f84cc000000         | je                  0xd2

        $sequence_1 = { ffd6 85c0 7406 89bd58ffffff 8b83c8000000 8985a0feffff 8b03 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8
            //   89bd58ffffff         | mov                 dword ptr [ebp - 0xa8], edi
            //   8b83c8000000         | mov                 eax, dword ptr [ebx + 0xc8]
            //   8985a0feffff         | mov                 dword ptr [ebp - 0x160], eax
            //   8b03                 | mov                 eax, dword ptr [ebx]

        $sequence_2 = { e9???????? b908010000 8db540d4ffff 8dbd04c8ffff f3a5 68???????? 8d8decb7ffff }
            // n = 7, score = 100
            //   e9????????           |                     
            //   b908010000           | mov                 ecx, 0x108
            //   8db540d4ffff         | lea                 esi, [ebp - 0x2bc0]
            //   8dbd04c8ffff         | lea                 edi, [ebp - 0x37fc]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   68????????           |                     
            //   8d8decb7ffff         | lea                 ecx, [ebp - 0x4814]

        $sequence_3 = { 8801 41 83ea01 75ed 85f6 741d 8d85f7efffff }
            // n = 7, score = 100
            //   8801                 | mov                 byte ptr [ecx], al
            //   41                   | inc                 ecx
            //   83ea01               | sub                 edx, 1
            //   75ed                 | jne                 0xffffffef
            //   85f6                 | test                esi, esi
            //   741d                 | je                  0x1f
            //   8d85f7efffff         | lea                 eax, [ebp - 0x1009]

        $sequence_4 = { e8???????? 898570feffff 59 59 85c0 741d }
            // n = 6, score = 100
            //   e8????????           |                     
            //   898570feffff         | mov                 dword ptr [ebp - 0x190], eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   741d                 | je                  0x1f

        $sequence_5 = { 0f858c38feff 33c0 c3 55 8bec 83b97c01000000 8b4508 }
            // n = 7, score = 100
            //   0f858c38feff         | jne                 0xfffe3892
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83b97c01000000       | cmp                 dword ptr [ecx + 0x17c], 0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_6 = { 8d86b8000000 50 e8???????? 8b86b0000000 85c0 0f84ad000000 83782000 }
            // n = 7, score = 100
            //   8d86b8000000         | lea                 eax, [esi + 0xb8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b86b0000000         | mov                 eax, dword ptr [esi + 0xb0]
            //   85c0                 | test                eax, eax
            //   0f84ad000000         | je                  0xb3
            //   83782000             | cmp                 dword ptr [eax + 0x20], 0

        $sequence_7 = { cc 6a38 b8???????? e8???????? 8d7904 33db 8b07 }
            // n = 7, score = 100
            //   cc                   | int3                
            //   6a38                 | push                0x38
            //   b8????????           |                     
            //   e8????????           |                     
            //   8d7904               | lea                 edi, [ecx + 4]
            //   33db                 | xor                 ebx, ebx
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_8 = { 8b85ecfcffff 85c0 7554 8b85f4fcffff 85c0 744a 8bb5f0fcffff }
            // n = 7, score = 100
            //   8b85ecfcffff         | mov                 eax, dword ptr [ebp - 0x314]
            //   85c0                 | test                eax, eax
            //   7554                 | jne                 0x56
            //   8b85f4fcffff         | mov                 eax, dword ptr [ebp - 0x30c]
            //   85c0                 | test                eax, eax
            //   744a                 | je                  0x4c
            //   8bb5f0fcffff         | mov                 esi, dword ptr [ebp - 0x310]

        $sequence_9 = { 50 ffd7 8d45cc 50 8d8518e5ffff 50 ffd6 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   50                   | push                eax
            //   8d8518e5ffff         | lea                 eax, [ebp - 0x1ae8]
            //   50                   | push                eax
            //   ffd6                 | call                esi

    condition:
        7 of them and filesize < 4315136
}