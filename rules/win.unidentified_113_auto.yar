rule win_unidentified_113_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.unidentified_113."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_113"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { ff7604 6894000000 ff74246c e8???????? 83c410 8946f8 e9???????? }
            // n = 7, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   6894000000           | push                0x94
            //   ff74246c             | push                dword ptr [esp + 0x6c]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8946f8               | mov                 dword ptr [esi - 8], eax
            //   e9????????           |                     

        $sequence_1 = { ffb424c8000000 56 53 e8???????? 8bbc24d4000000 83c42c 8bc7 }
            // n = 7, score = 100
            //   ffb424c8000000       | push                dword ptr [esp + 0xc8]
            //   56                   | push                esi
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8bbc24d4000000       | mov                 edi, dword ptr [esp + 0xd4]
            //   83c42c               | add                 esp, 0x2c
            //   8bc7                 | mov                 eax, edi

        $sequence_2 = { ff742430 68???????? e8???????? 8bf0 83c40c 85f6 0f845f020000 }
            // n = 7, score = 100
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   68????????           |                     
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c40c               | add                 esp, 0xc
            //   85f6                 | test                esi, esi
            //   0f845f020000         | je                  0x265

        $sequence_3 = { ff761c ffd0 0f57c0 83c408 660f13442410 8b6c2414 8b5c2410 }
            // n = 7, score = 100
            //   ff761c               | push                dword ptr [esi + 0x1c]
            //   ffd0                 | call                eax
            //   0f57c0               | xorps               xmm0, xmm0
            //   83c408               | add                 esp, 8
            //   660f13442410         | movlpd              qword ptr [esp + 0x10], xmm0
            //   8b6c2414             | mov                 ebp, dword ptr [esp + 0x14]
            //   8b5c2410             | mov                 ebx, dword ptr [esp + 0x10]

        $sequence_4 = { ff2485eca50810 8b4104 85c0 0f842c010000 8b38 33c9 85ff }
            // n = 7, score = 100
            //   ff2485eca50810       | jmp                 dword ptr [eax*4 + 0x1008a5ec]
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   85c0                 | test                eax, eax
            //   0f842c010000         | je                  0x132
            //   8b38                 | mov                 edi, dword ptr [eax]
            //   33c9                 | xor                 ecx, ecx
            //   85ff                 | test                edi, edi

        $sequence_5 = { e8???????? 83c404 83cbff e9???????? 83ff37 0f85b4000000 389ac7010000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   83cbff               | or                  ebx, 0xffffffff
            //   e9????????           |                     
            //   83ff37               | cmp                 edi, 0x37
            //   0f85b4000000         | jne                 0xba
            //   389ac7010000         | cmp                 byte ptr [edx + 0x1c7], bl

        $sequence_6 = { e8???????? 8bf0 83c408 85f6 0f84bf000000 a1???????? 6a00 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c408               | add                 esp, 8
            //   85f6                 | test                esi, esi
            //   0f84bf000000         | je                  0xc5
            //   a1????????           |                     
            //   6a00                 | push                0

        $sequence_7 = { e9???????? 807df000 0f845bffffff ff75e4 e8???????? 59 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   807df000             | cmp                 byte ptr [ebp - 0x10], 0
            //   0f845bffffff         | je                  0xffffff61
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   e9????????           |                     

        $sequence_8 = { ff742468 8bf0 57 ff7310 ff742430 e8???????? 50 }
            // n = 7, score = 100
            //   ff742468             | push                dword ptr [esp + 0x68]
            //   8bf0                 | mov                 esi, eax
            //   57                   | push                edi
            //   ff7310               | push                dword ptr [ebx + 0x10]
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_9 = { ff7608 ff15???????? 894628 85c0 752d ff15???????? 6860c00000 }
            // n = 7, score = 100
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff15????????         |                     
            //   894628               | mov                 dword ptr [esi + 0x28], eax
            //   85c0                 | test                eax, eax
            //   752d                 | jne                 0x2f
            //   ff15????????         |                     
            //   6860c00000           | push                0xc060

    condition:
        7 of them and filesize < 4707328
}