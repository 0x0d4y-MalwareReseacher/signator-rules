rule win_doppeldridex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.doppeldridex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.doppeldridex"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 837c240800 b8???????? ba???????? 0f44d0 52 6a08 ff7500 }
            // n = 7, score = 100
            //   837c240800           | cmp                 dword ptr [esp + 8], 0
            //   b8????????           |                     
            //   ba????????           |                     
            //   0f44d0               | cmove               edx, eax
            //   52                   | push                edx
            //   6a08                 | push                8
            //   ff7500               | push                dword ptr [ebp]

        $sequence_1 = { 833c2400 0f8479020000 8b0424 8b583c 8b740378 8b6c037c 03ee }
            // n = 7, score = 100
            //   833c2400             | cmp                 dword ptr [esp], 0
            //   0f8479020000         | je                  0x27f
            //   8b0424               | mov                 eax, dword ptr [esp]
            //   8b583c               | mov                 ebx, dword ptr [eax + 0x3c]
            //   8b740378             | mov                 esi, dword ptr [ebx + eax + 0x78]
            //   8b6c037c             | mov                 ebp, dword ptr [ebx + eax + 0x7c]
            //   03ee                 | add                 ebp, esi

        $sequence_2 = { 8d4c2470 e8???????? 8d842488000000 6a7e 50 8d48e8 e8???????? }
            // n = 7, score = 100
            //   8d4c2470             | lea                 ecx, dword ptr [esp + 0x70]
            //   e8????????           |                     
            //   8d842488000000       | lea                 eax, dword ptr [esp + 0x88]
            //   6a7e                 | push                0x7e
            //   50                   | push                eax
            //   8d48e8               | lea                 ecx, dword ptr [eax - 0x18]
            //   e8????????           |                     

        $sequence_3 = { 895d1c e8???????? 8bc5 5d 5b c3 }
            // n = 6, score = 100
            //   895d1c               | mov                 dword ptr [ebp + 0x1c], ebx
            //   e8????????           |                     
            //   8bc5                 | mov                 eax, ebp
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   c3                   | ret                 

        $sequence_4 = { c70088b2230d 8d4c2404 ff0424 e8???????? 83c004 50 8d4c2408 }
            // n = 7, score = 100
            //   c70088b2230d         | mov                 dword ptr [eax], 0xd23b288
            //   8d4c2404             | lea                 ecx, dword ptr [esp + 4]
            //   ff0424               | inc                 dword ptr [esp]
            //   e8????????           |                     
            //   83c004               | add                 eax, 4
            //   50                   | push                eax
            //   8d4c2408             | lea                 ecx, dword ptr [esp + 8]

        $sequence_5 = { 8b8424d8040000 81c408050000 5d 5b 5f 5e }
            // n = 6, score = 100
            //   8b8424d8040000       | mov                 eax, dword ptr [esp + 0x4d8]
            //   81c408050000         | add                 esp, 0x508
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_6 = { 59 59 5d 5b 5f c20400 56 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   c20400               | ret                 4
            //   56                   | push                esi

        $sequence_7 = { 8d4c2448 8b11 8b4104 f7da f7d8 8b71f8 03d6 }
            // n = 7, score = 100
            //   8d4c2448             | lea                 ecx, dword ptr [esp + 0x48]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   f7da                 | neg                 edx
            //   f7d8                 | neg                 eax
            //   8b71f8               | mov                 esi, dword ptr [ecx - 8]
            //   03d6                 | add                 edx, esi

        $sequence_8 = { 33d2 4a e8???????? 8bce e8???????? 5d 5e }
            // n = 7, score = 100
            //   33d2                 | xor                 edx, edx
            //   4a                   | dec                 edx
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   5d                   | pop                 ebp
            //   5e                   | pop                 esi

        $sequence_9 = { 8d0c24 8a143b 8811 8a543b01 885101 e8???????? 8bd3 }
            // n = 7, score = 100
            //   8d0c24               | lea                 ecx, dword ptr [esp]
            //   8a143b               | mov                 dl, byte ptr [ebx + edi]
            //   8811                 | mov                 byte ptr [ecx], dl
            //   8a543b01             | mov                 dl, byte ptr [ebx + edi + 1]
            //   885101               | mov                 byte ptr [ecx + 1], dl
            //   e8????????           |                     
            //   8bd3                 | mov                 edx, ebx

    condition:
        7 of them and filesize < 264192
}