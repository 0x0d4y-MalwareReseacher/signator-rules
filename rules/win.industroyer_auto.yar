rule win_industroyer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.industroyer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.industroyer"
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
        $sequence_0 = { e8???????? 814dd801010000 83c410 8975ac 8b7508 6804010000 }
            // n = 6, score = 600
            //   e8????????           |                     
            //   814dd801010000       | or                  dword ptr [ebp - 0x28], 0x101
            //   83c410               | add                 esp, 0x10
            //   8975ac               | mov                 dword ptr [ebp - 0x54], esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   6804010000           | push                0x104

        $sequence_1 = { 6808020000 ff15???????? 8d85ecfbffff 50 6a7b }
            // n = 5, score = 600
            //   6808020000           | push                0x208
            //   ff15????????         |                     
            //   8d85ecfbffff         | lea                 eax, [ebp - 0x414]
            //   50                   | push                eax
            //   6a7b                 | push                0x7b

        $sequence_2 = { 83c418 8d04b0 83c004 5e }
            // n = 4, score = 600
            //   83c418               | add                 esp, 0x18
            //   8d04b0               | lea                 eax, [eax + esi*4]
            //   83c004               | add                 eax, 4
            //   5e                   | pop                 esi

        $sequence_3 = { 8d8578f5ffff 50 8d8598fdffff 50 ff75fc ff15???????? 837de400 }
            // n = 7, score = 600
            //   8d8578f5ffff         | lea                 eax, [ebp - 0xa88]
            //   50                   | push                eax
            //   8d8598fdffff         | lea                 eax, [ebp - 0x268]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   837de400             | cmp                 dword ptr [ebp - 0x1c], 0

        $sequence_4 = { 57 57 57 68???????? 51 }
            // n = 5, score = 600
            //   57                   | push                edi
            //   57                   | push                edi
            //   57                   | push                edi
            //   68????????           |                     
            //   51                   | push                ecx

        $sequence_5 = { 8945e8 e8???????? 83c40c 8945f4 e8???????? }
            // n = 5, score = 600
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   e8????????           |                     

        $sequence_6 = { 8d8584f5ffff 68???????? 50 ff15???????? 83c40c 8d45f0 }
            // n = 6, score = 600
            //   8d8584f5ffff         | lea                 eax, [ebp - 0xa7c]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_7 = { 6a00 e8???????? 59 59 39450c 7604 }
            // n = 6, score = 600
            //   6a00                 | push                0
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   39450c               | cmp                 dword ptr [ebp + 0xc], eax
            //   7604                 | jbe                 6

        $sequence_8 = { 50 57 8d842470020000 50 ffd3 8d8c2468020000 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   57                   | push                edi
            //   8d842470020000       | lea                 eax, [esp + 0x270]
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8d8c2468020000       | lea                 ecx, [esp + 0x268]

        $sequence_9 = { 8b542414 8d8c2468020000 e8???????? 8d442418 50 ff742414 ff15???????? }
            // n = 7, score = 400
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   8d8c2468020000       | lea                 ecx, [esp + 0x268]
            //   e8????????           |                     
            //   8d442418             | lea                 eax, [esp + 0x18]
            //   50                   | push                eax
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   ff15????????         |                     

        $sequence_10 = { 56 57 8bbdf8efffff 33f6 c1ef02 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bbdf8efffff         | mov                 edi, dword ptr [ebp - 0x1008]
            //   33f6                 | xor                 esi, esi
            //   c1ef02               | shr                 edi, 2

        $sequence_11 = { ffd6 85c0 7441 68???????? 8d442448 }
            // n = 5, score = 400
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7441                 | je                  0x43
            //   68????????           |                     
            //   8d442448             | lea                 eax, [esp + 0x48]

        $sequence_12 = { 51 53 56 57 6a00 6880000000 6a03 }
            // n = 7, score = 400
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a03                 | push                3

        $sequence_13 = { ff15???????? 8b3d???????? 85c0 0f858c000000 0f1f8000000000 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   85c0                 | test                eax, eax
            //   0f858c000000         | jne                 0x92
            //   0f1f8000000000       | nop                 dword ptr [eax]

        $sequence_14 = { ff15???????? 8bf0 83feff 743c 6690 f644241810 751c }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1
            //   743c                 | je                  0x3e
            //   6690                 | nop                 
            //   f644241810           | test                byte ptr [esp + 0x18], 0x10
            //   751c                 | jne                 0x1e

        $sequence_15 = { 8b0d???????? 83c410 81f9a0860100 0f8381000000 }
            // n = 4, score = 400
            //   8b0d????????         |                     
            //   83c410               | add                 esp, 0x10
            //   81f9a0860100         | cmp                 ecx, 0x186a0
            //   0f8381000000         | jae                 0x87

        $sequence_16 = { a3???????? 660fd605???????? c705????????00000000 c705????????10000000 c705????????00000000 }
            // n = 5, score = 200
            //   a3????????           |                     
            //   660fd605????????     |                     
            //   c705????????00000000     |     
            //   c705????????10000000     |     
            //   c705????????00000000     |     

        $sequence_17 = { ff15???????? 8b3d???????? 0f57c0 8b1d???????? 0f1105???????? a3???????? }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   0f57c0               | xorps               xmm0, xmm0
            //   8b1d????????         |                     
            //   0f1105????????       |                     
            //   a3????????           |                     

        $sequence_18 = { b9???????? 8d8332020000 0f1f4000 8a10 3a11 }
            // n = 5, score = 200
            //   b9????????           |                     
            //   8d8332020000         | lea                 eax, [ebx + 0x232]
            //   0f1f4000             | nop                 dword ptr [eax]
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   3a11                 | cmp                 dl, byte ptr [ecx]

        $sequence_19 = { 8b4f04 83e804 50 8d85f6feffff 50 e8???????? }
            // n = 6, score = 200
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   83e804               | sub                 eax, 4
            //   50                   | push                eax
            //   8d85f6feffff         | lea                 eax, [ebp - 0x10a]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_20 = { 8b4604 83c40c 8a08 0fb6c1 }
            // n = 4, score = 200
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   83c40c               | add                 esp, 0xc
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   0fb6c1               | movzx               eax, cl

        $sequence_21 = { e8???????? 89442418 c6430100 c6430401 eb04 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   c6430100             | mov                 byte ptr [ebx + 1], 0
            //   c6430401             | mov                 byte ptr [ebx + 4], 1
            //   eb04                 | jmp                 6

        $sequence_22 = { eb07 8b04cd24ee4000 5f 5e 5b }
            // n = 5, score = 200
            //   eb07                 | jmp                 9
            //   8b04cd24ee4000       | mov                 eax, dword ptr [ecx*8 + 0x40ee24]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_23 = { 6a00 ff15???????? 8b35???????? 6a02 }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   6a02                 | push                2

        $sequence_24 = { 247f 88441628 eb12 0c80 88441628 8b0cbdd01f0210 }
            // n = 6, score = 200
            //   247f                 | and                 al, 0x7f
            //   88441628             | mov                 byte ptr [esi + edx + 0x28], al
            //   eb12                 | jmp                 0x14
            //   0c80                 | or                  al, 0x80
            //   88441628             | mov                 byte ptr [esi + edx + 0x28], al
            //   8b0cbdd01f0210       | mov                 ecx, dword ptr [edi*4 + 0x10021fd0]

        $sequence_25 = { b802000000 833d????????00 0f85b00a0000 8d0d90fd4000 ba1b000000 }
            // n = 5, score = 200
            //   b802000000           | mov                 eax, 2
            //   833d????????00       |                     
            //   0f85b00a0000         | jne                 0xab6
            //   8d0d90fd4000         | lea                 ecx, [0x40fd90]
            //   ba1b000000           | mov                 edx, 0x1b

        $sequence_26 = { f20f59db 660f282d???????? 660f59f5 660f28aa40fe4000 660f54e5 }
            // n = 5, score = 200
            //   f20f59db             | mulsd               xmm3, xmm3
            //   660f282d????????     |                     
            //   660f59f5             | mulpd               xmm6, xmm5
            //   660f28aa40fe4000     | movapd              xmm5, xmmword ptr [edx + 0x40fe40]
            //   660f54e5             | andpd               xmm4, xmm5

        $sequence_27 = { 6689442444 8d442424 6a0a 50 8b8344020000 0f11442438 }
            // n = 6, score = 200
            //   6689442444           | mov                 word ptr [esp + 0x44], ax
            //   8d442424             | lea                 eax, [esp + 0x24]
            //   6a0a                 | push                0xa
            //   50                   | push                eax
            //   8b8344020000         | mov                 eax, dword ptr [ebx + 0x244]
            //   0f11442438           | movups              xmmword ptr [esp + 0x38], xmm0

        $sequence_28 = { 8d44243c 50 ff15???????? 50 ff15???????? 8bf8 85ff }
            // n = 7, score = 200
            //   8d44243c             | lea                 eax, [esp + 0x3c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi

        $sequence_29 = { e8???????? 83c404 89450c 8bc8 c745fc00000000 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   8bc8                 | mov                 ecx, eax
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0

        $sequence_30 = { c705????????00000000 ffd3 a1???????? 6aff 8945f8 }
            // n = 5, score = 200
            //   c705????????00000000     |     
            //   ffd3                 | call                ebx
            //   a1????????           |                     
            //   6aff                 | push                -1
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_31 = { 0fb705???????? 6689411e 8b815c020000 898160020000 8b8168020000 }
            // n = 5, score = 200
            //   0fb705????????       |                     
            //   6689411e             | mov                 word ptr [ecx + 0x1e], ax
            //   8b815c020000         | mov                 eax, dword ptr [ecx + 0x25c]
            //   898160020000         | mov                 dword ptr [ecx + 0x260], eax
            //   8b8168020000         | mov                 eax, dword ptr [ecx + 0x268]

        $sequence_32 = { e8???????? 8b55fc 8d0437 83c40c 894204 8b7508 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8d0437               | lea                 eax, [edi + esi]
            //   83c40c               | add                 esp, 0xc
            //   894204               | mov                 dword ptr [edx + 4], eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_33 = { 3918 0f84ac000000 8d442458 50 8d8c24d0000000 }
            // n = 5, score = 100
            //   3918                 | cmp                 dword ptr [eax], ebx
            //   0f84ac000000         | je                  0xb2
            //   8d442458             | lea                 eax, [esp + 0x58]
            //   50                   | push                eax
            //   8d8c24d0000000       | lea                 ecx, [esp + 0xd0]

        $sequence_34 = { 2b7508 d1fe 56 e8???????? 84c0 }
            // n = 5, score = 100
            //   2b7508               | sub                 esi, dword ptr [ebp + 8]
            //   d1fe                 | sar                 esi, 1
            //   56                   | push                esi
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_35 = { 8bb560ffffff 2bc6 6a0c 59 99 f7f9 }
            // n = 6, score = 100
            //   8bb560ffffff         | mov                 esi, dword ptr [ebp - 0xa0]
            //   2bc6                 | sub                 eax, esi
            //   6a0c                 | push                0xc
            //   59                   | pop                 ecx
            //   99                   | cdq                 
            //   f7f9                 | idiv                ecx

        $sequence_36 = { 56 e8???????? 807d0c00 8a5d08 59 6a02 59 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   807d0c00             | cmp                 byte ptr [ebp + 0xc], 0
            //   8a5d08               | mov                 bl, byte ptr [ebp + 8]
            //   59                   | pop                 ecx
            //   6a02                 | push                2
            //   59                   | pop                 ecx

        $sequence_37 = { c744243c148c4000 c74424502c010000 895c2454 56 8d4c245c }
            // n = 5, score = 100
            //   c744243c148c4000     | mov                 dword ptr [esp + 0x3c], 0x408c14
            //   c74424502c010000     | mov                 dword ptr [esp + 0x50], 0x12c
            //   895c2454             | mov                 dword ptr [esp + 0x54], ebx
            //   56                   | push                esi
            //   8d4c245c             | lea                 ecx, [esp + 0x5c]

        $sequence_38 = { c7431407000000 894b10 668903 8b4510 8975dc 39450c }
            // n = 6, score = 100
            //   c7431407000000       | mov                 dword ptr [ebx + 0x14], 7
            //   894b10               | mov                 dword ptr [ebx + 0x10], ecx
            //   668903               | mov                 word ptr [ebx], ax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi
            //   39450c               | cmp                 dword ptr [ebp + 0xc], eax

        $sequence_39 = { 83c8ff 85c0 7831 8b1cc5647a4400 }
            // n = 4, score = 100
            //   83c8ff               | or                  eax, 0xffffffff
            //   85c0                 | test                eax, eax
            //   7831                 | js                  0x33
            //   8b1cc5647a4400       | mov                 ebx, dword ptr [eax*8 + 0x447a64]

    condition:
        7 of them and filesize < 983040
}