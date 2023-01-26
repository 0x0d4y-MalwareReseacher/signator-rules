rule win_allaple_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.allaple."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.allaple"
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
        $sequence_0 = { c1f803 8b5510 880c02 8b45f8 25ff000000 8b8d20ffffff }
            // n = 6, score = 300
            //   c1f803               | sar                 eax, 3
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   880c02               | mov                 byte ptr [edx + eax], cl
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   25ff000000           | and                 eax, 0xff
            //   8b8d20ffffff         | mov                 ecx, dword ptr [ebp - 0xe0]

        $sequence_1 = { 334510 5d c3 55 8bec 836508ff 8b4d0c }
            // n = 7, score = 300
            //   334510               | xor                 eax, dword ptr [ebp + 0x10]
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   836508ff             | and                 dword ptr [ebp + 8], 0xffffffff
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_2 = { e8???????? 83c620 c60610 b818000000 034518 66894603 66c746050004 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c620               | add                 esi, 0x20
            //   c60610               | mov                 byte ptr [esi], 0x10
            //   b818000000           | mov                 eax, 0x18
            //   034518               | add                 eax, dword ptr [ebp + 0x18]
            //   66894603             | mov                 word ptr [esi + 3], ax
            //   66c746050004         | mov                 word ptr [esi + 5], 0x400

        $sequence_3 = { ff750c 8d8500fcffff 50 e8???????? 8db790000000 56 53 }
            // n = 7, score = 300
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d8500fcffff         | lea                 eax, [ebp - 0x400]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8db790000000         | lea                 esi, [edi + 0x90]
            //   56                   | push                esi
            //   53                   | push                ebx

        $sequence_4 = { 6a00 6a00 e8???????? 0bc0 0f84f7000000 83f8ff 0f84ee000000 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   e8????????           |                     
            //   0bc0                 | or                  eax, eax
            //   0f84f7000000         | je                  0xfd
            //   83f8ff               | cmp                 eax, -1
            //   0f84ee000000         | je                  0xf4

        $sequence_5 = { 8b4356 66894618 56 53 e8???????? 83c620 c60610 }
            // n = 7, score = 300
            //   8b4356               | mov                 eax, dword ptr [ebx + 0x56]
            //   66894618             | mov                 word ptr [esi + 0x18], ax
            //   56                   | push                esi
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c620               | add                 esi, 0x20
            //   c60610               | mov                 byte ptr [esi], 0x10

        $sequence_6 = { 8b4df0 034dec 034d8c 8b55e4 33d1 8955e4 8b45ec }
            // n = 7, score = 300
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   034dec               | add                 ecx, dword ptr [ebp - 0x14]
            //   034d8c               | add                 ecx, dword ptr [ebp - 0x74]
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   33d1                 | xor                 edx, ecx
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]

        $sequence_7 = { 7408 8985b4fdffff eb05 e9???????? 68???????? }
            // n = 5, score = 300
            //   7408                 | je                  0xa
            //   8985b4fdffff         | mov                 dword ptr [ebp - 0x24c], eax
            //   eb05                 | jmp                 7
            //   e9????????           |                     
            //   68????????           |                     

        $sequence_8 = { 56 e8???????? 8975fc 83c604 c706ff534d42 c6460471 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   e8????????           |                     
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   83c604               | add                 esi, 4
            //   c706ff534d42         | mov                 dword ptr [esi], 0x424d53ff
            //   c6460471             | mov                 byte ptr [esi + 4], 0x71

        $sequence_9 = { 0fb74606 8945f8 81c6f8000000 8bde 83c328 eb2f 8b4e0c }
            // n = 7, score = 300
            //   0fb74606             | movzx               eax, word ptr [esi + 6]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   81c6f8000000         | add                 esi, 0xf8
            //   8bde                 | mov                 ebx, esi
            //   83c328               | add                 ebx, 0x28
            //   eb2f                 | jmp                 0x31
            //   8b4e0c               | mov                 ecx, dword ptr [esi + 0xc]

    condition:
        7 of them and filesize < 253952
}