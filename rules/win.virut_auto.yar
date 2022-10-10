rule win_virut_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.virut."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.virut"
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
        $sequence_0 = { 53 8d442428 50 8d8424d4000000 50 ff15???????? 6800100000 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   8d8424d4000000       | lea                 eax, [esp + 0xd4]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6800100000           | push                0x1000

        $sequence_1 = { 60 e8???????? 8b542430 5d 8b1a }
            // n = 5, score = 200
            //   60                   | pushal              
            //   e8????????           |                     
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   5d                   | pop                 ebp
            //   8b1a                 | mov                 ebx, dword ptr [edx]

        $sequence_2 = { 8d442444 50 8d8424d0000000 50 ffd6 83f8ff 0f8573030000 }
            // n = 7, score = 200
            //   8d442444             | lea                 eax, [esp + 0x44]
            //   50                   | push                eax
            //   8d8424d0000000       | lea                 eax, [esp + 0xd0]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   83f8ff               | cmp                 eax, -1
            //   0f8573030000         | jne                 0x379

        $sequence_3 = { 97 2be1 890c24 54 }
            // n = 4, score = 200
            //   97                   | xchg                eax, edi
            //   2be1                 | sub                 esp, ecx
            //   890c24               | mov                 dword ptr [esp], ecx
            //   54                   | push                esp

        $sequence_4 = { 3c7a 7702 2c20 aa }
            // n = 4, score = 200
            //   3c7a                 | cmp                 al, 0x7a
            //   7702                 | ja                  4
            //   2c20                 | sub                 al, 0x20
            //   aa                   | stosb               byte ptr es:[edi], al

        $sequence_5 = { c6840cd00100002e 8b149500304000 2bca 8d8c0cd1010000 8a02 }
            // n = 5, score = 200
            //   c6840cd00100002e     | mov                 byte ptr [esp + ecx + 0x1d0], 0x2e
            //   8b149500304000       | mov                 edx, dword ptr [edx*4 + 0x403000]
            //   2bca                 | sub                 ecx, edx
            //   8d8c0cd1010000       | lea                 ecx, [esp + ecx + 0x1d1]
            //   8a02                 | mov                 al, byte ptr [edx]

        $sequence_6 = { 3b44241c 7d33 8b4c241c 53 2bc8 51 }
            // n = 6, score = 200
            //   3b44241c             | cmp                 eax, dword ptr [esp + 0x1c]
            //   7d33                 | jge                 0x35
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   53                   | push                ebx
            //   2bc8                 | sub                 ecx, eax
            //   51                   | push                ecx

        $sequence_7 = { 3c5c 74ec 3c2e 74dd }
            // n = 4, score = 200
            //   3c5c                 | cmp                 al, 0x5c
            //   74ec                 | je                  0xffffffee
            //   3c2e                 | cmp                 al, 0x2e
            //   74dd                 | je                  0xffffffdf

        $sequence_8 = { 68???????? 50 ff15???????? 8d85ecfbffff 83c410 }
            // n = 5, score = 200
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d85ecfbffff         | lea                 eax, [ebp - 0x414]
            //   83c410               | add                 esp, 0x10

        $sequence_9 = { 83c70f 57 8bd4 53 8bcc 50 }
            // n = 6, score = 200
            //   83c70f               | add                 edi, 0xf
            //   57                   | push                edi
            //   8bd4                 | mov                 edx, esp
            //   53                   | push                ebx
            //   8bcc                 | mov                 ecx, esp
            //   50                   | push                eax

        $sequence_10 = { 4e 45 54 2e44 }
            // n = 4, score = 200
            //   4e                   | dec                 esi
            //   45                   | inc                 ebp
            //   54                   | push                esp
            //   2e44                 | inc                 esp

        $sequence_11 = { 8d54240c cd2e 83f800 7c19 60 e8???????? }
            // n = 6, score = 200
            //   8d54240c             | lea                 edx, [esp + 0xc]
            //   cd2e                 | int                 0x2e
            //   83f800               | cmp                 eax, 0
            //   7c19                 | jl                  0x1b
            //   60                   | pushal              
            //   e8????????           |                     

        $sequence_12 = { 33d2 8bcf 52 f6d9 52 }
            // n = 5, score = 200
            //   33d2                 | xor                 edx, edx
            //   8bcf                 | mov                 ecx, edi
            //   52                   | push                edx
            //   f6d9                 | neg                 cl
            //   52                   | push                edx

        $sequence_13 = { 7cd4 8bc3 5f 5e 5b c9 }
            // n = 6, score = 200
            //   7cd4                 | jl                  0xffffffd6
            //   8bc3                 | mov                 eax, ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               

        $sequence_14 = { 7e1b e8???????? 33d2 6a1a 5f f7f7 80c261 }
            // n = 7, score = 200
            //   7e1b                 | jle                 0x1d
            //   e8????????           |                     
            //   33d2                 | xor                 edx, edx
            //   6a1a                 | push                0x1a
            //   5f                   | pop                 edi
            //   f7f7                 | div                 edi
            //   80c261               | add                 dl, 0x61

        $sequence_15 = { 8944241c 3acb 75df ff74241c 6a40 ff15???????? 8bf8 }
            // n = 7, score = 200
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   3acb                 | cmp                 cl, bl
            //   75df                 | jne                 0xffffffe1
            //   ff74241c             | push                dword ptr [esp + 0x1c]
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

    condition:
        7 of them and filesize < 98304
}