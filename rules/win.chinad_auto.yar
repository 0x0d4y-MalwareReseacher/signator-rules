rule win_chinad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.chinad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chinad"
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
        $sequence_0 = { c1f819 03c1 c1f81a 03c3 c1f819 03c2 c1f81a }
            // n = 7, score = 200
            //   c1f819               | sar                 eax, 0x19
            //   03c1                 | add                 eax, ecx
            //   c1f81a               | sar                 eax, 0x1a
            //   03c3                 | add                 eax, ebx
            //   c1f819               | sar                 eax, 0x19
            //   03c2                 | add                 eax, edx
            //   c1f81a               | sar                 eax, 0x1a

        $sequence_1 = { 8bc2 99 898554ffffff 8bc1 8b4d9c 89954cffffff 99 }
            // n = 7, score = 200
            //   8bc2                 | mov                 eax, edx
            //   99                   | cdq                 
            //   898554ffffff         | mov                 dword ptr [ebp - 0xac], eax
            //   8bc1                 | mov                 eax, ecx
            //   8b4d9c               | mov                 ecx, dword ptr [ebp - 0x64]
            //   89954cffffff         | mov                 dword ptr [ebp - 0xb4], edx
            //   99                   | cdq                 

        $sequence_2 = { c3 3b0d???????? 7502 f3c3 e9???????? 56 6a04 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   3b0d????????         |                     
            //   7502                 | jne                 4
            //   f3c3                 | ret                 
            //   e9????????           |                     
            //   56                   | push                esi
            //   6a04                 | push                4

        $sequence_3 = { 6a00 ff75ec 13fa e8???????? 6a00 ff75d4 03d8 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   13fa                 | adc                 edi, edx
            //   e8????????           |                     
            //   6a00                 | push                0
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   03d8                 | add                 ebx, eax

        $sequence_4 = { 0fa4c21a 8b55a0 c1e01a 2bc8 8b45ac 894f10 8b4df8 }
            // n = 7, score = 200
            //   0fa4c21a             | shld                edx, eax, 0x1a
            //   8b55a0               | mov                 edx, dword ptr [ebp - 0x60]
            //   c1e01a               | shl                 eax, 0x1a
            //   2bc8                 | sub                 ecx, eax
            //   8b45ac               | mov                 eax, dword ptr [ebp - 0x54]
            //   894f10               | mov                 dword ptr [edi + 0x10], ecx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_5 = { 8945e4 8b4de4 51 e8???????? 83c404 8945d8 8b55d8 }
            // n = 7, score = 200
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]

        $sequence_6 = { 52 ff15???????? 8945f4 837df400 7407 c745f001000000 }
            // n = 6, score = 200
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0
            //   7407                 | je                  9
            //   c745f001000000       | mov                 dword ptr [ebp - 0x10], 1

        $sequence_7 = { 58 668986b8000000 668986be010000 c74668a0d34300 83a6b803000000 6a0d e8???????? }
            // n = 7, score = 200
            //   58                   | pop                 eax
            //   668986b8000000       | mov                 word ptr [esi + 0xb8], ax
            //   668986be010000       | mov                 word ptr [esi + 0x1be], ax
            //   c74668a0d34300       | mov                 dword ptr [esi + 0x68], 0x43d3a0
            //   83a6b803000000       | and                 dword ptr [esi + 0x3b8], 0
            //   6a0d                 | push                0xd
            //   e8????????           |                     

        $sequence_8 = { 8b8510fdffff 8b8d34fdffff 33fe 33da 8bf0 0facc80e c1e612 }
            // n = 7, score = 200
            //   8b8510fdffff         | mov                 eax, dword ptr [ebp - 0x2f0]
            //   8b8d34fdffff         | mov                 ecx, dword ptr [ebp - 0x2cc]
            //   33fe                 | xor                 edi, esi
            //   33da                 | xor                 ebx, edx
            //   8bf0                 | mov                 esi, eax
            //   0facc80e             | shrd                eax, ecx, 0xe
            //   c1e612               | shl                 esi, 0x12

        $sequence_9 = { 51 e8???????? 8d4b08 8945fc 51 e8???????? 8d4f10 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8d4b08               | lea                 ecx, [ebx + 8]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8d4f10               | lea                 ecx, [edi + 0x10]

    condition:
        7 of them and filesize < 598016
}