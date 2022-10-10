rule win_zeroaccess_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.zeroaccess."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeroaccess"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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

        $sequence_1 = { 2bfe 8d45fc 50 57 56 }
            // n = 5, score = 200
            //   2bfe                 | sub                 edi, esi
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_2 = { e8???????? 50 6819000200 8d45f8 50 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   50                   | push                eax
            //   6819000200           | push                0x20019
            //   8d45f8               | lea                 eax, [ebp - 8]
            //   50                   | push                eax

        $sequence_3 = { c3 8d4104 83caff f00fc110 750a }
            // n = 5, score = 200
            //   c3                   | ret                 
            //   8d4104               | lea                 eax, [ecx + 4]
            //   83caff               | or                  edx, 0xffffffff
            //   f00fc110             | lock xadd           dword ptr [eax], edx
            //   750a                 | jne                 0xc

        $sequence_4 = { 3bc1 7604 83c8ff c3 }
            // n = 4, score = 200
            //   3bc1                 | cmp                 eax, ecx
            //   7604                 | jbe                 6
            //   83c8ff               | or                  eax, 0xffffffff
            //   c3                   | ret                 

        $sequence_5 = { 6a04 68???????? 6a10 68???????? 68060000c8 ff7308 ff15???????? }
            // n = 7, score = 200
            //   6a04                 | push                4
            //   68????????           |                     
            //   6a10                 | push                0x10
            //   68????????           |                     
            //   68060000c8           | push                0xc8000006
            //   ff7308               | push                dword ptr [ebx + 8]
            //   ff15????????         |                     

        $sequence_6 = { 51 ab ff15???????? 6a10 }
            // n = 4, score = 200
            //   51                   | push                ecx
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ff15????????         |                     
            //   6a10                 | push                0x10

        $sequence_7 = { 45 33c0 48 83c9ff c744242804000000 48 }
            // n = 6, score = 200
            //   45                   | inc                 ebp
            //   33c0                 | xor                 eax, eax
            //   48                   | dec                 eax
            //   83c9ff               | or                  ecx, 0xffffffff
            //   c744242804000000     | mov                 dword ptr [esp + 0x28], 4
            //   48                   | dec                 eax

        $sequence_8 = { 740c bf03000040 eb05 bf010000c0 }
            // n = 4, score = 200
            //   740c                 | je                  0xe
            //   bf03000040           | mov                 edi, 0x40000003
            //   eb05                 | jmp                 7
            //   bf010000c0           | mov                 edi, 0xc0000001

        $sequence_9 = { ff15???????? 85c0 7407 b8e3030000 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   b8e3030000           | mov                 eax, 0x3e3

        $sequence_10 = { 3bf8 730e 2bc7 e8???????? }
            // n = 4, score = 200
            //   3bf8                 | cmp                 edi, eax
            //   730e                 | jae                 0x10
            //   2bc7                 | sub                 eax, edi
            //   e8????????           |                     

        $sequence_11 = { 8364243000 48 8b4b10 89442440 }
            // n = 4, score = 100
            //   8364243000           | and                 dword ptr [esp + 0x30], 0
            //   48                   | dec                 eax
            //   8b4b10               | mov                 ecx, dword ptr [ebx + 0x10]
            //   89442440             | mov                 dword ptr [esp + 0x40], eax

        $sequence_12 = { 8b8d10010000 ff15???????? 8bc6 48 8b9c2418020000 }
            // n = 5, score = 100
            //   8b8d10010000         | mov                 ecx, dword ptr [ebp + 0x110]
            //   ff15????????         |                     
            //   8bc6                 | mov                 eax, esi
            //   48                   | dec                 eax
            //   8b9c2418020000       | mov                 ebx, dword ptr [esp + 0x218]

        $sequence_13 = { 2bf8 7411 85ff 7904 8bd1 }
            // n = 5, score = 100
            //   2bf8                 | sub                 edi, eax
            //   7411                 | je                  0x13
            //   85ff                 | test                edi, edi
            //   7904                 | jns                 6
            //   8bd1                 | mov                 edx, ecx

    condition:
        7 of them and filesize < 172032
}