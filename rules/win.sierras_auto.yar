rule win_sierras_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.sierras."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sierras"
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
        $sequence_0 = { c705????????07000000 8935???????? 8935???????? 8935???????? 8935???????? ff15???????? 3bc6 }
            // n = 7, score = 400
            //   c705????????07000000     |     
            //   8935????????         |                     
            //   8935????????         |                     
            //   8935????????         |                     
            //   8935????????         |                     
            //   ff15????????         |                     
            //   3bc6                 | cmp                 eax, esi

        $sequence_1 = { 8bf1 e8???????? 8b8610010000 5e c3 }
            // n = 5, score = 200
            //   8bf1                 | mov                 esi, ecx
            //   e8????????           |                     
            //   8b8610010000         | mov                 eax, dword ptr [esi + 0x110]
            //   5e                   | pop                 esi
            //   c3                   | ret                 

        $sequence_2 = { 0175f0 03d8 8b45f0 3b4510 72c3 eb62 837d1000 }
            // n = 7, score = 200
            //   0175f0               | add                 dword ptr [ebp - 0x10], esi
            //   03d8                 | add                 ebx, eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   3b4510               | cmp                 eax, dword ptr [ebp + 0x10]
            //   72c3                 | jb                  0xffffffc5
            //   eb62                 | jmp                 0x64
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0

        $sequence_3 = { 57 68???????? 8d8608020000 50 ff15???????? 8bf8 }
            // n = 6, score = 200
            //   57                   | push                edi
            //   68????????           |                     
            //   8d8608020000         | lea                 eax, dword ptr [esi + 0x208]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_4 = { 0f84d80f0000 8b4dfc ff4df8 0fb611 8bcf }
            // n = 5, score = 200
            //   0f84d80f0000         | je                  0xfde
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   ff4df8               | dec                 dword ptr [ebp - 8]
            //   0fb611               | movzx               edx, byte ptr [ecx]
            //   8bcf                 | mov                 ecx, edi

        $sequence_5 = { 8b542410 8b35???????? a1???????? 33c9 85c0 7418 8bde }
            // n = 7, score = 200
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   8b35????????         |                     
            //   a1????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   8bde                 | mov                 ebx, esi

        $sequence_6 = { 8d44242c 8d8c247c020000 52 50 53 53 53 }
            // n = 7, score = 200
            //   8d44242c             | lea                 eax, dword ptr [esp + 0x2c]
            //   8d8c247c020000       | lea                 ecx, dword ptr [esp + 0x27c]
            //   52                   | push                edx
            //   50                   | push                eax
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_7 = { 8b0d???????? 8d5560 8bc5 3bea 741a 8bf8 83c060 }
            // n = 7, score = 200
            //   8b0d????????         |                     
            //   8d5560               | lea                 edx, dword ptr [ebp + 0x60]
            //   8bc5                 | mov                 eax, ebp
            //   3bea                 | cmp                 ebp, edx
            //   741a                 | je                  0x1c
            //   8bf8                 | mov                 edi, eax
            //   83c060               | add                 eax, 0x60

        $sequence_8 = { 7656 8b4514 894514 8b4510 2bc7 }
            // n = 5, score = 200
            //   7656                 | jbe                 0x58
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   894514               | mov                 dword ptr [ebp + 0x14], eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   2bc7                 | sub                 eax, edi

        $sequence_9 = { 8d8614010000 5e c3 56 8bf1 e8???????? }
            // n = 6, score = 200
            //   8d8614010000         | lea                 eax, dword ptr [esi + 0x114]
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   e8????????           |                     

        $sequence_10 = { 017514 03fb 3b7d10 72b0 }
            // n = 4, score = 200
            //   017514               | add                 dword ptr [ebp + 0x14], esi
            //   03fb                 | add                 edi, ebx
            //   3b7d10               | cmp                 edi, dword ptr [ebp + 0x10]
            //   72b0                 | jb                  0xffffffb2

        $sequence_11 = { 7d0d 6a13 50 57 ff15???????? 83c40c }
            // n = 6, score = 200
            //   7d0d                 | jge                 0xf
            //   6a13                 | push                0x13
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_12 = { 83e103 89442418 f3a4 b911000000 }
            // n = 4, score = 200
            //   83e103               | and                 ecx, 3
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   b911000000           | mov                 ecx, 0x11

        $sequence_13 = { 7523 8d442410 8d8c2480120000 50 51 }
            // n = 5, score = 200
            //   7523                 | jne                 0x25
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   8d8c2480120000       | lea                 ecx, dword ptr [esp + 0x1280]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_14 = { c7401890de4000 e9???????? f6c7e0 740f 8b4508 c7401874de4000 }
            // n = 6, score = 200
            //   c7401890de4000       | mov                 dword ptr [eax + 0x18], 0x40de90
            //   e9????????           |                     
            //   f6c7e0               | test                bh, 0xe0
            //   740f                 | je                  0x11
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   c7401874de4000       | mov                 dword ptr [eax + 0x18], 0x40de74

    condition:
        7 of them and filesize < 131072
}