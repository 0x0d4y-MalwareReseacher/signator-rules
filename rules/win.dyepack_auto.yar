rule win_dyepack_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.dyepack."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dyepack"
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
        $sequence_0 = { 885c2420 f3ab 66ab 53 6880000000 6a03 53 }
            // n = 7, score = 300
            //   885c2420             | mov                 byte ptr [esp + 0x20], bl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   53                   | push                ebx
            //   6880000000           | push                0x80
            //   6a03                 | push                3
            //   53                   | push                ebx

        $sequence_1 = { 8d4c2418 53 51 8d54242c 6a01 52 56 }
            // n = 7, score = 300
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   8d54242c             | lea                 edx, dword ptr [esp + 0x2c]
            //   6a01                 | push                1
            //   52                   | push                edx
            //   56                   | push                esi

        $sequence_2 = { 6880000000 6a03 53 aa 8b842434100000 53 6800000040 }
            // n = 7, score = 300
            //   6880000000           | push                0x80
            //   6a03                 | push                3
            //   53                   | push                ebx
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8b842434100000       | mov                 eax, dword ptr [esp + 0x1034]
            //   53                   | push                ebx
            //   6800000040           | push                0x40000000

        $sequence_3 = { 3bf8 7cb2 7f08 8b4c2410 3be9 }
            // n = 5, score = 300
            //   3bf8                 | cmp                 edi, eax
            //   7cb2                 | jl                  0xffffffb4
            //   7f08                 | jg                  0xa
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   3be9                 | cmp                 ebp, ecx

        $sequence_4 = { 72ac 56 ff15???????? 56 }
            // n = 4, score = 300
            //   72ac                 | jb                  0xffffffae
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_5 = { 5f 5e 5b 81c414100000 c3 8b3d???????? }
            // n = 6, score = 300
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   81c414100000         | add                 esp, 0x1014
            //   c3                   | ret                 
            //   8b3d????????         |                     

        $sequence_6 = { 8b3d???????? 55 6a02 53 }
            // n = 4, score = 300
            //   8b3d????????         |                     
            //   55                   | push                ebp
            //   6a02                 | push                2
            //   53                   | push                ebx

        $sequence_7 = { 8b4c2410 2bcd 1bc7 7815 7f08 81f900100000 }
            // n = 6, score = 300
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   2bcd                 | sub                 ecx, ebp
            //   1bc7                 | sbb                 eax, edi
            //   7815                 | js                  0x17
            //   7f08                 | jg                  0xa
            //   81f900100000         | cmp                 ecx, 0x1000

        $sequence_8 = { ff15???????? 56 ff15???????? 8d442410 895c2410 50 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   895c2410             | mov                 dword ptr [esp + 0x10], ebx
            //   50                   | push                eax

        $sequence_9 = { 3bc3 7416 03e8 8b442414 13fb 3bf8 }
            // n = 6, score = 300
            //   3bc3                 | cmp                 eax, ebx
            //   7416                 | je                  0x18
            //   03e8                 | add                 ebp, eax
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   13fb                 | adc                 edi, ebx
            //   3bf8                 | cmp                 edi, eax

    condition:
        7 of them and filesize < 212992
}