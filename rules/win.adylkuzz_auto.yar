rule win_adylkuzz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.adylkuzz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.adylkuzz"
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
        $sequence_0 = { c1e104 034c2428 894c2424 6681cf0043 66897b74 66894370 66c743720e00 }
            // n = 7, score = 100
            //   c1e104               | shl                 ecx, 4
            //   034c2428             | add                 ecx, dword ptr [esp + 0x28]
            //   894c2424             | mov                 dword ptr [esp + 0x24], ecx
            //   6681cf0043           | or                  di, 0x4300
            //   66897b74             | mov                 word ptr [ebx + 0x74], di
            //   66894370             | mov                 word ptr [ebx + 0x70], ax
            //   66c743720e00         | mov                 word ptr [ebx + 0x72], 0xe

        $sequence_1 = { e8???????? c744240810000000 31ed c744240400000000 891c24 e8???????? c744241c00000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c744240810000000     | mov                 dword ptr [esp + 8], 0x10
            //   31ed                 | xor                 ebp, ebp
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   891c24               | mov                 dword ptr [esp], ebx
            //   e8????????           |                     
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0

        $sequence_2 = { f5 81ed04000000 66f7c6ae1b 89442500 f9 660fabd8 8b06 }
            // n = 7, score = 100
            //   f5                   | cmc                 
            //   81ed04000000         | sub                 ebp, 4
            //   66f7c6ae1b           | test                si, 0x1bae
            //   89442500             | mov                 dword ptr [ebp], eax
            //   f9                   | stc                 
            //   660fabd8             | bts                 ax, bx
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_3 = { f7c4fc11101e f7d0 33d8 f5 03f8 e9???????? 98 }
            // n = 7, score = 100
            //   f7c4fc11101e         | test                esp, 0x1e1011fc
            //   f7d0                 | not                 eax
            //   33d8                 | xor                 ebx, eax
            //   f5                   | cmc                 
            //   03f8                 | add                 edi, eax
            //   e9????????           |                     
            //   98                   | cwde                

        $sequence_4 = { 89d6 53 89cb 50 8b415c 8b0a 8b10 }
            // n = 7, score = 100
            //   89d6                 | mov                 esi, edx
            //   53                   | push                ebx
            //   89cb                 | mov                 ebx, ecx
            //   50                   | push                eax
            //   8b415c               | mov                 eax, dword ptr [ecx + 0x5c]
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   8b10                 | mov                 edx, dword ptr [eax]

        $sequence_5 = { e8???????? 8b442414 c1e008 89c2 89442414 81ca4900ff7f 89f0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   c1e008               | shl                 eax, 8
            //   89c2                 | mov                 edx, eax
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   81ca4900ff7f         | or                  edx, 0x7fff0049
            //   89f0                 | mov                 eax, esi

        $sequence_6 = { ff4f14 8b00 89c6 0fb6c0 81e600ffff00 83c002 eb3f }
            // n = 7, score = 100
            //   ff4f14               | dec                 dword ptr [edi + 0x14]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   89c6                 | mov                 esi, eax
            //   0fb6c0               | movzx               eax, al
            //   81e600ffff00         | and                 esi, 0xffff00
            //   83c002               | add                 eax, 2
            //   eb3f                 | jmp                 0x41

        $sequence_7 = { e8???????? 85c0 0f84510c0000 8d442468 89442410 8d842490000000 8944240c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84510c0000         | je                  0xc57
            //   8d442468             | lea                 eax, [esp + 0x68]
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   8d842490000000       | lea                 eax, [esp + 0x90]
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax

        $sequence_8 = { c7442408ffffffff c744240400000000 890424 e8???????? 85c0 0f8579ffffff 8b85d4feffff }
            // n = 7, score = 100
            //   c7442408ffffffff     | mov                 dword ptr [esp + 8], 0xffffffff
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8579ffffff         | jne                 0xffffff7f
            //   8b85d4feffff         | mov                 eax, dword ptr [ebp - 0x12c]

        $sequence_9 = { db44240c dd1a 8b5314 8944240c b802000000 db44240c dd5a08 }
            // n = 7, score = 100
            //   db44240c             | fild                dword ptr [esp + 0xc]
            //   dd1a                 | fstp                qword ptr [edx]
            //   8b5314               | mov                 edx, dword ptr [ebx + 0x14]
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   b802000000           | mov                 eax, 2
            //   db44240c             | fild                dword ptr [esp + 0xc]
            //   dd5a08               | fstp                qword ptr [edx + 8]

    condition:
        7 of them and filesize < 6438912
}