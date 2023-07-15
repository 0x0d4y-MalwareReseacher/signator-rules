rule win_darkmoon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.darkmoon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkmoon"
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
        $sequence_0 = { c9 c20400 837dd84b 74ab ebbc }
            // n = 5, score = 100
            //   c9                   | leave               
            //   c20400               | ret                 4
            //   837dd84b             | cmp                 dword ptr [ebp - 0x28], 0x4b
            //   74ab                 | je                  0xffffffad
            //   ebbc                 | jmp                 0xffffffbe

        $sequence_1 = { 64657273 006801 0000 80ff56 35c745fc04 }
            // n = 5, score = 100
            //   64657273             | jb                  0x77
            //   006801               | add                 byte ptr [eax + 1], ch
            //   0000                 | add                 byte ptr [eax], al
            //   80ff56               | cmp                 bh, 0x56
            //   35c745fc04           | xor                 eax, 0x4fc45c7

        $sequence_2 = { c1ef02 eb0b 8b55e4 c1ef02 83e203 03fa }
            // n = 6, score = 100
            //   c1ef02               | shr                 edi, 2
            //   eb0b                 | jmp                 0xd
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   c1ef02               | shr                 edi, 2
            //   83e203               | and                 edx, 3
            //   03fa                 | add                 edi, edx

        $sequence_3 = { 51 50 50 8d860f040000 }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   50                   | push                eax
            //   50                   | push                eax
            //   8d860f040000         | lea                 eax, [esi + 0x40f]

        $sequence_4 = { 8dbd8cf0ffff 57 ff96a9000000 c7857cf0ffff00000000 83857cf0ffff01 ffb57cf0ffff }
            // n = 6, score = 100
            //   8dbd8cf0ffff         | lea                 edi, [ebp - 0xf74]
            //   57                   | push                edi
            //   ff96a9000000         | call                dword ptr [esi + 0xa9]
            //   c7857cf0ffff00000000     | mov    dword ptr [ebp - 0xf84], 0
            //   83857cf0ffff01       | add                 dword ptr [ebp - 0xf84], 1
            //   ffb57cf0ffff         | push                dword ptr [ebp - 0xf84]

        $sequence_5 = { 8b742414 83fe3c 7c29 b889888888 b93c000000 f7ee }
            // n = 6, score = 100
            //   8b742414             | mov                 esi, dword ptr [esp + 0x14]
            //   83fe3c               | cmp                 esi, 0x3c
            //   7c29                 | jl                  0x2b
            //   b889888888           | mov                 eax, 0x88888889
            //   b93c000000           | mov                 ecx, 0x3c
            //   f7ee                 | imul                esi

        $sequence_6 = { 57 ff7510 ff7514 50 ff750c ff96b5000000 58 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   50                   | push                eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff96b5000000         | call                dword ptr [esi + 0xb5]
            //   58                   | pop                 eax

        $sequence_7 = { 6802000080 ff5735 c7852cefffff04010000 8d852cefffff 50 }
            // n = 5, score = 100
            //   6802000080           | push                0x80000002
            //   ff5735               | call                dword ptr [edi + 0x35]
            //   c7852cefffff04010000     | mov    dword ptr [ebp - 0x10d4], 0x104
            //   8d852cefffff         | lea                 eax, [ebp - 0x10d4]
            //   50                   | push                eax

        $sequence_8 = { 8d55ec 6a00 52 8d85c0fdffff }
            // n = 4, score = 100
            //   8d55ec               | lea                 edx, [ebp - 0x14]
            //   6a00                 | push                0
            //   52                   | push                edx
            //   8d85c0fdffff         | lea                 eax, [ebp - 0x240]

        $sequence_9 = { 7c27 b889888888 8b742414 f7ef 03d7 b93c000000 }
            // n = 6, score = 100
            //   7c27                 | jl                  0x29
            //   b889888888           | mov                 eax, 0x88888889
            //   8b742414             | mov                 esi, dword ptr [esp + 0x14]
            //   f7ef                 | imul                edi
            //   03d7                 | add                 edx, edi
            //   b93c000000           | mov                 ecx, 0x3c

    condition:
        7 of them and filesize < 98304
}