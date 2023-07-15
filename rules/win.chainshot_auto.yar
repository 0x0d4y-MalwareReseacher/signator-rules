rule win_chainshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.chainshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chainshot"
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
        $sequence_0 = { e8???????? 84c0 752b b9050e0080 eb05 b901000080 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   84c0                 | push                ebp
            //   752b                 | mov                 ebp, esp
            //   b9050e0080           | mov                 eax, dword ptr [ebp + 8]
            //   eb05                 | test                eax, 0x2000000
            //   b901000080           | je                  0x45a

        $sequence_1 = { 750c 33d2 b905120080 e9???????? 8b542424 8b44242c }
            // n = 6, score = 300
            //   750c                 | inc                 ecx
            //   33d2                 | mov                 byte ptr [ecx], al
            //   b905120080           | je                  0x14e
            //   e9????????           |                     
            //   8b542424             | mov                 eax, dword ptr [ebp + 8]
            //   8b44242c             | add                 dword ptr [ebp - 4], 4

        $sequence_2 = { e8???????? 8bf8 85c0 78bc }
            // n = 4, score = 300
            //   e8????????           |                     
            //   8bf8                 | inc                 cx
            //   85c0                 | mov                 dword ptr [edi], edi
            //   78bc                 | mov                 ebx, 0x80000078

        $sequence_3 = { 803d????????01 7514 e8???????? 89442420 85c0 7826 }
            // n = 6, score = 300
            //   803d????????01       |                     
            //   7514                 | mov                 ecx, 0x80000001
            //   e8????????           |                     
            //   89442420             | jne                 0x562
            //   85c0                 | inc                 ebp
            //   7826                 | xor                 ecx, ecx

        $sequence_4 = { 7513 bb17000080 eb33 663bd5 }
            // n = 4, score = 300
            //   7513                 | mov                 dword ptr [esp + 0x30], ebp
            //   bb17000080           | inc                 esp
            //   eb33                 | mov                 dword ptr [esp + 0x38], ebx
            //   663bd5               | movups              xmm0, xmmword ptr [esp + 0x30]

        $sequence_5 = { 754a c705????????05000000 eb67 83fa05 7539 }
            // n = 5, score = 300
            //   754a                 | ja                  0xac9
            //   c705????????05000000     |     
            //   eb67                 | je                  0xad6
            //   83fa05               | add                 ebx, 0x18
            //   7539                 | mov                 ecx, dword ptr [ebx]

        $sequence_6 = { 7408 ffd1 8905???????? bf7e000080 }
            // n = 4, score = 300
            //   7408                 | mov                 edi, ecx
            //   ffd1                 | movlpd              qword ptr [esp + 0x24], xmm0
            //   8905????????         |                     
            //   bf7e000080           | push                eax

        $sequence_7 = { e9???????? bd01000000 c70720000000 e9???????? 8bce }
            // n = 5, score = 300
            //   e9????????           |                     
            //   bd01000000           | mov                 dword ptr [esp + 0x144], 0x1db10100
            //   c70720000000         | mov                 dword ptr [esp + 0x148], 0x60001
            //   e9????????           |                     
            //   8bce                 | mov                 dword ptr [esp + 0x14c], 0x814908

        $sequence_8 = { 85c0 7407 b908000080 eb1e }
            // n = 4, score = 300
            //   85c0                 | cmp                 byte ptr [eax + 0x3f], 0xe8
            //   7407                 | je                  0x6fb
            //   b908000080           | cmp                 byte ptr [eax + 0x5a], 0xe8
            //   eb1e                 | push                0x5b

        $sequence_9 = { 8ad8 84c0 750a b905050080 e9???????? }
            // n = 5, score = 300
            //   8ad8                 | dec                 ecx
            //   84c0                 | mov                 byte ptr [esp + 0x28], al
            //   750a                 | mov                 eax, dword ptr [ebp + 0x50]
            //   b905050080           | dec                 ebp
            //   e9????????           |                     

    condition:
        7 of them and filesize < 802816
}