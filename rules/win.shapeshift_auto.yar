rule win_shapeshift_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.shapeshift."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shapeshift"
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
        $sequence_0 = { 6a1c 8bf0 e8???????? 8bc8 0f57c0 83c404 0f1101 }
            // n = 7, score = 100
            //   6a1c                 | push                0x1c
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   0f57c0               | xorps               xmm0, xmm0
            //   83c404               | add                 esp, 4
            //   0f1101               | movups              xmmword ptr [ecx], xmm0

        $sequence_1 = { 4e 40 89442424 83feff 0f8fa8feffff e8???????? 6a00 }
            // n = 7, score = 100
            //   4e                   | dec                 esi
            //   40                   | inc                 eax
            //   89442424             | mov                 dword ptr [esp + 0x24], eax
            //   83feff               | cmp                 esi, -1
            //   0f8fa8feffff         | jg                  0xfffffeae
            //   e8????????           |                     
            //   6a00                 | push                0

        $sequence_2 = { 899df0fdffff c785ecfdffff00000000 0f86ef010000 e8???????? 6a0c 8bf0 }
            // n = 6, score = 100
            //   899df0fdffff         | mov                 dword ptr [ebp - 0x210], ebx
            //   c785ecfdffff00000000     | mov    dword ptr [ebp - 0x214], 0
            //   0f86ef010000         | jbe                 0x1f5
            //   e8????????           |                     
            //   6a0c                 | push                0xc
            //   8bf0                 | mov                 esi, eax

        $sequence_3 = { c745e04c804100 e9???????? c745dc02000000 c745e04c804100 8b4508 8bcf 8b7510 }
            // n = 7, score = 100
            //   c745e04c804100       | mov                 dword ptr [ebp - 0x20], 0x41804c
            //   e9????????           |                     
            //   c745dc02000000       | mov                 dword ptr [ebp - 0x24], 2
            //   c745e04c804100       | mov                 dword ptr [ebp - 0x20], 0x41804c
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bcf                 | mov                 ecx, edi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]

        $sequence_4 = { 0f85ca000000 837c241c01 a1???????? 89442448 }
            // n = 4, score = 100
            //   0f85ca000000         | jne                 0xd0
            //   837c241c01           | cmp                 dword ptr [esp + 0x1c], 1
            //   a1????????           |                     
            //   89442448             | mov                 dword ptr [esp + 0x48], eax

        $sequence_5 = { ba1d000000 e9???????? 833d????????00 0f852caeffff 8d0d009c4100 ba1d000000 }
            // n = 6, score = 100
            //   ba1d000000           | mov                 edx, 0x1d
            //   e9????????           |                     
            //   833d????????00       |                     
            //   0f852caeffff         | jne                 0xffffae32
            //   8d0d009c4100         | lea                 ecx, [0x419c00]
            //   ba1d000000           | mov                 edx, 0x1d

        $sequence_6 = { 75a2 57 885f0c ff15???????? 6a01 57 }
            // n = 6, score = 100
            //   75a2                 | jne                 0xffffffa4
            //   57                   | push                edi
            //   885f0c               | mov                 byte ptr [edi + 0xc], bl
            //   ff15????????         |                     
            //   6a01                 | push                1
            //   57                   | push                edi

        $sequence_7 = { 803d????????01 741d 6a0a ff15???????? 43 81fbffffff7f }
            // n = 6, score = 100
            //   803d????????01       |                     
            //   741d                 | je                  0x1f
            //   6a0a                 | push                0xa
            //   ff15????????         |                     
            //   43                   | inc                 ebx
            //   81fbffffff7f         | cmp                 ebx, 0x7fffffff

    condition:
        7 of them and filesize < 303104
}