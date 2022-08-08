rule win_appleseed_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.appleseed."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.appleseed"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 488d5547 488d4de7 48894547 e8???????? 488d051f300100 488d1590c80100 488d4de7 }
            // n = 7, score = 100
            //   488d5547             | dec                 eax
            //   488d4de7             | cmp                 dword ptr [ebp + 0xf], 0x10
            //   48894547             | jne                 0x807
            //   e8????????           |                     
            //   488d051f300100       | dec                 eax
            //   488d1590c80100       | lea                 ecx, [esp + 0x20]
            //   488d4de7             | dec                 eax

        $sequence_1 = { 7509 488d05a3d60100 eb04 4883c014 8938 e8???????? }
            // n = 6, score = 100
            //   7509                 | je                  0x179d
            //   488d05a3d60100       | dec                 eax
            //   eb04                 | cmp                 dword ptr [ebp - 0x30], 0x10
            //   4883c014             | jb                  0x59
            //   8938                 | dec                 eax
            //   e8????????           |                     

        $sequence_2 = { 4533c0 488bd7 33c9 ff15???????? 85c0 0f84bb000000 4585f6 }
            // n = 7, score = 100
            //   4533c0               | mov                 dword ptr [esp + 0x40], 0
            //   488bd7               | mov                 byte ptr [esp + 0x30], 0
            //   33c9                 | dec                 eax
            //   ff15????????         |                     
            //   85c0                 | lea                 edx, [0x207a0]
            //   0f84bb000000         | dec                 esp
            //   4585f6               | mov                 dword ptr [esp + 0x20], esi

        $sequence_3 = { 897570 33c0 48894578 48898580000000 48898588000000 48898590000000 }
            // n = 6, score = 100
            //   897570               | lea                 edx, [0x23380]
            //   33c0                 | dec                 eax
            //   48894578             | mov                 dword ptr [esp + 0x40], eax
            //   48898580000000       | dec                 eax
            //   48898588000000       | lea                 eax, [ebp - 0x78]
            //   48898590000000       | dec                 eax

        $sequence_4 = { 720c 488b8d98000000 e8???????? 48c785b00000000f000000 4889bda8000000 c6859800000000 4883bd9000000010 }
            // n = 7, score = 100
            //   720c                 | dec                 eax
            //   488b8d98000000       | cmp                 dword ptr [ebp + 8], 0x10
            //   e8????????           |                     
            //   48c785b00000000f000000     | dec    eax
            //   4889bda8000000       | cmovae              ecx, dword ptr [ebp - 0x10]
            //   c6859800000000       | dec                 eax
            //   4883bd9000000010     | lea                 ecx, [esp + 0x40]

        $sequence_5 = { 41b900100000 4d8d4601 33d2 488bc8 ff15???????? 488be8 4885c0 }
            // n = 7, score = 100
            //   41b900100000         | mov                 ebx, dword ptr [esp + 0x48]
            //   4d8d4601             | dec                 eax
            //   33d2                 | mov                 ebp, dword ptr [esp + 0x50]
            //   488bc8               | dec                 eax
            //   ff15????????         |                     
            //   488be8               | add                 esp, 0x20
            //   4885c0               | inc                 ecx

        $sequence_6 = { f0ff05???????? 751d 488d1dc2350200 bf04000000 488bcb e8???????? 4883c328 }
            // n = 7, score = 100
            //   f0ff05????????       |                     
            //   751d                 | mov                 byte ptr [esp + 0x20], ch
            //   488d1dc2350200       | inc                 ebp
            //   bf04000000           | xor                 eax, eax
            //   488bcb               | dec                 eax
            //   e8????????           |                     
            //   4883c328             | lea                 edx, [0x29306]

        $sequence_7 = { 488bd7 e8???????? 90 48c74424380f000000 }
            // n = 4, score = 100
            //   488bd7               | dec                 eax
            //   e8????????           |                     
            //   90                   | mov                 dword ptr [edi + 0x10], ebx
            //   48c74424380f000000     | dec    eax

        $sequence_8 = { 488b4df7 e8???????? 48c7450f0f000000 48897d07 c645f700 48837def10 7209 }
            // n = 7, score = 100
            //   488b4df7             | mov                 dword ptr [ebp - 0x79], ecx
            //   e8????????           |                     
            //   48c7450f0f000000     | dec                 esp
            //   48897d07             | mov                 dword ptr [ebp - 0x31], eax
            //   c645f700             | dec                 eax
            //   48837def10           | mov                 dword ptr [ebp - 0x10], 0xf
            //   7209                 | dec                 eax

        $sequence_9 = { 488d4db8 e8???????? 48833d????????00 0f84f9070000 488d154f180200 488d4db8 }
            // n = 6, score = 100
            //   488d4db8             | dec                 eax
            //   e8????????           |                     
            //   48833d????????00     |                     
            //   0f84f9070000         | lea                 edx, [ebp - 1]
            //   488d154f180200       | dec                 eax
            //   488d4db8             | lea                 ecx, [ebp - 0x39]

    condition:
        7 of them and filesize < 497664
}