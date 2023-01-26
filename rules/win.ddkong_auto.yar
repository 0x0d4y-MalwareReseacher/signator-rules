rule win_ddkong_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.ddkong."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ddkong"
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
        $sequence_0 = { ffd7 50 ffd6 c6852cffffff57 c6852dffffff6f c6852effffff77 c6852fffffff36 }
            // n = 7, score = 100
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   c6852cffffff57       | mov                 byte ptr [ebp - 0xd4], 0x57
            //   c6852dffffff6f       | mov                 byte ptr [ebp - 0xd3], 0x6f
            //   c6852effffff77       | mov                 byte ptr [ebp - 0xd2], 0x77
            //   c6852fffffff36       | mov                 byte ptr [ebp - 0xd1], 0x36

        $sequence_1 = { c645d565 c645d66e c645d774 885dd8 ffd7 50 ffd6 }
            // n = 7, score = 100
            //   c645d565             | mov                 byte ptr [ebp - 0x2b], 0x65
            //   c645d66e             | mov                 byte ptr [ebp - 0x2a], 0x6e
            //   c645d774             | mov                 byte ptr [ebp - 0x29], 0x74
            //   885dd8               | mov                 byte ptr [ebp - 0x28], bl
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_2 = { c645f565 c645f653 c645f774 c645f861 c645f974 }
            // n = 5, score = 100
            //   c645f565             | mov                 byte ptr [ebp - 0xb], 0x65
            //   c645f653             | mov                 byte ptr [ebp - 0xa], 0x53
            //   c645f774             | mov                 byte ptr [ebp - 9], 0x74
            //   c645f861             | mov                 byte ptr [ebp - 8], 0x61
            //   c645f974             | mov                 byte ptr [ebp - 7], 0x74

        $sequence_3 = { c645cc6c c645cd65 c645ce41 ffd6 50 }
            // n = 5, score = 100
            //   c645cc6c             | mov                 byte ptr [ebp - 0x34], 0x6c
            //   c645cd65             | mov                 byte ptr [ebp - 0x33], 0x65
            //   c645ce41             | mov                 byte ptr [ebp - 0x32], 0x41
            //   ffd6                 | call                esi
            //   50                   | push                eax

        $sequence_4 = { c645b565 c645b674 c645b753 c645b865 }
            // n = 4, score = 100
            //   c645b565             | mov                 byte ptr [ebp - 0x4b], 0x65
            //   c645b674             | mov                 byte ptr [ebp - 0x4a], 0x74
            //   c645b753             | mov                 byte ptr [ebp - 0x49], 0x53
            //   c645b865             | mov                 byte ptr [ebp - 0x48], 0x65

        $sequence_5 = { 8065e700 8d45dc 50 53 ffd7 50 }
            // n = 6, score = 100
            //   8065e700             | and                 byte ptr [ebp - 0x19], 0
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   50                   | push                eax

        $sequence_6 = { c645db69 c645dc62 c645dd75 c645de74 }
            // n = 4, score = 100
            //   c645db69             | mov                 byte ptr [ebp - 0x25], 0x69
            //   c645dc62             | mov                 byte ptr [ebp - 0x24], 0x62
            //   c645dd75             | mov                 byte ptr [ebp - 0x23], 0x75
            //   c645de74             | mov                 byte ptr [ebp - 0x22], 0x74

        $sequence_7 = { ff55b0 39b518ffffff 7409 ffb518ffffff ff55b0 c3 }
            // n = 6, score = 100
            //   ff55b0               | call                dword ptr [ebp - 0x50]
            //   39b518ffffff         | cmp                 dword ptr [ebp - 0xe8], esi
            //   7409                 | je                  0xb
            //   ffb518ffffff         | push                dword ptr [ebp - 0xe8]
            //   ff55b0               | call                dword ptr [ebp - 0x50]
            //   c3                   | ret                 

        $sequence_8 = { c68525ffffff63 c68526ffffff74 c68527ffffff69 c68528ffffff6f }
            // n = 4, score = 100
            //   c68525ffffff63       | mov                 byte ptr [ebp - 0xdb], 0x63
            //   c68526ffffff74       | mov                 byte ptr [ebp - 0xda], 0x74
            //   c68527ffffff69       | mov                 byte ptr [ebp - 0xd9], 0x69
            //   c68528ffffff6f       | mov                 byte ptr [ebp - 0xd8], 0x6f

        $sequence_9 = { c645dd65 c645de74 c645df55 c645e073 c645e165 c645e272 c645e34e }
            // n = 7, score = 100
            //   c645dd65             | mov                 byte ptr [ebp - 0x23], 0x65
            //   c645de74             | mov                 byte ptr [ebp - 0x22], 0x74
            //   c645df55             | mov                 byte ptr [ebp - 0x21], 0x55
            //   c645e073             | mov                 byte ptr [ebp - 0x20], 0x73
            //   c645e165             | mov                 byte ptr [ebp - 0x1f], 0x65
            //   c645e272             | mov                 byte ptr [ebp - 0x1e], 0x72
            //   c645e34e             | mov                 byte ptr [ebp - 0x1d], 0x4e

    condition:
        7 of them and filesize < 81920
}