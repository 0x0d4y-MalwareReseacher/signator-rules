rule win_magniber_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.magniber."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.magniber"
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
        $sequence_0 = { 894dfc 8b55fc 3b55e0 7d16 8b45fc }
            // n = 5, score = 400
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   3b55e0               | cmp                 edx, dword ptr [ebp - 0x20]
            //   7d16                 | jge                 0x18
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_1 = { c78540fbffff40954000 c78544fbffff48954000 c78548fbffff50954000 c7854cfbffff58954000 c78550fbffff60954000 c78554fbffff68954000 }
            // n = 6, score = 400
            //   c78540fbffff40954000     | mov    dword ptr [ebp - 0x4c0], 0x409540
            //   c78544fbffff48954000     | mov    dword ptr [ebp - 0x4bc], 0x409548
            //   c78548fbffff50954000     | mov    dword ptr [ebp - 0x4b8], 0x409550
            //   c7854cfbffff58954000     | mov    dword ptr [ebp - 0x4b4], 0x409558
            //   c78550fbffff60954000     | mov    dword ptr [ebp - 0x4b0], 0x409560
            //   c78554fbffff68954000     | mov    dword ptr [ebp - 0x4ac], 0x409568

        $sequence_2 = { 6808020000 8d8d8cf9ffff 51 e8???????? 83c408 }
            // n = 5, score = 400
            //   6808020000           | push                0x208
            //   8d8d8cf9ffff         | lea                 ecx, [ebp - 0x674]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_3 = { c7816c040000ffffffff c745fc00000000 eb07 c745fc00000000 8b45fc }
            // n = 5, score = 400
            //   c7816c040000ffffffff     | mov    dword ptr [ecx + 0x46c], 0xffffffff
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   eb07                 | jmp                 9
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_4 = { 7d45 6a01 6a00 e8???????? }
            // n = 4, score = 400
            //   7d45                 | jge                 0x47
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   e8????????           |                     

        $sequence_5 = { 8b55fc 83c201 8955fc 8b45f8 0345a4 }
            // n = 5, score = 400
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   83c201               | add                 edx, 1
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0345a4               | add                 eax, dword ptr [ebp - 0x5c]

        $sequence_6 = { c745f401000000 ebcf 837df400 741f 8b450c }
            // n = 5, score = 400
            //   c745f401000000       | mov                 dword ptr [ebp - 0xc], 1
            //   ebcf                 | jmp                 0xffffffd1
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0
            //   741f                 | je                  0x21
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_7 = { 743f c745fc00000000 eb09 8b4dfc 83c101 894dfc }
            // n = 6, score = 400
            //   743f                 | je                  0x41
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   eb09                 | jmp                 0xb
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c101               | add                 ecx, 1
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_8 = { b3b1 3e6c 21746c2e 4834b0 184026 e221 a1????????05eef081 }
            // n = 7, score = 100
            //   b3b1                 | mov                 bl, 0xb1
            //   3e6c                 | insb                byte ptr es:[edi], dx
            //   21746c2e             | and                 dword ptr [esp + ebp*2 + 0x2e], esi
            //   4834b0               | dec                 eax
            //   184026               | xor                 al, 0xb0
            //   e221                 | sbb                 byte ptr [eax + 0x26], al
            //   a1????????05eef081     |     

        $sequence_9 = { 32cb 5a b3b1 3e6c }
            // n = 4, score = 100
            //   32cb                 | cmpsb               byte ptr [esi], byte ptr es:[edi]
            //   5a                   | outsb               dx, byte ptr [esi]
            //   b3b1                 | fcomp               dword ptr [ebx - 0x6b64d635]
            //   3e6c                 | push                esi

        $sequence_10 = { a1????????05eef081 e0f8 29aed0515fa6 8d4f0e }
            // n = 4, score = 100
            //   a1????????05eef081     |     
            //   e0f8                 | loopne              0xfffffffa
            //   29aed0515fa6         | sub                 dword ptr [esi - 0x59a0ae30], ebp
            //   8d4f0e               | lea                 ecx, [edi + 0xe]

        $sequence_11 = { 70ac 52 f8 a6 6e d89bcb299b94 }
            // n = 6, score = 100
            //   70ac                 | jg                  0x51
            //   52                   | enter               -0x2ed4, -0x3a
            //   f8                   | sbb                 dh, byte ptr [edx]
            //   a6                   | dec                 eax
            //   6e                   | xor                 al, 0xb0
            //   d89bcb299b94         | sbb                 byte ptr [eax + 0x26], al

        $sequence_12 = { 52 fc 285f44 c1c70d }
            // n = 4, score = 100
            //   52                   | lea                 ecx, [edi + 0xe]
            //   fc                   | loop                0x23
            //   285f44               | loopne              0xfffffffa
            //   c1c70d               | sub                 dword ptr [esi - 0x59a0ae30], ebp

        $sequence_13 = { 29aed0515fa6 8d4f0e 7f4c c82cd1c6 1a32 b636 }
            // n = 6, score = 100
            //   29aed0515fa6         | rol                 edi, 0xd
            //   8d4f0e               | sbb                 bl, cl
            //   7f4c                 | push                edx
            //   c82cd1c6             | cld                 
            //   1a32                 | sub                 byte ptr [edi + 0x44], bl
            //   b636                 | sub                 dword ptr [esi - 0x59a0ae30], ebp

        $sequence_14 = { d331 4e4e54 70ac 52 }
            // n = 4, score = 100
            //   d331                 | sbb                 dh, byte ptr [edx]
            //   4e4e54               | mov                 dh, 0x36
            //   70ac                 | jo                  0xffffffae
            //   52                   | push                edx

        $sequence_15 = { f76e9f 32d8 2d7a350e78 95 }
            // n = 4, score = 100
            //   f76e9f               | sub                 dword ptr [esi - 0x59a0ae30], ebp
            //   32d8                 | loopne              0xfffffffa
            //   2d7a350e78           | sub                 dword ptr [esi - 0x59a0ae30], ebp
            //   95                   | lea                 ecx, [edi + 0xe]

    condition:
        7 of them and filesize < 117760
}