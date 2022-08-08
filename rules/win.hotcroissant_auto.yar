rule win_hotcroissant_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.hotcroissant."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hotcroissant"
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
        $sequence_0 = { 68703a0000 8d958cc5ffff 52 50 }
            // n = 4, score = 500
            //   68703a0000           | push                0x3a70
            //   8d958cc5ffff         | lea                 edx, [ebp - 0x3a74]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_1 = { 33c0 52 a3???????? a3???????? a3???????? }
            // n = 5, score = 500
            //   33c0                 | xor                 eax, eax
            //   52                   | push                edx
            //   a3????????           |                     
            //   a3????????           |                     
            //   a3????????           |                     

        $sequence_2 = { c3 e8???????? 6a00 c705????????00000000 ff15???????? 6a00 c705????????00000000 }
            // n = 7, score = 500
            //   c3                   | ret                 
            //   e8????????           |                     
            //   6a00                 | push                0
            //   c705????????00000000     |     
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   c705????????00000000     |     

        $sequence_3 = { 33c0 52 a3???????? a3???????? }
            // n = 4, score = 500
            //   33c0                 | xor                 eax, eax
            //   52                   | push                edx
            //   a3????????           |                     
            //   a3????????           |                     

        $sequence_4 = { 51 56 33f6 ba8bd6b800 }
            // n = 4, score = 500
            //   51                   | push                ecx
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   ba8bd6b800           | mov                 edx, 0xb8d68b

        $sequence_5 = { c705????????01000000 ffd6 6800040000 68???????? 68???????? }
            // n = 5, score = 500
            //   c705????????01000000     |     
            //   ffd6                 | call                esi
            //   6800040000           | push                0x400
            //   68????????           |                     
            //   68????????           |                     

        $sequence_6 = { 52 ffd6 893d???????? 893d???????? }
            // n = 4, score = 500
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   893d????????         |                     
            //   893d????????         |                     

        $sequence_7 = { b117 8955fc b829704902 39750c }
            // n = 4, score = 500
            //   b117                 | mov                 cl, 0x17
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   b829704902           | mov                 eax, 0x2497029
            //   39750c               | cmp                 dword ptr [ebp + 0xc], esi

        $sequence_8 = { c705????????01000000 ffd6 6800040000 68???????? 68???????? 68???????? ffd6 }
            // n = 7, score = 500
            //   c705????????01000000     |     
            //   ffd6                 | call                esi
            //   6800040000           | push                0x400
            //   68????????           |                     
            //   68????????           |                     
            //   68????????           |                     
            //   ffd6                 | call                esi

        $sequence_9 = { 33c9 7707 3d00400000 7608 }
            // n = 4, score = 500
            //   33c9                 | xor                 ecx, ecx
            //   7707                 | ja                  9
            //   3d00400000           | cmp                 eax, 0x4000
            //   7608                 | jbe                 0xa

    condition:
        7 of them and filesize < 591872
}