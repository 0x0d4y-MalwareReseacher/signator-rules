rule win_malumpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.malumpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.malumpos"
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
        $sequence_0 = { 53 68???????? 6aff ff15???????? 68???????? }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   68????????           |                     
            //   6aff                 | push                -1
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_1 = { 4b 5b 52 7106 81f300000000 }
            // n = 5, score = 100
            //   4b                   | dec                 ebx
            //   5b                   | pop                 ebx
            //   52                   | push                edx
            //   7106                 | jno                 8
            //   81f300000000         | xor                 ebx, 0

        $sequence_2 = { ff35???????? a3???????? ffd0 a1???????? 8b4005 be???????? a3???????? }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   a3????????           |                     
            //   ffd0                 | call                eax
            //   a1????????           |                     
            //   8b4005               | mov                 eax, dword ptr [eax + 5]
            //   be????????           |                     
            //   a3????????           |                     

        $sequence_3 = { 50 83c404 51 7a03 c1e3e0 59 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   83c404               | add                 esp, 4
            //   51                   | push                ecx
            //   7a03                 | jp                  5
            //   c1e3e0               | shl                 ebx, 0xe0
            //   59                   | pop                 ecx

        $sequence_4 = { bb91d075da 5b 5b c1fba0 7805 0500000000 }
            // n = 6, score = 100
            //   bb91d075da           | mov                 ebx, 0xda75d091
            //   5b                   | pop                 ebx
            //   5b                   | pop                 ebx
            //   c1fba0               | sar                 ebx, 0xa0
            //   7805                 | js                  7
            //   0500000000           | add                 eax, 0

        $sequence_5 = { 53 7806 81cb00000000 5b 7c05 53 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   7806                 | js                  8
            //   81cb00000000         | or                  ebx, 0
            //   5b                   | pop                 ebx
            //   7c05                 | jl                  7
            //   53                   | push                ebx

        $sequence_6 = { 894534 8d4558 50 ff7754 ff35???????? ff35???????? }
            // n = 6, score = 100
            //   894534               | mov                 dword ptr [ebp + 0x34], eax
            //   8d4558               | lea                 eax, [ebp + 0x58]
            //   50                   | push                eax
            //   ff7754               | push                dword ptr [edi + 0x54]
            //   ff35????????         |                     
            //   ff35????????         |                     

        $sequence_7 = { 83c304 ff45f4 8b45f4 3b4614 729e eb08 8b45ec }
            // n = 7, score = 100
            //   83c304               | add                 ebx, 4
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   3b4614               | cmp                 eax, dword ptr [esi + 0x14]
            //   729e                 | jb                  0xffffffa0
            //   eb08                 | jmp                 0xa
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]

        $sequence_8 = { 8bf9 53 53 bb91d075da 5b 5b }
            // n = 6, score = 100
            //   8bf9                 | mov                 edi, ecx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   bb91d075da           | mov                 ebx, 0xda75d091
            //   5b                   | pop                 ebx
            //   5b                   | pop                 ebx

        $sequence_9 = { 8b00 8b4018 56 be???????? a3???????? }
            // n = 5, score = 100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b4018               | mov                 eax, dword ptr [eax + 0x18]
            //   56                   | push                esi
            //   be????????           |                     
            //   a3????????           |                     

    condition:
        7 of them and filesize < 542720
}