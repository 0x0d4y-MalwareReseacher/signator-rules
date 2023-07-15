rule win_mpkbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.mpkbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mpkbot"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { ff15???????? 8b45fc 3bc6 7406 8b08 50 ff5108 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3bc6                 | cmp                 eax, esi
            //   7406                 | je                  8
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff5108               | call                dword ptr [ecx + 8]

        $sequence_1 = { 56 56 68???????? 8975f4 8b08 50 ff510c }
            // n = 7, score = 400
            //   56                   | push                esi
            //   56                   | push                esi
            //   68????????           |                     
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff510c               | call                dword ptr [ecx + 0xc]

        $sequence_2 = { 807e1100 7604 c6461100 57 }
            // n = 4, score = 400
            //   807e1100             | cmp                 byte ptr [esi + 0x11], 0
            //   7604                 | jbe                 6
            //   c6461100             | mov                 byte ptr [esi + 0x11], 0
            //   57                   | push                edi

        $sequence_3 = { a3???????? 8d45fc 50 683f000f00 6a00 }
            // n = 5, score = 400
            //   a3????????           |                     
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   683f000f00           | push                0xf003f
            //   6a00                 | push                0

        $sequence_4 = { 8b1d???????? ffd3 6a00 56 68???????? 68???????? }
            // n = 6, score = 400
            //   8b1d????????         |                     
            //   ffd3                 | call                ebx
            //   6a00                 | push                0
            //   56                   | push                esi
            //   68????????           |                     
            //   68????????           |                     

        $sequence_5 = { ffe0 55 8bec 68???????? ff15???????? }
            // n = 5, score = 400
            //   ffe0                 | jmp                 eax
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_6 = { 6a18 5a 6689500e 33d2 }
            // n = 4, score = 400
            //   6a18                 | push                0x18
            //   5a                   | pop                 edx
            //   6689500e             | mov                 word ptr [eax + 0xe], dx
            //   33d2                 | xor                 edx, edx

        $sequence_7 = { c3 55 8bec 33c0 384508 7507 }
            // n = 6, score = 400
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   384508               | cmp                 byte ptr [ebp + 8], al
            //   7507                 | jne                 9

        $sequence_8 = { 50 68???????? 6a0d ff15???????? 8b35???????? eb14 8d45e4 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   68????????           |                     
            //   6a0d                 | push                0xd
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   eb14                 | jmp                 0x16
            //   8d45e4               | lea                 eax, [ebp - 0x1c]

        $sequence_9 = { 895010 895014 894818 89481c 895020 895024 }
            // n = 6, score = 400
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   895014               | mov                 dword ptr [eax + 0x14], edx
            //   894818               | mov                 dword ptr [eax + 0x18], ecx
            //   89481c               | mov                 dword ptr [eax + 0x1c], ecx
            //   895020               | mov                 dword ptr [eax + 0x20], edx
            //   895024               | mov                 dword ptr [eax + 0x24], edx

    condition:
        7 of them and filesize < 139264
}