rule win_miniasp_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.miniasp."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miniasp"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 8b8530dfffff 8b400c 48 89857cdeffff }
            // n = 4, score = 100
            //   8b8530dfffff         | mov                 eax, dword ptr [ebp - 0x20d0]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   48                   | dec                 eax
            //   89857cdeffff         | mov                 dword ptr [ebp - 0x2184], eax

        $sequence_1 = { 807dbf00 75ef 8b45c4 2b45c0 8945b8 8b45b8 }
            // n = 6, score = 100
            //   807dbf00             | cmp                 byte ptr [ebp - 0x41], 0
            //   75ef                 | jne                 0xfffffff1
            //   8b45c4               | mov                 eax, dword ptr [ebp - 0x3c]
            //   2b45c0               | sub                 eax, dword ptr [ebp - 0x40]
            //   8945b8               | mov                 dword ptr [ebp - 0x48], eax
            //   8b45b8               | mov                 eax, dword ptr [ebp - 0x48]

        $sequence_2 = { 80bd2fdeffff00 75e3 8b8534deffff 2b8530deffff 8b8d30deffff }
            // n = 5, score = 100
            //   80bd2fdeffff00       | cmp                 byte ptr [ebp - 0x21d1], 0
            //   75e3                 | jne                 0xffffffe5
            //   8b8534deffff         | mov                 eax, dword ptr [ebp - 0x21cc]
            //   2b8530deffff         | sub                 eax, dword ptr [ebp - 0x21d0]
            //   8b8d30deffff         | mov                 ecx, dword ptr [ebp - 0x21d0]

        $sequence_3 = { 59 8945fc 68???????? 8b45fc 40 40 50 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   68????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   40                   | inc                 eax
            //   50                   | push                eax

        $sequence_4 = { e8???????? 50 68???????? 8b45ec ffb0a4000000 e8???????? 83c40c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   ffb0a4000000         | push                dword ptr [eax + 0xa4]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { 2b45ec 8945e4 8b45fc 0345e4 8945fc ff7510 }
            // n = 6, score = 100
            //   2b45ec               | sub                 eax, dword ptr [ebp - 0x14]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0345e4               | add                 eax, dword ptr [ebp - 0x1c]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_6 = { 68???????? 68???????? 8b4dbc e8???????? 0fb6c0 85c0 7420 }
            // n = 7, score = 100
            //   68????????           |                     
            //   68????????           |                     
            //   8b4dbc               | mov                 ecx, dword ptr [ebp - 0x44]
            //   e8????????           |                     
            //   0fb6c0               | movzx               eax, al
            //   85c0                 | test                eax, eax
            //   7420                 | je                  0x22

        $sequence_7 = { c20400 55 8bec 83ec34 56 57 894dec }
            // n = 7, score = 100
            //   c20400               | ret                 4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec34               | sub                 esp, 0x34
            //   56                   | push                esi
            //   57                   | push                edi
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx

        $sequence_8 = { 80bdcbfbffff00 75e3 8b85d0fbffff 2b85ccfbffff 8b8dccfbffff 898dc4fbffff 8985c0fbffff }
            // n = 7, score = 100
            //   80bdcbfbffff00       | cmp                 byte ptr [ebp - 0x435], 0
            //   75e3                 | jne                 0xffffffe5
            //   8b85d0fbffff         | mov                 eax, dword ptr [ebp - 0x430]
            //   2b85ccfbffff         | sub                 eax, dword ptr [ebp - 0x434]
            //   8b8dccfbffff         | mov                 ecx, dword ptr [ebp - 0x434]
            //   898dc4fbffff         | mov                 dword ptr [ebp - 0x43c], ecx
            //   8985c0fbffff         | mov                 dword ptr [ebp - 0x440], eax

        $sequence_9 = { e8???????? 83c410 68???????? 68???????? 8b45fc ffb094000000 8b4dfc }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   68????????           |                     
            //   68????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   ffb094000000         | push                dword ptr [eax + 0x94]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 139264
}