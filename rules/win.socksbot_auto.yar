rule win_socksbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.socksbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.socksbot"
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
        $sequence_0 = { 8bec 83ec40 8d45c0 57 50 68???????? }
            // n = 6, score = 300
            //   8bec                 | mov                 ebp, esp
            //   83ec40               | sub                 esp, 0x40
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   57                   | push                edi
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_1 = { eb21 8b4510 53 2bc6 50 8b450c 03c6 }
            // n = 7, score = 300
            //   eb21                 | jmp                 0x23
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   53                   | push                ebx
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   03c6                 | add                 eax, esi

        $sequence_2 = { 3b4d0c 7cd0 5f 5e 5b c9 c3 }
            // n = 7, score = 300
            //   3b4d0c               | cmp                 ecx, dword ptr [ebp + 0xc]
            //   7cd0                 | jl                  0xffffffd2
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c3                   | ret                 

        $sequence_3 = { ff15???????? 8bd0 33c9 85d2 7e22 53 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax
            //   33c9                 | xor                 ecx, ecx
            //   85d2                 | test                edx, edx
            //   7e22                 | jle                 0x24
            //   53                   | push                ebx

        $sequence_4 = { 8b00 ff30 ff15???????? 85c0 74eb 53 56 }
            // n = 7, score = 300
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ff30                 | push                dword ptr [eax]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   74eb                 | je                  0xffffffed
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_5 = { 7433 50 56 ff15???????? 682000cc00 57 }
            // n = 6, score = 300
            //   7433                 | je                  0x35
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   682000cc00           | push                0xcc0020
            //   57                   | push                edi

        $sequence_6 = { 85c9 7905 0fb7c1 eb05 8d4302 03c1 50 }
            // n = 7, score = 300
            //   85c9                 | test                ecx, ecx
            //   7905                 | jns                 7
            //   0fb7c1               | movzx               eax, cx
            //   eb05                 | jmp                 7
            //   8d4302               | lea                 eax, [ebx + 2]
            //   03c1                 | add                 eax, ecx
            //   50                   | push                eax

        $sequence_7 = { ff15???????? 46 83fe64 7ce2 ff7508 e8???????? 59 }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   46                   | inc                 esi
            //   83fe64               | cmp                 esi, 0x64
            //   7ce2                 | jl                  0xffffffe4
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_8 = { 42 8815???????? 881408 ff15???????? 83fe08 7c78 33db }
            // n = 7, score = 300
            //   42                   | inc                 edx
            //   8815????????         |                     
            //   881408               | mov                 byte ptr [eax + ecx], dl
            //   ff15????????         |                     
            //   83fe08               | cmp                 esi, 8
            //   7c78                 | jl                  0x7a
            //   33db                 | xor                 ebx, ebx

        $sequence_9 = { 59 50 56 ff15???????? ff750c }
            // n = 5, score = 300
            //   59                   | pop                 ecx
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]

    condition:
        7 of them and filesize < 73728
}