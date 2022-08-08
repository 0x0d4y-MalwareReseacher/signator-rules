rule win_jimmy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.jimmy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jimmy"
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
        $sequence_0 = { 0fb68050010000 85c0 7415 e8???????? 83f805 7229 a1???????? }
            // n = 7, score = 400
            //   0fb68050010000       | movzx               eax, byte ptr [eax + 0x150]
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17
            //   e8????????           |                     
            //   83f805               | cmp                 eax, 5
            //   7229                 | jb                  0x2b
            //   a1????????           |                     

        $sequence_1 = { 59 8945ec eb07 8b45ec 40 }
            // n = 5, score = 400
            //   59                   | pop                 ecx
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   eb07                 | jmp                 9
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   40                   | inc                 eax

        $sequence_2 = { 668945e0 6a25 58 668945e2 }
            // n = 4, score = 400
            //   668945e0             | mov                 word ptr [ebp - 0x20], ax
            //   6a25                 | push                0x25
            //   58                   | pop                 eax
            //   668945e2             | mov                 word ptr [ebp - 0x1e], ax

        $sequence_3 = { 6a73 58 668945b2 6a22 }
            // n = 4, score = 400
            //   6a73                 | push                0x73
            //   58                   | pop                 eax
            //   668945b2             | mov                 word ptr [ebp - 0x4e], ax
            //   6a22                 | push                0x22

        $sequence_4 = { ff55fc 83c41c c9 c3 55 8bec 51 }
            // n = 7, score = 400
            //   ff55fc               | call                dword ptr [ebp - 4]
            //   83c41c               | add                 esp, 0x1c
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx

        $sequence_5 = { ff75f4 e8???????? 59 8a45eb }
            // n = 4, score = 400
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8a45eb               | mov                 al, byte ptr [ebp - 0x15]

        $sequence_6 = { 8b4df8 89410c 8b45f8 ff700c }
            // n = 4, score = 400
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   89410c               | mov                 dword ptr [ecx + 0xc], eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   ff700c               | push                dword ptr [eax + 0xc]

        $sequence_7 = { 6a00 6a25 e8???????? 83c410 8945e8 8d45ec }
            // n = 6, score = 400
            //   6a00                 | push                0
            //   6a25                 | push                0x25
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8d45ec               | lea                 eax, [ebp - 0x14]

        $sequence_8 = { 50 ff75f0 ff55fc 83c414 85c0 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff55fc               | call                dword ptr [ebp - 4]
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax

        $sequence_9 = { 6a09 e8???????? 59 59 8945fc ff7514 ff7510 }
            // n = 7, score = 400
            //   6a09                 | push                9
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]

    condition:
        7 of them and filesize < 188416
}