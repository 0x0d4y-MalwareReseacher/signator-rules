rule win_poldat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.poldat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poldat"
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
        $sequence_0 = { 56 50 e8???????? 8b7d08 8b5d0c }
            // n = 5, score = 100
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]

        $sequence_1 = { 7508 81fd01010000 773c 8b4328 }
            // n = 4, score = 100
            //   7508                 | jne                 0xa
            //   81fd01010000         | cmp                 ebp, 0x101
            //   773c                 | ja                  0x3e
            //   8b4328               | mov                 eax, dword ptr [ebx + 0x28]

        $sequence_2 = { e8???????? 50 ff15???????? 50 8d85e4fbffff }
            // n = 5, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8d85e4fbffff         | lea                 eax, [ebp - 0x41c]

        $sequence_3 = { c9 c3 55 8bec 81ec1c040000 803d????????30 53 }
            // n = 7, score = 100
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec1c040000         | sub                 esp, 0x41c
            //   803d????????30       |                     
            //   53                   | push                ebx

        $sequence_4 = { 50 ff15???????? 50 8d85e4fbffff 68???????? 50 e8???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8d85e4fbffff         | lea                 eax, [ebp - 0x41c]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { be580c0000 57 56 8975fc }
            // n = 4, score = 100
            //   be580c0000           | mov                 esi, 0xc58
            //   57                   | push                edi
            //   56                   | push                esi
            //   8975fc               | mov                 dword ptr [ebp - 4], esi

        $sequence_6 = { 7321 8b4b08 8b148dbc9c4100 8b4b0c c7049100000000 8b5308 }
            // n = 6, score = 100
            //   7321                 | jae                 0x23
            //   8b4b08               | mov                 ecx, dword ptr [ebx + 8]
            //   8b148dbc9c4100       | mov                 edx, dword ptr [ecx*4 + 0x419cbc]
            //   8b4b0c               | mov                 ecx, dword ptr [ebx + 0xc]
            //   c7049100000000       | mov                 dword ptr [ecx + edx*4], 0
            //   8b5308               | mov                 edx, dword ptr [ebx + 8]

        $sequence_7 = { c3 55 8bec 81ec1c040000 803d????????30 53 56 }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec1c040000         | sub                 esp, 0x41c
            //   803d????????30       |                     
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_8 = { e8???????? 83c414 8d8598fbffff 6a00 }
            // n = 4, score = 100
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8d8598fbffff         | lea                 eax, [ebp - 0x468]
            //   6a00                 | push                0

        $sequence_9 = { 8b400c 3bd8 89442418 7338 8b442428 85c0 0f84f8020000 }
            // n = 7, score = 100
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   3bd8                 | cmp                 ebx, eax
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   7338                 | jae                 0x3a
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   85c0                 | test                eax, eax
            //   0f84f8020000         | je                  0x2fe

    condition:
        7 of them and filesize < 247808
}