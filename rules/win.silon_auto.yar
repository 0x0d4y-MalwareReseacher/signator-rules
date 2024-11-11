rule win_silon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.silon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.silon"
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
        $sequence_0 = { 6a03 68???????? 8b5508 8b4204 50 }
            // n = 5, score = 200
            //   6a03                 | push                3
            //   68????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   50                   | push                eax

        $sequence_1 = { 83c114 898d00efffff 8b9500efffff 0fb6420d }
            // n = 4, score = 200
            //   83c114               | add                 ecx, 0x14
            //   898d00efffff         | mov                 dword ptr [ebp - 0x1100], ecx
            //   8b9500efffff         | mov                 edx, dword ptr [ebp - 0x1100]
            //   0fb6420d             | movzx               eax, byte ptr [edx + 0xd]

        $sequence_2 = { 83ec14 c745ec00000000 c745fc00000000 6804010000 68???????? }
            // n = 5, score = 200
            //   83ec14               | sub                 esp, 0x14
            //   c745ec00000000       | mov                 dword ptr [ebp - 0x14], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   6804010000           | push                0x104
            //   68????????           |                     

        $sequence_3 = { 7418 8b5508 8b8264080000 8b4d08 8b9160080000 899060080000 8b4508 }
            // n = 7, score = 200
            //   7418                 | je                  0x1a
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b8264080000         | mov                 eax, dword ptr [edx + 0x864]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b9160080000         | mov                 edx, dword ptr [ecx + 0x860]
            //   899060080000         | mov                 dword ptr [eax + 0x860], edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_4 = { 0f8512010000 8b85ecfeffff 83c001 8985e4feffff }
            // n = 4, score = 200
            //   0f8512010000         | jne                 0x118
            //   8b85ecfeffff         | mov                 eax, dword ptr [ebp - 0x114]
            //   83c001               | add                 eax, 1
            //   8985e4feffff         | mov                 dword ptr [ebp - 0x11c], eax

        $sequence_5 = { 8985c4fdffff 8b8dc4fdffff 51 e8???????? }
            // n = 4, score = 200
            //   8985c4fdffff         | mov                 dword ptr [ebp - 0x23c], eax
            //   8b8dc4fdffff         | mov                 ecx, dword ptr [ebp - 0x23c]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_6 = { 6a00 6a02 8b4ddc 51 8b55d8 52 e8???????? }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   51                   | push                ecx
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_7 = { 894dec 8b55ec 3b55e8 732e 8b45f0 50 8b4dec }
            // n = 7, score = 200
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   3b55e8               | cmp                 edx, dword ptr [ebp - 0x18]
            //   732e                 | jae                 0x30
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

        $sequence_8 = { 8b0d???????? 51 68???????? e8???????? 83c410 c78500feffff00000000 8b9504feffff }
            // n = 7, score = 200
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c78500feffff00000000     | mov    dword ptr [ebp - 0x200], 0
            //   8b9504feffff         | mov                 edx, dword ptr [ebp - 0x1fc]

        $sequence_9 = { 8b4dfc 8b9058080000 2b915c080000 8b450c 395018 }
            // n = 5, score = 200
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b9058080000         | mov                 edx, dword ptr [eax + 0x858]
            //   2b915c080000         | sub                 edx, dword ptr [ecx + 0x85c]
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   395018               | cmp                 dword ptr [eax + 0x18], edx

    condition:
        7 of them and filesize < 122880
}