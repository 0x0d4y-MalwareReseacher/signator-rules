rule win_cradlecore_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.cradlecore."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cradlecore"
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
        $sequence_0 = { b8???????? e8???????? b818120000 e8???????? 53 56 57 }
            // n = 7, score = 100
            //   b8????????           |                     
            //   e8????????           |                     
            //   b818120000           | mov                 eax, 0x1218
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_1 = { 8d4dbc e8???????? 83c618 e9???????? 8d0439 50 }
            // n = 6, score = 100
            //   8d4dbc               | lea                 ecx, dword ptr [ebp - 0x44]
            //   e8????????           |                     
            //   83c618               | add                 esi, 0x18
            //   e9????????           |                     
            //   8d0439               | lea                 eax, dword ptr [ecx + edi]
            //   50                   | push                eax

        $sequence_2 = { 8b7d08 c747140f000000 895f10 881f 895dfc }
            // n = 5, score = 100
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   c747140f000000       | mov                 dword ptr [edi + 0x14], 0xf
            //   895f10               | mov                 dword ptr [edi + 0x10], ebx
            //   881f                 | mov                 byte ptr [edi], bl
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx

        $sequence_3 = { 33db 8b4508 2bf3 89750c 8d1c03 8d4701 8d0408 }
            // n = 7, score = 100
            //   33db                 | xor                 ebx, ebx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   2bf3                 | sub                 esi, ebx
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   8d1c03               | lea                 ebx, dword ptr [ebx + eax]
            //   8d4701               | lea                 eax, dword ptr [edi + 1]
            //   8d0408               | lea                 eax, dword ptr [eax + ecx]

        $sequence_4 = { 8d4dc4 897dfc e8???????? 8d4ddc c745dc5c436872 51 8d45e4 }
            // n = 7, score = 100
            //   8d4dc4               | lea                 ecx, dword ptr [ebp - 0x3c]
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   e8????????           |                     
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   c745dc5c436872       | mov                 dword ptr [ebp - 0x24], 0x7268435c
            //   51                   | push                ecx
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]

        $sequence_5 = { 8b4508 03c1 03c3 50 e8???????? 83c40c }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   03c1                 | add                 eax, ecx
            //   03c3                 | add                 eax, ebx
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_6 = { 740d 68???????? 8d93a8010000 eb0b 68???????? 8d9378010000 e8???????? }
            // n = 7, score = 100
            //   740d                 | je                  0xf
            //   68????????           |                     
            //   8d93a8010000         | lea                 edx, dword ptr [ebx + 0x1a8]
            //   eb0b                 | jmp                 0xd
            //   68????????           |                     
            //   8d9378010000         | lea                 edx, dword ptr [ebx + 0x178]
            //   e8????????           |                     

        $sequence_7 = { 83e11f c1f805 c1e106 8b0485f01f4300 0fbe440804 83e040 5d }
            // n = 7, score = 100
            //   83e11f               | and                 ecx, 0x1f
            //   c1f805               | sar                 eax, 5
            //   c1e106               | shl                 ecx, 6
            //   8b0485f01f4300       | mov                 eax, dword ptr [eax*4 + 0x431ff0]
            //   0fbe440804           | movsx               eax, byte ptr [eax + ecx + 4]
            //   83e040               | and                 eax, 0x40
            //   5d                   | pop                 ebp

        $sequence_8 = { e8???????? 59 59 6a0b 8d7b18 8bf0 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   6a0b                 | push                0xb
            //   8d7b18               | lea                 edi, dword ptr [ebx + 0x18]
            //   8bf0                 | mov                 esi, eax

        $sequence_9 = { e8???????? 834dfcff 8d4db0 6a00 53 c745e024c84200 895dec }
            // n = 7, score = 100
            //   e8????????           |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   8d4db0               | lea                 ecx, dword ptr [ebp - 0x50]
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   c745e024c84200       | mov                 dword ptr [ebp - 0x20], 0x42c824
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx

    condition:
        7 of them and filesize < 450560
}