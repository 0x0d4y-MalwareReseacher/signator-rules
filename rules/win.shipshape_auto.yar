rule win_shipshape_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.shipshape."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shipshape"
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
        $sequence_0 = { 8d542438 8d842400070000 52 50 e8???????? 8bfd 83c9ff }
            // n = 7, score = 100
            //   8d542438             | lea                 edx, [esp + 0x38]
            //   8d842400070000       | lea                 eax, [esp + 0x700]
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bfd                 | mov                 edi, ebp
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_1 = { 8bcb 8d9424fc050000 83e103 50 f3a4 8d7c243c }
            // n = 6, score = 100
            //   8bcb                 | mov                 ecx, ebx
            //   8d9424fc050000       | lea                 edx, [esp + 0x5fc]
            //   83e103               | and                 ecx, 3
            //   50                   | push                eax
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d7c243c             | lea                 edi, [esp + 0x3c]

        $sequence_2 = { 3d???????? 7cf1 56 8bf1 c1e603 3b9678b74000 0f851c010000 }
            // n = 7, score = 100
            //   3d????????           |                     
            //   7cf1                 | jl                  0xfffffff3
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   c1e603               | shl                 esi, 3
            //   3b9678b74000         | cmp                 edx, dword ptr [esi + 0x40b778]
            //   0f851c010000         | jne                 0x122

        $sequence_3 = { 83e01f c1f905 8b0c8d60d54000 8a44c104 83e040 }
            // n = 5, score = 100
            //   83e01f               | and                 eax, 0x1f
            //   c1f905               | sar                 ecx, 5
            //   8b0c8d60d54000       | mov                 ecx, dword ptr [ecx*4 + 0x40d560]
            //   8a44c104             | mov                 al, byte ptr [ecx + eax*8 + 4]
            //   83e040               | and                 eax, 0x40

        $sequence_4 = { 80fb78 7f0e 0fbec3 8a8018a24000 83e00f eb02 }
            // n = 6, score = 100
            //   80fb78               | cmp                 bl, 0x78
            //   7f0e                 | jg                  0x10
            //   0fbec3               | movsx               eax, bl
            //   8a8018a24000         | mov                 al, byte ptr [eax + 0x40a218]
            //   83e00f               | and                 eax, 0xf
            //   eb02                 | jmp                 4

        $sequence_5 = { 56 e8???????? 56 e8???????? 83c408 eb09 56 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   eb09                 | jmp                 0xb
            //   56                   | push                esi

        $sequence_6 = { e8???????? 6a04 68???????? e8???????? 6a0c }
            // n = 5, score = 100
            //   e8????????           |                     
            //   6a04                 | push                4
            //   68????????           |                     
            //   e8????????           |                     
            //   6a0c                 | push                0xc

        $sequence_7 = { 6840420f00 51 52 e8???????? 50 }
            // n = 5, score = 100
            //   6840420f00           | push                0xf4240
            //   51                   | push                ecx
            //   52                   | push                edx
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_8 = { 8d942434030000 83e103 f3a4 bf???????? 83c9ff }
            // n = 5, score = 100
            //   8d942434030000       | lea                 edx, [esp + 0x334]
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_9 = { 52 ff15???????? 8d8424b4000000 50 ff15???????? 0c06 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8d8424b4000000       | lea                 eax, [esp + 0xb4]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   0c06                 | or                  al, 6

    condition:
        7 of them and filesize < 338386
}