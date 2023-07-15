rule win_synccrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.synccrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.synccrypt"
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
        $sequence_0 = { 8996dc000000 8b542438 8986f4000000 898c2488000000 898ed8000000 89fb 8b4c2428 }
            // n = 7, score = 100
            //   8996dc000000         | mov                 dword ptr [esi + 0xdc], edx
            //   8b542438             | mov                 edx, dword ptr [esp + 0x38]
            //   8986f4000000         | mov                 dword ptr [esi + 0xf4], eax
            //   898c2488000000       | mov                 dword ptr [esp + 0x88], ecx
            //   898ed8000000         | mov                 dword ptr [esi + 0xd8], ecx
            //   89fb                 | mov                 ebx, edi
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]

        $sequence_1 = { e8???????? 8b4c2448 8b542450 897c2414 890424 894c2410 8b4c2444 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4c2448             | mov                 ecx, dword ptr [esp + 0x48]
            //   8b542450             | mov                 edx, dword ptr [esp + 0x50]
            //   897c2414             | mov                 dword ptr [esp + 0x14], edi
            //   890424               | mov                 dword ptr [esp], eax
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx
            //   8b4c2444             | mov                 ecx, dword ptr [esp + 0x44]

        $sequence_2 = { e8???????? e8???????? 85c0 89442430 0f84e4030000 e8???????? 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89442430             | mov                 dword ptr [esp + 0x30], eax
            //   0f84e4030000         | je                  0x3ea
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_3 = { 8b5c2420 85db 7419 891c24 e8???????? 8d4314 890424 }
            // n = 7, score = 100
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   85db                 | test                ebx, ebx
            //   7419                 | je                  0x1b
            //   891c24               | mov                 dword ptr [esp], ebx
            //   e8????????           |                     
            //   8d4314               | lea                 eax, [ebx + 0x14]
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_4 = { e8???????? 85c0 89c7 0f84b3000000 8b4308 85c0 7408 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89c7                 | mov                 edi, eax
            //   0f84b3000000         | je                  0xb9
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa

        $sequence_5 = { c7470c00000000 c700ffffffff c74004ffffffff c7470402000000 8d44243c 895c2410 897c2408 }
            // n = 7, score = 100
            //   c7470c00000000       | mov                 dword ptr [edi + 0xc], 0
            //   c700ffffffff         | mov                 dword ptr [eax], 0xffffffff
            //   c74004ffffffff       | mov                 dword ptr [eax + 4], 0xffffffff
            //   c7470402000000       | mov                 dword ptr [edi + 4], 2
            //   8d44243c             | lea                 eax, [esp + 0x3c]
            //   895c2410             | mov                 dword ptr [esp + 0x10], ebx
            //   897c2408             | mov                 dword ptr [esp + 8], edi

        $sequence_6 = { 741c 8b542434 c70000000000 c7400400000000 8902 b802000000 83c42c }
            // n = 7, score = 100
            //   741c                 | je                  0x1e
            //   8b542434             | mov                 edx, dword ptr [esp + 0x34]
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   c7400400000000       | mov                 dword ptr [eax + 4], 0
            //   8902                 | mov                 dword ptr [edx], eax
            //   b802000000           | mov                 eax, 2
            //   83c42c               | add                 esp, 0x2c

        $sequence_7 = { e8???????? 85c0 0f847e020000 8b442428 89742404 893424 89442410 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f847e020000         | je                  0x284
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   89742404             | mov                 dword ptr [esp + 4], esi
            //   893424               | mov                 dword ptr [esp], esi
            //   89442410             | mov                 dword ptr [esp + 0x10], eax

        $sequence_8 = { c744240400000000 890424 e8???????? 85c0 89c3 741e 890424 }
            // n = 7, score = 100
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89c3                 | mov                 ebx, eax
            //   741e                 | je                  0x20
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_9 = { c744241033020000 eb92 c744241058020000 eb88 e8???????? 894314 e9???????? }
            // n = 7, score = 100
            //   c744241033020000     | mov                 dword ptr [esp + 0x10], 0x233
            //   eb92                 | jmp                 0xffffff94
            //   c744241058020000     | mov                 dword ptr [esp + 0x10], 0x258
            //   eb88                 | jmp                 0xffffff8a
            //   e8????????           |                     
            //   894314               | mov                 dword ptr [ebx + 0x14], eax
            //   e9????????           |                     

    condition:
        7 of them and filesize < 4489216
}