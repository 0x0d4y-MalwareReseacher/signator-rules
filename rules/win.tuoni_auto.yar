rule win_tuoni_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.tuoni."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tuoni"
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
        $sequence_0 = { ff15???????? ffb5a4fbffff ffd6 6a08 8d85a8fbffff 50 ff15???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   ffb5a4fbffff         | push                dword ptr [ebp - 0x45c]
            //   ffd6                 | call                esi
            //   6a08                 | push                8
            //   8d85a8fbffff         | lea                 eax, [ebp - 0x458]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_1 = { 8d4da8 e8???????? 8d4dc0 e8???????? e9???????? 68???????? e8???????? }
            // n = 7, score = 100
            //   8d4da8               | lea                 ecx, [ebp - 0x58]
            //   e8????????           |                     
            //   8d4dc0               | lea                 ecx, [ebp - 0x40]
            //   e8????????           |                     
            //   e9????????           |                     
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_2 = { 8bf8 85ff 7423 8d45e8 50 8d8598fbffff 50 }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   7423                 | je                  0x25
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   8d8598fbffff         | lea                 eax, [ebp - 0x468]
            //   50                   | push                eax

        $sequence_3 = { 89412c 894130 8bc1 c3 83790400 740c 6a18 }
            // n = 7, score = 100
            //   89412c               | mov                 dword ptr [ecx + 0x2c], eax
            //   894130               | mov                 dword ptr [ecx + 0x30], eax
            //   8bc1                 | mov                 eax, ecx
            //   c3                   | ret                 
            //   83790400             | cmp                 dword ptr [ecx + 4], 0
            //   740c                 | je                  0xe
            //   6a18                 | push                0x18

        $sequence_4 = { 51 ff37 e8???????? 59 59 5e 892f }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   ff37                 | push                dword ptr [edi]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   5e                   | pop                 esi
            //   892f                 | mov                 dword ptr [edi], ebp

        $sequence_5 = { ff15???????? 50 6a00 57 ff15???????? 8bf8 85ff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   50                   | push                eax
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi

        $sequence_6 = { 7404 c645d701 f6c302 740b 8d4da4 83e3fd }
            // n = 6, score = 100
            //   7404                 | je                  6
            //   c645d701             | mov                 byte ptr [ebp - 0x29], 1
            //   f6c302               | test                bl, 2
            //   740b                 | je                  0xd
            //   8d4da4               | lea                 ecx, [ebp - 0x5c]
            //   83e3fd               | and                 ebx, 0xfffffffd

        $sequence_7 = { 8d85a0fbffff 50 ffd7 ff15???????? 50 6a00 6800040000 }
            // n = 7, score = 100
            //   8d85a0fbffff         | lea                 eax, [ebp - 0x460]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   ff15????????         |                     
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6800040000           | push                0x400

        $sequence_8 = { 894598 8b452c 894590 8b4530 894594 6a44 5f }
            // n = 7, score = 100
            //   894598               | mov                 dword ptr [ebp - 0x68], eax
            //   8b452c               | mov                 eax, dword ptr [ebp + 0x2c]
            //   894590               | mov                 dword ptr [ebp - 0x70], eax
            //   8b4530               | mov                 eax, dword ptr [ebp + 0x30]
            //   894594               | mov                 dword ptr [ebp - 0x6c], eax
            //   6a44                 | push                0x44
            //   5f                   | pop                 edi

        $sequence_9 = { 68???????? e8???????? 83c40c 8d4dd8 e8???????? 8d8594fbffff 50 }
            // n = 7, score = 100
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   e8????????           |                     
            //   8d8594fbffff         | lea                 eax, [ebp - 0x46c]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 734208
}