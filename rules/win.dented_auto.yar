rule win_dented_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.dented."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dented"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { 8d4c2410 8bf0 e8???????? 8364242c00 8d4c2434 }
            // n = 5, score = 400
            //   8d4c2410             | lea                 ecx, [esp + 0x10]
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     
            //   8364242c00           | and                 dword ptr [esp + 0x2c], 0
            //   8d4c2434             | lea                 ecx, [esp + 0x34]

        $sequence_1 = { 7417 83e80e 7407 5d ff25???????? ff7508 ff15???????? }
            // n = 7, score = 400
            //   7417                 | je                  0x19
            //   83e80e               | sub                 eax, 0xe
            //   7407                 | je                  9
            //   5d                   | pop                 ebp
            //   ff25????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     

        $sequence_2 = { 56 57 bf94000000 8d8560ffffff 57 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   57                   | push                edi
            //   bf94000000           | mov                 edi, 0x94
            //   8d8560ffffff         | lea                 eax, [ebp - 0xa0]
            //   57                   | push                edi

        $sequence_3 = { 8bda 33c0 57 8bf9 }
            // n = 4, score = 400
            //   8bda                 | mov                 ebx, edx
            //   33c0                 | xor                 eax, eax
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx

        $sequence_4 = { 880c16 eb12 8b85f8f7ffff 8a8485fcfbffff 32c1 }
            // n = 5, score = 400
            //   880c16               | mov                 byte ptr [esi + edx], cl
            //   eb12                 | jmp                 0x14
            //   8b85f8f7ffff         | mov                 eax, dword ptr [ebp - 0x808]
            //   8a8485fcfbffff       | mov                 al, byte ptr [ebp + eax*4 - 0x404]
            //   32c1                 | xor                 al, cl

        $sequence_5 = { 53 8d85a8fdffff 50 ffd6 85c0 }
            // n = 5, score = 400
            //   53                   | push                ebx
            //   8d85a8fdffff         | lea                 eax, [ebp - 0x258]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax

        $sequence_6 = { 53 6a00 8985dcfdffff ff15???????? 83a5e8fdffff00 53 }
            // n = 6, score = 400
            //   53                   | push                ebx
            //   6a00                 | push                0
            //   8985dcfdffff         | mov                 dword ptr [ebp - 0x224], eax
            //   ff15????????         |                     
            //   83a5e8fdffff00       | and                 dword ptr [ebp - 0x218], 0
            //   53                   | push                ebx

        $sequence_7 = { e8???????? 837dbc00 8b5d0c 8b7d10 7415 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   837dbc00             | cmp                 dword ptr [ebp - 0x44], 0
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   7415                 | je                  0x17

        $sequence_8 = { 51 8d95f4fdffff e8???????? 59 53 53 }
            // n = 6, score = 400
            //   51                   | push                ecx
            //   8d95f4fdffff         | lea                 edx, [ebp - 0x20c]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_9 = { 50 e8???????? 68???????? 8d85ecfbffff 57 50 e8???????? }
            // n = 7, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   8d85ecfbffff         | lea                 eax, [ebp - 0x414]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 450560
}