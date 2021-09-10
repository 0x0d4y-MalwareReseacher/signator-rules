rule win_laziok_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.laziok."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.laziok"
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
        $sequence_0 = { 6a00 6a0c a3???????? e8???????? a3???????? c3 }
            // n = 6, score = 900
            //   6a00                 | push                0
            //   6a0c                 | push                0xc
            //   a3????????           |                     
            //   e8????????           |                     
            //   a3????????           |                     
            //   c3                   | ret                 

        $sequence_1 = { 8b4610 6a10 8d4df0 51 6a00 }
            // n = 5, score = 900
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   6a10                 | push                0x10
            //   8d4df0               | lea                 ecx, dword ptr [ebp - 0x10]
            //   51                   | push                ecx
            //   6a00                 | push                0

        $sequence_2 = { 8b460c 56 85c0 7524 eb11 }
            // n = 5, score = 900
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   56                   | push                esi
            //   85c0                 | test                eax, eax
            //   7524                 | jne                 0x26
            //   eb11                 | jmp                 0x13

        $sequence_3 = { 56 68???????? ff74240c 33f6 e8???????? 59 }
            // n = 6, score = 900
            //   56                   | push                esi
            //   68????????           |                     
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   33f6                 | xor                 esi, esi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_4 = { b801000000 eb02 31c0 21c0 7407 b801000000 }
            // n = 6, score = 900
            //   b801000000           | mov                 eax, 1
            //   eb02                 | jmp                 4
            //   31c0                 | xor                 eax, eax
            //   21c0                 | and                 eax, eax
            //   7407                 | je                  9
            //   b801000000           | mov                 eax, 1

        $sequence_5 = { 59 8b4c240c 03c6 8901 }
            // n = 4, score = 900
            //   59                   | pop                 ecx
            //   8b4c240c             | mov                 ecx, dword ptr [esp + 0xc]
            //   03c6                 | add                 eax, esi
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_6 = { 8bc6 5e c3 56 68???????? ff74240c e8???????? }
            // n = 7, score = 900
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   56                   | push                esi
            //   68????????           |                     
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   e8????????           |                     

        $sequence_7 = { 740a 8b4c240c 8b742408 8901 }
            // n = 4, score = 900
            //   740a                 | je                  0xc
            //   8b4c240c             | mov                 ecx, dword ptr [esp + 0xc]
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   8901                 | mov                 dword ptr [ecx], eax

    condition:
        7 of them and filesize < 688128
}