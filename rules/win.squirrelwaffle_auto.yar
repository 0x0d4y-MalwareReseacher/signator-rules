rule win_squirrelwaffle_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.squirrelwaffle."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.squirrelwaffle"
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
        $sequence_0 = { ff15???????? 8bd8 83c40c 85db 0f84d0000000 8bce }
            // n = 6, score = 700
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   83c40c               | add                 esp, 0xc
            //   85db                 | test                ebx, ebx
            //   0f84d0000000         | je                  0xd6
            //   8bce                 | mov                 ecx, esi

        $sequence_1 = { c7855cf7ffff00000000 c78560f7ffff0f000000 8b00 3bc7 c6854cf7ffff00 0f42f8 833910 }
            // n = 7, score = 700
            //   c7855cf7ffff00000000     | mov    dword ptr [ebp - 0x8a4], 0
            //   c78560f7ffff0f000000     | mov    dword ptr [ebp - 0x8a0], 0xf
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   3bc7                 | cmp                 eax, edi
            //   c6854cf7ffff00       | mov                 byte ptr [ebp - 0x8b4], 0
            //   0f42f8               | cmovb               edi, eax
            //   833910               | cmp                 dword ptr [ecx], 0x10

        $sequence_2 = { 0f8484000000 8d442410 50 ff764c }
            // n = 4, score = 700
            //   0f8484000000         | je                  0x8a
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   50                   | push                eax
            //   ff764c               | push                dword ptr [esi + 0x4c]

        $sequence_3 = { 8d8d18f9ffff 51 68???????? 50 ff15???????? 85c0 }
            // n = 6, score = 700
            //   8d8d18f9ffff         | lea                 ecx, [ebp - 0x6e8]
            //   51                   | push                ecx
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_4 = { 8d4dd8 ff75cc 6a08 e8???????? e9???????? b301 }
            // n = 6, score = 700
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   6a08                 | push                8
            //   e8????????           |                     
            //   e9????????           |                     
            //   b301                 | mov                 bl, 1

        $sequence_5 = { 0f88da000000 83f801 0f8fa8000000 8b75e8 8d45d4 8b7dd4 }
            // n = 6, score = 700
            //   0f88da000000         | js                  0xe0
            //   83f801               | cmp                 eax, 1
            //   0f8fa8000000         | jg                  0xae
            //   8b75e8               | mov                 esi, dword ptr [ebp - 0x18]
            //   8d45d4               | lea                 eax, [ebp - 0x2c]
            //   8b7dd4               | mov                 edi, dword ptr [ebp - 0x2c]

        $sequence_6 = { 8bca 0430 8806 8bc2 898568f7ffff }
            // n = 5, score = 700
            //   8bca                 | mov                 ecx, edx
            //   0430                 | add                 al, 0x30
            //   8806                 | mov                 byte ptr [esi], al
            //   8bc2                 | mov                 eax, edx
            //   898568f7ffff         | mov                 dword ptr [ebp - 0x898], eax

        $sequence_7 = { 2bc1 83f808 7221 8d4108 83fe10 8945e4 }
            // n = 6, score = 700
            //   2bc1                 | sub                 eax, ecx
            //   83f808               | cmp                 eax, 8
            //   7221                 | jb                  0x23
            //   8d4108               | lea                 eax, [ecx + 8]
            //   83fe10               | cmp                 esi, 0x10
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax

        $sequence_8 = { 6a08 e8???????? e9???????? 8b5d08 eb32 }
            // n = 5, score = 700
            //   6a08                 | push                8
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   eb32                 | jmp                 0x34

        $sequence_9 = { c645cc00 8d4dd8 ff75cc 6a08 }
            // n = 4, score = 700
            //   c645cc00             | mov                 byte ptr [ebp - 0x34], 0
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   ff75cc               | push                dword ptr [ebp - 0x34]
            //   6a08                 | push                8

    condition:
        7 of them and filesize < 147456
}