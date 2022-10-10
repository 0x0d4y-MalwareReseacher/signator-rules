rule win_nokki_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.nokki."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nokki"
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
        $sequence_0 = { e8???????? 33d2 68ce070000 52 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   33d2                 | xor                 edx, edx
            //   68ce070000           | push                0x7ce
            //   52                   | push                edx

        $sequence_1 = { e8???????? 33c9 68ce070000 51 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   68ce070000           | push                0x7ce
            //   51                   | push                ecx

        $sequence_2 = { 8bff e8???????? 99 b91a000000 f7f9 8b85f0fdffff 83c002 }
            // n = 7, score = 100
            //   8bff                 | mov                 edi, edi
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b91a000000           | mov                 ecx, 0x1a
            //   f7f9                 | idiv                ecx
            //   8b85f0fdffff         | mov                 eax, dword ptr [ebp - 0x210]
            //   83c002               | add                 eax, 2

        $sequence_3 = { eb12 8b45e0 8a808ce94000 08443b1d }
            // n = 4, score = 100
            //   eb12                 | jmp                 0x14
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8a808ce94000         | mov                 al, byte ptr [eax + 0x40e98c]
            //   08443b1d             | or                  byte ptr [ebx + edi + 0x1d], al

        $sequence_4 = { 75e8 68???????? 8d9514f7ffff 52 }
            // n = 4, score = 100
            //   75e8                 | jne                 0xffffffea
            //   68????????           |                     
            //   8d9514f7ffff         | lea                 edx, [ebp - 0x8ec]
            //   52                   | push                edx

        $sequence_5 = { 8987d4ec4000 83c704 83ff28 72e6 5f }
            // n = 5, score = 100
            //   8987d4ec4000         | mov                 dword ptr [edi + 0x40ecd4], eax
            //   83c704               | add                 edi, 4
            //   83ff28               | cmp                 edi, 0x28
            //   72e6                 | jb                  0xffffffe8
            //   5f                   | pop                 edi

        $sequence_6 = { b9???????? 895dfc 89bd74e8ffff ffd0 83c010 8907 b9???????? }
            // n = 7, score = 100
            //   b9????????           |                     
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   89bd74e8ffff         | mov                 dword ptr [ebp - 0x178c], edi
            //   ffd0                 | call                eax
            //   83c010               | add                 eax, 0x10
            //   8907                 | mov                 dword ptr [edi], eax
            //   b9????????           |                     

        $sequence_7 = { 50 8b4204 ffd0 6a0f 68???????? 8bce }
            // n = 6, score = 100
            //   50                   | push                eax
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   ffd0                 | call                eax
            //   6a0f                 | push                0xf
            //   68????????           |                     
            //   8bce                 | mov                 ecx, esi

        $sequence_8 = { ebde 8bc8 83e01f c1f905 8b0c8dc02b4100 }
            // n = 5, score = 100
            //   ebde                 | jmp                 0xffffffe0
            //   8bc8                 | mov                 ecx, eax
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8dc02b4100       | mov                 ecx, dword ptr [ecx*4 + 0x412bc0]

        $sequence_9 = { 8b06 8bc8 c1f905 8b0c8d80054100 83e01f c1e006 }
            // n = 6, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d80054100       | mov                 ecx, dword ptr [ecx*4 + 0x410580]
            //   83e01f               | and                 eax, 0x1f
            //   c1e006               | shl                 eax, 6

        $sequence_10 = { 7404 85c0 7524 a1???????? a3???????? a1???????? c705????????b7634000 }
            // n = 7, score = 100
            //   7404                 | je                  6
            //   85c0                 | test                eax, eax
            //   7524                 | jne                 0x26
            //   a1????????           |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   c705????????b7634000     |     

        $sequence_11 = { 56 ffd3 85c0 740b 68???????? ff15???????? 6a00 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   740b                 | je                  0xd
            //   68????????           |                     
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_12 = { 68ce070000 50 8d8db6f7ffff 51 }
            // n = 4, score = 100
            //   68ce070000           | push                0x7ce
            //   50                   | push                eax
            //   8d8db6f7ffff         | lea                 ecx, [ebp - 0x84a]
            //   51                   | push                ecx

        $sequence_13 = { 85c0 0f84abfeffff eb09 56 e8???????? }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   0f84abfeffff         | je                  0xfffffeb1
            //   eb09                 | jmp                 0xb
            //   56                   | push                esi
            //   e8????????           |                     

    condition:
        7 of them and filesize < 454656
}