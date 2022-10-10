rule win_moure_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.moure."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moure"
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
        $sequence_0 = { e8???????? 83651000 8d4510 50 00750c 8bce 007508 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83651000             | and                 dword ptr [ebp + 0x10], 0
            //   8d4510               | lea                 eax, [ebp + 0x10]
            //   50                   | push                eax
            //   00750c               | add                 byte ptr [ebp + 0xc], dh
            //   8bce                 | mov                 ecx, esi
            //   007508               | add                 byte ptr [ebp + 8], dh

        $sequence_1 = { 8325????????00 8d4514 50 007514 }
            // n = 4, score = 100
            //   8325????????00       |                     
            //   8d4514               | lea                 eax, [ebp + 0x14]
            //   50                   | push                eax
            //   007514               | add                 byte ptr [ebp + 0x14], dh

        $sequence_2 = { 8bd8 5f 807d0000 7402 f7db 8b4d0c 8bc3 }
            // n = 7, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   5f                   | pop                 edi
            //   807d0000             | cmp                 byte ptr [ebp], 0
            //   7402                 | je                  4
            //   f7db                 | neg                 ebx
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8bc3                 | mov                 eax, ebx

        $sequence_3 = { f5 bcbabfbfa8 695b0000ab4973 8026c9 c5bcbabfbfc580 3450 cdc5 }
            // n = 7, score = 100
            //   f5                   | cmc                 
            //   bcbabfbfa8           | mov                 esp, 0xa8bfbfba
            //   695b0000ab4973       | imul                ebx, dword ptr [ebx], 0x7349ab00
            //   8026c9               | and                 byte ptr [esi], 0xc9
            //   c5bcbabfbfc580       | lds                 edi, ptr [edx + edi*4 - 0x7f3a4041]
            //   3450                 | xor                 al, 0x50
            //   cdc5                 | int                 0xc5

        $sequence_4 = { 741c 0bc1 50 007514 007510 00750c 007508 }
            // n = 7, score = 100
            //   741c                 | je                  0x1e
            //   0bc1                 | or                  eax, ecx
            //   50                   | push                eax
            //   007514               | add                 byte ptr [ebp + 0x14], dh
            //   007510               | add                 byte ptr [ebp + 0x10], dh
            //   00750c               | add                 byte ptr [ebp + 0xc], dh
            //   007508               | add                 byte ptr [ebp + 8], dh

        $sequence_5 = { 81c3a769ef24 5b ff7590 51 }
            // n = 4, score = 100
            //   81c3a769ef24         | add                 ebx, 0x24ef69a7
            //   5b                   | pop                 ebx
            //   ff7590               | push                dword ptr [ebp - 0x70]
            //   51                   | push                ecx

        $sequence_6 = { 5b c1ea10 03da 50 52 }
            // n = 5, score = 100
            //   5b                   | pop                 ebx
            //   c1ea10               | shr                 edx, 0x10
            //   03da                 | add                 ebx, edx
            //   50                   | push                eax
            //   52                   | push                edx

        $sequence_7 = { 8b3d???????? 6a58 53 00d7 6a5a 53 89462c }
            // n = 7, score = 100
            //   8b3d????????         |                     
            //   6a58                 | push                0x58
            //   53                   | push                ebx
            //   00d7                 | add                 bh, dl
            //   6a5a                 | push                0x5a
            //   53                   | push                ebx
            //   89462c               | mov                 dword ptr [esi + 0x2c], eax

        $sequence_8 = { 5f 8b431c 51 03c9 8d8a59a2847b 2bcd 8d4c1952 }
            // n = 7, score = 100
            //   5f                   | pop                 edi
            //   8b431c               | mov                 eax, dword ptr [ebx + 0x1c]
            //   51                   | push                ecx
            //   03c9                 | add                 ecx, ecx
            //   8d8a59a2847b         | lea                 ecx, [edx + 0x7b84a259]
            //   2bcd                 | sub                 ecx, ebp
            //   8d4c1952             | lea                 ecx, [ecx + ebx + 0x52]

        $sequence_9 = { 50 83c004 50 ff15???????? 8b06 3345fc }
            // n = 6, score = 100
            //   50                   | push                eax
            //   83c004               | add                 eax, 4
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   3345fc               | xor                 eax, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 188416
}