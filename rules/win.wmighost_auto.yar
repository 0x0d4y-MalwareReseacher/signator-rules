rule win_wmighost_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.wmighost."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wmighost"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 52 e8???????? 83c40c 68e8030000 ff15???????? e9???????? }
            // n = 6, score = 100
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_1 = { 83c408 68???????? 8d8df0fcffff 51 }
            // n = 4, score = 100
            //   83c408               | add                 esp, 8
            //   68????????           |                     
            //   8d8df0fcffff         | lea                 ecx, [ebp - 0x310]
            //   51                   | push                ecx

        $sequence_2 = { 51 e8???????? 83c408 8d95f0fcffff 52 ff15???????? }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8d95f0fcffff         | lea                 edx, [ebp - 0x310]
            //   52                   | push                edx
            //   ff15????????         |                     

        $sequence_3 = { 6804010000 ff15???????? 83c404 8985f8feffff 6804010000 6a00 8b95f8feffff }
            // n = 7, score = 100
            //   6804010000           | push                0x104
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4
            //   8985f8feffff         | mov                 dword ptr [ebp - 0x108], eax
            //   6804010000           | push                0x104
            //   6a00                 | push                0
            //   8b95f8feffff         | mov                 edx, dword ptr [ebp - 0x108]

        $sequence_4 = { 8b550c 52 8d85f0fcffff 50 e8???????? 83c408 }
            // n = 6, score = 100
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   52                   | push                edx
            //   8d85f0fcffff         | lea                 eax, [ebp - 0x310]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_5 = { 83c40c 68e8030000 ff15???????? e9???????? c745fcffffffff }
            // n = 5, score = 100
            //   83c40c               | add                 esp, 0xc
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   e9????????           |                     
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff

        $sequence_6 = { 3b0d???????? 733c 8b55f8 0fbe82c8304000 33c9 8a0d???????? }
            // n = 6, score = 100
            //   3b0d????????         |                     
            //   733c                 | jae                 0x3e
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   0fbe82c8304000       | movsx               eax, byte ptr [edx + 0x4030c8]
            //   33c9                 | xor                 ecx, ecx
            //   8a0d????????         |                     

        $sequence_7 = { 50 8b4df0 51 e8???????? c745fcffffffff 8d4d08 e8???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   8d4d08               | lea                 ecx, [ebp + 8]
            //   e8????????           |                     

        $sequence_8 = { 8dbdfdfeffff f3ab 66ab aa c685f0fcffff00 b940000000 }
            // n = 6, score = 100
            //   8dbdfdfeffff         | lea                 edi, [ebp - 0x103]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   c685f0fcffff00       | mov                 byte ptr [ebp - 0x310], 0
            //   b940000000           | mov                 ecx, 0x40

        $sequence_9 = { 8955e4 8b45ec 50 8b4de4 51 6aff }
            // n = 6, score = 100
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx
            //   6aff                 | push                -1

    condition:
        7 of them and filesize < 49152
}