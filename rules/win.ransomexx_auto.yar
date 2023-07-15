rule win_ransomexx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.ransomexx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ransomexx"
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
        $sequence_0 = { 33fe 03df 8b7dfc 039c3db8feffff 8bb43d94feffff 03f3 89b43dd4feffff }
            // n = 7, score = 100
            //   33fe                 | xor                 edi, esi
            //   03df                 | add                 ebx, edi
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   039c3db8feffff       | add                 ebx, dword ptr [ebp + edi - 0x148]
            //   8bb43d94feffff       | mov                 esi, dword ptr [ebp + edi - 0x16c]
            //   03f3                 | add                 esi, ebx
            //   89b43dd4feffff       | mov                 dword ptr [ebp + edi - 0x12c], esi

        $sequence_1 = { 03442418 8b54240c 134c241c 0302 134a04 01442450 89442458 }
            // n = 7, score = 100
            //   03442418             | add                 eax, dword ptr [esp + 0x18]
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]
            //   134c241c             | adc                 ecx, dword ptr [esp + 0x1c]
            //   0302                 | add                 eax, dword ptr [edx]
            //   134a04               | adc                 ecx, dword ptr [edx + 4]
            //   01442450             | add                 dword ptr [esp + 0x50], eax
            //   89442458             | mov                 dword ptr [esp + 0x58], eax

        $sequence_2 = { 0fb6b688614200 c1e708 33f7 8b7d08 83c004 c1e608 8955ec }
            // n = 7, score = 100
            //   0fb6b688614200       | movzx               esi, byte ptr [esi + 0x426188]
            //   c1e708               | shl                 edi, 8
            //   33f7                 | xor                 esi, edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   83c004               | add                 eax, 4
            //   c1e608               | shl                 esi, 8
            //   8955ec               | mov                 dword ptr [ebp - 0x14], edx

        $sequence_3 = { c1e008 0bc3 41 4e 75f4 }
            // n = 5, score = 100
            //   c1e008               | shl                 eax, 8
            //   0bc3                 | or                  eax, ebx
            //   41                   | inc                 ecx
            //   4e                   | dec                 esi
            //   75f4                 | jne                 0xfffffff6

        $sequence_4 = { e8???????? 83c410 6a00 ff15???????? 50 ff15???????? 8b35???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b35????????         |                     

        $sequence_5 = { 85f6 0f84b1000000 395d08 0f84a8000000 395d0c 0f849f000000 68000000f0 }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   0f84b1000000         | je                  0xb7
            //   395d08               | cmp                 dword ptr [ebp + 8], ebx
            //   0f84a8000000         | je                  0xae
            //   395d0c               | cmp                 dword ptr [ebp + 0xc], ebx
            //   0f849f000000         | je                  0xa5
            //   68000000f0           | push                0xf0000000

        $sequence_6 = { 830d????????01 8d4310 e8???????? 8bcc 3bcb 0f84e8000000 8bd1 }
            // n = 7, score = 100
            //   830d????????01       |                     
            //   8d4310               | lea                 eax, [ebx + 0x10]
            //   e8????????           |                     
            //   8bcc                 | mov                 ecx, esp
            //   3bcb                 | cmp                 ecx, ebx
            //   0f84e8000000         | je                  0xee
            //   8bd1                 | mov                 edx, ecx

        $sequence_7 = { 7477 817dec00020000 756e b900020000 }
            // n = 4, score = 100
            //   7477                 | je                  0x79
            //   817dec00020000       | cmp                 dword ptr [ebp - 0x14], 0x200
            //   756e                 | jne                 0x70
            //   b900020000           | mov                 ecx, 0x200

        $sequence_8 = { 8d45cc bb01000000 898574ffffff 8d856cffffff 8bcf 8955cc }
            // n = 6, score = 100
            //   8d45cc               | lea                 eax, [ebp - 0x34]
            //   bb01000000           | mov                 ebx, 1
            //   898574ffffff         | mov                 dword ptr [ebp - 0x8c], eax
            //   8d856cffffff         | lea                 eax, [ebp - 0x94]
            //   8bcf                 | mov                 ecx, edi
            //   8955cc               | mov                 dword ptr [ebp - 0x34], edx

        $sequence_9 = { e8???????? 8bf0 83c414 85f6 7567 8b45fc 40 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c414               | add                 esp, 0x14
            //   85f6                 | test                esi, esi
            //   7567                 | jne                 0x69
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax

    condition:
        7 of them and filesize < 372736
}