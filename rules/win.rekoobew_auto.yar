rule win_rekoobew_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.rekoobew."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rekoobew"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { f7d1 01ca c7442404???????? 891424 e8???????? 85c0 7449 }
            // n = 7, score = 100
            //   f7d1                 | not                 ecx
            //   01ca                 | add                 edx, ecx
            //   c7442404????????     |                     
            //   891424               | mov                 dword ptr [esp], edx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7449                 | je                  0x4b

        $sequence_1 = { 8b1c9de0804000 c1e310 31df 8b55d8 0fb6de 8b1c9de0804000 c1e308 }
            // n = 7, score = 100
            //   8b1c9de0804000       | mov                 ebx, dword ptr [ebx*4 + 0x4080e0]
            //   c1e310               | shl                 ebx, 0x10
            //   31df                 | xor                 edi, ebx
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   0fb6de               | movzx               ebx, dh
            //   8b1c9de0804000       | mov                 ebx, dword ptr [ebx*4 + 0x4080e0]
            //   c1e308               | shl                 ebx, 8

        $sequence_2 = { c1ea18 8855f0 89c2 c1ea10 8855f1 89c2 c1ea08 }
            // n = 7, score = 100
            //   c1ea18               | shr                 edx, 0x18
            //   8855f0               | mov                 byte ptr [ebp - 0x10], dl
            //   89c2                 | mov                 edx, eax
            //   c1ea10               | shr                 edx, 0x10
            //   8855f1               | mov                 byte ptr [ebp - 0xf], dl
            //   89c2                 | mov                 edx, eax
            //   c1ea08               | shr                 edx, 8

        $sequence_3 = { 89742404 8b4508 890424 e8???????? 85c0 750c }
            // n = 6, score = 100
            //   89742404             | mov                 dword ptr [esp + 4], esi
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe

        $sequence_4 = { 0fb6f5 8b34b5e08c4000 31fe 8975f0 0fb675ec }
            // n = 5, score = 100
            //   0fb6f5               | movzx               esi, ch
            //   8b34b5e08c4000       | mov                 esi, dword ptr [esi*4 + 0x408ce0]
            //   31fe                 | xor                 esi, edi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   0fb675ec             | movzx               esi, byte ptr [ebp - 0x14]

        $sequence_5 = { c1e208 09d7 897dc4 0fb67838 c1e718 0fb65039 c1e210 }
            // n = 7, score = 100
            //   c1e208               | shl                 edx, 8
            //   09d7                 | or                  edi, edx
            //   897dc4               | mov                 dword ptr [ebp - 0x3c], edi
            //   0fb67838             | movzx               edi, byte ptr [eax + 0x38]
            //   c1e718               | shl                 edi, 0x18
            //   0fb65039             | movzx               edx, byte ptr [eax + 0x39]
            //   c1e210               | shl                 edx, 0x10

        $sequence_6 = { 337b3c 89ce c1ee18 333cb5e0844000 89d6 c1ee10 81e6ff000000 }
            // n = 7, score = 100
            //   337b3c               | xor                 edi, dword ptr [ebx + 0x3c]
            //   89ce                 | mov                 esi, ecx
            //   c1ee18               | shr                 esi, 0x18
            //   333cb5e0844000       | xor                 edi, dword ptr [esi*4 + 0x4084e0]
            //   89d6                 | mov                 esi, edx
            //   c1ee10               | shr                 esi, 0x10
            //   81e6ff000000         | and                 esi, 0xff

        $sequence_7 = { 89f1 c1e910 0fb6c9 333c8de0884000 0fb6ce }
            // n = 5, score = 100
            //   89f1                 | mov                 ecx, esi
            //   c1e910               | shr                 ecx, 0x10
            //   0fb6c9               | movzx               ecx, cl
            //   333c8de0884000       | xor                 edi, dword ptr [ecx*4 + 0x4088e0]
            //   0fb6ce               | movzx               ecx, dh

        $sequence_8 = { 31f1 894dec 0fb6ca 8b0c8de07c4000 }
            // n = 4, score = 100
            //   31f1                 | xor                 ecx, esi
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   0fb6ca               | movzx               ecx, dl
            //   8b0c8de07c4000       | mov                 ecx, dword ptr [ecx*4 + 0x407ce0]

        $sequence_9 = { 89fa 0fb6d6 89d6 8b55e8 3314b5e08c4000 8955e0 0fb655f0 }
            // n = 7, score = 100
            //   89fa                 | mov                 edx, edi
            //   0fb6d6               | movzx               edx, dh
            //   89d6                 | mov                 esi, edx
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   3314b5e08c4000       | xor                 edx, dword ptr [esi*4 + 0x408ce0]
            //   8955e0               | mov                 dword ptr [ebp - 0x20], edx
            //   0fb655f0             | movzx               edx, byte ptr [ebp - 0x10]

    condition:
        7 of them and filesize < 248832
}