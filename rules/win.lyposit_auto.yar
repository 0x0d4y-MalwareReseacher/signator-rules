rule win_lyposit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.lyposit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lyposit"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 6afa 5e 8b45f8 8b08 50 ff5108 8bc6 }
            // n = 7, score = 200
            //   6afa                 | push                -6
            //   5e                   | pop                 esi
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff5108               | call                dword ptr [ecx + 8]
            //   8bc6                 | mov                 eax, esi

        $sequence_1 = { 895e0c 53 ff7510 8d4610 50 e8???????? }
            // n = 6, score = 200
            //   895e0c               | mov                 dword ptr [esi + 0xc], ebx
            //   53                   | push                ebx
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8d4610               | lea                 eax, [esi + 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { 6808020000 6a40 8b3d???????? ffd7 }
            // n = 4, score = 200
            //   6808020000           | push                0x208
            //   6a40                 | push                0x40
            //   8b3d????????         |                     
            //   ffd7                 | call                edi

        $sequence_3 = { 33db 895dc4 885dd8 895ddc }
            // n = 4, score = 200
            //   33db                 | xor                 ebx, ebx
            //   895dc4               | mov                 dword ptr [ebp - 0x3c], ebx
            //   885dd8               | mov                 byte ptr [ebp - 0x28], bl
            //   895ddc               | mov                 dword ptr [ebp - 0x24], ebx

        $sequence_4 = { 897dfc be00500000 56 6a40 }
            // n = 4, score = 200
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   be00500000           | mov                 esi, 0x5000
            //   56                   | push                esi
            //   6a40                 | push                0x40

        $sequence_5 = { 85c0 75d1 53 ff75e4 ff75e0 e8???????? 83c40c }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   75d1                 | jne                 0xffffffd3
            //   53                   | push                ebx
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_6 = { 8945f4 e8???????? 8945f8 3975fc 7623 8b45fc db45fc }
            // n = 7, score = 200
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   3975fc               | cmp                 dword ptr [ebp - 4], esi
            //   7623                 | jbe                 0x25
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   db45fc               | fild                dword ptr [ebp - 4]

        $sequence_7 = { ff75dc 53 ff75e0 8b35???????? ffd6 83c414 }
            // n = 6, score = 200
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   53                   | push                ebx
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   83c414               | add                 esp, 0x14

        $sequence_8 = { 6a2e 6a2f 8bce e8???????? 6a21 6a3d 8bce }
            // n = 7, score = 200
            //   6a2e                 | push                0x2e
            //   6a2f                 | push                0x2f
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   6a21                 | push                0x21
            //   6a3d                 | push                0x3d
            //   8bce                 | mov                 ecx, esi

        $sequence_9 = { 83c410 85f6 0f85fc020000 214308 8b75ec c70305000000 e9???????? }
            // n = 7, score = 200
            //   83c410               | add                 esp, 0x10
            //   85f6                 | test                esi, esi
            //   0f85fc020000         | jne                 0x302
            //   214308               | and                 dword ptr [ebx + 8], eax
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   c70305000000         | mov                 dword ptr [ebx], 5
            //   e9????????           |                     

    condition:
        7 of them and filesize < 466944
}