rule win_badcall_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.badcall."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.badcall"
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
        $sequence_0 = { a1???????? 50 c705????????04000000 ff15???????? }
            // n = 4, score = 300
            //   a1????????           |                     
            //   50                   | push                eax
            //   c705????????04000000     |     
            //   ff15????????         |                     

        $sequence_1 = { ff15???????? c20400 c705????????01000000 a1???????? 68???????? 50 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   c20400               | ret                 4
            //   c705????????01000000     |     
            //   a1????????           |                     
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_2 = { 8b4604 8bcf 50 e8???????? 5f }
            // n = 5, score = 300
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   8bcf                 | mov                 ecx, edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   5f                   | pop                 edi

        $sequence_3 = { 8bd1 8d7c240c 89442408 c1e902 f3a5 8bca 50 }
            // n = 7, score = 300
            //   8bd1                 | mov                 edx, ecx
            //   8d7c240c             | lea                 edi, dword ptr [esp + 0xc]
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bca                 | mov                 ecx, edx
            //   50                   | push                eax

        $sequence_4 = { 8b442404 48 7455 48 7434 83e803 7557 }
            // n = 7, score = 300
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   48                   | dec                 eax
            //   7455                 | je                  0x57
            //   48                   | dec                 eax
            //   7434                 | je                  0x36
            //   83e803               | sub                 eax, 3
            //   7557                 | jne                 0x59

        $sequence_5 = { 8d442408 6a78 8d4c2410 50 51 }
            // n = 5, score = 300
            //   8d442408             | lea                 eax, dword ptr [esp + 8]
            //   6a78                 | push                0x78
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_6 = { 52 51 40 6a00 50 c744242c01000000 c784243001000001000000 }
            // n = 7, score = 300
            //   52                   | push                edx
            //   51                   | push                ecx
            //   40                   | inc                 eax
            //   6a00                 | push                0
            //   50                   | push                eax
            //   c744242c01000000     | mov                 dword ptr [esp + 0x2c], 1
            //   c784243001000001000000     | mov    dword ptr [esp + 0x130], 1

        $sequence_7 = { 7615 8a4c2408 8a542420 3aca 7509 66817c24090103 }
            // n = 6, score = 300
            //   7615                 | jbe                 0x17
            //   8a4c2408             | mov                 cl, byte ptr [esp + 8]
            //   8a542420             | mov                 dl, byte ptr [esp + 0x20]
            //   3aca                 | cmp                 cl, dl
            //   7509                 | jne                 0xb
            //   66817c24090103       | cmp                 word ptr [esp + 9], 0x301

        $sequence_8 = { e8???????? 85c0 7415 6a16 6a00 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7415                 | je                  0x17
            //   6a16                 | push                0x16
            //   6a00                 | push                0

        $sequence_9 = { 7605 b800400000 8b4f04 6a00 50 8d042e }
            // n = 6, score = 300
            //   7605                 | jbe                 7
            //   b800400000           | mov                 eax, 0x4000
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8d042e               | lea                 eax, dword ptr [esi + ebp]

        $sequence_10 = { ff15???????? c20400 a1???????? 68???????? }
            // n = 4, score = 300
            //   ff15????????         |                     
            //   c20400               | ret                 4
            //   a1????????           |                     
            //   68????????           |                     

        $sequence_11 = { b940000000 33c0 8d7c2411 895c2408 f3ab 66ab }
            // n = 6, score = 300
            //   b940000000           | mov                 ecx, 0x40
            //   33c0                 | xor                 eax, eax
            //   8d7c2411             | lea                 edi, dword ptr [esp + 0x11]
            //   895c2408             | mov                 dword ptr [esp + 8], ebx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax

        $sequence_12 = { 83e803 7557 33c0 68???????? a3???????? a3???????? }
            // n = 6, score = 300
            //   83e803               | sub                 eax, 3
            //   7557                 | jne                 0x59
            //   33c0                 | xor                 eax, eax
            //   68????????           |                     
            //   a3????????           |                     
            //   a3????????           |                     

        $sequence_13 = { 8d44241c 52 50 e8???????? 8d8c244c010000 81c638010000 51 }
            // n = 7, score = 200
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8c244c010000       | lea                 ecx, dword ptr [esp + 0x14c]
            //   81c638010000         | add                 esi, 0x138
            //   51                   | push                ecx

        $sequence_14 = { 50 51 e8???????? 83c40c 85c0 7dcb }
            // n = 6, score = 200
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7dcb                 | jge                 0xffffffcd

        $sequence_15 = { 8b442468 83e103 8bd0 f3a4 8bc8 }
            // n = 5, score = 200
            //   8b442468             | mov                 eax, dword ptr [esp + 0x68]
            //   83e103               | and                 ecx, 3
            //   8bd0                 | mov                 edx, eax
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8bc8                 | mov                 ecx, eax

    condition:
        7 of them and filesize < 483328
}