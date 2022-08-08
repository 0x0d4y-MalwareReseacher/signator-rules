rule win_bravonc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.bravonc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bravonc"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 53 ff75f0 894118 e8???????? 8b4df8 8b96c0000000 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   894118               | mov                 dword ptr [ecx + 0x18], eax
            //   e8????????           |                     
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   8b96c0000000         | mov                 edx, dword ptr [esi + 0xc0]

        $sequence_1 = { 8d855cffffff 50 8d45c0 50 e8???????? 8b4004 59 }
            // n = 7, score = 100
            //   8d855cffffff         | lea                 eax, [ebp - 0xa4]
            //   50                   | push                eax
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   59                   | pop                 ecx

        $sequence_2 = { 0f8c9d000000 391d???????? 0f8591000000 53 }
            // n = 4, score = 100
            //   0f8c9d000000         | jl                  0xa3
            //   391d????????         |                     
            //   0f8591000000         | jne                 0x97
            //   53                   | push                ebx

        $sequence_3 = { 33ff eb49 83f8fd 7509 c74618d0e34000 }
            // n = 5, score = 100
            //   33ff                 | xor                 edi, edi
            //   eb49                 | jmp                 0x4b
            //   83f8fd               | cmp                 eax, -3
            //   7509                 | jne                 0xb
            //   c74618d0e34000       | mov                 dword ptr [esi + 0x18], 0x40e3d0

        $sequence_4 = { 53 7f1a ff7508 8d85f4fbffff 50 e8???????? 83c40c }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   7f1a                 | jg                  0x1c
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d85f4fbffff         | lea                 eax, [ebp - 0x40c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { 7423 38450c 7414 394510 760f }
            // n = 5, score = 100
            //   7423                 | je                  0x25
            //   38450c               | cmp                 byte ptr [ebp + 0xc], al
            //   7414                 | je                  0x16
            //   394510               | cmp                 dword ptr [ebp + 0x10], eax
            //   760f                 | jbe                 0x11

        $sequence_6 = { e8???????? 8b7d10 6a04 5b 8d4de0 53 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   6a04                 | push                4
            //   5b                   | pop                 ebx
            //   8d4de0               | lea                 ecx, [ebp - 0x20]
            //   53                   | push                ebx

        $sequence_7 = { 50 0fb605???????? 50 8d45ac 50 ff75e4 ff75e8 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   0fb605????????       |                     
            //   50                   | push                eax
            //   8d45ac               | lea                 eax, [ebp - 0x54]
            //   50                   | push                eax
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff75e8               | push                dword ptr [ebp - 0x18]

        $sequence_8 = { 57 6800100000 8d8d10efffff e8???????? a0???????? 6a31 888524ffffff }
            // n = 7, score = 100
            //   57                   | push                edi
            //   6800100000           | push                0x1000
            //   8d8d10efffff         | lea                 ecx, [ebp - 0x10f0]
            //   e8????????           |                     
            //   a0????????           |                     
            //   6a31                 | push                0x31
            //   888524ffffff         | mov                 byte ptr [ebp - 0xdc], al

        $sequence_9 = { 2bfb 8945f4 8b06 f7d8 23c1 03f3 8945fc }
            // n = 7, score = 100
            //   2bfb                 | sub                 edi, ebx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   f7d8                 | neg                 eax
            //   23c1                 | and                 eax, ecx
            //   03f3                 | add                 esi, ebx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

    condition:
        7 of them and filesize < 131072
}