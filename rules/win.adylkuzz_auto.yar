rule win_adylkuzz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.adylkuzz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.adylkuzz"
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
        $sequence_0 = { d9c9 dfe9 ddd8 7a6d 756b 8b4370 c6437528 }
            // n = 7, score = 100
            //   d9c9                 | fxch                st(1)
            //   dfe9                 | fucompi             st(1)
            //   ddd8                 | fstp                st(0)
            //   7a6d                 | jp                  0x6f
            //   756b                 | jne                 0x6d
            //   8b4370               | mov                 eax, dword ptr [ebx + 0x70]
            //   c6437528             | mov                 byte ptr [ebx + 0x75], 0x28

        $sequence_1 = { e8???????? 891c24 c744240405000000 89c6 e8???????? 89d9 66897370 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   c744240405000000     | mov                 dword ptr [esp + 4], 5
            //   89c6                 | mov                 esi, eax
            //   e8????????           |                     
            //   89d9                 | mov                 ecx, ebx
            //   66897370             | mov                 word ptr [ebx + 0x70], si

        $sequence_2 = { f9 03f8 57 c3 8b442504 f7d2 8b542500 }
            // n = 7, score = 100
            //   f9                   | stc                 
            //   03f8                 | add                 edi, eax
            //   57                   | push                edi
            //   c3                   | ret                 
            //   8b442504             | mov                 eax, dword ptr [ebp + 4]
            //   f7d2                 | not                 edx
            //   8b542500             | mov                 edx, dword ptr [ebp]

        $sequence_3 = { d2c8 8a442504 6681fba51d f7c3784bdd7d 81c506000000 368801 0fc8 }
            // n = 7, score = 100
            //   d2c8                 | ror                 al, cl
            //   8a442504             | mov                 al, byte ptr [ebp + 4]
            //   6681fba51d           | cmp                 bx, 0x1da5
            //   f7c3784bdd7d         | test                ebx, 0x7ddd4b78
            //   81c506000000         | add                 ebp, 6
            //   368801               | mov                 byte ptr ss:[ecx], al
            //   0fc8                 | bswap               eax

        $sequence_4 = { c7450c20f04400 894d08 5d e9???????? 55 89e5 8b450c }
            // n = 7, score = 100
            //   c7450c20f04400       | mov                 dword ptr [ebp + 0xc], 0x44f020
            //   894d08               | mov                 dword ptr [ebp + 8], ecx
            //   5d                   | pop                 ebp
            //   e9????????           |                     
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_5 = { eb21 807c24200e 7530 8b5768 81e200040000 83fa01 19d2 }
            // n = 7, score = 100
            //   eb21                 | jmp                 0x23
            //   807c24200e           | cmp                 byte ptr [esp + 0x20], 0xe
            //   7530                 | jne                 0x32
            //   8b5768               | mov                 edx, dword ptr [edi + 0x68]
            //   81e200040000         | and                 edx, 0x400
            //   83fa01               | cmp                 edx, 1
            //   19d2                 | sbb                 edx, edx

        $sequence_6 = { d9dd 60 6e f6ef 14df 4b 5f }
            // n = 7, score = 100
            //   d9dd                 | fstpnce             st(5), st(0)
            //   60                   | pushal              
            //   6e                   | outsb               dx, byte ptr [esi]
            //   f6ef                 | imul                bh
            //   14df                 | adc                 al, 0xdf
            //   4b                   | dec                 ebx
            //   5f                   | pop                 edi

        $sequence_7 = { f6416201 740f 8b4178 8b400c 894170 b802000000 c3 }
            // n = 7, score = 100
            //   f6416201             | test                byte ptr [ecx + 0x62], 1
            //   740f                 | je                  0x11
            //   8b4178               | mov                 eax, dword ptr [ecx + 0x78]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   894170               | mov                 dword ptr [ecx + 0x70], eax
            //   b802000000           | mov                 eax, 2
            //   c3                   | ret                 

        $sequence_8 = { f9 32d8 c0c923 662bcd 668b4c2500 663bf6 84dd }
            // n = 7, score = 100
            //   f9                   | stc                 
            //   32d8                 | xor                 bl, al
            //   c0c923               | ror                 cl, 0x23
            //   662bcd               | sub                 cx, bp
            //   668b4c2500           | mov                 cx, word ptr [ebp]
            //   663bf6               | cmp                 si, si
            //   84dd                 | test                ch, bl

        $sequence_9 = { 83ff02 7541 bd02000000 31c9 ba02000000 89d8 e8???????? }
            // n = 7, score = 100
            //   83ff02               | cmp                 edi, 2
            //   7541                 | jne                 0x43
            //   bd02000000           | mov                 ebp, 2
            //   31c9                 | xor                 ecx, ecx
            //   ba02000000           | mov                 edx, 2
            //   89d8                 | mov                 eax, ebx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 6438912
}