rule win_zebrocy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.zebrocy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zebrocy"
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
        $sequence_0 = { 014158 11515c e8???????? dc6360 }
            // n = 4, score = 100
            //   014158               | add                 dword ptr [ecx + 0x58], eax
            //   11515c               | adc                 dword ptr [ecx + 0x5c], edx
            //   e8????????           |                     
            //   dc6360               | fsub                qword ptr [ebx + 0x60]

        $sequence_1 = { 0103 8b0e ba???????? e8???????? }
            // n = 4, score = 100
            //   0103                 | add                 dword ptr [ebx], eax
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   ba????????           |                     
            //   e8????????           |                     

        $sequence_2 = { 0103 83c41c 5b 5e }
            // n = 4, score = 100
            //   0103                 | add                 dword ptr [ebx], eax
            //   83c41c               | add                 esp, 0x1c
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi

        $sequence_3 = { 0110 8b7dd4 ba???????? 89470c }
            // n = 4, score = 100
            //   0110                 | add                 dword ptr [eax], edx
            //   8b7dd4               | mov                 edi, dword ptr [ebp - 0x2c]
            //   ba????????           |                     
            //   89470c               | mov                 dword ptr [edi + 0xc], eax

        $sequence_4 = { 8b56b0 8b4204 c74430b074434200 56 c706???????? }
            // n = 5, score = 100
            //   8b56b0               | mov                 edx, dword ptr [esi - 0x50]
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   c74430b074434200     | mov                 dword ptr [eax + esi - 0x50], 0x424374
            //   56                   | push                esi
            //   c706????????         |                     

        $sequence_5 = { 68???????? 8d4dd4 897de8 c745e400000000 c645d400 }
            // n = 5, score = 100
            //   68????????           |                     
            //   8d4dd4               | lea                 ecx, dword ptr [ebp - 0x2c]
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   c745e400000000       | mov                 dword ptr [ebp - 0x1c], 0
            //   c645d400             | mov                 byte ptr [ebp - 0x2c], 0

        $sequence_6 = { a1???????? c705????????80384100 8935???????? a3???????? ff15???????? a3???????? 83f8ff }
            // n = 7, score = 100
            //   a1????????           |                     
            //   c705????????80384100     |     
            //   8935????????         |                     
            //   a3????????           |                     
            //   ff15????????         |                     
            //   a3????????           |                     
            //   83f8ff               | cmp                 eax, -1

        $sequence_7 = { e8???????? 83c41c 8d542478 52 ff15???????? 50 ff15???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8d542478             | lea                 edx, dword ptr [esp + 0x78]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_8 = { 0102 8b45d4 89500c 89c1 }
            // n = 4, score = 100
            //   0102                 | add                 dword ptr [edx], eax
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   89500c               | mov                 dword ptr [eax + 0xc], edx
            //   89c1                 | mov                 ecx, eax

        $sequence_9 = { 014150 8b550c 115154 014158 }
            // n = 4, score = 100
            //   014150               | add                 dword ptr [ecx + 0x50], eax
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   115154               | adc                 dword ptr [ecx + 0x54], edx
            //   014158               | add                 dword ptr [ecx + 0x58], eax

        $sequence_10 = { c1fb05 83e61f 8d1c9dc0a84200 894508 8b03 c1e606 }
            // n = 6, score = 100
            //   c1fb05               | sar                 ebx, 5
            //   83e61f               | and                 esi, 0x1f
            //   8d1c9dc0a84200       | lea                 ebx, dword ptr [ebx*4 + 0x42a8c0]
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   c1e606               | shl                 esi, 6

        $sequence_11 = { 0103 31d2 85ff 8b03 }
            // n = 4, score = 100
            //   0103                 | add                 dword ptr [ebx], eax
            //   31d2                 | xor                 edx, edx
            //   85ff                 | test                edi, edi
            //   8b03                 | mov                 eax, dword ptr [ebx]

        $sequence_12 = { ff15???????? 6685c0 0f84bf000000 8dbc2488000000 8935???????? e8???????? 83ec1c }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   6685c0               | test                ax, ax
            //   0f84bf000000         | je                  0xc5
            //   8dbc2488000000       | lea                 edi, dword ptr [esp + 0x88]
            //   8935????????         |                     
            //   e8????????           |                     
            //   83ec1c               | sub                 esp, 0x1c

        $sequence_13 = { bf???????? 833cf5b486420001 751d 8d04f5b0864200 8938 }
            // n = 5, score = 100
            //   bf????????           |                     
            //   833cf5b486420001     | cmp                 dword ptr [esi*8 + 0x4286b4], 1
            //   751d                 | jne                 0x1f
            //   8d04f5b0864200       | lea                 eax, dword ptr [esi*8 + 0x4286b0]
            //   8938                 | mov                 dword ptr [eax], edi

        $sequence_14 = { 0110 5e 5f 5d }
            // n = 4, score = 100
            //   0110                 | add                 dword ptr [eax], edx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp

        $sequence_15 = { 50 e8???????? 83c404 83c702 3bfb }
            // n = 5, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   83c702               | add                 edi, 2
            //   3bfb                 | cmp                 edi, ebx

    condition:
        7 of them and filesize < 393216
}