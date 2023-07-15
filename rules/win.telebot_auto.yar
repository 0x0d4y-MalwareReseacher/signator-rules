rule win_telebot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.telebot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.telebot"
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
        $sequence_0 = { 894c2440 89542408 e8???????? 85c0 89442438 8b4c2440 0f84a7000000 }
            // n = 7, score = 100
            //   894c2440             | mov                 dword ptr [esp + 0x40], ecx
            //   89542408             | mov                 dword ptr [esp + 8], edx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   89442438             | mov                 dword ptr [esp + 0x38], eax
            //   8b4c2440             | mov                 ecx, dword ptr [esp + 0x40]
            //   0f84a7000000         | je                  0xad

        $sequence_1 = { 29c4 8b0404 c744241c00000000 89c5 }
            // n = 4, score = 100
            //   29c4                 | sub                 esp, eax
            //   8b0404               | mov                 eax, dword ptr [esp + eax]
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0
            //   89c5                 | mov                 ebp, eax

        $sequence_2 = { 72f0 8d442410 c744241020000000 896c2418 c744241410000000 890424 ffd7 }
            // n = 7, score = 100
            //   72f0                 | jb                  0xfffffff2
            //   8d442410             | lea                 eax, [esp + 0x10]
            //   c744241020000000     | mov                 dword ptr [esp + 0x10], 0x20
            //   896c2418             | mov                 dword ptr [esp + 0x18], ebp
            //   c744241410000000     | mov                 dword ptr [esp + 0x14], 0x10
            //   890424               | mov                 dword ptr [esp], eax
            //   ffd7                 | call                edi

        $sequence_3 = { 8b5c2420 8b7c2424 8d7368 897c2404 893424 e8???????? 8b442428 }
            // n = 7, score = 100
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   8b7c2424             | mov                 edi, dword ptr [esp + 0x24]
            //   8d7368               | lea                 esi, [ebx + 0x68]
            //   897c2404             | mov                 dword ptr [esp + 4], edi
            //   893424               | mov                 dword ptr [esp], esi
            //   e8????????           |                     
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]

        $sequence_4 = { e9???????? 8b54243c 8b442424 83e20f c70015000000 895048 }
            // n = 6, score = 100
            //   e9????????           |                     
            //   8b54243c             | mov                 edx, dword ptr [esp + 0x3c]
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   83e20f               | and                 edx, 0xf
            //   c70015000000         | mov                 dword ptr [eax], 0x15
            //   895048               | mov                 dword ptr [eax + 0x48], edx

        $sequence_5 = { 0f42c7 89c1 89442420 d3e3 81fb54030000 89d8 }
            // n = 6, score = 100
            //   0f42c7               | cmovb               eax, edi
            //   89c1                 | mov                 ecx, eax
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   d3e3                 | shl                 ebx, cl
            //   81fb54030000         | cmp                 ebx, 0x354
            //   89d8                 | mov                 eax, ebx

        $sequence_6 = { 895008 89f2 c1ea08 89500c 8b442424 8b5010 f6c602 }
            // n = 7, score = 100
            //   895008               | mov                 dword ptr [eax + 8], edx
            //   89f2                 | mov                 edx, esi
            //   c1ea08               | shr                 edx, 8
            //   89500c               | mov                 dword ptr [eax + 0xc], edx
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   8b5010               | mov                 edx, dword ptr [eax + 0x10]
            //   f6c602               | test                dh, 2

        $sequence_7 = { 31db 8974242c 31f6 90 8b542424 }
            // n = 5, score = 100
            //   31db                 | xor                 ebx, ebx
            //   8974242c             | mov                 dword ptr [esp + 0x2c], esi
            //   31f6                 | xor                 esi, esi
            //   90                   | nop                 
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]

        $sequence_8 = { 8d486c 83c054 8954243c 8b54244c 89442410 8b44243c 894c240c }
            // n = 7, score = 100
            //   8d486c               | lea                 ecx, [eax + 0x6c]
            //   83c054               | add                 eax, 0x54
            //   8954243c             | mov                 dword ptr [esp + 0x3c], edx
            //   8b54244c             | mov                 edx, dword ptr [esp + 0x4c]
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   894c240c             | mov                 dword ptr [esp + 0xc], ecx

        $sequence_9 = { 8b7638 83f80b 0f859febffff 8b542424 c782c41b0000ffffffff e9???????? 39d3 }
            // n = 7, score = 100
            //   8b7638               | mov                 esi, dword ptr [esi + 0x38]
            //   83f80b               | cmp                 eax, 0xb
            //   0f859febffff         | jne                 0xffffeba5
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]
            //   c782c41b0000ffffffff     | mov    dword ptr [edx + 0x1bc4], 0xffffffff
            //   e9????????           |                     
            //   39d3                 | cmp                 ebx, edx

    condition:
        7 of them and filesize < 393216
}