rule win_zeroaccess_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.zeroaccess."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeroaccess"
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
        $sequence_0 = { 85c0 7408 ff15???????? eb02 }
            // n = 4, score = 300
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   ff15????????         |                     
            //   eb02                 | jmp                 4

        $sequence_1 = { 56 56 6a20 6a05 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   56                   | push                esi
            //   6a20                 | push                0x20
            //   6a05                 | push                5

        $sequence_2 = { bf03000040 eb05 bf010000c0 85ff }
            // n = 4, score = 200
            //   bf03000040           | mov                 edi, 0x40000003
            //   eb05                 | jmp                 7
            //   bf010000c0           | mov                 edi, 0xc0000001
            //   85ff                 | test                edi, edi

        $sequence_3 = { 8b01 ff761c ff7618 ff5004 }
            // n = 4, score = 200
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff761c               | push                dword ptr [esi + 0x1c]
            //   ff7618               | push                dword ptr [esi + 0x18]
            //   ff5004               | call                dword ptr [eax + 4]

        $sequence_4 = { c3 8d4104 83caff f00fc110 750a 85c9 }
            // n = 6, score = 200
            //   c3                   | ret                 
            //   8d4104               | lea                 eax, [ecx + 4]
            //   83caff               | or                  edx, 0xffffffff
            //   f00fc110             | lock xadd           dword ptr [eax], edx
            //   750a                 | jne                 0xc
            //   85c9                 | test                ecx, ecx

        $sequence_5 = { 8bf4 2bfe 8d45fc 50 57 56 }
            // n = 6, score = 200
            //   8bf4                 | mov                 esi, esp
            //   2bfe                 | sub                 edi, esi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_6 = { 3bc1 7604 83c8ff c3 }
            // n = 4, score = 200
            //   3bc1                 | cmp                 eax, ecx
            //   7604                 | jbe                 6
            //   83c8ff               | or                  eax, 0xffffffff
            //   c3                   | ret                 

        $sequence_7 = { 68???????? 6a10 68???????? 68060000c8 ff7708 ff15???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   6a10                 | push                0x10
            //   68????????           |                     
            //   68060000c8           | push                0xc8000006
            //   ff7708               | push                dword ptr [edi + 8]
            //   ff15????????         |                     

        $sequence_8 = { 6a10 8945e8 8d45e4 50 }
            // n = 4, score = 200
            //   6a10                 | push                0x10
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax

        $sequence_9 = { 3bf8 730e 2bc7 e8???????? }
            // n = 4, score = 200
            //   3bf8                 | cmp                 edi, eax
            //   730e                 | jae                 0x10
            //   2bc7                 | sub                 eax, edi
            //   e8????????           |                     

        $sequence_10 = { ff15???????? 85c0 7407 b8e3030000 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   b8e3030000           | mov                 eax, 0x3e3

        $sequence_11 = { 48 83c9ff c744242804000000 48 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   83c9ff               | or                  ecx, 0xffffffff
            //   c744242804000000     | mov                 dword ptr [esp + 0x28], 4
            //   48                   | dec                 eax

        $sequence_12 = { 48 8d4c2460 c744247030000000 48 897c2478 48 }
            // n = 6, score = 100
            //   48                   | dec                 eax
            //   8d4c2460             | lea                 ecx, [esp + 0x60]
            //   c744247030000000     | mov                 dword ptr [esp + 0x70], 0x30
            //   48                   | dec                 eax
            //   897c2478             | mov                 dword ptr [esp + 0x78], edi
            //   48                   | dec                 eax

        $sequence_13 = { 4c 8bc8 48 85c0 0f84e6000000 44 8b442460 }
            // n = 7, score = 100
            //   4c                   | dec                 esp
            //   8bc8                 | mov                 ecx, eax
            //   48                   | dec                 eax
            //   85c0                 | test                eax, eax
            //   0f84e6000000         | je                  0xec
            //   44                   | inc                 esp
            //   8b442460             | mov                 eax, dword ptr [esp + 0x60]

        $sequence_14 = { 4d 85c9 7404 41 832100 45 85c0 }
            // n = 7, score = 100
            //   4d                   | dec                 ebp
            //   85c9                 | test                ecx, ecx
            //   7404                 | je                  6
            //   41                   | inc                 ecx
            //   832100               | and                 dword ptr [ecx], 0
            //   45                   | inc                 ebp
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 172032
}