rule win_jssloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.jssloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jssloader"
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
        $sequence_0 = { b8ffffff7f 8b5110 2bc2 83f802 0f82a7030000 83791410 }
            // n = 6, score = 200
            //   b8ffffff7f           | mov                 eax, 0x7fffffff
            //   8b5110               | mov                 edx, dword ptr [ecx + 0x10]
            //   2bc2                 | sub                 eax, edx
            //   83f802               | cmp                 eax, 2
            //   0f82a7030000         | jb                  0x3ad
            //   83791410             | cmp                 dword ptr [ecx + 0x14], 0x10

        $sequence_1 = { 8bf8 83e73f 6bdf38 031c95701d4400 b9???????? }
            // n = 5, score = 200
            //   8bf8                 | mov                 edi, eax
            //   83e73f               | and                 edi, 0x3f
            //   6bdf38               | imul                ebx, edi, 0x38
            //   031c95701d4400       | add                 ebx, dword ptr [edx*4 + 0x441d70]
            //   b9????????           |                     

        $sequence_2 = { 50 e8???????? 83a6701d440000 59 83c604 81fe00020000 72dd }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83a6701d440000       | and                 dword ptr [esi + 0x441d70], 0
            //   59                   | pop                 ecx
            //   83c604               | add                 esi, 4
            //   81fe00020000         | cmp                 esi, 0x200
            //   72dd                 | jb                  0xffffffdf

        $sequence_3 = { c745d40f000000 c645c000 e8???????? 8d8df4feffff c745fc00000000 e8???????? 8d4dc0 }
            // n = 7, score = 200
            //   c745d40f000000       | mov                 dword ptr [ebp - 0x2c], 0xf
            //   c645c000             | mov                 byte ptr [ebp - 0x40], 0
            //   e8????????           |                     
            //   8d8df4feffff         | lea                 ecx, [ebp - 0x10c]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   e8????????           |                     
            //   8d4dc0               | lea                 ecx, [ebp - 0x40]

        $sequence_4 = { 8d8d7cfcffff e8???????? 83bd30fdffff10 8d951cfdffff ffb52cfdffff 0f43951cfdffff }
            // n = 6, score = 200
            //   8d8d7cfcffff         | lea                 ecx, [ebp - 0x384]
            //   e8????????           |                     
            //   83bd30fdffff10       | cmp                 dword ptr [ebp - 0x2d0], 0x10
            //   8d951cfdffff         | lea                 edx, [ebp - 0x2e4]
            //   ffb52cfdffff         | push                dword ptr [ebp - 0x2d4]
            //   0f43951cfdffff       | cmovae              edx, dword ptr [ebp - 0x2e4]

        $sequence_5 = { c68500feffff00 e8???????? c645fc1d 8d8d18feffff 6a07 68???????? c78528feffff00000000 }
            // n = 7, score = 200
            //   c68500feffff00       | mov                 byte ptr [ebp - 0x200], 0
            //   e8????????           |                     
            //   c645fc1d             | mov                 byte ptr [ebp - 4], 0x1d
            //   8d8d18feffff         | lea                 ecx, [ebp - 0x1e8]
            //   6a07                 | push                7
            //   68????????           |                     
            //   c78528feffff00000000     | mov    dword ptr [ebp - 0x1d8], 0

        $sequence_6 = { 83c604 c700???????? 56 e8???????? 8b45e4 8b4dec 8945ec }
            // n = 7, score = 200
            //   83c604               | add                 esi, 4
            //   c700????????         |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax

        $sequence_7 = { 68???????? 68???????? 6a00 c745b400000000 c745b80f000000 c645a400 ff15???????? }
            // n = 7, score = 200
            //   68????????           |                     
            //   68????????           |                     
            //   6a00                 | push                0
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   c745b80f000000       | mov                 dword ptr [ebp - 0x48], 0xf
            //   c645a400             | mov                 byte ptr [ebp - 0x5c], 0
            //   ff15????????         |                     

        $sequence_8 = { 0f8483000000 eb7d 8b1c9d58414300 6800080000 6a00 53 ff15???????? }
            // n = 7, score = 200
            //   0f8483000000         | je                  0x89
            //   eb7d                 | jmp                 0x7f
            //   8b1c9d58414300       | mov                 ebx, dword ptr [ebx*4 + 0x434158]
            //   6800080000           | push                0x800
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_9 = { 8bd6 7202 8b16 ff7610 8bc8 }
            // n = 5, score = 200
            //   8bd6                 | mov                 edx, esi
            //   7202                 | jb                  4
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   ff7610               | push                dword ptr [esi + 0x10]
            //   8bc8                 | mov                 ecx, eax

    condition:
        7 of them and filesize < 581632
}