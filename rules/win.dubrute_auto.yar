rule win_dubrute_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.dubrute."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dubrute"
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
        $sequence_0 = { 8d3489 c1e603 8bc6 034744 8b5020 85d2 }
            // n = 6, score = 100
            //   8d3489               | lea                 esi, [ecx + ecx*4]
            //   c1e603               | shl                 esi, 3
            //   8bc6                 | mov                 eax, esi
            //   034744               | add                 eax, dword ptr [edi + 0x44]
            //   8b5020               | mov                 edx, dword ptr [eax + 0x20]
            //   85d2                 | test                edx, edx

        $sequence_1 = { 51 53 56 33f6 57 39750c ff7518 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   57                   | push                edi
            //   39750c               | cmp                 dword ptr [ebp + 0xc], esi
            //   ff7518               | push                dword ptr [ebp + 0x18]

        $sequence_2 = { ff36 834df0ff 8975f4 895df8 68???????? e8???????? 59 }
            // n = 7, score = 100
            //   ff36                 | push                dword ptr [esi]
            //   834df0ff             | or                  dword ptr [ebp - 0x10], 0xffffffff
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_3 = { e8???????? 83c410 6a02 58 eb96 8b460c 85c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   6a02                 | push                2
            //   58                   | pop                 eax
            //   eb96                 | jmp                 0xffffff98
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   85c0                 | test                eax, eax

        $sequence_4 = { 8b06 c1e908 8808 ff06 8b06 8bcb c1e908 }
            // n = 7, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   c1e908               | shr                 ecx, 8
            //   8808                 | mov                 byte ptr [eax], cl
            //   ff06                 | inc                 dword ptr [esi]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   c1e908               | shr                 ecx, 8

        $sequence_5 = { 8a4601 c1e008 0bc2 0fb65603 c1e008 0bc2 eb0c }
            // n = 7, score = 100
            //   8a4601               | mov                 al, byte ptr [esi + 1]
            //   c1e008               | shl                 eax, 8
            //   0bc2                 | or                  eax, edx
            //   0fb65603             | movzx               edx, byte ptr [esi + 3]
            //   c1e008               | shl                 eax, 8
            //   0bc2                 | or                  eax, edx
            //   eb0c                 | jmp                 0xe

        $sequence_6 = { 85c0 59 0f84a8000000 8b4d0c 8906 034604 3b4df4 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx
            //   0f84a8000000         | je                  0xae
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8906                 | mov                 dword ptr [esi], eax
            //   034604               | add                 eax, dword ptr [esi + 4]
            //   3b4df4               | cmp                 ecx, dword ptr [ebp - 0xc]

        $sequence_7 = { 8d45a4 8d4d0c 50 ffd6 8b35???????? 8d4514 6a01 }
            // n = 7, score = 100
            //   8d45a4               | lea                 eax, [ebp - 0x5c]
            //   8d4d0c               | lea                 ecx, [ebp + 0xc]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b35????????         |                     
            //   8d4514               | lea                 eax, [ebp + 0x14]
            //   6a01                 | push                1

        $sequence_8 = { a1???????? 8d4e20 ff30 8d4720 53 50 ff15???????? }
            // n = 7, score = 100
            //   a1????????           |                     
            //   8d4e20               | lea                 ecx, [esi + 0x20]
            //   ff30                 | push                dword ptr [eax]
            //   8d4720               | lea                 eax, [edi + 0x20]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_9 = { eb09 8b4304 89450c 8d450c 8b08 8b4508 5f }
            // n = 7, score = 100
            //   eb09                 | jmp                 0xb
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   8d450c               | lea                 eax, [ebp + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 598016
}