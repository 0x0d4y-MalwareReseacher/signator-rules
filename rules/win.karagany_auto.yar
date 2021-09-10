rule win_karagany_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.karagany."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.karagany"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 8945d0 8945d8 8945e0 8945e8 }
            // n = 4, score = 400
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax

        $sequence_1 = { 68???????? 8d85a4fdffff 50 ffd6 68???????? }
            // n = 5, score = 400
            //   68????????           |                     
            //   8d85a4fdffff         | lea                 eax, dword ptr [ebp - 0x25c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     

        $sequence_2 = { e8???????? 53 56 57 33db 680f270000 }
            // n = 6, score = 400
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33db                 | xor                 ebx, ebx
            //   680f270000           | push                0x270f

        $sequence_3 = { 57 8bf8 6a03 57 }
            // n = 4, score = 400
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3
            //   57                   | push                edi

        $sequence_4 = { 57 8bf8 6a03 57 ffd6 }
            // n = 5, score = 400
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3
            //   57                   | push                edi
            //   ffd6                 | call                esi

        $sequence_5 = { 56 8b35???????? 57 8bf8 6a03 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3

        $sequence_6 = { 6a64 ff15???????? 5f 5e 33c0 5b 8be5 }
            // n = 7, score = 400
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_7 = { 6a64 ff15???????? 5f 5e 33c0 5b }
            // n = 6, score = 400
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx

        $sequence_8 = { ff15???????? 6a64 ff15???????? 5f 5e 33c0 }
            // n = 6, score = 400
            //   ff15????????         |                     
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 8d85a4fdffff 50 ffd6 68???????? }
            // n = 4, score = 400
            //   8d85a4fdffff         | lea                 eax, dword ptr [ebp - 0x25c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     

    condition:
        7 of them and filesize < 180224
}