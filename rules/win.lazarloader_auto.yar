rule win_lazarloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.lazarloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lazarloader"
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
        $sequence_0 = { 48894de8 488945f0 488d15a0bd0000 b805000000 894520 894528 }
            // n = 6, score = 100
            //   48894de8             | dec                 eax
            //   488945f0             | lea                 eax, [0x12733]
            //   488d15a0bd0000       | lock xadd           dword ptr [ecx], eax
            //   b805000000           | cmp                 eax, 1
            //   894520               | jne                 0x625
            //   894528               | dec                 eax

        $sequence_1 = { 488bd7 4c8d05fecd0000 83e23f 488bcf }
            // n = 4, score = 100
            //   488bd7               | dec                 eax
            //   4c8d05fecd0000       | cmp                 ecx, eax
            //   83e23f               | dec                 eax
            //   488bcf               | test                ecx, ecx

        $sequence_2 = { 33c0 b906020000 f3aa 33c0 66898424d0060000 488d8424d2060000 488bf8 }
            // n = 7, score = 100
            //   33c0                 | dec                 eax
            //   b906020000           | mov                 ebx, eax
            //   f3aa                 | dec                 eax
            //   33c0                 | test                eax, eax
            //   66898424d0060000     | mov                 ecx, 4
            //   488d8424d2060000     | dec                 esp
            //   488bf8               | lea                 eax, [0xeab0]

        $sequence_3 = { 488bc2 e9???????? 493bec 0f84be000000 8b7500 33c0 f04d0fb1bcf120ba0100 }
            // n = 7, score = 100
            //   488bc2               | mov                 ecx, dword ptr [esp + 0x58]
            //   e9????????           |                     
            //   493bec               | dec                 eax
            //   0f84be000000         | imul                ecx, ecx, 0
            //   8b7500               | dec                 eax
            //   33c0                 | mov                 edx, dword ptr [esp + 0x58]
            //   f04d0fb1bcf120ba0100     | movsx    ecx, byte ptr [edx + ecx]

        $sequence_4 = { 4889842490000000 488b442470 0fb700 6689442432 488b442458 0fb74c2432 }
            // n = 6, score = 100
            //   4889842490000000     | xor                 ecx, ecx
            //   488b442470           | inc                 ebp
            //   0fb700               | xor                 ecx, ecx
            //   6689442432           | inc                 ecx
            //   488b442458           | mov                 eax, 0x15
            //   0fb74c2432           | dec                 eax

        $sequence_5 = { 4885c9 7430 53 4883ec20 488d0563810000 }
            // n = 5, score = 100
            //   4885c9               | dec                 edx
            //   7430                 | mov                 ecx, dword ptr [ecx + esi + 0x28]
            //   53                   | je                  0x212
            //   4883ec20             | or                  edi, 0xffffffff
            //   488d0563810000       | dec                 esp

        $sequence_6 = { eb19 488d1dec1e0100 eb10 488d1df31e0100 eb07 488d1dd21e0100 }
            // n = 6, score = 100
            //   eb19                 | mov                 dword ptr [esp + 0x50], eax
            //   488d1dec1e0100       | dec                 eax
            //   eb10                 | mov                 eax, dword ptr [esp + 0x50]
            //   488d1df31e0100       | dec                 eax
            //   eb07                 | mov                 dword ptr [esp + 0x88], eax
            //   488d1dd21e0100       | dec                 eax

        $sequence_7 = { 4883ec20 e8???????? 488b05???????? 488d1da7710100 }
            // n = 4, score = 100
            //   4883ec20             | dec                 eax
            //   e8????????           |                     
            //   488b05????????       |                     
            //   488d1da7710100       | mov                 ecx, dword ptr [esp + 0x58]

        $sequence_8 = { e8???????? 89442460 33c9 e8???????? }
            // n = 4, score = 100
            //   e8????????           |                     
            //   89442460             | mov                 eax, 0x69
            //   33c9                 | mov                 word ptr [esp + 0x44], ax
            //   e8????????           |                     

        $sequence_9 = { 85c0 750d 488bcb e8???????? e9???????? 4c8d2557230100 }
            // n = 6, score = 100
            //   85c0                 | dec                 eax
            //   750d                 | mov                 edi, eax
            //   488bcb               | xor                 eax, eax
            //   e8????????           |                     
            //   e9????????           |                     
            //   4c8d2557230100       | mov                 ecx, 0x206

    condition:
        7 of them and filesize < 364544
}