rule win_ketrum_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.ketrum."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ketrum"
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
        $sequence_0 = { 830eff 2b34bda0bc6200 c1fe06 8bc7 c1e005 03f0 8975e4 }
            // n = 7, score = 200
            //   830eff               | or                  dword ptr [esi], 0xffffffff
            //   2b34bda0bc6200       | sub                 esi, dword ptr [edi*4 + 0x62bca0]
            //   c1fe06               | sar                 esi, 6
            //   8bc7                 | mov                 eax, edi
            //   c1e005               | shl                 eax, 5
            //   03f0                 | add                 esi, eax
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi

        $sequence_1 = { e9???????? 55 8bec b828340000 e8???????? a1???????? }
            // n = 6, score = 200
            //   e9????????           |                     
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b828340000           | mov                 eax, 0x3428
            //   e8????????           |                     
            //   a1????????           |                     

        $sequence_2 = { 50 8d8540fbffff 50 8d8550fbffff 50 8d854cfbffff 50 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d8540fbffff         | lea                 eax, [ebp - 0x4c0]
            //   50                   | push                eax
            //   8d8550fbffff         | lea                 eax, [ebp - 0x4b0]
            //   50                   | push                eax
            //   8d854cfbffff         | lea                 eax, [ebp - 0x4b4]
            //   50                   | push                eax

        $sequence_3 = { dc0d???????? dd05???????? dcc9 dec1 e8???????? }
            // n = 5, score = 200
            //   dc0d????????         |                     
            //   dd05????????         |                     
            //   dcc9                 | fmul                st(1), st(0)
            //   dec1                 | faddp               st(1)
            //   e8????????           |                     

        $sequence_4 = { e8???????? 83c444 8d85e4cbffff 50 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   83c444               | add                 esp, 0x44
            //   8d85e4cbffff         | lea                 eax, [ebp - 0x341c]
            //   50                   | push                eax

        $sequence_5 = { ff15???????? e9???????? 53 50 ff15???????? 8bf8 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   e9????????           |                     
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_6 = { 68???????? e8???????? 8d85e4cbffff 50 68???????? e8???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   8d85e4cbffff         | lea                 eax, [ebp - 0x341c]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_7 = { ff750c e8???????? 59 85c0 7407 c6043e2b }
            // n = 6, score = 200
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   c6043e2b             | mov                 byte ptr [esi + edi], 0x2b

        $sequence_8 = { b8???????? 8bce 895dfc e8???????? 8b85d8e6ffff 395804 }
            // n = 6, score = 100
            //   b8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   e8????????           |                     
            //   8b85d8e6ffff         | mov                 eax, dword ptr [ebp - 0x1928]
            //   395804               | cmp                 dword ptr [eax + 4], ebx

        $sequence_9 = { e8???????? 8b4004 8b4dec 8974c104 8b4710 8bd7 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8974c104             | mov                 dword ptr [ecx + eax*8 + 4], esi
            //   8b4710               | mov                 eax, dword ptr [edi + 0x10]
            //   8bd7                 | mov                 edx, edi

        $sequence_10 = { 83bd98feffff05 0f83c9000000 6a01 33ff 8db5d4feffff }
            // n = 5, score = 100
            //   83bd98feffff05       | cmp                 dword ptr [ebp - 0x168], 5
            //   0f83c9000000         | jae                 0xcf
            //   6a01                 | push                1
            //   33ff                 | xor                 edi, edi
            //   8db5d4feffff         | lea                 esi, [ebp - 0x12c]

        $sequence_11 = { 68???????? 50 e8???????? 83781410 59 59 }
            // n = 6, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83781410             | cmp                 dword ptr [eax + 0x14], 0x10
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_12 = { 56 8d45dc 50 6a01 ff75bc ff15???????? }
            // n = 6, score = 100
            //   56                   | push                esi
            //   8d45dc               | lea                 eax, [ebp - 0x24]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   ff75bc               | push                dword ptr [ebp - 0x44]
            //   ff15????????         |                     

        $sequence_13 = { 6a15 58 b9???????? 8d9590efffff e8???????? }
            // n = 5, score = 100
            //   6a15                 | push                0x15
            //   58                   | pop                 eax
            //   b9????????           |                     
            //   8d9590efffff         | lea                 edx, [ebp - 0x1070]
            //   e8????????           |                     

        $sequence_14 = { e8???????? 85c0 e9???????? 33c0 8dbdf8eeffff ab }
            // n = 6, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   8dbdf8eeffff         | lea                 edi, [ebp - 0x1108]
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_15 = { 5f 2bd1 5e 0fb708 66890c02 }
            // n = 5, score = 100
            //   5f                   | pop                 edi
            //   2bd1                 | sub                 edx, ecx
            //   5e                   | pop                 esi
            //   0fb708               | movzx               ecx, word ptr [eax]
            //   66890c02             | mov                 word ptr [edx + eax], cx

    condition:
        7 of them and filesize < 4599808
}