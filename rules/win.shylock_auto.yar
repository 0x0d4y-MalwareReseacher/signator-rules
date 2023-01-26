rule win_shylock_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.shylock."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shylock"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { eb36 8b4514 85c0 7404 8b0b 8908 85ff }
            // n = 7, score = 500
            //   eb36                 | jmp                 0x38
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   8908                 | mov                 dword ptr [eax], ecx
            //   85ff                 | test                edi, edi

        $sequence_1 = { e8???????? 8db53cffffff e8???????? 8d7db0 e8???????? 8d45b0 50 }
            // n = 7, score = 500
            //   e8????????           |                     
            //   8db53cffffff         | lea                 esi, [ebp - 0xc4]
            //   e8????????           |                     
            //   8d7db0               | lea                 edi, [ebp - 0x50]
            //   e8????????           |                     
            //   8d45b0               | lea                 eax, [ebp - 0x50]
            //   50                   | push                eax

        $sequence_2 = { e8???????? 8d75e0 e8???????? 8d75e8 e8???????? 8b450c 83c018 }
            // n = 7, score = 500
            //   e8????????           |                     
            //   8d75e0               | lea                 esi, [ebp - 0x20]
            //   e8????????           |                     
            //   8d75e8               | lea                 esi, [ebp - 0x18]
            //   e8????????           |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83c018               | add                 eax, 0x18

        $sequence_3 = { e8???????? 8d45f8 e8???????? 84c0 7526 68???????? }
            // n = 6, score = 500
            //   e8????????           |                     
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7526                 | jne                 0x28
            //   68????????           |                     

        $sequence_4 = { 8d45d4 50 e8???????? 8b45f4 85c0 7403 c60000 }
            // n = 7, score = 500
            //   8d45d4               | lea                 eax, [ebp - 0x2c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5
            //   c60000               | mov                 byte ptr [eax], 0

        $sequence_5 = { b8???????? e8???????? 59 8bce 51 ff7508 e8???????? }
            // n = 7, score = 500
            //   b8????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bce                 | mov                 ecx, esi
            //   51                   | push                ecx
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_6 = { e8???????? 83670800 8bc7 5e c3 55 8bec }
            // n = 7, score = 500
            //   e8????????           |                     
            //   83670800             | and                 dword ptr [edi + 8], 0
            //   8bc7                 | mov                 eax, edi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_7 = { 59 3bc7 744b 397df0 7446 8d4de8 51 }
            // n = 7, score = 500
            //   59                   | pop                 ecx
            //   3bc7                 | cmp                 eax, edi
            //   744b                 | je                  0x4d
            //   397df0               | cmp                 dword ptr [ebp - 0x10], edi
            //   7446                 | je                  0x48
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   51                   | push                ecx

        $sequence_8 = { ff75fc ff75f8 e8???????? 83c410 83f801 7526 8d85e8feffff }
            // n = 7, score = 500
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   83f801               | cmp                 eax, 1
            //   7526                 | jne                 0x28
            //   8d85e8feffff         | lea                 eax, [ebp - 0x118]

        $sequence_9 = { c745e030313233 c745e434353637 66c745e83839 8945f8 750a 40 803c1820 }
            // n = 7, score = 500
            //   c745e030313233       | mov                 dword ptr [ebp - 0x20], 0x33323130
            //   c745e434353637       | mov                 dword ptr [ebp - 0x1c], 0x37363534
            //   66c745e83839         | mov                 word ptr [ebp - 0x18], 0x3938
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   750a                 | jne                 0xc
            //   40                   | inc                 eax
            //   803c1820             | cmp                 byte ptr [eax + ebx], 0x20

    condition:
        7 of them and filesize < 630784
}