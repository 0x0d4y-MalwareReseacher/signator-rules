rule win_unidentified_037_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.unidentified_037."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_037"
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
        $sequence_0 = { 8d54241c 68???????? 52 66ab ffd3 8d84241c020000 8d4c241c }
            // n = 7, score = 100
            //   8d54241c             | lea                 edx, [esp + 0x1c]
            //   68????????           |                     
            //   52                   | push                edx
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   ffd3                 | call                ebx
            //   8d84241c020000       | lea                 eax, [esp + 0x21c]
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]

        $sequence_1 = { 7e78 53 8b5c2410 56 8b742410 }
            // n = 5, score = 100
            //   7e78                 | jle                 0x7a
            //   53                   | push                ebx
            //   8b5c2410             | mov                 ebx, dword ptr [esp + 0x10]
            //   56                   | push                esi
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]

        $sequence_2 = { 8b550c 33c9 668b0a 83c1cf }
            // n = 4, score = 100
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   33c9                 | xor                 ecx, ecx
            //   668b0a               | mov                 cx, word ptr [edx]
            //   83c1cf               | add                 ecx, -0x31

        $sequence_3 = { f7ee 03d6 c1fa09 8bc2 c1e81f 03d0 83fa01 }
            // n = 7, score = 100
            //   f7ee                 | imul                esi
            //   03d6                 | add                 edx, esi
            //   c1fa09               | sar                 edx, 9
            //   8bc2                 | mov                 eax, edx
            //   c1e81f               | shr                 eax, 0x1f
            //   03d0                 | add                 edx, eax
            //   83fa01               | cmp                 edx, 1

        $sequence_4 = { 8db3f0000000 6a00 8bce c744242005000000 89742430 8806 ff15???????? }
            // n = 7, score = 100
            //   8db3f0000000         | lea                 esi, [ebx + 0xf0]
            //   6a00                 | push                0
            //   8bce                 | mov                 ecx, esi
            //   c744242005000000     | mov                 dword ptr [esp + 0x20], 5
            //   89742430             | mov                 dword ptr [esp + 0x30], esi
            //   8806                 | mov                 byte ptr [esi], al
            //   ff15????????         |                     

        $sequence_5 = { 8bf9 8d1c3a 8bc7 3bfb 741c }
            // n = 5, score = 100
            //   8bf9                 | mov                 edi, ecx
            //   8d1c3a               | lea                 ebx, [edx + edi]
            //   8bc7                 | mov                 eax, edi
            //   3bfb                 | cmp                 edi, ebx
            //   741c                 | je                  0x1e

        $sequence_6 = { 55 884c2428 8d4c2428 ff15???????? 8a542454 55 8d4c2438 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   884c2428             | mov                 byte ptr [esp + 0x28], cl
            //   8d4c2428             | lea                 ecx, [esp + 0x28]
            //   ff15????????         |                     
            //   8a542454             | mov                 dl, byte ptr [esp + 0x54]
            //   55                   | push                ebp
            //   8d4c2438             | lea                 ecx, [esp + 0x38]

        $sequence_7 = { 8d8424200c0000 52 50 ff15???????? 8d8c241c020000 51 e8???????? }
            // n = 7, score = 100
            //   8d8424200c0000       | lea                 eax, [esp + 0xc20]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d8c241c020000       | lea                 ecx, [esp + 0x21c]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_8 = { 83ec1c 53 8bd9 55 33ed 8b4304 56 }
            // n = 7, score = 100
            //   83ec1c               | sub                 esp, 0x1c
            //   53                   | push                ebx
            //   8bd9                 | mov                 ebx, ecx
            //   55                   | push                ebp
            //   33ed                 | xor                 ebp, ebp
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   56                   | push                esi

        $sequence_9 = { 3bd5 0f83cb000000 8d44ad00 c1e005 03c5 c1e002 3bfb }
            // n = 7, score = 100
            //   3bd5                 | cmp                 edx, ebp
            //   0f83cb000000         | jae                 0xd1
            //   8d44ad00             | lea                 eax, [ebp + ebp*4]
            //   c1e005               | shl                 eax, 5
            //   03c5                 | add                 eax, ebp
            //   c1e002               | shl                 eax, 2
            //   3bfb                 | cmp                 edi, ebx

    condition:
        7 of them and filesize < 167936
}