rule win_open_carrot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.open_carrot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.open_carrot"
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
        $sequence_0 = { 83bb90af010000 8b0f 7430 488b93a0af0100 4c8bc7 488b0b ff5318 }
            // n = 7, score = 100
            //   83bb90af010000       | inc                 ecx
            //   8b0f                 | push                esi
            //   7430                 | inc                 ecx
            //   488b93a0af0100       | push                edi
            //   4c8bc7               | dec                 eax
            //   488b0b               | sub                 esp, 0x40
            //   ff5318               | dec                 eax

        $sequence_1 = { 4d8b2424 4c21e6 4c01f7 4881e104000000 4889e8 48056f000000 4c01c1 }
            // n = 7, score = 100
            //   4d8b2424             | test                edi, edi
            //   4c21e6               | jne                 0xbd9
            //   4c01f7               | jmp                 0xc05
            //   4881e104000000       | jmp                 0xb9a
            //   4889e8               | inc                 ecx
            //   48056f000000         | mov                 bh, bl
            //   4c01c1               | inc                 ecx

        $sequence_2 = { 488bc8 e8???????? 488bf8 4885c0 7533 4c8d0d3b5d0600 c7442420c7000000 }
            // n = 7, score = 100
            //   488bc8               | xor                 eax, eax
            //   e8????????           |                     
            //   488bf8               | dec                 eax
            //   4885c0               | add                 esp, 0x38
            //   7533                 | dec                 esp
            //   4c8d0d3b5d0600       | lea                 ecx, [0xe2872]
            //   c7442420c7000000     | mov                 dword ptr [esp + 0x20], 0xb3

        $sequence_3 = { ff15???????? 807da02d 7518 807da12d 7512 e8???????? 84c0 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   807da02d             | push                dword ptr [esp]
            //   7518                 | push                dword ptr [esp]
            //   807da12d             | dec                 eax
            //   7512                 | sub                 dword ptr [eax], 0x3dfdccd1
            //   e8????????           |                     
            //   84c0                 | dec                 eax

        $sequence_4 = { 412b5500 4d89d8 4889f6 482580000000 81ea027cee51 4981c840000000 48253f000000 }
            // n = 7, score = 100
            //   412b5500             | dec                 ecx
            //   4d89d8               | mov                 ecx, edi
            //   4889f6               | test                eax, eax
            //   482580000000         | jne                 0x6d4
            //   81ea027cee51         | dec                 eax
            //   4981c840000000       | lea                 edx, [0x100fa2]
            //   48253f000000         | dec                 eax

        $sequence_5 = { 8133eaa23d55 4889eb 49c7c500000000 4881c36f000000 48c7c000020000 66290b 4981c3ffff0000 }
            // n = 7, score = 100
            //   8133eaa23d55         | lea                 ebx, [0xfff6b9b7]
            //   4889eb               | inc                 ecx
            //   49c7c500000000       | movzx               edi, dl
            //   4881c36f000000       | shr                 ecx, 8
            //   48c7c000020000       | movzx               esi, cl
            //   66290b               | inc                 ecx
            //   4981c3ffff0000       | mov                 ecx, edx

        $sequence_6 = { 7525 4c8d0d92101000 c744242096010000 ba9d000000 8d4822 448d4041 e8???????? }
            // n = 7, score = 100
            //   7525                 | xor                 ecx, ecx
            //   4c8d0d92101000       | dec                 eax
            //   c744242096010000     | mov                 esi, eax
            //   ba9d000000           | dec                 eax
            //   8d4822               | test                eax, eax
            //   448d4041             | jne                 0x1ea5
            //   e8????????           |                     

        $sequence_7 = { 488bd8 4885c0 7520 4c8d0da8081000 c7442420dc000000 ba8d000000 448d400d }
            // n = 7, score = 100
            //   488bd8               | ja                  0x1d0b
            //   4885c0               | dec                 esp
            //   7520                 | lea                 eax, [esp + 0x40]
            //   4c8d0da8081000       | mov                 edx, dword ptr [edx]
            //   c7442420dc000000     | dec                 eax
            //   ba8d000000           | lea                 ecx, [0x101020]
            //   448d400d             | dec                 eax

        $sequence_8 = { 896808 4889680c e8???????? 33d2 4889430c 41b804010000 488bc8 }
            // n = 7, score = 100
            //   896808               | jbe                 0x19d5
            //   4889680c             | inc                 esp
            //   e8????????           |                     
            //   33d2                 | mov                 eax, dword ptr [ecx + 8]
            //   4889430c             | inc                 ecx
            //   41b804010000         | xor                 dl, 1
            //   488bc8               | inc                 ecx

        $sequence_9 = { e8???????? 85c0 0f8551010000 488d4db3 e8???????? 85c0 0f852b010000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   0f8551010000         | mov                 ebx, ebp
            //   488d4db3             | dec                 eax
            //   e8????????           |                     
            //   85c0                 | add                 ebx, 0x128
            //   0f852b010000         | dec                 eax

    condition:
        7 of them and filesize < 8377344
}