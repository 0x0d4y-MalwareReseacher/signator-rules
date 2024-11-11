rule win_mespinoza_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.mespinoza."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mespinoza"
        malpedia_rule_date = "20241030"
        malpedia_hash = "26e26953c49c8efafbf72a38076855d578e0a2e4"
        malpedia_version = "20241030"
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
        $sequence_0 = { 85f6 7421 6a2c 6a00 56 e8???????? }
            // n = 6, score = 200
            //   85f6                 | test                esi, esi
            //   7421                 | je                  0x23
            //   6a2c                 | push                0x2c
            //   6a00                 | push                0
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_1 = { 59 837d0800 89460c 7416 85c0 7412 }
            // n = 6, score = 200
            //   59                   | pop                 ecx
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   7416                 | je                  0x18
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14

        $sequence_2 = { 50 e8???????? 83650c00 8bce 57 e8???????? 8b4510 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83650c00             | and                 dword ptr [ebp + 0xc], 0
            //   8bce                 | mov                 ecx, esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_3 = { 5d c3 6a34 b8???????? e8???????? 8d45c0 33f6 }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a34                 | push                0x34
            //   b8????????           |                     
            //   e8????????           |                     
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   33f6                 | xor                 esi, esi

        $sequence_4 = { 8d8d6cffffff e8???????? 8d45b8 c645fc04 50 8b857cffffff 8d8d7cffffff }
            // n = 7, score = 200
            //   8d8d6cffffff         | lea                 ecx, [ebp - 0x94]
            //   e8????????           |                     
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   50                   | push                eax
            //   8b857cffffff         | mov                 eax, dword ptr [ebp - 0x84]
            //   8d8d7cffffff         | lea                 ecx, [ebp - 0x84]

        $sequence_5 = { 6a07 6a00 68???????? ff75f8 ffd6 }
            // n = 5, score = 200
            //   6a07                 | push                7
            //   6a00                 | push                0
            //   68????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ffd6                 | call                esi

        $sequence_6 = { c645fc01 e8???????? 83c418 8d4dd8 56 6a01 e8???????? }
            // n = 7, score = 200
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   56                   | push                esi
            //   6a01                 | push                1
            //   e8????????           |                     

        $sequence_7 = { 8b5c2420 896c2410 eb08 33ed eb04 8b6c2410 c1e602 }
            // n = 7, score = 200
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp
            //   eb08                 | jmp                 0xa
            //   33ed                 | xor                 ebp, ebp
            //   eb04                 | jmp                 6
            //   8b6c2410             | mov                 ebp, dword ptr [esp + 0x10]
            //   c1e602               | shl                 esi, 2

        $sequence_8 = { 7404 c60700 47 c1e803 894518 8b01 ff5018 }
            // n = 7, score = 200
            //   7404                 | je                  6
            //   c60700               | mov                 byte ptr [edi], 0
            //   47                   | inc                 edi
            //   c1e803               | shr                 eax, 3
            //   894518               | mov                 dword ptr [ebp + 0x18], eax
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff5018               | call                dword ptr [eax + 0x18]

        $sequence_9 = { 8bcf c645fc01 e8???????? 8b03 }
            // n = 4, score = 200
            //   8bcf                 | mov                 ecx, edi
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   e8????????           |                     
            //   8b03                 | mov                 eax, dword ptr [ebx]

    condition:
        7 of them and filesize < 1091584
}