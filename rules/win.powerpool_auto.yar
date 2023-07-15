rule win_powerpool_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.powerpool."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.powerpool"
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
        $sequence_0 = { 741d 8b5008 8b7a2c 037a10 }
            // n = 4, score = 200
            //   741d                 | je                  0x1f
            //   8b5008               | mov                 edx, dword ptr [eax + 8]
            //   8b7a2c               | mov                 edi, dword ptr [edx + 0x2c]
            //   037a10               | add                 edi, dword ptr [edx + 0x10]

        $sequence_1 = { 7447 3c2f 7443 6a01 6a02 8d8d20ffffff }
            // n = 6, score = 200
            //   7447                 | je                  0x49
            //   3c2f                 | cmp                 al, 0x2f
            //   7443                 | je                  0x45
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   8d8d20ffffff         | lea                 ecx, [ebp - 0xe0]

        $sequence_2 = { 741c 8b4514 50 8b45fc 052c020000 e8???????? }
            // n = 6, score = 200
            //   741c                 | je                  0x1e
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   052c020000           | add                 eax, 0x22c
            //   e8????????           |                     

        $sequence_3 = { 741d 807f3e5c 7517 b85c000000 }
            // n = 4, score = 200
            //   741d                 | je                  0x1f
            //   807f3e5c             | cmp                 byte ptr [edi + 0x3e], 0x5c
            //   7517                 | jne                 0x19
            //   b85c000000           | mov                 eax, 0x5c

        $sequence_4 = { 005311 40 005d11 40 006711 }
            // n = 5, score = 200
            //   005311               | add                 byte ptr [ebx + 0x11], dl
            //   40                   | inc                 eax
            //   005d11               | add                 byte ptr [ebp + 0x11], bl
            //   40                   | inc                 eax
            //   006711               | add                 byte ptr [edi + 0x11], ah

        $sequence_5 = { 013e 017e08 5b 8bc7 }
            // n = 4, score = 200
            //   013e                 | add                 dword ptr [esi], edi
            //   017e08               | add                 dword ptr [esi + 8], edi
            //   5b                   | pop                 ebx
            //   8bc7                 | mov                 eax, edi

        $sequence_6 = { 013e 017e08 894630 5b }
            // n = 4, score = 200
            //   013e                 | add                 dword ptr [esi], edi
            //   017e08               | add                 dword ptr [esi + 8], edi
            //   894630               | mov                 dword ptr [esi + 0x30], eax
            //   5b                   | pop                 ebx

        $sequence_7 = { 741d 6a2c 6a01 8bcf e8???????? 53 }
            // n = 6, score = 200
            //   741d                 | je                  0x1f
            //   6a2c                 | push                0x2c
            //   6a01                 | push                1
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   53                   | push                ebx

        $sequence_8 = { 741d 8b4d08 51 8b4e04 }
            // n = 4, score = 200
            //   741d                 | je                  0x1f
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]

        $sequence_9 = { 014140 8b45cc 8bc8 d3ea 8b4df8 }
            // n = 5, score = 200
            //   014140               | add                 dword ptr [ecx + 0x40], eax
            //   8b45cc               | mov                 eax, dword ptr [ebp - 0x34]
            //   8bc8                 | mov                 ecx, eax
            //   d3ea                 | shr                 edx, cl
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_10 = { 006711 40 0000 0303 }
            // n = 4, score = 200
            //   006711               | add                 byte ptr [edi + 0x11], ah
            //   40                   | inc                 eax
            //   0000                 | add                 byte ptr [eax], al
            //   0303                 | add                 eax, dword ptr [ebx]

        $sequence_11 = { 0101 8b45ec 8b4d18 5f }
            // n = 4, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4d18               | mov                 ecx, dword ptr [ebp + 0x18]
            //   5f                   | pop                 edi

        $sequence_12 = { 01411c 8b7df0 85c0 742c }
            // n = 4, score = 200
            //   01411c               | add                 dword ptr [ecx + 0x1c], eax
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   85c0                 | test                eax, eax
            //   742c                 | je                  0x2e

        $sequence_13 = { 741d 50 51 8d45f4 }
            // n = 4, score = 200
            //   741d                 | je                  0x1f
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8d45f4               | lea                 eax, [ebp - 0xc]

        $sequence_14 = { 8b45e4 33ff 897de8 3d00040000 7719 50 e8???????? }
            // n = 7, score = 200
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   33ff                 | xor                 edi, edi
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   3d00040000           | cmp                 eax, 0x400
            //   7719                 | ja                  0x1b
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_15 = { 741d 85d2 7419 8bce }
            // n = 4, score = 200
            //   741d                 | je                  0x1f
            //   85d2                 | test                edx, edx
            //   7419                 | je                  0x1b
            //   8bce                 | mov                 ecx, esi

    condition:
        7 of them and filesize < 819200
}