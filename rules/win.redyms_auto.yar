rule win_redyms_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.redyms."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redyms"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { 56 50 ff15???????? 57 ff15???????? a1???????? 8d7828 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   57                   | push                edi
            //   ff15????????         |                     
            //   a1????????           |                     
            //   8d7828               | lea                 edi, [eax + 0x28]

        $sequence_1 = { 8855e2 2bf3 8a1c0e 32d8 80f3fb 8819 40 }
            // n = 7, score = 100
            //   8855e2               | mov                 byte ptr [ebp - 0x1e], dl
            //   2bf3                 | sub                 esi, ebx
            //   8a1c0e               | mov                 bl, byte ptr [esi + ecx]
            //   32d8                 | xor                 bl, al
            //   80f3fb               | xor                 bl, 0xfb
            //   8819                 | mov                 byte ptr [ecx], bl
            //   40                   | inc                 eax

        $sequence_2 = { 52 53 e8???????? 83c40c 5f 5e b001 }
            // n = 7, score = 100
            //   52                   | push                edx
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   b001                 | mov                 al, 1

        $sequence_3 = { 394df0 0f94c1 894df8 8b55f4 52 }
            // n = 5, score = 100
            //   394df0               | cmp                 dword ptr [ebp - 0x10], ecx
            //   0f94c1               | sete                cl
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   52                   | push                edx

        $sequence_4 = { 53 b941000000 8db5f8feffff bf???????? bb???????? f3a5 e8???????? }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   b941000000           | mov                 ecx, 0x41
            //   8db5f8feffff         | lea                 esi, [ebp - 0x108]
            //   bf????????           |                     
            //   bb????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   e8????????           |                     

        $sequence_5 = { c70000000000 a1???????? 8d7828 57 8bd8 ff15???????? 83c8ff }
            // n = 7, score = 100
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   a1????????           |                     
            //   8d7828               | lea                 edi, [eax + 0x28]
            //   57                   | push                edi
            //   8bd8                 | mov                 ebx, eax
            //   ff15????????         |                     
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_6 = { 8d642400 8a140e 32d0 80f238 8811 40 }
            // n = 6, score = 100
            //   8d642400             | lea                 esp, [esp]
            //   8a140e               | mov                 dl, byte ptr [esi + ecx]
            //   32d0                 | xor                 dl, al
            //   80f238               | xor                 dl, 0x38
            //   8811                 | mov                 byte ptr [ecx], dl
            //   40                   | inc                 eax

        $sequence_7 = { 8d642400 8a1c0e 32d8 80f317 8819 40 41 }
            // n = 7, score = 100
            //   8d642400             | lea                 esp, [esp]
            //   8a1c0e               | mov                 bl, byte ptr [esi + ecx]
            //   32d8                 | xor                 bl, al
            //   80f317               | xor                 bl, 0x17
            //   8819                 | mov                 byte ptr [ecx], bl
            //   40                   | inc                 eax
            //   41                   | inc                 ecx

        $sequence_8 = { 57 68???????? 8bf8 6a07 }
            // n = 4, score = 100
            //   57                   | push                edi
            //   68????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   6a07                 | push                7

        $sequence_9 = { 8bf0 6800300000 33db 56 53 8975f4 895df8 }
            // n = 7, score = 100
            //   8bf0                 | mov                 esi, eax
            //   6800300000           | push                0x3000
            //   33db                 | xor                 ebx, ebx
            //   56                   | push                esi
            //   53                   | push                ebx
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   895df8               | mov                 dword ptr [ebp - 8], ebx

    condition:
        7 of them and filesize < 98304
}