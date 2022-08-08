rule win_outlook_backdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.outlook_backdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.outlook_backdoor"
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
        $sequence_0 = { 8365fc00 8b450c 83ec10 8bfc ff7510 8d75dc a5 }
            // n = 7, score = 600
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83ec10               | sub                 esp, 0x10
            //   8bfc                 | mov                 edi, esp
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8d75dc               | lea                 esi, [ebp - 0x24]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_1 = { 59 85c0 75e1 8365f000 803e2e 0f9445f7 807df700 }
            // n = 7, score = 600
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   75e1                 | jne                 0xffffffe3
            //   8365f000             | and                 dword ptr [ebp - 0x10], 0
            //   803e2e               | cmp                 byte ptr [esi], 0x2e
            //   0f9445f7             | sete                byte ptr [ebp - 9]
            //   807df700             | cmp                 byte ptr [ebp - 9], 0

        $sequence_2 = { 8b4514 2bc6 40 50 8d3c1e 57 50 }
            // n = 7, score = 600
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   2bc6                 | sub                 eax, esi
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   8d3c1e               | lea                 edi, [esi + ebx]
            //   57                   | push                edi
            //   50                   | push                eax

        $sequence_3 = { 8bcb e8???????? 84c0 0f8497000000 8b4704 8b4808 }
            // n = 6, score = 600
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f8497000000         | je                  0x9d
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]

        $sequence_4 = { 897de8 c645fc01 85ff 7411 ff7510 8b4d14 }
            // n = 6, score = 600
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   85ff                 | test                edi, edi
            //   7411                 | je                  0x13
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]

        $sequence_5 = { 83f802 750d 8b45e8 8b7de4 2bc7 83f802 7309 }
            // n = 7, score = 600
            //   83f802               | cmp                 eax, 2
            //   750d                 | jne                 0xf
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   8b7de4               | mov                 edi, dword ptr [ebp - 0x1c]
            //   2bc7                 | sub                 eax, edi
            //   83f802               | cmp                 eax, 2
            //   7309                 | jae                 0xb

        $sequence_6 = { 8d54243c 52 50 ff5124 8bf0 e8???????? }
            // n = 6, score = 600
            //   8d54243c             | lea                 edx, [esp + 0x3c]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff5124               | call                dword ptr [ecx + 0x24]
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     

        $sequence_7 = { 5b 59 c3 55 8bec 83e4f8 6aff }
            // n = 7, score = 600
            //   5b                   | pop                 ebx
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83e4f8               | and                 esp, 0xfffffff8
            //   6aff                 | push                -1

        $sequence_8 = { ff15???????? 832600 ff4e10 7517 6800800000 6a00 ff760c }
            // n = 7, score = 600
            //   ff15????????         |                     
            //   832600               | and                 dword ptr [esi], 0
            //   ff4e10               | dec                 dword ptr [esi + 0x10]
            //   7517                 | jne                 0x19
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   ff760c               | push                dword ptr [esi + 0xc]

        $sequence_9 = { 59 85ff 7504 33c9 eb07 8b07 8b4804 }
            // n = 7, score = 600
            //   59                   | pop                 ecx
            //   85ff                 | test                edi, edi
            //   7504                 | jne                 6
            //   33c9                 | xor                 ecx, ecx
            //   eb07                 | jmp                 9
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   8b4804               | mov                 ecx, dword ptr [eax + 4]

    condition:
        7 of them and filesize < 2912256
}