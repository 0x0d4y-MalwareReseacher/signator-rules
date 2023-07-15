rule win_downeks_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.downeks."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.downeks"
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
        $sequence_0 = { e8???????? 83c404 53 33c9 8d75ac 8d95ccfeffff e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   53                   | push                ebx
            //   33c9                 | xor                 ecx, ecx
            //   8d75ac               | lea                 esi, [ebp - 0x54]
            //   8d95ccfeffff         | lea                 edx, [ebp - 0x134]
            //   e8????????           |                     

        $sequence_1 = { c1e604 03758c bae8100904 8d4d8c e8???????? 8b00 3bc6 }
            // n = 7, score = 200
            //   c1e604               | shl                 esi, 4
            //   03758c               | add                 esi, dword ptr [ebp - 0x74]
            //   bae8100904           | mov                 edx, 0x40910e8
            //   8d4d8c               | lea                 ecx, [ebp - 0x74]
            //   e8????????           |                     
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   3bc6                 | cmp                 eax, esi

        $sequence_2 = { c745f001000000 e8???????? 69c0e8030000 8945ec 8945f4 8b866c040000 50 }
            // n = 7, score = 200
            //   c745f001000000       | mov                 dword ptr [ebp - 0x10], 1
            //   e8????????           |                     
            //   69c0e8030000         | imul                eax, eax, 0x3e8
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b866c040000         | mov                 eax, dword ptr [esi + 0x46c]
            //   50                   | push                eax

        $sequence_3 = { c645fc0a e8???????? 83c404 be08000000 c645fc0c 39b588fdffff 720f }
            // n = 7, score = 200
            //   c645fc0a             | mov                 byte ptr [ebp - 4], 0xa
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   be08000000           | mov                 esi, 8
            //   c645fc0c             | mov                 byte ptr [ebp - 4], 0xc
            //   39b588fdffff         | cmp                 dword ptr [ebp - 0x278], esi
            //   720f                 | jb                  0x11

        $sequence_4 = { 8b4d10 8b5d0c 2bc2 8d5001 3bca 0f8210010000 8bc8 }
            // n = 7, score = 200
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   2bc2                 | sub                 eax, edx
            //   8d5001               | lea                 edx, [eax + 1]
            //   3bca                 | cmp                 ecx, edx
            //   0f8210010000         | jb                  0x116
            //   8bc8                 | mov                 ecx, eax

        $sequence_5 = { e8???????? 50 56 6844130804 57 e8???????? 83c418 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   50                   | push                eax
            //   56                   | push                esi
            //   6844130804           | push                0x4081344
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18

        $sequence_6 = { e8???????? 8b4afc 33c8 e8???????? b80cac0904 e9???????? 8b85e4feffff }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b4afc               | mov                 ecx, dword ptr [edx - 4]
            //   33c8                 | xor                 ecx, eax
            //   e8????????           |                     
            //   b80cac0904           | mov                 eax, 0x409ac0c
            //   e9????????           |                     
            //   8b85e4feffff         | mov                 eax, dword ptr [ebp - 0x11c]

        $sequence_7 = { c3 b057 5d c3 b058 5d c3 }
            // n = 7, score = 200
            //   c3                   | ret                 
            //   b057                 | mov                 al, 0x57
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   b058                 | mov                 al, 0x58
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_8 = { 0f821cfeffff 8bb500feffff 8b4f24 2b4f20 b8310cc330 f7e9 c1fa05 }
            // n = 7, score = 200
            //   0f821cfeffff         | jb                  0xfffffe22
            //   8bb500feffff         | mov                 esi, dword ptr [ebp - 0x200]
            //   8b4f24               | mov                 ecx, dword ptr [edi + 0x24]
            //   2b4f20               | sub                 ecx, dword ptr [edi + 0x20]
            //   b8310cc330           | mov                 eax, 0x30c30c31
            //   f7e9                 | imul                ecx
            //   c1fa05               | sar                 edx, 5

        $sequence_9 = { 68a48b0904 8d55f0 52 c745f000aa0804 8945f4 894df8 c745fc00000000 }
            // n = 7, score = 200
            //   68a48b0904           | push                0x4098ba4
            //   8d55f0               | lea                 edx, [ebp - 0x10]
            //   52                   | push                edx
            //   c745f000aa0804       | mov                 dword ptr [ebp - 0x10], 0x408aa00
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0

    condition:
        7 of them and filesize < 1318912
}