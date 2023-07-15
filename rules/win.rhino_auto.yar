rule win_rhino_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.rhino."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rhino"
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
        $sequence_0 = { 8bc7 c1c105 33c3 81c1a1ebd96e 33c5 034c243c 03c1 }
            // n = 7, score = 400
            //   8bc7                 | mov                 eax, edi
            //   c1c105               | rol                 ecx, 5
            //   33c3                 | xor                 eax, ebx
            //   81c1a1ebd96e         | add                 ecx, 0x6ed9eba1
            //   33c5                 | xor                 eax, ebp
            //   034c243c             | add                 ecx, dword ptr [esp + 0x3c]
            //   03c1                 | add                 eax, ecx

        $sequence_1 = { 51 e8???????? 8b4310 56 03c7 55 50 }
            // n = 7, score = 400
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   56                   | push                esi
            //   03c7                 | add                 eax, edi
            //   55                   | push                ebp
            //   50                   | push                eax

        $sequence_2 = { 8975f4 8975f8 e8???????? 8b45f4 85c0 7504 8bc6 }
            // n = 7, score = 400
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   e8????????           |                     
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   85c0                 | test                eax, eax
            //   7504                 | jne                 6
            //   8bc6                 | mov                 eax, esi

        $sequence_3 = { 3317 3315???????? 8916 8b4704 33c2 894604 8b4f08 }
            // n = 7, score = 400
            //   3317                 | xor                 edx, dword ptr [edi]
            //   3315????????         |                     
            //   8916                 | mov                 dword ptr [esi], edx
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   33c2                 | xor                 eax, edx
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   8b4f08               | mov                 ecx, dword ptr [edi + 8]

        $sequence_4 = { 897dfc e8???????? 897dfc 8d4dd8 47 897df0 }
            // n = 6, score = 400
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   e8????????           |                     
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   47                   | inc                 edi
            //   897df0               | mov                 dword ptr [ebp - 0x10], edi

        $sequence_5 = { 13d1 03fa 897c2418 13e9 f76310 6a02 }
            // n = 6, score = 400
            //   13d1                 | adc                 edx, ecx
            //   03fa                 | add                 edi, edx
            //   897c2418             | mov                 dword ptr [esp + 0x18], edi
            //   13e9                 | adc                 ebp, ecx
            //   f76310               | mul                 dword ptr [ebx + 0x10]
            //   6a02                 | push                2

        $sequence_6 = { 5e 5d 5b 83c40c c20800 8b4c2408 394c2404 }
            // n = 7, score = 400
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   83c40c               | add                 esp, 0xc
            //   c20800               | ret                 8
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]
            //   394c2404             | cmp                 dword ptr [esp + 4], ecx

        $sequence_7 = { 8365fc00 33c0 40 8945ec 394314 740f }
            // n = 6, score = 400
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   394314               | cmp                 dword ptr [ebx + 0x14], eax
            //   740f                 | je                  0x11

        $sequence_8 = { e8???????? 83ec44 53 56 57 8bf9 c745dc07000000 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83ec44               | sub                 esp, 0x44
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   c745dc07000000       | mov                 dword ptr [ebp - 0x24], 7

        $sequence_9 = { ff7308 ff7304 eb1c 85c0 7509 8b5c2414 8b4308 }
            // n = 7, score = 400
            //   ff7308               | push                dword ptr [ebx + 8]
            //   ff7304               | push                dword ptr [ebx + 4]
            //   eb1c                 | jmp                 0x1e
            //   85c0                 | test                eax, eax
            //   7509                 | jne                 0xb
            //   8b5c2414             | mov                 ebx, dword ptr [esp + 0x14]
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]

    condition:
        7 of them and filesize < 1288192
}