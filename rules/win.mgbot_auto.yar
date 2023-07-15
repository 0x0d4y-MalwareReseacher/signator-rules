rule win_mgbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.mgbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mgbot"
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
        $sequence_0 = { 5e c20400 ff742408 ff742408 e8???????? }
            // n = 5, score = 200
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   ff742408             | push                dword ptr [esp + 8]
            //   ff742408             | push                dword ptr [esp + 8]
            //   e8????????           |                     

        $sequence_1 = { 8be5 5d c20800 6808020000 e8???????? }
            // n = 5, score = 200
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6808020000           | push                0x208
            //   e8????????           |                     

        $sequence_2 = { 6808020000 e8???????? 6804010000 8bf0 6a00 56 e8???????? }
            // n = 7, score = 200
            //   6808020000           | push                0x208
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   8bf0                 | mov                 esi, eax
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_3 = { 5d c20800 6808020000 e8???????? }
            // n = 4, score = 200
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6808020000           | push                0x208
            //   e8????????           |                     

        $sequence_4 = { 6808020000 e8???????? 6804010000 8bf0 }
            // n = 4, score = 200
            //   6808020000           | push                0x208
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   8bf0                 | mov                 esi, eax

        $sequence_5 = { 5b 8be5 5d c20800 6808020000 e8???????? }
            // n = 6, score = 200
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6808020000           | push                0x208
            //   e8????????           |                     

        $sequence_6 = { 5b 8be5 5d c20800 6808020000 }
            // n = 5, score = 200
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6808020000           | push                0x208

        $sequence_7 = { 6808020000 e8???????? 6804010000 8bf0 6a00 }
            // n = 5, score = 200
            //   6808020000           | push                0x208
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   8bf0                 | mov                 esi, eax
            //   6a00                 | push                0

        $sequence_8 = { 8be5 5d c20800 6808020000 }
            // n = 4, score = 200
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   6808020000           | push                0x208

        $sequence_9 = { 6808020000 e8???????? 6804010000 8bf0 6a00 56 }
            // n = 6, score = 200
            //   6808020000           | push                0x208
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   8bf0                 | mov                 esi, eax
            //   6a00                 | push                0
            //   56                   | push                esi

    condition:
        7 of them and filesize < 1677312
}