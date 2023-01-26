rule win_bistromath_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.bistromath."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bistromath"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { e8???????? 6a00 6a06 8d55e8 c745e800000000 8bcb e8???????? }
            // n = 7, score = 400
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a06                 | push                6
            //   8d55e8               | lea                 edx, [ebp - 0x18]
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     

        $sequence_1 = { ff942470030000 48 89442428 48 8d8c24c0000000 ff942470030000 48 }
            // n = 7, score = 400
            //   ff942470030000       | call                dword ptr [esp + 0x370]
            //   48                   | dec                 eax
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   48                   | dec                 eax
            //   8d8c24c0000000       | lea                 ecx, [esp + 0xc0]
            //   ff942470030000       | call                dword ptr [esp + 0x370]
            //   48                   | dec                 eax

        $sequence_2 = { 8b3b 85d2 7471 0fb602 83f826 7462 3d9d000000 }
            // n = 7, score = 400
            //   8b3b                 | mov                 edi, dword ptr [ebx]
            //   85d2                 | test                edx, edx
            //   7471                 | je                  0x73
            //   0fb602               | movzx               eax, byte ptr [edx]
            //   83f826               | cmp                 eax, 0x26
            //   7462                 | je                  0x64
            //   3d9d000000           | cmp                 eax, 0x9d

        $sequence_3 = { e8???????? 85c0 7407 ba01000000 eb3c 8b442444 ff431c }
            // n = 7, score = 400
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   ba01000000           | mov                 edx, 1
            //   eb3c                 | jmp                 0x3e
            //   8b442444             | mov                 eax, dword ptr [esp + 0x44]
            //   ff431c               | inc                 dword ptr [ebx + 0x1c]

        $sequence_4 = { f6c203 7504 33c9 eb05 b901000000 85c9 ba???????? }
            // n = 7, score = 400
            //   f6c203               | test                dl, 3
            //   7504                 | jne                 6
            //   33c9                 | xor                 ecx, ecx
            //   eb05                 | jmp                 7
            //   b901000000           | mov                 ecx, 1
            //   85c9                 | test                ecx, ecx
            //   ba????????           |                     

        $sequence_5 = { 394814 0f8eba010000 894c2438 894c243c 8b450c 85c0 7409 }
            // n = 7, score = 400
            //   394814               | cmp                 dword ptr [eax + 0x14], ecx
            //   0f8eba010000         | jle                 0x1c0
            //   894c2438             | mov                 dword ptr [esp + 0x38], ecx
            //   894c243c             | mov                 dword ptr [esp + 0x3c], ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb

        $sequence_6 = { 8b8548ffffff 894624 8b8544ffffff 66894616 8b8540ffffff 5f 66894628 }
            // n = 7, score = 400
            //   8b8548ffffff         | mov                 eax, dword ptr [ebp - 0xb8]
            //   894624               | mov                 dword ptr [esi + 0x24], eax
            //   8b8544ffffff         | mov                 eax, dword ptr [ebp - 0xbc]
            //   66894616             | mov                 word ptr [esi + 0x16], ax
            //   8b8540ffffff         | mov                 eax, dword ptr [ebp - 0xc0]
            //   5f                   | pop                 edi
            //   66894628             | mov                 word ptr [esi + 0x28], ax

        $sequence_7 = { eb0b 85db 0f84bd000000 8b45f4 8b08 33db 85c9 }
            // n = 7, score = 400
            //   eb0b                 | jmp                 0xd
            //   85db                 | test                ebx, ebx
            //   0f84bd000000         | je                  0xc3
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   33db                 | xor                 ebx, ebx
            //   85c9                 | test                ecx, ecx

        $sequence_8 = { c3 8b4f44 e8???????? 8bd8 85db 7510 8b4738 }
            // n = 7, score = 400
            //   c3                   | ret                 
            //   8b4f44               | mov                 ecx, dword ptr [edi + 0x44]
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   7510                 | jne                 0x12
            //   8b4738               | mov                 eax, dword ptr [edi + 0x38]

        $sequence_9 = { c3 8bce 895e14 e8???????? 8b07 8b4064 394618 }
            // n = 7, score = 400
            //   c3                   | ret                 
            //   8bce                 | mov                 ecx, esi
            //   895e14               | mov                 dword ptr [esi + 0x14], ebx
            //   e8????????           |                     
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8b4064               | mov                 eax, dword ptr [eax + 0x64]
            //   394618               | cmp                 dword ptr [esi + 0x18], eax

    condition:
        7 of them and filesize < 33816576
}