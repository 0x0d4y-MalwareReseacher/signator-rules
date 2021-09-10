rule win_blackcoffee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.blackcoffee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackcoffee"
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
        $sequence_0 = { 6a01 53 68???????? ff15???????? 85c0 0f8ce2000000 8b45f4 }
            // n = 7, score = 100
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   68????????           |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8ce2000000         | jl                  0xe8
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_1 = { f3ab 66ab aa 33c0 8d7df4 ab }
            // n = 6, score = 100
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   33c0                 | xor                 eax, eax
            //   8d7df4               | lea                 edi, dword ptr [ebp - 0xc]
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_2 = { 6a40 ff15???????? bb???????? 8bf0 53 e8???????? 40 }
            // n = 7, score = 100
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   bb????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   53                   | push                ebx
            //   e8????????           |                     
            //   40                   | inc                 eax

        $sequence_3 = { 81ec74030000 56 33f6 33c9 8d858cfeffff 660fbe91e0c60010 }
            // n = 6, score = 100
            //   81ec74030000         | sub                 esp, 0x374
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   33c9                 | xor                 ecx, ecx
            //   8d858cfeffff         | lea                 eax, dword ptr [ebp - 0x174]
            //   660fbe91e0c60010     | movsx               dx, byte ptr [ecx + 0x1000c6e0]

        $sequence_4 = { 6a40 ffd7 8b4d10 8b55e4 8901 8910 ff75e4 }
            // n = 7, score = 100
            //   6a40                 | push                0x40
            //   ffd7                 | call                edi
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8910                 | mov                 dword ptr [eax], edx
            //   ff75e4               | push                dword ptr [ebp - 0x1c]

        $sequence_5 = { 0fb6c0 50 8d85dcfeffff ff750c 68???????? 53 }
            // n = 6, score = 100
            //   0fb6c0               | movzx               eax, al
            //   50                   | push                eax
            //   8d85dcfeffff         | lea                 eax, dword ptr [ebp - 0x124]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   68????????           |                     
            //   53                   | push                ebx

        $sequence_6 = { 8d45f4 50 8b45fc 53 56 }
            // n = 5, score = 100
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_7 = { 5b c9 c3 8b442404 57 33ff 3bc7 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   3bc7                 | cmp                 eax, edi

        $sequence_8 = { 57 56 b8???????? 57 50 50 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   56                   | push                esi
            //   b8????????           |                     
            //   57                   | push                edi
            //   50                   | push                eax
            //   50                   | push                eax

        $sequence_9 = { 50 53 68???????? ff75f8 ff15???????? 85c0 7574 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   53                   | push                ebx
            //   68????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7574                 | jne                 0x76

    condition:
        7 of them and filesize < 118784
}