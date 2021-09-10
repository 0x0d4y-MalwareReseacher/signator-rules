rule win_glasses_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.glasses."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.glasses"
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
        $sequence_0 = { eb25 c745fcffffffff 3bf3 7415 6880000000 53 56 }
            // n = 7, score = 100
            //   eb25                 | jmp                 0x27
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   3bf3                 | cmp                 esi, ebx
            //   7415                 | je                  0x17
            //   6880000000           | push                0x80
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_1 = { e8???????? 8be5 5d c3 33c0 85ff 7e1d }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   85ff                 | test                edi, edi
            //   7e1d                 | jle                 0x1f

        $sequence_2 = { e8???????? 8bcb c1e903 03c1 3bc3 760a c7864402000010000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   c1e903               | shr                 ecx, 3
            //   03c1                 | add                 eax, ecx
            //   3bc3                 | cmp                 eax, ebx
            //   760a                 | jbe                 0xc
            //   c7864402000010000000     | mov    dword ptr [esi + 0x244], 0x10

        $sequence_3 = { e9???????? 8b4df0 81c108070000 e9???????? 8b4df0 81c17c070000 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   81c108070000         | add                 ecx, 0x708
            //   e9????????           |                     
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   81c17c070000         | add                 ecx, 0x77c
            //   e9????????           |                     

        $sequence_4 = { e8???????? 8b9570ffffff 50 52 57 e8???????? 83c410 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b9570ffffff         | mov                 edx, dword ptr [ebp - 0x90]
            //   50                   | push                eax
            //   52                   | push                edx
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_5 = { e8???????? 85c0 0f84e8000000 8bc8 e8???????? 8bf0 6a3d }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84e8000000         | je                  0xee
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   6a3d                 | push                0x3d

        $sequence_6 = { ff0d???????? 53 8bcf e8???????? c645ff00 5f 5e }
            // n = 7, score = 100
            //   ff0d????????         |                     
            //   53                   | push                ebx
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_7 = { e8???????? 57 56 8d8db4fcffff c745fc00000000 e8???????? 84c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   57                   | push                edi
            //   56                   | push                esi
            //   8d8db4fcffff         | lea                 ecx, dword ptr [ebp - 0x34c]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_8 = { e8???????? 8bd8 85db 7519 8d8d2cffffff c745fcffffffff e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   7519                 | jne                 0x1b
            //   8d8d2cffffff         | lea                 ecx, dword ptr [ebp - 0xd4]
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   e8????????           |                     

        $sequence_9 = { ff15???????? 8bd8 3bde 7538 8b17 8b4214 68???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   3bde                 | cmp                 ebx, esi
            //   7538                 | jne                 0x3a
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   68????????           |                     

    condition:
        7 of them and filesize < 4177920
}