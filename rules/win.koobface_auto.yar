rule win_koobface_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.koobface."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.koobface"
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
        $sequence_0 = { 3bc3 0f8410010000 8b08 8d55e4 52 68???????? 53 }
            // n = 7, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   0f8410010000         | je                  0x116
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d55e4               | lea                 edx, [ebp - 0x1c]
            //   52                   | push                edx
            //   68????????           |                     
            //   53                   | push                ebx

        $sequence_1 = { 8b8dd0fdffff 8d852cfeffff 50 c745fc33000000 e8???????? 56 }
            // n = 6, score = 100
            //   8b8dd0fdffff         | mov                 ecx, dword ptr [ebp - 0x230]
            //   8d852cfeffff         | lea                 eax, [ebp - 0x1d4]
            //   50                   | push                eax
            //   c745fc33000000       | mov                 dword ptr [ebp - 4], 0x33
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_2 = { a5 83ec10 8bfc 8db590fbffff a5 a5 }
            // n = 6, score = 100
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   83ec10               | sub                 esp, 0x10
            //   8bfc                 | mov                 edi, esp
            //   8db590fbffff         | lea                 esi, [ebp - 0x470]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_3 = { 8d044554494200 8bc8 2bce 6a03 }
            // n = 4, score = 100
            //   8d044554494200       | lea                 eax, [eax*2 + 0x424954]
            //   8bc8                 | mov                 ecx, eax
            //   2bce                 | sub                 ecx, esi
            //   6a03                 | push                3

        $sequence_4 = { 8bf8 59 59 3bfb 7508 8bbd0cfeffff }
            // n = 6, score = 100
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   3bfb                 | cmp                 edi, ebx
            //   7508                 | jne                 0xa
            //   8bbd0cfeffff         | mov                 edi, dword ptr [ebp - 0x1f4]

        $sequence_5 = { 8b45e8 8b08 53 50 }
            // n = 4, score = 100
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_6 = { 50 c645fc1c e8???????? 56 8945b4 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   c645fc1c             | mov                 byte ptr [ebp - 4], 0x1c
            //   e8????????           |                     
            //   56                   | push                esi
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax

        $sequence_7 = { 0355f0 8dbc3a05e9e3a9 c1c705 037db0 8bd0 897db8 f7d2 }
            // n = 7, score = 100
            //   0355f0               | add                 edx, dword ptr [ebp - 0x10]
            //   8dbc3a05e9e3a9       | lea                 edi, [edx + edi - 0x561c16fb]
            //   c1c705               | rol                 edi, 5
            //   037db0               | add                 edi, dword ptr [ebp - 0x50]
            //   8bd0                 | mov                 edx, eax
            //   897db8               | mov                 dword ptr [ebp - 0x48], edi
            //   f7d2                 | not                 edx

        $sequence_8 = { 5d c20400 c3 56 68???????? 8bf1 e8???????? }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   c3                   | ret                 
            //   56                   | push                esi
            //   68????????           |                     
            //   8bf1                 | mov                 esi, ecx
            //   e8????????           |                     

        $sequence_9 = { e9???????? 8d4df0 e9???????? 8d4d10 e9???????? 8d4de8 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   e9????????           |                     
            //   8d4d10               | lea                 ecx, [ebp + 0x10]
            //   e9????????           |                     
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   e9????????           |                     

    condition:
        7 of them and filesize < 368640
}