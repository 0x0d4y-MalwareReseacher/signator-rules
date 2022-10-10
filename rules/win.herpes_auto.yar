rule win_herpes_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.herpes."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.herpes"
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
        $sequence_0 = { ffb604020000 ffd7 68???????? 8986a4010000 ffb604020000 ffd7 68???????? }
            // n = 7, score = 100
            //   ffb604020000         | push                dword ptr [esi + 0x204]
            //   ffd7                 | call                edi
            //   68????????           |                     
            //   8986a4010000         | mov                 dword ptr [esi + 0x1a4], eax
            //   ffb604020000         | push                dword ptr [esi + 0x204]
            //   ffd7                 | call                edi
            //   68????????           |                     

        $sequence_1 = { 7528 8b8de8fcffff 8b35???????? 51 ffd6 53 ffd6 }
            // n = 7, score = 100
            //   7528                 | jne                 0x2a
            //   8b8de8fcffff         | mov                 ecx, dword ptr [ebp - 0x318]
            //   8b35????????         |                     
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   53                   | push                ebx
            //   ffd6                 | call                esi

        $sequence_2 = { c746140f000000 c7461000000000 8d85f8feffff 8bce c60600 e8???????? 8b4dfc }
            // n = 7, score = 100
            //   c746140f000000       | mov                 dword ptr [esi + 0x14], 0xf
            //   c7461000000000       | mov                 dword ptr [esi + 0x10], 0
            //   8d85f8feffff         | lea                 eax, [ebp - 0x108]
            //   8bce                 | mov                 ecx, esi
            //   c60600               | mov                 byte ptr [esi], 0
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_3 = { c1f805 8d3c85e02d4200 8bf3 83e61f c1e606 8b07 0fbe440604 }
            // n = 7, score = 100
            //   c1f805               | sar                 eax, 5
            //   8d3c85e02d4200       | lea                 edi, [eax*4 + 0x422de0]
            //   8bf3                 | mov                 esi, ebx
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   0fbe440604           | movsx               eax, byte ptr [esi + eax + 4]

        $sequence_4 = { 68???????? 8d8d3effffff 51 ffd6 68???????? 8d9557ffffff 52 }
            // n = 7, score = 100
            //   68????????           |                     
            //   8d8d3effffff         | lea                 ecx, [ebp - 0xc2]
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   8d9557ffffff         | lea                 edx, [ebp - 0xa9]
            //   52                   | push                edx

        $sequence_5 = { 33c4 8984244c1b0000 56 57 c744240c64000000 e8???????? 8d842470050000 }
            // n = 7, score = 100
            //   33c4                 | xor                 eax, esp
            //   8984244c1b0000       | mov                 dword ptr [esp + 0x1b4c], eax
            //   56                   | push                esi
            //   57                   | push                edi
            //   c744240c64000000     | mov                 dword ptr [esp + 0xc], 0x64
            //   e8????????           |                     
            //   8d842470050000       | lea                 eax, [esp + 0x570]

        $sequence_6 = { 83e902 7435 83e90d 0f8588000000 }
            // n = 4, score = 100
            //   83e902               | sub                 ecx, 2
            //   7435                 | je                  0x37
            //   83e90d               | sub                 ecx, 0xd
            //   0f8588000000         | jne                 0x8e

        $sequence_7 = { 52 99 f7fe 52 99 f7ff }
            // n = 6, score = 100
            //   52                   | push                edx
            //   99                   | cdq                 
            //   f7fe                 | idiv                esi
            //   52                   | push                edx
            //   99                   | cdq                 
            //   f7ff                 | idiv                edi

        $sequence_8 = { 50 51 e8???????? 8b15???????? 68e8030000 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b15????????         |                     
            //   68e8030000           | push                0x3e8

        $sequence_9 = { 8bc8 c1f905 8b0c8de02d4200 83e01f c1e006 f644080401 74cd }
            // n = 7, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   8b0c8de02d4200       | mov                 ecx, dword ptr [ecx*4 + 0x422de0]
            //   83e01f               | and                 eax, 0x1f
            //   c1e006               | shl                 eax, 6
            //   f644080401           | test                byte ptr [eax + ecx + 4], 1
            //   74cd                 | je                  0xffffffcf

    condition:
        7 of them and filesize < 319488
}