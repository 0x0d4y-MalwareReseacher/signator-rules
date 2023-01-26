rule win_metadatabin_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.metadatabin."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.metadatabin"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 8b74242c 0f92442408 f7e3 8b5c2478 01c8 8984249c000000 0fb6442408 }
            // n = 7, score = 100
            //   8b74242c             | mov                 esi, dword ptr [esp + 0x2c]
            //   0f92442408           | setb                byte ptr [esp + 8]
            //   f7e3                 | mul                 ebx
            //   8b5c2478             | mov                 ebx, dword ptr [esp + 0x78]
            //   01c8                 | add                 eax, ecx
            //   8984249c000000       | mov                 dword ptr [esp + 0x9c], eax
            //   0fb6442408           | movzx               eax, byte ptr [esp + 8]

        $sequence_1 = { eb15 89f3 89d9 68???????? eb1d 8b5508 89d9 }
            // n = 7, score = 100
            //   eb15                 | jmp                 0x17
            //   89f3                 | mov                 ebx, esi
            //   89d9                 | mov                 ecx, ebx
            //   68????????           |                     
            //   eb1d                 | jmp                 0x1f
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   89d9                 | mov                 ecx, ebx

        $sequence_2 = { 89cb 0f8454ffffff 8d3c13 8d4c1301 3b7df0 894dc4 730c }
            // n = 7, score = 100
            //   89cb                 | mov                 ebx, ecx
            //   0f8454ffffff         | je                  0xffffff5a
            //   8d3c13               | lea                 edi, [ebx + edx]
            //   8d4c1301             | lea                 ecx, [ebx + edx + 1]
            //   3b7df0               | cmp                 edi, dword ptr [ebp - 0x10]
            //   894dc4               | mov                 dword ptr [ebp - 0x3c], ecx
            //   730c                 | jae                 0xe

        $sequence_3 = { 8b8c2490000000 11f2 8bb42420020000 89842498010000 89542424 89f0 f7e1 }
            // n = 7, score = 100
            //   8b8c2490000000       | mov                 ecx, dword ptr [esp + 0x90]
            //   11f2                 | adc                 edx, esi
            //   8bb42420020000       | mov                 esi, dword ptr [esp + 0x220]
            //   89842498010000       | mov                 dword ptr [esp + 0x198], eax
            //   89542424             | mov                 dword ptr [esp + 0x24], edx
            //   89f0                 | mov                 eax, esi
            //   f7e1                 | mul                 ecx

        $sequence_4 = { f00fc14724 6683f801 7532 eb32 89542428 8d4f28 8d542408 }
            // n = 7, score = 100
            //   f00fc14724           | lock xadd           dword ptr [edi + 0x24], eax
            //   6683f801             | cmp                 ax, 1
            //   7532                 | jne                 0x34
            //   eb32                 | jmp                 0x34
            //   89542428             | mov                 dword ptr [esp + 0x28], edx
            //   8d4f28               | lea                 ecx, [edi + 0x28]
            //   8d542408             | lea                 edx, [esp + 8]

        $sequence_5 = { f7e6 89c7 89d6 89c8 01df 8b5c2418 83d600 }
            // n = 7, score = 100
            //   f7e6                 | mul                 esi
            //   89c7                 | mov                 edi, eax
            //   89d6                 | mov                 esi, edx
            //   89c8                 | mov                 eax, ecx
            //   01df                 | add                 edi, ebx
            //   8b5c2418             | mov                 ebx, dword ptr [esp + 0x18]
            //   83d600               | adc                 esi, 0

        $sequence_6 = { 01f7 83d100 f7e3 01f8 89d6 8b7c2460 8984244c010000 }
            // n = 7, score = 100
            //   01f7                 | add                 edi, esi
            //   83d100               | adc                 ecx, 0
            //   f7e3                 | mul                 ebx
            //   01f8                 | add                 eax, edi
            //   89d6                 | mov                 esi, edx
            //   8b7c2460             | mov                 edi, dword ptr [esp + 0x60]
            //   8984244c010000       | mov                 dword ptr [esp + 0x14c], eax

        $sequence_7 = { b001 8955ec 84db 0f8483000000 8d7720 89f1 e8???????? }
            // n = 7, score = 100
            //   b001                 | mov                 al, 1
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx
            //   84db                 | test                bl, bl
            //   0f8483000000         | je                  0x89
            //   8d7720               | lea                 esi, [edi + 0x20]
            //   89f1                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_8 = { beffffffff 660f62e6 660f6eb42490000000 83d200 660f6ce5 660f6eac2450020000 83d000 }
            // n = 7, score = 100
            //   beffffffff           | mov                 esi, 0xffffffff
            //   660f62e6             | punpckldq           xmm4, xmm6
            //   660f6eb42490000000     | movd    xmm6, dword ptr [esp + 0x90]
            //   83d200               | adc                 edx, 0
            //   660f6ce5             | punpcklqdq          xmm4, xmm5
            //   660f6eac2450020000     | movd    xmm5, dword ptr [esp + 0x250]
            //   83d000               | adc                 eax, 0

        $sequence_9 = { 8b08 895c241c 8d5101 85d2 0f8e34070000 8910 31ff }
            // n = 7, score = 100
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   895c241c             | mov                 dword ptr [esp + 0x1c], ebx
            //   8d5101               | lea                 edx, [ecx + 1]
            //   85d2                 | test                edx, edx
            //   0f8e34070000         | jle                 0x73a
            //   8910                 | mov                 dword ptr [eax], edx
            //   31ff                 | xor                 edi, edi

    condition:
        7 of them and filesize < 1263616
}