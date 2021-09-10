rule win_hermes_ransom_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.hermes_ransom."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hermes_ransom"
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
        $sequence_0 = { ff75fc ff15???????? 33c0 e9???????? 8365c000 33c0 }
            // n = 6, score = 100
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8365c000             | and                 dword ptr [ebp - 0x40], 0
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 0f869e000000 83a538ffffff00 33c0 89853cffffff 6a02 6a00 ffb53cffffff }
            // n = 7, score = 100
            //   0f869e000000         | jbe                 0xa4
            //   83a538ffffff00       | and                 dword ptr [ebp - 0xc8], 0
            //   33c0                 | xor                 eax, eax
            //   89853cffffff         | mov                 dword ptr [ebp - 0xc4], eax
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   ffb53cffffff         | push                dword ptr [ebp - 0xc4]

        $sequence_2 = { 56 57 6a0a 59 be???????? 8dbd50ffffff }
            // n = 6, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a0a                 | push                0xa
            //   59                   | pop                 ecx
            //   be????????           |                     
            //   8dbd50ffffff         | lea                 edi, dword ptr [ebp - 0xb0]

        $sequence_3 = { ff35???????? ff15???????? 8945e8 837de800 7508 6a01 }
            // n = 6, score = 100
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   7508                 | jne                 0xa
            //   6a01                 | push                1

        $sequence_4 = { 50 e8???????? 59 59 85c0 753c }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   753c                 | jne                 0x3e

        $sequence_5 = { 6a00 6a02 6800000040 8d85e0f6ffff 50 ff15???????? 8945d8 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   6800000040           | push                0x40000000
            //   8d85e0f6ffff         | lea                 eax, dword ptr [ebp - 0x920]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax

        $sequence_6 = { 6a00 ff15???????? 8945e8 837de800 7508 6a03 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   7508                 | jne                 0xa
            //   6a03                 | push                3

        $sequence_7 = { 8b5508 0fb70c4a 2bc1 eb0b 8b45fc 40 8945fc }
            // n = 7, score = 100
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0fb70c4a             | movzx               ecx, word ptr [edx + ecx*2]
            //   2bc1                 | sub                 eax, ecx
            //   eb0b                 | jmp                 0xd
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_8 = { d1e0 33c9 66898848094100 833d????????01 7513 68???????? 68???????? }
            // n = 7, score = 100
            //   d1e0                 | shl                 eax, 1
            //   33c9                 | xor                 ecx, ecx
            //   66898848094100       | mov                 word ptr [eax + 0x410948], cx
            //   833d????????01       |                     
            //   7513                 | jne                 0x15
            //   68????????           |                     
            //   68????????           |                     

        $sequence_9 = { 3b05???????? 7d34 8b45e4 0fb7344528ae4000 68???????? e8???????? 59 }
            // n = 7, score = 100
            //   3b05????????         |                     
            //   7d34                 | jge                 0x36
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   0fb7344528ae4000     | movzx               esi, word ptr [eax*2 + 0x40ae28]
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 7192576
}