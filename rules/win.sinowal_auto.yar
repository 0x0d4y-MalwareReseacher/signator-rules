rule win_sinowal_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.sinowal."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sinowal"
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
        $sequence_0 = { 51 6a00 6a00 6a00 8b95acfdffff }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8b95acfdffff         | mov                 edx, dword ptr [ebp - 0x254]

        $sequence_1 = { 8b4df8 51 6a00 6a01 6a00 }
            // n = 5, score = 200
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_2 = { 68e8030000 ff15???????? 8b45f8 8b483c }
            // n = 4, score = 200
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b483c               | mov                 ecx, dword ptr [eax + 0x3c]

        $sequence_3 = { 83ec0c c745f400000000 c745f800000000 8b4510 8945fc 8b4510 33d2 }
            // n = 7, score = 200
            //   83ec0c               | sub                 esp, 0xc
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   c745f800000000       | mov                 dword ptr [ebp - 8], 0
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   33d2                 | xor                 edx, edx

        $sequence_4 = { ff15???????? 837de400 740a 8b45e4 50 ff15???????? 8b4d94 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   837de400             | cmp                 dword ptr [ebp - 0x1c], 0
            //   740a                 | je                  0xc
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4d94               | mov                 ecx, dword ptr [ebp - 0x6c]

        $sequence_5 = { 52 8b45f8 50 ff15???????? 85c0 7408 }
            // n = 6, score = 200
            //   52                   | push                edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa

        $sequence_6 = { ff15???????? 8b4d08 8901 8b5508 833a00 750a b805400080 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   833a00               | cmp                 dword ptr [edx], 0
            //   750a                 | jne                 0xc
            //   b805400080           | mov                 eax, 0x80004005

        $sequence_7 = { c745f400000000 c745fc00000000 6880000000 6a00 8d8570ffffff 50 }
            // n = 6, score = 200
            //   c745f400000000       | mov                 dword ptr [ebp - 0xc], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   6880000000           | push                0x80
            //   6a00                 | push                0
            //   8d8570ffffff         | lea                 eax, [ebp - 0x90]
            //   50                   | push                eax

        $sequence_8 = { 890d???????? c705????????00000000 a1???????? 8b0c85d0669600 894dfc }
            // n = 5, score = 200
            //   890d????????         |                     
            //   c705????????00000000     |     
            //   a1????????           |                     
            //   8b0c85d0669600       | mov                 ecx, dword ptr [eax*4 + 0x9666d0]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_9 = { c21400 55 8bec 83ec08 68ffffff7f 8d45f8 }
            // n = 6, score = 200
            //   c21400               | ret                 0x14
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec08               | sub                 esp, 8
            //   68ffffff7f           | push                0x7fffffff
            //   8d45f8               | lea                 eax, [ebp - 8]

    condition:
        7 of them and filesize < 73728
}