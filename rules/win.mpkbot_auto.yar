rule win_mpkbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.mpkbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mpkbot"
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
        $sequence_0 = { 6a00 53 ff35???????? 8b1d???????? ffd3 }
            // n = 5, score = 400
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff35????????         |                     
            //   8b1d????????         |                     
            //   ffd3                 | call                ebx

        $sequence_1 = { 50 ff15???????? 8b45fc 3bc6 7406 8b08 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3bc6                 | cmp                 eax, esi
            //   7406                 | je                  8
            //   8b08                 | mov                 ecx, dword ptr [eax]

        $sequence_2 = { 8975f8 8b08 50 ff5150 }
            // n = 4, score = 400
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff5150               | call                dword ptr [ecx + 0x50]

        $sequence_3 = { 5a 6689500e 33d2 c70028000000 895010 895014 894818 }
            // n = 7, score = 400
            //   5a                   | pop                 edx
            //   6689500e             | mov                 word ptr [eax + 0xe], dx
            //   33d2                 | xor                 edx, edx
            //   c70028000000         | mov                 dword ptr [eax], 0x28
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   895014               | mov                 dword ptr [eax + 0x14], edx
            //   894818               | mov                 dword ptr [eax + 0x18], ecx

        $sequence_4 = { 6689500e 33d2 c70028000000 895010 }
            // n = 4, score = 400
            //   6689500e             | mov                 word ptr [eax + 0xe], dx
            //   33d2                 | xor                 edx, edx
            //   c70028000000         | mov                 dword ptr [eax], 0x28
            //   895010               | mov                 dword ptr [eax + 0x10], edx

        $sequence_5 = { 6a10 ff15???????? 6685c0 7404 6a01 }
            // n = 5, score = 400
            //   6a10                 | push                0x10
            //   ff15????????         |                     
            //   6685c0               | test                ax, ax
            //   7404                 | je                  6
            //   6a01                 | push                1

        $sequence_6 = { 56 56 6880000000 56 56 56 68???????? }
            // n = 7, score = 400
            //   56                   | push                esi
            //   56                   | push                esi
            //   6880000000           | push                0x80
            //   56                   | push                esi
            //   56                   | push                esi
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_7 = { 894808 33c9 41 8bd1 6689500c }
            // n = 5, score = 400
            //   894808               | mov                 dword ptr [eax + 8], ecx
            //   33c9                 | xor                 ecx, ecx
            //   41                   | inc                 ecx
            //   8bd1                 | mov                 edx, ecx
            //   6689500c             | mov                 word ptr [eax + 0xc], dx

        $sequence_8 = { 43 68???????? 895e08 ffd7 6a00 }
            // n = 5, score = 400
            //   43                   | inc                 ebx
            //   68????????           |                     
            //   895e08               | mov                 dword ptr [esi + 8], ebx
            //   ffd7                 | call                edi
            //   6a00                 | push                0

        $sequence_9 = { 52 56 6a20 68???????? 68???????? 8975f8 }
            // n = 6, score = 400
            //   52                   | push                edx
            //   56                   | push                esi
            //   6a20                 | push                0x20
            //   68????????           |                     
            //   68????????           |                     
            //   8975f8               | mov                 dword ptr [ebp - 8], esi

    condition:
        7 of them and filesize < 139264
}