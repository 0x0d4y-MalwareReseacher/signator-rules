rule win_plurox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.plurox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.plurox"
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
        $sequence_0 = { 90 f9 0925???????? 0000 }
            // n = 4, score = 100
            //   90                   | nop                 
            //   f9                   | stc                 
            //   0925????????         |                     
            //   0000                 | add                 byte ptr [eax], al

        $sequence_1 = { 1a6e00 0000 94 624a8b 0416 }
            // n = 5, score = 100
            //   1a6e00               | sbb                 ch, byte ptr [esi]
            //   0000                 | add                 byte ptr [eax], al
            //   94                   | xchg                eax, esp
            //   624a8b               | bound               ecx, qword ptr [edx - 0x75]
            //   0416                 | add                 al, 0x16

        $sequence_2 = { 6f b804000000 4e 4f b84e4f3dd9 }
            // n = 5, score = 100
            //   6f                   | outsd               dx, dword ptr [esi]
            //   b804000000           | mov                 eax, 4
            //   4e                   | dec                 esi
            //   4f                   | dec                 edi
            //   b84e4f3dd9           | mov                 eax, 0xd93d4f4e

        $sequence_3 = { 94 f8 21480e 2a15???????? 6f b804000000 }
            // n = 6, score = 100
            //   94                   | xchg                eax, esp
            //   f8                   | clc                 
            //   21480e               | and                 dword ptr [eax + 0xe], ecx
            //   2a15????????         |                     
            //   6f                   | outsd               dx, dword ptr [esi]
            //   b804000000           | mov                 eax, 4

        $sequence_4 = { e9???????? e408 6873d30808 94 e519 e8???????? 0000 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   e408                 | in                  al, 8
            //   6873d30808           | push                0x808d373
            //   94                   | xchg                eax, esp
            //   e519                 | in                  eax, 0x19
            //   e8????????           |                     
            //   0000                 | add                 byte ptr [eax], al

        $sequence_5 = { 8918 43 0416 0a20 0816 ec bbf2000000 }
            // n = 7, score = 100
            //   8918                 | mov                 dword ptr [eax], ebx
            //   43                   | inc                 ebx
            //   0416                 | add                 al, 0x16
            //   0a20                 | or                  ah, byte ptr [eax]
            //   0816                 | or                  byte ptr [esi], dl
            //   ec                   | in                  al, dx
            //   bbf2000000           | mov                 ebx, 0xf2

        $sequence_6 = { 8a00 46 0c83 47 }
            // n = 4, score = 100
            //   8a00                 | mov                 al, byte ptr [eax]
            //   46                   | inc                 esi
            //   0c83                 | or                  al, 0x83
            //   47                   | inc                 edi

        $sequence_7 = { 624a8b 0416 128bc606091a f6870f1a000000 e10d }
            // n = 5, score = 100
            //   624a8b               | bound               ecx, qword ptr [edx - 0x75]
            //   0416                 | add                 al, 0x16
            //   128bc606091a         | adc                 cl, byte ptr [ebx + 0x1a0906c6]
            //   f6870f1a000000       | test                byte ptr [edi + 0x1a0f], 0
            //   e10d                 | loope               0xf

        $sequence_8 = { 07 f3cf 6b0000 0025???????? 7171 6805245f07 40 }
            // n = 7, score = 100
            //   07                   | pop                 es
            //   f3cf                 | iretd               
            //   6b0000               | imul                eax, dword ptr [eax], 0
            //   0025????????         |                     
            //   7171                 | jno                 0x73
            //   6805245f07           | push                0x75f2405
            //   40                   | inc                 eax

        $sequence_9 = { 64841a 6c 2432 3449 }
            // n = 4, score = 100
            //   64841a               | test                byte ptr fs:[edx], bl
            //   6c                   | insb                byte ptr es:[edi], dx
            //   2432                 | and                 al, 0x32
            //   3449                 | xor                 al, 0x49

    condition:
        7 of them and filesize < 475136
}