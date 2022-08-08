rule win_atmii_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.atmii."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atmii"
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
        $sequence_0 = { 6800300000 6815020000 6a00 56 ffd7 8bf8 897df4 }
            // n = 7, score = 100
            //   6800300000           | push                0x3000
            //   6815020000           | push                0x215
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   8bf8                 | mov                 edi, eax
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi

        $sequence_1 = { eb09 68???????? 8d45b8 50 8b35???????? ffd6 }
            // n = 6, score = 100
            //   eb09                 | jmp                 0xb
            //   68????????           |                     
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   50                   | push                eax
            //   8b35????????         |                     
            //   ffd6                 | call                esi

        $sequence_2 = { 8b4e10 68???????? 51 68???????? 68???????? ffd7 }
            // n = 6, score = 100
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]
            //   68????????           |                     
            //   51                   | push                ecx
            //   68????????           |                     
            //   68????????           |                     
            //   ffd7                 | call                edi

        $sequence_3 = { 8d85c4f9ffff 50 57 56 ff15???????? }
            // n = 5, score = 100
            //   8d85c4f9ffff         | lea                 eax, [ebp - 0x63c]
            //   50                   | push                eax
            //   57                   | push                edi
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_4 = { 8d8d00fcffff 68???????? 51 ffd3 8d9500fcffff 52 e8???????? }
            // n = 7, score = 100
            //   8d8d00fcffff         | lea                 ecx, [ebp - 0x400]
            //   68????????           |                     
            //   51                   | push                ecx
            //   ffd3                 | call                ebx
            //   8d9500fcffff         | lea                 edx, [ebp - 0x400]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_5 = { 8b460c 83c414 68???????? 50 }
            // n = 4, score = 100
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   83c414               | add                 esp, 0x14
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_6 = { 0f848e000000 81481808010000 668b0a 66894810 }
            // n = 4, score = 100
            //   0f848e000000         | je                  0x94
            //   81481808010000       | or                  dword ptr [eax + 0x18], 0x108
            //   668b0a               | mov                 cx, word ptr [edx]
            //   66894810             | mov                 word ptr [eax + 0x10], cx

        $sequence_7 = { 751d 6a00 6a00 6a02 }
            // n = 4, score = 100
            //   751d                 | jne                 0x1f
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a02                 | push                2

        $sequence_8 = { 32c0 33db 57 8bf9 8845ff 3bf3 }
            // n = 6, score = 100
            //   32c0                 | xor                 al, al
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   8845ff               | mov                 byte ptr [ebp - 1], al
            //   3bf3                 | cmp                 esi, ebx

        $sequence_9 = { 8d4dcc 51 eb60 68???????? }
            // n = 4, score = 100
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   51                   | push                ecx
            //   eb60                 | jmp                 0x62
            //   68????????           |                     

        $sequence_10 = { 8b16 8d45f8 50 8b4604 }
            // n = 4, score = 100
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax
            //   8b4604               | mov                 eax, dword ptr [esi + 4]

        $sequence_11 = { 68???????? 68???????? ffd7 5f 5b 8be5 5d }
            // n = 7, score = 100
            //   68????????           |                     
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_12 = { 8d8d28fbffff 51 6a00 ff15???????? 50 ff15???????? 68???????? }
            // n = 7, score = 100
            //   8d8d28fbffff         | lea                 ecx, [ebp - 0x4d8]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_13 = { 85c0 7519 e8???????? 68???????? ff15???????? 8a45ff }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   7519                 | jne                 0x1b
            //   e8????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   8a45ff               | mov                 al, byte ptr [ebp - 1]

        $sequence_14 = { e8???????? 8d85f4fdffff 50 68???????? 68d6000000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8d85f4fdffff         | lea                 eax, [ebp - 0x20c]
            //   50                   | push                eax
            //   68????????           |                     
            //   68d6000000           | push                0xd6

        $sequence_15 = { 8b45fc 83c00d 50 8b4dfc 8b5101 ffd2 }
            // n = 6, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   83c00d               | add                 eax, 0xd
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5101               | mov                 edx, dword ptr [ecx + 1]
            //   ffd2                 | call                edx

    condition:
        7 of them and filesize < 49152
}