rule win_buhtrap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.buhtrap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buhtrap"
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
        $sequence_0 = { e8???????? 59 59 84c0 0f8435010000 }
            // n = 5, score = 500
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   0f8435010000         | je                  0x13b

        $sequence_1 = { 53 56 57 8bf9 89542414 68???????? }
            // n = 6, score = 400
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   89542414             | mov                 dword ptr [esp + 0x14], edx
            //   68????????           |                     

        $sequence_2 = { ff75dc ffd7 6804010000 56 ff75d8 ffd3 85c0 }
            // n = 7, score = 400
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   ffd7                 | call                edi
            //   6804010000           | push                0x104
            //   56                   | push                esi
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax

        $sequence_3 = { e8???????? 83c40c 85c0 75e3 50 50 }
            // n = 6, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   75e3                 | jne                 0xffffffe5
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_4 = { 5e 0f95c0 5d c3 55 8bec 83ec0c }
            // n = 7, score = 400
            //   5e                   | pop                 esi
            //   0f95c0               | setne               al
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc

        $sequence_5 = { 8b30 8d442434 50 6a00 6a0b }
            // n = 5, score = 400
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a0b                 | push                0xb

        $sequence_6 = { 6804010000 56 ff75ec ffd3 }
            // n = 4, score = 400
            //   6804010000           | push                0x104
            //   56                   | push                esi
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ffd3                 | call                ebx

        $sequence_7 = { c745c800018000 e8???????? 50 6a07 5a b9???????? e8???????? }
            // n = 7, score = 400
            //   c745c800018000       | mov                 dword ptr [ebp - 0x38], 0x800100
            //   e8????????           |                     
            //   50                   | push                eax
            //   6a07                 | push                7
            //   5a                   | pop                 edx
            //   b9????????           |                     
            //   e8????????           |                     

        $sequence_8 = { 50 57 ff7514 ffd6 8b75ec 85c0 7419 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ffd6                 | call                esi
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   85c0                 | test                eax, eax
            //   7419                 | je                  0x1b

        $sequence_9 = { 6a3d 53 ff15???????? 85c0 7420 }
            // n = 5, score = 100
            //   6a3d                 | push                0x3d
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7420                 | je                  0x22

        $sequence_10 = { 3bdf 0f84ad010000 8b4634 893b 3bc7 }
            // n = 5, score = 100
            //   3bdf                 | cmp                 ebx, edi
            //   0f84ad010000         | je                  0x1b3
            //   8b4634               | mov                 eax, dword ptr [esi + 0x34]
            //   893b                 | mov                 dword ptr [ebx], edi
            //   3bc7                 | cmp                 eax, edi

        $sequence_11 = { 035508 03cb 85c0 740e 2bd1 8a1c0a }
            // n = 6, score = 100
            //   035508               | add                 edx, dword ptr [ebp + 8]
            //   03cb                 | add                 ecx, ebx
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   2bd1                 | sub                 edx, ecx
            //   8a1c0a               | mov                 bl, byte ptr [edx + ecx]

        $sequence_12 = { 8d8580fdffff 50 ff15???????? 57 682f816e5c 6a0a }
            // n = 6, score = 100
            //   8d8580fdffff         | lea                 eax, [ebp - 0x280]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   57                   | push                edi
            //   682f816e5c           | push                0x5c6e812f
            //   6a0a                 | push                0xa

        $sequence_13 = { e8???????? 83c40c 84c0 0f84ed000000 8d75f4 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   84c0                 | test                al, al
            //   0f84ed000000         | je                  0xf3
            //   8d75f4               | lea                 esi, [ebp - 0xc]

        $sequence_14 = { c9 c3 8b4064 395864 75f8 }
            // n = 5, score = 100
            //   c9                   | leave               
            //   c3                   | ret                 
            //   8b4064               | mov                 eax, dword ptr [eax + 0x64]
            //   395864               | cmp                 dword ptr [eax + 0x64], ebx
            //   75f8                 | jne                 0xfffffffa

    condition:
        7 of them and filesize < 131072
}