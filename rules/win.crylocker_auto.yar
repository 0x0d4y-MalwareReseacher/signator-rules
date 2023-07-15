rule win_crylocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.crylocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crylocker"
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
        $sequence_0 = { e8???????? 8b4c2438 8bf0 8b44243c 6a00 50 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b4c2438             | mov                 ecx, dword ptr [esp + 0x38]
            //   8bf0                 | mov                 esi, eax
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_1 = { c744243800000280 c744243c000001e0 c744244008020000 c744244400bab34b 895c241c }
            // n = 5, score = 100
            //   c744243800000280     | mov                 dword ptr [esp + 0x38], 0x80020000
            //   c744243c000001e0     | mov                 dword ptr [esp + 0x3c], 0xe0010000
            //   c744244008020000     | mov                 dword ptr [esp + 0x40], 0x208
            //   c744244400bab34b     | mov                 dword ptr [esp + 0x44], 0x4bb3ba00
            //   895c241c             | mov                 dword ptr [esp + 0x1c], ebx

        $sequence_2 = { 394c243c 0f8711ffffff 5f 5b }
            // n = 4, score = 100
            //   394c243c             | cmp                 dword ptr [esp + 0x3c], ecx
            //   0f8711ffffff         | ja                  0xffffff17
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_3 = { 7520 8b4c2424 6a00 6a00 }
            // n = 4, score = 100
            //   7520                 | jne                 0x22
            //   8b4c2424             | mov                 ecx, dword ptr [esp + 0x24]
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_4 = { 55 57 ff15???????? 8b4c241c 03f0 }
            // n = 5, score = 100
            //   55                   | push                ebp
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   03f0                 | add                 esi, eax

        $sequence_5 = { 6a00 57 e9???????? e8???????? 85c0 7458 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   57                   | push                edi
            //   e9????????           |                     
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7458                 | je                  0x5a

        $sequence_6 = { 85c0 7937 6a01 6814010000 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7937                 | jns                 0x39
            //   6a01                 | push                1
            //   6814010000           | push                0x114

        $sequence_7 = { 52 e8???????? e8???????? e8???????? 8b0d???????? 8d442420 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   8d442420             | lea                 eax, [esp + 0x20]

        $sequence_8 = { 56 e8???????? 8b442414 6a64 }
            // n = 4, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   6a64                 | push                0x64

        $sequence_9 = { 8bd8 51 895c2428 e8???????? 8b15???????? 83c408 }
            // n = 6, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   51                   | push                ecx
            //   895c2428             | mov                 dword ptr [esp + 0x28], ebx
            //   e8????????           |                     
            //   8b15????????         |                     
            //   83c408               | add                 esp, 8

    condition:
        7 of them and filesize < 139264
}