rule win_rekoobew_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.rekoobew."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rekoobew"
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
        $sequence_0 = { 89442408 c7442404???????? 891c24 e8???????? 89c2 b80e000000 }
            // n = 6, score = 100
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   e8????????           |                     
            //   89c2                 | mov                 edx, eax
            //   b80e000000           | mov                 eax, 0xe

        $sequence_1 = { 897dd4 8d8438a1ebd96e 8945f0 89d0 31d8 31f0 }
            // n = 6, score = 100
            //   897dd4               | mov                 dword ptr [ebp - 0x2c], edi
            //   8d8438a1ebd96e       | lea                 eax, [eax + edi + 0x6ed9eba1]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   89d0                 | mov                 eax, edx
            //   31d8                 | xor                 eax, ebx
            //   31f0                 | xor                 eax, esi

        $sequence_2 = { 0fb6f1 8b34b5e07c4000 33b328010000 8b4de4 c1e918 }
            // n = 5, score = 100
            //   0fb6f1               | movzx               esi, cl
            //   8b34b5e07c4000       | mov                 esi, dword ptr [esi*4 + 0x407ce0]
            //   33b328010000         | xor                 esi, dword ptr [ebx + 0x128]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   c1e918               | shr                 ecx, 0x18

        $sequence_3 = { 33bb14010000 89d6 c1ee10 81e6ff000000 333cb5e0744000 8b4dec }
            // n = 6, score = 100
            //   33bb14010000         | xor                 edi, dword ptr [ebx + 0x114]
            //   89d6                 | mov                 esi, edx
            //   c1ee10               | shr                 esi, 0x10
            //   81e6ff000000         | and                 esi, 0xff
            //   333cb5e0744000       | xor                 edi, dword ptr [esi*4 + 0x4074e0]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

        $sequence_4 = { 80bf????????ff 0f8414010000 83c601 837d1000 0f9545ef 7409 }
            // n = 6, score = 100
            //   80bf????????ff       |                     
            //   0f8414010000         | je                  0x11a
            //   83c601               | add                 esi, 1
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   0f9545ef             | setne               byte ptr [ebp - 0x11]
            //   7409                 | je                  0xb

        $sequence_5 = { c1c11e 8b5de4 335dec 335db8 335dbc d1c3 895dec }
            // n = 7, score = 100
            //   c1c11e               | rol                 ecx, 0x1e
            //   8b5de4               | mov                 ebx, dword ptr [ebp - 0x1c]
            //   335dec               | xor                 ebx, dword ptr [ebp - 0x14]
            //   335db8               | xor                 ebx, dword ptr [ebp - 0x48]
            //   335dbc               | xor                 ebx, dword ptr [ebp - 0x44]
            //   d1c3                 | rol                 ebx, 1
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx

        $sequence_6 = { 56 53 81ecb4000000 e8???????? c70424???????? e8???????? a3???????? }
            // n = 7, score = 100
            //   56                   | push                esi
            //   53                   | push                ebx
            //   81ecb4000000         | sub                 esp, 0xb4
            //   e8????????           |                     
            //   c70424????????       |                     
            //   e8????????           |                     
            //   a3????????           |                     

        $sequence_7 = { 0fb65005 c1e210 09f2 0fb67007 09f2 0fb67006 }
            // n = 6, score = 100
            //   0fb65005             | movzx               edx, byte ptr [eax + 5]
            //   c1e210               | shl                 edx, 0x10
            //   09f2                 | or                  edx, esi
            //   0fb67007             | movzx               esi, byte ptr [eax + 7]
            //   09f2                 | or                  edx, esi
            //   0fb67006             | movzx               esi, byte ptr [eax + 6]

        $sequence_8 = { 09d7 0fb64827 09cf 0fb65026 c1e208 09d7 897dc8 }
            // n = 7, score = 100
            //   09d7                 | or                  edi, edx
            //   0fb64827             | movzx               ecx, byte ptr [eax + 0x27]
            //   09cf                 | or                  edi, ecx
            //   0fb65026             | movzx               edx, byte ptr [eax + 0x26]
            //   c1e208               | shl                 edx, 8
            //   09d7                 | or                  edi, edx
            //   897dc8               | mov                 dword ptr [ebp - 0x38], edi

        $sequence_9 = { 8b55ec c1ea18 333c95e0704000 8b55f0 c1ea10 0fb6d2 }
            // n = 6, score = 100
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   c1ea18               | shr                 edx, 0x18
            //   333c95e0704000       | xor                 edi, dword ptr [edx*4 + 0x4070e0]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   c1ea10               | shr                 edx, 0x10
            //   0fb6d2               | movzx               edx, dl

    condition:
        7 of them and filesize < 248832
}