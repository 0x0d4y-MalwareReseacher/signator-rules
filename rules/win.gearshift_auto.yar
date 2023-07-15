rule win_gearshift_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.gearshift."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gearshift"
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
        $sequence_0 = { 498bd4 488bcb ff15???????? 41b900800000 41b810010000 }
            // n = 5, score = 200
            //   498bd4               | mov                 eax, dword ptr [esp + 0x70]
            //   488bcb               | dec                 eax
            //   ff15????????         |                     
            //   41b900800000         | mov                 eax, dword ptr [eax + 8]
            //   41b810010000         | dec                 eax

        $sequence_1 = { 6689442455 88442457 8885f0000000 e8???????? 33d2 488d8d81000000 }
            // n = 6, score = 200
            //   6689442455           | mov                 dword ptr [edi + eax + 0x50], 1
            //   88442457             | dec                 eax
            //   8885f0000000         | lea                 edx, [0xafbf]
            //   e8????????           |                     
            //   33d2                 | dec                 ecx
            //   488d8d81000000       | mov                 ecx, esp

        $sequence_2 = { 0f84ec000000 8bc8 48034d08 ff96c0000000 4c8be0 4883f8ff 0f841d020000 }
            // n = 7, score = 200
            //   0f84ec000000         | test                edx, edx
            //   8bc8                 | je                  0x66b
            //   48034d08             | add                 al, byte ptr [ecx]
            //   ff96c0000000         | mov                 byte ptr [ecx], 0
            //   4c8be0               | ret                 
            //   4883f8ff             | xor                 eax, eax
            //   0f841d020000         | mov                 ecx, dword ptr fs:[0]

        $sequence_3 = { ff15???????? 488d1587ae0000 498bcc 48894528 ff15???????? 488d1563af0000 498bcc }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   488d1587ae0000       | mov                 ecx, dword ptr [eax + 0x20]
            //   498bcc               | dec                 eax
            //   48894528             | mov                 eax, dword ptr [esp + 0x2b0]
            //   ff15????????         |                     
            //   488d1563af0000       | dec                 eax
            //   498bcc               | add                 eax, ecx

        $sequence_4 = { 488b88c0000000 488d05a73b0300 395914 4a8b0ce0 498b0c0f 0f94c3 ff15???????? }
            // n = 7, score = 200
            //   488b88c0000000       | test                eax, eax
            //   488d05a73b0300       | jne                 0x17df
            //   395914               | inc                 ebp
            //   4a8b0ce0             | xor                 eax, eax
            //   498b0c0f             | xor                 edx, edx
            //   0f94c3               | dec                 eax
            //   ff15????????         |                     

        $sequence_5 = { 75b6 488bcd ff15???????? 4c8bac2478010000 488bbc2470010000 }
            // n = 5, score = 200
            //   75b6                 | cmp                 esi, esp
            //   488bcd               | jne                 0x1fe
            //   ff15????????         |                     
            //   4c8bac2478010000     | dec                 ecx
            //   488bbc2470010000     | movsx               eax, ah

        $sequence_6 = { 48897818 488b05???????? 4833c4 48894570 488d0d5f320200 }
            // n = 5, score = 200
            //   48897818             | mov                 ecx, esp
            //   488b05????????       |                     
            //   4833c4               | mov                 dword ptr [esp + 0x70], edi
            //   48894570             | inc                 ecx
            //   488d0d5f320200       | mov                 eax, 0x40

        $sequence_7 = { 488b742410 488b7c2418 c3 41ffc2 48ffc2 443bd3 }
            // n = 6, score = 200
            //   488b742410           | dec                 eax
            //   488b7c2418           | mov                 dword ptr [eax], ecx
            //   c3                   | dec                 eax
            //   41ffc2               | cmp                 ecx, edx
            //   48ffc2               | jb                  0x986
            //   443bd3               | dec                 eax

        $sequence_8 = { 448ba890000000 ba14000000 4c036d08 498bcd }
            // n = 4, score = 200
            //   448ba890000000       | mov                 eax, dword ptr [ecx + 4]
            //   ba14000000           | dec                 ecx
            //   4c036d08             | lea                 edx, [ecx + 8]
            //   498bcd               | dec                 eax

        $sequence_9 = { 0fb7d1 eb09 488b4508 488d540102 }
            // n = 4, score = 200
            //   0fb7d1               | dec                 eax
            //   eb09                 | mov                 eax, dword ptr [esp + 0x30]
            //   488b4508             | mov                 eax, dword ptr [eax + 0x24]
            //   488d540102           | and                 eax, 0x20000000

    condition:
        7 of them and filesize < 540672
}