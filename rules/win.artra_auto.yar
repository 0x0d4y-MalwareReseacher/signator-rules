rule win_artra_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.artra."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.artra"
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
        $sequence_0 = { 5e 83c41c c21000 5f }
            // n = 4, score = 800
            //   5e                   | pop                 esi
            //   83c41c               | add                 esp, 0x1c
            //   c21000               | ret                 0x10
            //   5f                   | pop                 edi

        $sequence_1 = { 8b442410 5f 5e 83c41c }
            // n = 4, score = 800
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   83c41c               | add                 esp, 0x1c

        $sequence_2 = { 2bc7 3bc8 72e3 8bc6 8d5001 5f }
            // n = 6, score = 700
            //   2bc7                 | sub                 eax, edi
            //   3bc8                 | cmp                 ecx, eax
            //   72e3                 | jb                  0xffffffe5
            //   8bc6                 | mov                 eax, esi
            //   8d5001               | lea                 edx, dword ptr [eax + 1]
            //   5f                   | pop                 edi

        $sequence_3 = { 8a10 40 84d2 75f9 2bc7 3bc8 72e3 }
            // n = 7, score = 700
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   40                   | inc                 eax
            //   84d2                 | test                dl, dl
            //   75f9                 | jne                 0xfffffffb
            //   2bc7                 | sub                 eax, edi
            //   3bc8                 | cmp                 ecx, eax
            //   72e3                 | jb                  0xffffffe5

        $sequence_4 = { 8bc6 41 8d7801 8d9b00000000 }
            // n = 4, score = 700
            //   8bc6                 | mov                 eax, esi
            //   41                   | inc                 ecx
            //   8d7801               | lea                 edi, dword ptr [eax + 1]
            //   8d9b00000000         | lea                 ebx, dword ptr [ebx]

        $sequence_5 = { 51 8bc6 57 33c9 8d7801 8da42400000000 }
            // n = 6, score = 700
            //   51                   | push                ecx
            //   8bc6                 | mov                 eax, esi
            //   57                   | push                edi
            //   33c9                 | xor                 ecx, ecx
            //   8d7801               | lea                 edi, dword ptr [eax + 1]
            //   8da42400000000       | lea                 esp, dword ptr [esp]

        $sequence_6 = { 5f 8a08 40 84c9 75f9 2bc2 880c30 }
            // n = 7, score = 700
            //   5f                   | pop                 edi
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   880c30               | mov                 byte ptr [eax + esi], cl

        $sequence_7 = { 6a00 8d442414 50 ffd7 85c0 7445 53 }
            // n = 7, score = 600
            //   6a00                 | push                0
            //   8d442414             | lea                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7445                 | je                  0x47
            //   53                   | push                ebx

        $sequence_8 = { 6a00 8d54241c 52 ffd7 85c0 75cc 5d }
            // n = 7, score = 600
            //   6a00                 | push                0
            //   8d54241c             | lea                 edx, dword ptr [esp + 0x1c]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   75cc                 | jne                 0xffffffce
            //   5d                   | pop                 ebp

        $sequence_9 = { 8a08 880a 40 42 84c9 75f6 e8???????? }
            // n = 7, score = 600
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   880a                 | mov                 byte ptr [edx], cl
            //   40                   | inc                 eax
            //   42                   | inc                 edx
            //   84c9                 | test                cl, cl
            //   75f6                 | jne                 0xfffffff8
            //   e8????????           |                     

        $sequence_10 = { 55 8b2d???????? 90 8b542410 8d4c2410 51 }
            // n = 6, score = 600
            //   55                   | push                ebp
            //   8b2d????????         |                     
            //   90                   | nop                 
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]
            //   51                   | push                ecx

        $sequence_11 = { 8935???????? ff15???????? 8bf8 85ff 0f8488000000 }
            // n = 5, score = 600
            //   8935????????         |                     
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   0f8488000000         | je                  0x8e

        $sequence_12 = { e8???????? 8b3d???????? 6a00 6a00 6a00 8d442414 50 }
            // n = 7, score = 600
            //   e8????????           |                     
            //   8b3d????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d442414             | lea                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax

        $sequence_13 = { 2bc2 03fb 8a4f01 47 84c9 75f8 8bc8 }
            // n = 7, score = 600
            //   2bc2                 | sub                 eax, edx
            //   03fb                 | add                 edi, ebx
            //   8a4f01               | mov                 cl, byte ptr [edi + 1]
            //   47                   | inc                 edi
            //   84c9                 | test                cl, cl
            //   75f8                 | jne                 0xfffffffa
            //   8bc8                 | mov                 ecx, eax

        $sequence_14 = { 57 ff15???????? 6a6d 56 ff15???????? 8bf0 }
            // n = 6, score = 600
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6a6d                 | push                0x6d
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_15 = { 8bf8 83c404 897c2410 899c24ac000000 3bfb 743b }
            // n = 6, score = 500
            //   8bf8                 | mov                 edi, eax
            //   83c404               | add                 esp, 4
            //   897c2410             | mov                 dword ptr [esp + 0x10], edi
            //   899c24ac000000       | mov                 dword ptr [esp + 0xac], ebx
            //   3bfb                 | cmp                 edi, ebx
            //   743b                 | je                  0x3d

        $sequence_16 = { a0???????? 8807 8b4c2414 51 ff15???????? 8d842488030000 8bc8 }
            // n = 7, score = 500
            //   a0????????           |                     
            //   8807                 | mov                 byte ptr [edi], al
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8d842488030000       | lea                 eax, dword ptr [esp + 0x388]
            //   8bc8                 | mov                 ecx, eax

        $sequence_17 = { 8b08 8d5101 8910 8819 8bc3 8b4c2444 64890d00000000 }
            // n = 7, score = 500
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d5101               | lea                 edx, dword ptr [ecx + 1]
            //   8910                 | mov                 dword ptr [eax], edx
            //   8819                 | mov                 byte ptr [ecx], bl
            //   8bc3                 | mov                 eax, ebx
            //   8b4c2444             | mov                 ecx, dword ptr [esp + 0x44]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx

        $sequence_18 = { c1f805 8b0485e03b4100 83e61f c1e606 8d443004 8020fd 8b45f8 }
            // n = 7, score = 400
            //   c1f805               | sar                 eax, 5
            //   8b0485e03b4100       | mov                 eax, dword ptr [eax*4 + 0x413be0]
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   8d443004             | lea                 eax, dword ptr [eax + esi + 4]
            //   8020fd               | and                 byte ptr [eax], 0xfd
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_19 = { ffd6 85c0 75cc 5d 5b 8b442410 5f }
            // n = 7, score = 400
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   75cc                 | jne                 0xffffffce
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   5f                   | pop                 edi

        $sequence_20 = { 68???????? 8d942474020000 e8???????? 8d842474020000 }
            // n = 4, score = 400
            //   68????????           |                     
            //   8d942474020000       | lea                 edx, dword ptr [esp + 0x274]
            //   e8????????           |                     
            //   8d842474020000       | lea                 eax, dword ptr [esp + 0x274]

        $sequence_21 = { 8b5618 51 52 50 ffd3 }
            // n = 5, score = 400
            //   8b5618               | mov                 edx, dword ptr [esi + 0x18]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   ffd3                 | call                ebx

        $sequence_22 = { 53 8b1d???????? 55 8b2d???????? 8b442410 8d542410 52 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   55                   | push                ebp
            //   8b2d????????         |                     
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8d542410             | lea                 edx, dword ptr [esp + 0x10]
            //   52                   | push                edx

        $sequence_23 = { 85ff 0f84bc000000 6a00 57 ff15???????? }
            // n = 5, score = 200
            //   85ff                 | test                edi, edi
            //   0f84bc000000         | je                  0xc2
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 811008
}