rule win_opachki_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.opachki."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.opachki"
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
        $sequence_0 = { 6a01 6800000080 8d85e0feffff 50 ff15???????? 8bf0 }
            // n = 6, score = 300
            //   6a01                 | push                1
            //   6800000080           | push                0x80000000
            //   8d85e0feffff         | lea                 eax, dword ptr [ebp - 0x120]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_1 = { 50 ff15???????? 50 68???????? 8d8500ffffff }
            // n = 5, score = 300
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]

        $sequence_2 = { 8bec 51 51 8b450c 56 8b7108 }
            // n = 6, score = 300
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   8b7108               | mov                 esi, dword ptr [ecx + 8]

        $sequence_3 = { 7441 2bc7 8bf0 8a07 8bcf eb21 }
            // n = 6, score = 300
            //   7441                 | je                  0x43
            //   2bc7                 | sub                 eax, edi
            //   8bf0                 | mov                 esi, eax
            //   8a07                 | mov                 al, byte ptr [edi]
            //   8bcf                 | mov                 ecx, edi
            //   eb21                 | jmp                 0x23

        $sequence_4 = { 2bf1 7507 40 ff4d0c 4a 75e5 837d0c00 }
            // n = 7, score = 300
            //   2bf1                 | sub                 esi, ecx
            //   7507                 | jne                 9
            //   40                   | inc                 eax
            //   ff4d0c               | dec                 dword ptr [ebp + 0xc]
            //   4a                   | dec                 edx
            //   75e5                 | jne                 0xffffffe7
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0

        $sequence_5 = { 56 6a08 8bf1 83660800 58 }
            // n = 5, score = 300
            //   56                   | push                esi
            //   6a08                 | push                8
            //   8bf1                 | mov                 esi, ecx
            //   83660800             | and                 dword ptr [esi + 8], 0
            //   58                   | pop                 eax

        $sequence_6 = { 2b45f8 ebf2 55 8bec 8b4508 57 }
            // n = 6, score = 300
            //   2b45f8               | sub                 eax, dword ptr [ebp - 8]
            //   ebf2                 | jmp                 0xfffffff4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   57                   | push                edi

        $sequence_7 = { c3 55 8bec 81ec00010000 ff7508 }
            // n = 5, score = 300
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec00010000         | sub                 esp, 0x100
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_8 = { eb0a 3ca0 7206 3ca3 7702 }
            // n = 5, score = 200
            //   eb0a                 | jmp                 0xc
            //   3ca0                 | cmp                 al, 0xa0
            //   7206                 | jb                  8
            //   3ca3                 | cmp                 al, 0xa3
            //   7702                 | ja                  4

        $sequence_9 = { 884703 ebcc 3c66 7507 884704 b201 }
            // n = 6, score = 200
            //   884703               | mov                 byte ptr [edi + 3], al
            //   ebcc                 | jmp                 0xffffffce
            //   3c66                 | cmp                 al, 0x66
            //   7507                 | jne                 9
            //   884704               | mov                 byte ptr [edi + 4], al
            //   b201                 | mov                 dl, 1

        $sequence_10 = { 66894718 80ff04 7504 ad 89471a f6c110 }
            // n = 6, score = 200
            //   66894718             | mov                 word ptr [edi + 0x18], ax
            //   80ff04               | cmp                 bh, 4
            //   7504                 | jne                 6
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   89471a               | mov                 dword ptr [edi + 0x1a], eax
            //   f6c110               | test                cl, 0x10

        $sequence_11 = { c0e002 c0e805 88470a 3c01 ac }
            // n = 5, score = 200
            //   c0e002               | shl                 al, 2
            //   c0e805               | shr                 al, 5
            //   88470a               | mov                 byte ptr [edi + 0xa], al
            //   3c01                 | cmp                 al, 1
            //   ac                   | lodsb               al, byte ptr [esi]

        $sequence_12 = { 08db 752b 46 88470c 88c4 c0ec06 88670d }
            // n = 7, score = 200
            //   08db                 | or                  bl, bl
            //   752b                 | jne                 0x2d
            //   46                   | inc                 esi
            //   88470c               | mov                 byte ptr [edi + 0xc], al
            //   88c4                 | mov                 ah, al
            //   c0ec06               | shr                 ah, 6
            //   88670d               | mov                 byte ptr [edi + 0xd], ah

        $sequence_13 = { 88470f 3c05 750b 08ed }
            // n = 4, score = 200
            //   88470f               | mov                 byte ptr [edi + 0xf], al
            //   3c05                 | cmp                 al, 5
            //   750b                 | jne                 0xd
            //   08ed                 | or                  ch, ch

        $sequence_14 = { 08d2 7408 66ad 6689471f eb45 }
            // n = 5, score = 200
            //   08d2                 | or                  dl, dl
            //   7408                 | je                  0xa
            //   66ad                 | lodsw               ax, word ptr [esi]
            //   6689471f             | mov                 word ptr [edi + 0x1f], ax
            //   eb45                 | jmp                 0x47

    condition:
        7 of them and filesize < 122880
}