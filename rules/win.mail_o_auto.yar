rule win_mail_o_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.mail_o."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mail_o"
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
        $sequence_0 = { e8???????? 488bd8 4885c0 752d 4c8d0d40101200 c744242032000000 ba80000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488bd8               | lea                 edx, [0x11bc09]
            //   4885c0               | dec                 eax
            //   752d                 | mov                 ecx, esi
            //   4c8d0d40101200       | dec                 eax
            //   c744242032000000     | add                 esi, eax
            //   ba80000000           | cmp                 byte ptr [esi], 0xa

        $sequence_1 = { e8???????? 4863c8 488d4701 4803d9 483bd8 740a c7442420c2000000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4863c8               | mov                 ebx, eax
            //   488d4701             | dec                 eax
            //   4803d9               | test                eax, eax
            //   483bd8               | je                  0x1423
            //   740a                 | dec                 eax
            //   c7442420c2000000     | mov                 edi, ecx

        $sequence_2 = { e9???????? 418b06 8983c00d0000 e9???????? 418b06 ffc8 83f80a }
            // n = 7, score = 100
            //   e9????????           |                     
            //   418b06               | dec                 eax
            //   8983c00d0000         | mov                 eax, esi
            //   e9????????           |                     
            //   418b06               | dec                 eax
            //   ffc8                 | lea                 ecx, [ecx + 1]
            //   83f80a               | test                al, al

        $sequence_3 = { c744244007000000 7412 c7442430000000c0 c744244405000000 eb10 c744243000000080 c744244401000000 }
            // n = 7, score = 100
            //   c744244007000000     | cmp                 dword ptr [ecx], 0
            //   7412                 | je                  0x1421
            //   c7442430000000c0     | dec                 eax
            //   c744244405000000     | mov                 ecx, ebx
            //   eb10                 | dec                 eax
            //   c744243000000080     | mov                 ebx, ecx
            //   c744244401000000     | dec                 eax

        $sequence_4 = { ff542438 488b442448 48314310 488b442450 48314318 0fb6442430 8803 }
            // n = 7, score = 100
            //   ff542438             | add                 eax, eax
            //   488b442448           | dec                 ebp
            //   48314310             | mov                 dword ptr [edi], eax
            //   488b442450           | dec                 eax
            //   48314318             | cmp                 dword ptr [ebx + 0x450], 0
            //   0fb6442430           | dec                 ecx
            //   8803                 | mov                 dword ptr [edi + 0x20], eax

        $sequence_5 = { e9???????? 4885db 0f8449010000 0f1f840000000000 33d2 33c0 4885db }
            // n = 7, score = 100
            //   e9????????           |                     
            //   4885db               | dec                 ecx
            //   0f8449010000         | cmp                 eax, edi
            //   0f1f840000000000     | jb                  0xfbb
            //   33d2                 | dec                 eax
            //   33c0                 | lea                 eax, [esp + 0x20]
            //   4885db               | dec                 eax

        $sequence_6 = { e8???????? 41b8b2010000 488d15fe010e00 498bcf e8???????? 498bcc e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   41b8b2010000         | dec                 eax
            //   488d15fe010e00       | cmp                 ebx, eax
            //   498bcf               | dec                 eax
            //   e8????????           |                     
            //   498bcc               | mov                 ebp, edx
            //   e8????????           |                     

        $sequence_7 = { e9???????? 498b06 48898340070000 e9???????? 498b00 48898150070000 e9???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   498b06               | mov                 ecx, ebp
            //   48898340070000       | dec                 eax
            //   e9????????           |                     
            //   498b00               | lea                 ecx, [esp + 0x5c]
            //   48898150070000       | dec                 eax
            //   e9????????           |                     

        $sequence_8 = { e8???????? 85c0 0f8423010000 488bd7 488d4c2450 e8???????? 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | lea                 edx, [0xc5e5e]
            //   0f8423010000         | inc                 ecx
            //   488bd7               | mov                 eax, 0x75
            //   488d4c2450           | dec                 eax
            //   e8????????           |                     
            //   85c0                 | lea                 edx, [0x106e74]

        $sequence_9 = { e8???????? 4885c0 7525 baa4000000 c7442420c7000000 4c8d0d9a6e0b00 8d4806 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   4885c0               | cmp                 eax, 1
            //   7525                 | je                  0xa12
            //   baa4000000           | mov                 edx, 0x50
            //   c7442420c7000000     | mov                 dword ptr [esp + 0x28], 0x29
            //   4c8d0d9a6e0b00       | dec                 eax
            //   8d4806               | lea                 eax, [0x12880e]

    condition:
        7 of them and filesize < 5985280
}