rule win_tofsee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.tofsee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tofsee"
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
        $sequence_0 = { 41 890e c60000 eb07 8b45f0 830c30ff 83c604 }
            // n = 7, score = 400
            //   41                   | inc                 ecx
            //   890e                 | mov                 dword ptr [esi], ecx
            //   c60000               | mov                 byte ptr [eax], 0
            //   eb07                 | jmp                 9
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   830c30ff             | or                  dword ptr [eax + esi], 0xffffffff
            //   83c604               | add                 esi, 4

        $sequence_1 = { 83e001 895108 c3 55 8bec 83ec14 53 }
            // n = 7, score = 400
            //   83e001               | and                 eax, 1
            //   895108               | mov                 dword ptr [ecx + 8], edx
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec14               | sub                 esp, 0x14
            //   53                   | push                ebx

        $sequence_2 = { 56 a3???????? e8???????? 6a28 68???????? 57 56 }
            // n = 7, score = 400
            //   56                   | push                esi
            //   a3????????           |                     
            //   e8????????           |                     
            //   6a28                 | push                0x28
            //   68????????           |                     
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_3 = { 6a7d 50 e8???????? 85c0 59 59 }
            // n = 6, score = 400
            //   6a7d                 | push                0x7d
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_4 = { 5f 83660c00 8bce 5e e9???????? 53 56 }
            // n = 7, score = 400
            //   5f                   | pop                 edi
            //   83660c00             | and                 dword ptr [esi + 0xc], 0
            //   8bce                 | mov                 ecx, esi
            //   5e                   | pop                 esi
            //   e9????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_5 = { e8???????? 83c40c 8d85d8fcffff 50 ff75f4 ff15???????? 85c0 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85d8fcffff         | lea                 eax, [ebp - 0x328]
            //   50                   | push                eax
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_6 = { 83f8ff 0f84d3000000 6639b58efeffff 8975f8 8975f4 7663 6a28 }
            // n = 7, score = 400
            //   83f8ff               | cmp                 eax, -1
            //   0f84d3000000         | je                  0xd9
            //   6639b58efeffff       | cmp                 word ptr [ebp - 0x172], si
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   7663                 | jbe                 0x65
            //   6a28                 | push                0x28

        $sequence_7 = { 50 ff75fc e8???????? 83c418 85c0 7f55 ff75fc }
            // n = 7, score = 400
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7f55                 | jg                  0x57
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_8 = { 2bd0 03c1 2bd1 8b4df4 8d443030 52 50 }
            // n = 7, score = 400
            //   2bd0                 | sub                 edx, eax
            //   03c1                 | add                 eax, ecx
            //   2bd1                 | sub                 edx, ecx
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   8d443030             | lea                 eax, [eax + esi + 0x30]
            //   52                   | push                edx
            //   50                   | push                eax

        $sequence_9 = { 50 ff15???????? eb05 bf80000000 33c0 50 57 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   eb05                 | jmp                 7
            //   bf80000000           | mov                 edi, 0x80
            //   33c0                 | xor                 eax, eax
            //   50                   | push                eax
            //   57                   | push                edi

    condition:
        7 of them and filesize < 147456
}