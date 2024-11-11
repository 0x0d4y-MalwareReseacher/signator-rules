rule win_lethic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.lethic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lethic"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 83ec0c 8b4508 8945f4 6838100000 6a40 }
            // n = 5, score = 1200
            //   83ec0c               | sub                 esp, 0xc
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   6838100000           | push                0x1038
            //   6a40                 | push                0x40

        $sequence_1 = { 8b45f4 8b08 890a 8b55fc 8b02 8945fc 8b4df4 }
            // n = 7, score = 1200
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_2 = { 740a 8b45fc 8b08 894dfc }
            // n = 4, score = 1200
            //   740a                 | je                  0xc
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_3 = { eb42 6a10 8b55fc 83c208 }
            // n = 4, score = 1200
            //   eb42                 | jmp                 0x44
            //   6a10                 | push                0x10
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c208               | add                 edx, 8

        $sequence_4 = { 837df800 7418 8b45f8 50 8b4dfc }
            // n = 5, score = 1200
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7418                 | je                  0x1a
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { 7507 33c0 e9???????? 8b55f4 8b4218 50 8b4df8 }
            // n = 7, score = 1200
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b4218               | mov                 eax, dword ptr [edx + 0x18]
            //   50                   | push                eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_6 = { 7507 33c0 e9???????? 8b55f4 8b4218 }
            // n = 5, score = 1200
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b4218               | mov                 eax, dword ptr [edx + 0x18]

        $sequence_7 = { 8b45fc 8b4d10 894804 8b55fc c7823410000001000000 6a10 8b450c }
            // n = 7, score = 1200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1
            //   6a10                 | push                0x10
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_8 = { ffd0 6a06 6a01 6a02 8b4df4 }
            // n = 5, score = 1200
            //   ffd0                 | call                eax
            //   6a06                 | push                6
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_9 = { 837df800 7418 8b45f8 50 8b4dfc 51 }
            // n = 6, score = 1200
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7418                 | je                  0x1a
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 81920
}