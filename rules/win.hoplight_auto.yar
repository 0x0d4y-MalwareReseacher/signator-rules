rule win_hoplight_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.hoplight."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hoplight"
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
        $sequence_0 = { 7c0a 8b442438 d1f8 89442438 }
            // n = 4, score = 100
            //   7c0a                 | dec                 eax
            //   8b442438             | mov                 eax, dword ptr [esp + 0x30]
            //   d1f8                 | dec                 eax
            //   89442438             | mov                 dword ptr [esp + 0x78], eax

        $sequence_1 = { 0f87a3000000 440fb7c1 488d4c2444 4883c204 }
            // n = 4, score = 100
            //   0f87a3000000         | dec                 eax
            //   440fb7c1             | mov                 ecx, dword ptr [esp + 0x30]
            //   488d4c2444           | mov                 word ptr [ecx + 0xf44], ax
            //   4883c204             | jmp                 0x1d

        $sequence_2 = { 488b842470050000 8b4018 488b8c2470050000 038198000000 }
            // n = 4, score = 100
            //   488b842470050000     | xor                 eax, esp
            //   8b4018               | dec                 eax
            //   488b8c2470050000     | mov                 dword ptr [ebp + 0x3760], eax
            //   038198000000         | mov                 edx, 4

        $sequence_3 = { 48894c2408 4883ec68 837c247802 7c07 }
            // n = 4, score = 100
            //   48894c2408           | mov                 eax, dword ptr [esp + eax*4 + 0x420]
            //   4883ec68             | dec                 eax
            //   837c247802           | mov                 dword ptr [esp + 8], ecx
            //   7c07                 | dec                 eax

        $sequence_4 = { 83bc241404000000 7433 4863842414040000 8b848420040000 }
            // n = 4, score = 100
            //   83bc241404000000     | cmp                 dword ptr [esp + 0x414], 0
            //   7433                 | je                  0x35
            //   4863842414040000     | dec                 eax
            //   8b848420040000       | arpl                word ptr [esp + 0x414], ax

        $sequence_5 = { 488b4c2430 668981440f0000 eb1b 488b442430 }
            // n = 4, score = 100
            //   488b4c2430           | dec                 eax
            //   668981440f0000       | mov                 edi, ecx
            //   eb1b                 | dec                 eax
            //   488b442430           | mov                 eax, dword ptr [esp + 0x570]

        $sequence_6 = { 4833c4 48898560370000 ba04000000 488bf9 }
            // n = 4, score = 100
            //   4833c4               | sub                 esp, 0x68
            //   48898560370000       | cmp                 dword ptr [esp + 0x78], 2
            //   ba04000000           | jl                  9
            //   488bf9               | dec                 eax

        $sequence_7 = { 4889442478 48894580 4889742468 c7450049b9824e }
            // n = 4, score = 100
            //   4889442478           | mov                 eax, dword ptr [eax + 0x18]
            //   48894580             | dec                 eax
            //   4889742468           | mov                 ecx, dword ptr [esp + 0x570]
            //   c7450049b9824e       | add                 eax, dword ptr [ecx + 0x98]

    condition:
        7 of them and filesize < 765952
}