rule win_flawedammyy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.flawedammyy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.flawedammyy"
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
        $sequence_0 = { 004bbf 42 0062bf 42 }
            // n = 4, score = 200
            //   004bbf               | add                 byte ptr [ebx - 0x41], cl
            //   42                   | inc                 edx
            //   0062bf               | add                 byte ptr [edx - 0x41], ah
            //   42                   | inc                 edx

        $sequence_1 = { 85f6 0f8849ffffff 8b45d4 8d55e8 52 c745e800000000 }
            // n = 6, score = 200
            //   85f6                 | test                esi, esi
            //   0f8849ffffff         | js                  0xffffff4f
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8d55e8               | lea                 edx, [ebp - 0x18]
            //   52                   | push                edx
            //   c745e800000000       | mov                 dword ptr [ebp - 0x18], 0

        $sequence_2 = { c745c079506572 c745c4666f726d c745c8616e6365 c745cc436f756e }
            // n = 4, score = 200
            //   c745c079506572       | mov                 dword ptr [ebp - 0x40], 0x72655079
            //   c745c4666f726d       | mov                 dword ptr [ebp - 0x3c], 0x6d726f66
            //   c745c8616e6365       | mov                 dword ptr [ebp - 0x38], 0x65636e61
            //   c745cc436f756e       | mov                 dword ptr [ebp - 0x34], 0x6e756f43

        $sequence_3 = { 68???????? 8d85b4faffff 50 8d85c0fdffff 68???????? }
            // n = 5, score = 200
            //   68????????           |                     
            //   8d85b4faffff         | lea                 eax, [ebp - 0x54c]
            //   50                   | push                eax
            //   8d85c0fdffff         | lea                 eax, [ebp - 0x240]
            //   68????????           |                     

        $sequence_4 = { 0022 8a4200 828a4200bb8a42 00ff }
            // n = 4, score = 200
            //   0022                 | add                 byte ptr [edx], ah
            //   8a4200               | mov                 al, byte ptr [edx]
            //   828a4200bb8a42       | or                  byte ptr [edx - 0x7544ffbe], 0x42
            //   00ff                 | add                 bh, bh

        $sequence_5 = { 0062bf 42 0079bf 42 }
            // n = 4, score = 200
            //   0062bf               | add                 byte ptr [edx - 0x41], ah
            //   42                   | inc                 edx
            //   0079bf               | add                 byte ptr [ecx - 0x41], bh
            //   42                   | inc                 edx

        $sequence_6 = { c785d8feffff28010000 e8???????? 83c408 8d8dd8feffff }
            // n = 4, score = 200
            //   c785d8feffff28010000     | mov    dword ptr [ebp - 0x128], 0x128
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8d8dd8feffff         | lea                 ecx, [ebp - 0x128]

        $sequence_7 = { 8d8d48ffffff 6a44 51 ffd0 68c78a3146 6a01 c78548ffffff44000000 }
            // n = 7, score = 200
            //   8d8d48ffffff         | lea                 ecx, [ebp - 0xb8]
            //   6a44                 | push                0x44
            //   51                   | push                ecx
            //   ffd0                 | call                eax
            //   68c78a3146           | push                0x46318ac7
            //   6a01                 | push                1
            //   c78548ffffff44000000     | mov    dword ptr [ebp - 0xb8], 0x44

        $sequence_8 = { 00b3854200e5 854200 37 864200 }
            // n = 4, score = 200
            //   00b3854200e5         | add                 byte ptr [ebx - 0x1affbd7b], dh
            //   854200               | test                dword ptr [edx], eax
            //   37                   | aaa                 
            //   864200               | xchg                byte ptr [edx], al

        $sequence_9 = { 002a e342 0039 e342 }
            // n = 4, score = 200
            //   002a                 | add                 byte ptr [edx], ch
            //   e342                 | jecxz               0x44
            //   0039                 | add                 byte ptr [ecx], bh
            //   e342                 | jecxz               0x44

        $sequence_10 = { 51 8b11 8bf0 ff5208 85f6 0f881effffff 68???????? }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8bf0                 | mov                 esi, eax
            //   ff5208               | call                dword ptr [edx + 8]
            //   85f6                 | test                esi, esi
            //   0f881effffff         | js                  0xffffff24
            //   68????????           |                     

        $sequence_11 = { 8b08 50 ff9190000000 8b4dfc 6a05 8b11 51 }
            // n = 7, score = 200
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   50                   | push                eax
            //   ff9190000000         | call                dword ptr [ecx + 0x90]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   6a05                 | push                5
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   51                   | push                ecx

        $sequence_12 = { 0039 e342 0048e3 42 }
            // n = 4, score = 200
            //   0039                 | add                 byte ptr [ecx], bh
            //   e342                 | jecxz               0x44
            //   0048e3               | add                 byte ptr [eax - 0x1d], cl
            //   42                   | inc                 edx

        $sequence_13 = { 0000 0404 0404 0404 0401 }
            // n = 5, score = 200
            //   0000                 | add                 byte ptr [eax], al
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0404                 | add                 al, 4
            //   0401                 | add                 al, 1

        $sequence_14 = { 8b048588ae4100 f644010440 7409 803a1a }
            // n = 4, score = 200
            //   8b048588ae4100       | mov                 eax, dword ptr [eax*4 + 0x41ae88]
            //   f644010440           | test                byte ptr [ecx + eax + 4], 0x40
            //   7409                 | je                  0xb
            //   803a1a               | cmp                 byte ptr [edx], 0x1a

        $sequence_15 = { 0018 874200 58 874200 }
            // n = 4, score = 200
            //   0018                 | add                 byte ptr [eax], bl
            //   874200               | xchg                dword ptr [edx], eax
            //   58                   | pop                 eax
            //   874200               | xchg                dword ptr [edx], eax

        $sequence_16 = { 8d443802 50 6a40 ff15???????? }
            // n = 4, score = 100
            //   8d443802             | lea                 eax, [eax + edi + 2]
            //   50                   | push                eax
            //   6a40                 | push                0x40
            //   ff15????????         |                     

        $sequence_17 = { 0f8781000000 ff248dfd243400 881f eb76 ff30 }
            // n = 5, score = 100
            //   0f8781000000         | ja                  0x87
            //   ff248dfd243400       | jmp                 dword ptr [ecx*4 + 0x3424fd]
            //   881f                 | mov                 byte ptr [edi], bl
            //   eb76                 | jmp                 0x78
            //   ff30                 | push                dword ptr [eax]

        $sequence_18 = { 66ab aa 33c0 8d7dac 895da8 }
            // n = 5, score = 100
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   33c0                 | xor                 eax, eax
            //   8d7dac               | lea                 edi, [ebp - 0x54]
            //   895da8               | mov                 dword ptr [ebp - 0x58], ebx

        $sequence_19 = { 837efcff 7518 8b46f8 8b04855c303400 }
            // n = 4, score = 100
            //   837efcff             | cmp                 dword ptr [esi - 4], -1
            //   7518                 | jne                 0x1a
            //   8b46f8               | mov                 eax, dword ptr [esi - 8]
            //   8b04855c303400       | mov                 eax, dword ptr [eax*4 + 0x34305c]

        $sequence_20 = { 741f 8b3d???????? 53 68???????? 53 }
            // n = 5, score = 100
            //   741f                 | je                  0x21
            //   8b3d????????         |                     
            //   53                   | push                ebx
            //   68????????           |                     
            //   53                   | push                ebx

        $sequence_21 = { a2???????? eb07 c605????????00 c705????????4c403400 ff7508 ff15???????? }
            // n = 6, score = 100
            //   a2????????           |                     
            //   eb07                 | jmp                 9
            //   c605????????00       |                     
            //   c705????????4c403400     |     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     

        $sequence_22 = { 8b3c857c303400 c745ecffff0000 0faff9 83f801 }
            // n = 4, score = 100
            //   8b3c857c303400       | mov                 edi, dword ptr [eax*4 + 0x34307c]
            //   c745ecffff0000       | mov                 dword ptr [ebp - 0x14], 0xffff
            //   0faff9               | imul                edi, ecx
            //   83f801               | cmp                 eax, 1

        $sequence_23 = { 895df4 8d41de 33db 83f855 0f872affffff 0fb6805a213400 ff2485f6203400 }
            // n = 7, score = 100
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   8d41de               | lea                 eax, [ecx - 0x22]
            //   33db                 | xor                 ebx, ebx
            //   83f855               | cmp                 eax, 0x55
            //   0f872affffff         | ja                  0xffffff30
            //   0fb6805a213400       | movzx               eax, byte ptr [eax + 0x34215a]
            //   ff2485f6203400       | jmp                 dword ptr [eax*4 + 0x3420f6]

        $sequence_24 = { 381e 0f848e000000 8a06 3c0d 7505 881e 46 }
            // n = 7, score = 100
            //   381e                 | cmp                 byte ptr [esi], bl
            //   0f848e000000         | je                  0x94
            //   8a06                 | mov                 al, byte ptr [esi]
            //   3c0d                 | cmp                 al, 0xd
            //   7505                 | jne                 7
            //   881e                 | mov                 byte ptr [esi], bl
            //   46                   | inc                 esi

        $sequence_25 = { 8d7201 8a1e 80fb78 7405 }
            // n = 4, score = 100
            //   8d7201               | lea                 esi, [edx + 1]
            //   8a1e                 | mov                 bl, byte ptr [esi]
            //   80fb78               | cmp                 bl, 0x78
            //   7405                 | je                  7

        $sequence_26 = { ff2485f6203400 8b8614080000 3b45f4 7e03 }
            // n = 4, score = 100
            //   ff2485f6203400       | jmp                 dword ptr [eax*4 + 0x3420f6]
            //   8b8614080000         | mov                 eax, dword ptr [esi + 0x814]
            //   3b45f4               | cmp                 eax, dword ptr [ebp - 0xc]
            //   7e03                 | jle                 5

        $sequence_27 = { 6a07 e9???????? 33c0 8b7df4 8b0c855c303400 }
            // n = 5, score = 100
            //   6a07                 | push                7
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   8b0c855c303400       | mov                 ecx, dword ptr [eax*4 + 0x34305c]

        $sequence_28 = { f6450802 a1???????? 7505 b800100000 }
            // n = 4, score = 100
            //   f6450802             | test                byte ptr [ebp + 8], 2
            //   a1????????           |                     
            //   7505                 | jne                 7
            //   b800100000           | mov                 eax, 0x1000

        $sequence_29 = { 837c240800 7413 8d4604 50 }
            // n = 4, score = 100
            //   837c240800           | cmp                 dword ptr [esp + 8], 0
            //   7413                 | je                  0x15
            //   8d4604               | lea                 eax, [esi + 4]
            //   50                   | push                eax

        $sequence_30 = { ab c745a444000000 ff15???????? 50 8d85a4fbffff }
            // n = 5, score = 100
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   c745a444000000       | mov                 dword ptr [ebp - 0x5c], 0x44
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8d85a4fbffff         | lea                 eax, [ebp - 0x45c]

        $sequence_31 = { 8b14957c303400 49 0fafd1 0155fc 46 83c020 }
            // n = 6, score = 100
            //   8b14957c303400       | mov                 edx, dword ptr [edx*4 + 0x34307c]
            //   49                   | dec                 ecx
            //   0fafd1               | imul                edx, ecx
            //   0155fc               | add                 dword ptr [ebp - 4], edx
            //   46                   | inc                 esi
            //   83c020               | add                 eax, 0x20

    condition:
        7 of them and filesize < 1350656
}