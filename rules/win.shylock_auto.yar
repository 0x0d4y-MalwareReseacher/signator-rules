rule win_shylock_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.shylock."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shylock"
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
        $sequence_0 = { e8???????? 8d75e8 e8???????? 5b 8d75dc e8???????? 8b4508 }
            // n = 7, score = 500
            //   e8????????           |                     
            //   8d75e8               | lea                 esi, [ebp - 0x18]
            //   e8????????           |                     
            //   5b                   | pop                 ebx
            //   8d75dc               | lea                 esi, [ebp - 0x24]
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_1 = { a1???????? 39b034010000 0f8574010000 53 bb00020000 83781c03 7c08 }
            // n = 7, score = 500
            //   a1????????           |                     
            //   39b034010000         | cmp                 dword ptr [eax + 0x134], esi
            //   0f8574010000         | jne                 0x17a
            //   53                   | push                ebx
            //   bb00020000           | mov                 ebx, 0x200
            //   83781c03             | cmp                 dword ptr [eax + 0x1c], 3
            //   7c08                 | jl                  0xa

        $sequence_2 = { 8a00 8845dc 8d45f0 50 8d45ec 50 8d45f8 }
            // n = 7, score = 500
            //   8a00                 | mov                 al, byte ptr [eax]
            //   8845dc               | mov                 byte ptr [ebp - 0x24], al
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   50                   | push                eax
            //   8d45f8               | lea                 eax, [ebp - 8]

        $sequence_3 = { 8db3fc000000 e8???????? 8db300010000 e8???????? 8db304010000 e8???????? 8db308010000 }
            // n = 7, score = 500
            //   8db3fc000000         | lea                 esi, [ebx + 0xfc]
            //   e8????????           |                     
            //   8db300010000         | lea                 esi, [ebx + 0x100]
            //   e8????????           |                     
            //   8db304010000         | lea                 esi, [ebx + 0x104]
            //   e8????????           |                     
            //   8db308010000         | lea                 esi, [ebx + 0x108]

        $sequence_4 = { 56 ff15???????? 59 59 85c0 0f85e0010000 ff75b2 }
            // n = 7, score = 500
            //   56                   | push                esi
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   0f85e0010000         | jne                 0x1e6
            //   ff75b2               | push                dword ptr [ebp - 0x4e]

        $sequence_5 = { c22000 55 8bec 83ec1c 53 56 57 }
            // n = 7, score = 500
            //   c22000               | ret                 0x20
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec1c               | sub                 esp, 0x1c
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_6 = { 8b5d0c 8d45d0 50 e8???????? e8???????? 8bd8 }
            // n = 6, score = 500
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   8d45d0               | lea                 eax, [ebp - 0x30]
            //   50                   | push                eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_7 = { 6a01 eb15 6a00 ffb648010000 e8???????? 59 59 }
            // n = 7, score = 500
            //   6a01                 | push                1
            //   eb15                 | jmp                 0x17
            //   6a00                 | push                0
            //   ffb648010000         | push                dword ptr [esi + 0x148]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_8 = { 8d7d10 e8???????? 8b4d10 c645ff01 85c9 741b e8???????? }
            // n = 7, score = 500
            //   8d7d10               | lea                 edi, [ebp + 0x10]
            //   e8????????           |                     
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   c645ff01             | mov                 byte ptr [ebp - 1], 1
            //   85c9                 | test                ecx, ecx
            //   741b                 | je                  0x1d
            //   e8????????           |                     

        $sequence_9 = { e8???????? 8d7714 e8???????? 5e c3 55 8bec }
            // n = 7, score = 500
            //   e8????????           |                     
            //   8d7714               | lea                 esi, [edi + 0x14]
            //   e8????????           |                     
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

    condition:
        7 of them and filesize < 630784
}