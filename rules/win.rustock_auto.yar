rule win_rustock_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.rustock."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rustock"
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
        $sequence_0 = { 8b0d???????? 83f901 0f8452010000 85c9 750d 833d????????01 }
            // n = 6, score = 100
            //   8b0d????????         |                     
            //   83f901               | cmp                 ecx, 1
            //   0f8452010000         | je                  0x158
            //   85c9                 | test                ecx, ecx
            //   750d                 | jne                 0xf
            //   833d????????01       |                     

        $sequence_1 = { ff15???????? 8bd0 85d2 752a 833d????????00 7421 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax
            //   85d2                 | test                edx, edx
            //   752a                 | jne                 0x2c
            //   833d????????00       |                     
            //   7421                 | je                  0x23

        $sequence_2 = { 95 363289b00d9930 dfa3c37603c0 8a4754 a4 3de8e924c9 1e }
            // n = 7, score = 100
            //   95                   | xchg                eax, ebp
            //   363289b00d9930       | xor                 cl, byte ptr ss:[ecx + 0x30990db0]
            //   dfa3c37603c0         | fbld                tbyte ptr [ebx - 0x3ffc893d]
            //   8a4754               | mov                 al, byte ptr [edi + 0x54]
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   3de8e924c9           | cmp                 eax, 0xc924e9e8
            //   1e                   | push                ds

        $sequence_3 = { 59 8bc7 e9???????? 897dcc }
            // n = 4, score = 100
            //   59                   | pop                 ecx
            //   8bc7                 | mov                 eax, edi
            //   e9????????           |                     
            //   897dcc               | mov                 dword ptr [ebp - 0x34], edi

        $sequence_4 = { 3b4520 0f84fa000000 57 57 8d4d14 }
            // n = 5, score = 100
            //   3b4520               | cmp                 eax, dword ptr [ebp + 0x20]
            //   0f84fa000000         | je                  0x100
            //   57                   | push                edi
            //   57                   | push                edi
            //   8d4d14               | lea                 ecx, [ebp + 0x14]

        $sequence_5 = { 59 01fb 8d08 31f0 be948b0100 68d44f0100 59 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   01fb                 | add                 ebx, edi
            //   8d08                 | lea                 ecx, [eax]
            //   31f0                 | xor                 eax, esi
            //   be948b0100           | mov                 esi, 0x18b94
            //   68d44f0100           | push                0x14fd4
            //   59                   | pop                 ecx

        $sequence_6 = { 31d7 21d1 033d???????? 8d3c3f 8b0d???????? 09fe f7d1 }
            // n = 7, score = 100
            //   31d7                 | xor                 edi, edx
            //   21d1                 | and                 ecx, edx
            //   033d????????         |                     
            //   8d3c3f               | lea                 edi, [edi + edi]
            //   8b0d????????         |                     
            //   09fe                 | or                  esi, edi
            //   f7d1                 | not                 ecx

        $sequence_7 = { 6a01 e8???????? 59 59 8945e4 3bc7 7434 }
            // n = 7, score = 100
            //   6a01                 | push                1
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   3bc7                 | cmp                 eax, edi
            //   7434                 | je                  0x36

        $sequence_8 = { 8b0d???????? 29c9 29ce 29f9 }
            // n = 4, score = 100
            //   8b0d????????         |                     
            //   29c9                 | sub                 ecx, ecx
            //   29ce                 | sub                 esi, ecx
            //   29f9                 | sub                 ecx, edi

        $sequence_9 = { 897d0c 7415 8b0b 83c104 8bc1 }
            // n = 5, score = 100
            //   897d0c               | mov                 dword ptr [ebp + 0xc], edi
            //   7415                 | je                  0x17
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   83c104               | add                 ecx, 4
            //   8bc1                 | mov                 eax, ecx

    condition:
        7 of them and filesize < 565248
}