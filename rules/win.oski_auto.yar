rule win_oski_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.oski."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.oski"
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
        $sequence_0 = { 50 a1???????? 50 8d8df0feffff 51 e8???????? }
            // n = 6, score = 1100
            //   50                   | push                eax
            //   a1????????           |                     
            //   50                   | push                eax
            //   8d8df0feffff         | lea                 ecx, [ebp - 0x110]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_1 = { 25ff7f0000 c3 8bff 55 8bec 83ec14 ff7510 }
            // n = 7, score = 1000
            //   25ff7f0000           | and                 eax, 0x7fff
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec14               | sub                 esp, 0x14
            //   ff7510               | push                dword ptr [ebp + 0x10]

        $sequence_2 = { 8975f0 e8???????? cc 8bff 55 8bec 8b550c }
            // n = 7, score = 900
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   e8????????           |                     
            //   cc                   | int3                
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]

        $sequence_3 = { 83c40c e8???????? 50 a1???????? 50 }
            // n = 5, score = 900
            //   83c40c               | add                 esp, 0xc
            //   e8????????           |                     
            //   50                   | push                eax
            //   a1????????           |                     
            //   50                   | push                eax

        $sequence_4 = { 50 8995ccfaffff c785c8faffff01040000 c685ecfaffff00 e8???????? }
            // n = 5, score = 800
            //   50                   | push                eax
            //   8995ccfaffff         | mov                 dword ptr [ebp - 0x534], edx
            //   c785c8faffff01040000     | mov    dword ptr [ebp - 0x538], 0x401
            //   c685ecfaffff00       | mov                 byte ptr [ebp - 0x514], 0
            //   e8????????           |                     

        $sequence_5 = { 7502 f3c3 e9???????? 8bff 55 8bec 83ec1c }
            // n = 7, score = 800
            //   7502                 | jne                 4
            //   f3c3                 | ret                 
            //   e9????????           |                     
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec1c               | sub                 esp, 0x1c

        $sequence_6 = { 8b45b8 7303 8d45b8 8b4e40 8b563c }
            // n = 5, score = 800
            //   8b45b8               | mov                 eax, dword ptr [ebp - 0x48]
            //   7303                 | jae                 5
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   8b4e40               | mov                 ecx, dword ptr [esi + 0x40]
            //   8b563c               | mov                 edx, dword ptr [esi + 0x3c]

        $sequence_7 = { b903000000 6a00 6a00 50 51 }
            // n = 5, score = 800
            //   b903000000           | mov                 ecx, 3
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_8 = { 894e04 eb02 33f6 8d55ec 52 e8???????? }
            // n = 6, score = 800
            //   894e04               | mov                 dword ptr [esi + 4], ecx
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   8d55ec               | lea                 edx, [ebp - 0x14]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_9 = { 8b15???????? 8d8df0feffff 51 52 }
            // n = 4, score = 800
            //   8b15????????         |                     
            //   8d8df0feffff         | lea                 ecx, [ebp - 0x110]
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_10 = { 83c404 8b55f8 8955f4 8b45f4 50 e8???????? }
            // n = 6, score = 400
            //   83c404               | add                 esp, 4
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8955f4               | mov                 dword ptr [ebp - 0xc], edx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_11 = { 8b511c 83c220 52 6a00 }
            // n = 4, score = 400
            //   8b511c               | mov                 edx, dword ptr [ecx + 0x1c]
            //   83c220               | add                 edx, 0x20
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_12 = { 8d55f4 52 6a00 68???????? ff15???????? 8945f0 837df000 }
            // n = 7, score = 400
            //   8d55f4               | lea                 edx, [ebp - 0xc]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff15????????         |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   837df000             | cmp                 dword ptr [ebp - 0x10], 0

        $sequence_13 = { 8d4df8 51 6800020000 8b55f4 52 ff15???????? 8945f0 }
            // n = 7, score = 400
            //   8d4df8               | lea                 ecx, [ebp - 8]
            //   51                   | push                ecx
            //   6800020000           | push                0x200
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_14 = { 68???????? 6a00 e8???????? 83c40c 8985e4fdffff }
            // n = 5, score = 400
            //   68????????           |                     
            //   6a00                 | push                0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8985e4fdffff         | mov                 dword ptr [ebp - 0x21c], eax

        $sequence_15 = { 8b45f4 50 e8???????? 83c404 8b0d???????? 51 ff15???????? }
            // n = 7, score = 400
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_16 = { 8b5508 52 a1???????? 50 8d8de8fdffff }
            // n = 5, score = 400
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   a1????????           |                     
            //   50                   | push                eax
            //   8d8de8fdffff         | lea                 ecx, [ebp - 0x218]

    condition:
        7 of them and filesize < 423936
}