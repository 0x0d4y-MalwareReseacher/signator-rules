rule win_lethic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.lethic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lethic"
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
        $sequence_0 = { 33c0 eb42 6a10 8b55fc 83c208 52 8b45fc }
            // n = 7, score = 1200
            //   33c0                 | xor                 eax, eax
            //   eb42                 | jmp                 0x44
            //   6a10                 | push                0x10
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c208               | add                 edx, 8
            //   52                   | push                edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_1 = { 6a10 8b55fc 83c208 52 8b45fc }
            // n = 5, score = 1200
            //   6a10                 | push                0x10
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c208               | add                 edx, 8
            //   52                   | push                edx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_2 = { eb42 6a10 8b55fc 83c208 }
            // n = 4, score = 1200
            //   eb42                 | jmp                 0x44
            //   6a10                 | push                0x10
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c208               | add                 edx, 8

        $sequence_3 = { 8b4508 8945fc 8b4dfc 894df0 8b550c 8955f8 8b45f8 }
            // n = 7, score = 1200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_4 = { 837dfc00 7507 33c0 e9???????? 8b45fc 8b4d10 894804 }
            // n = 7, score = 1200
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894804               | mov                 dword ptr [eax + 4], ecx

        $sequence_5 = { 3b4df4 741e 8b55fc 8b45f8 }
            // n = 4, score = 1200
            //   3b4df4               | cmp                 ecx, dword ptr [ebp - 0xc]
            //   741e                 | je                  0x20
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_6 = { 034510 8945f4 8b4df8 3b4df4 }
            // n = 4, score = 1200
            //   034510               | add                 eax, dword ptr [ebp + 0x10]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   3b4df4               | cmp                 ecx, dword ptr [ebp - 0xc]

        $sequence_7 = { 837df800 7418 8b45f8 50 8b4dfc }
            // n = 5, score = 1200
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7418                 | je                  0x1a
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_8 = { 8b45fc 8b08 894dfc ebec 8b55fc }
            // n = 5, score = 1200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   ebec                 | jmp                 0xffffffee
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]

        $sequence_9 = { 8b55fc 8b02 8945fc 8b4df4 51 8b55f8 }
            // n = 6, score = 1200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   51                   | push                ecx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

    condition:
        7 of them and filesize < 81920
}