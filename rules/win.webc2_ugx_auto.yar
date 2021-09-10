rule win_webc2_ugx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.webc2_ugx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_ugx"
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
        $sequence_0 = { 3bc3 8945a8 0f84eb020000 8d8696090000 }
            // n = 4, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   8945a8               | mov                 dword ptr [ebp - 0x58], eax
            //   0f84eb020000         | je                  0x2f1
            //   8d8696090000         | lea                 eax, dword ptr [esi + 0x996]

        $sequence_1 = { 50 57 ff969c060000 3bc3 8945a8 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff969c060000         | call                dword ptr [esi + 0x69c]
            //   3bc3                 | cmp                 eax, ebx
            //   8945a8               | mov                 dword ptr [ebp - 0x58], eax

        $sequence_2 = { ff15???????? 56 6a01 57 ff15???????? 3bc7 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   56                   | push                esi
            //   6a01                 | push                1
            //   57                   | push                edi
            //   ff15????????         |                     
            //   3bc7                 | cmp                 eax, edi

        $sequence_3 = { 50 8d85ccfeffff 50 ffd7 8d8584fcffff 50 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   8d85ccfeffff         | lea                 eax, dword ptr [ebp - 0x134]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   8d8584fcffff         | lea                 eax, dword ptr [ebp - 0x37c]
            //   50                   | push                eax

        $sequence_4 = { 8945a0 0f844f030000 8d8686090000 50 }
            // n = 4, score = 100
            //   8945a0               | mov                 dword ptr [ebp - 0x60], eax
            //   0f844f030000         | je                  0x355
            //   8d8686090000         | lea                 eax, dword ptr [esi + 0x986]
            //   50                   | push                eax

        $sequence_5 = { ff957cffffff 83f8ff 0f848b010000 50 8a4615 50 }
            // n = 6, score = 100
            //   ff957cffffff         | call                dword ptr [ebp - 0x84]
            //   83f8ff               | cmp                 eax, -1
            //   0f848b010000         | je                  0x191
            //   50                   | push                eax
            //   8a4615               | mov                 al, byte ptr [esi + 0x15]
            //   50                   | push                eax

        $sequence_6 = { 59 8945f8 ff75f4 50 6aff ff7508 53 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   ff7508               | push                dword ptr [ebp + 8]
            //   53                   | push                ebx

        $sequence_7 = { 0f840a020000 33c0 8dbd69ffffff 889d68ffffff 885d8c ab ab }
            // n = 7, score = 100
            //   0f840a020000         | je                  0x210
            //   33c0                 | xor                 eax, eax
            //   8dbd69ffffff         | lea                 edi, dword ptr [ebp - 0x97]
            //   889d68ffffff         | mov                 byte ptr [ebp - 0x98], bl
            //   885d8c               | mov                 byte ptr [ebp - 0x74], bl
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_8 = { 8aca c0e103 c0ea05 0aca 8808 }
            // n = 5, score = 100
            //   8aca                 | mov                 cl, dl
            //   c0e103               | shl                 cl, 3
            //   c0ea05               | shr                 dl, 5
            //   0aca                 | or                  cl, dl
            //   8808                 | mov                 byte ptr [eax], cl

        $sequence_9 = { 50 57 ff969c060000 3bc3 8945a0 0f844f030000 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff969c060000         | call                dword ptr [esi + 0x69c]
            //   3bc3                 | cmp                 eax, ebx
            //   8945a0               | mov                 dword ptr [ebp - 0x60], eax
            //   0f844f030000         | je                  0x355

    condition:
        7 of them and filesize < 57344
}