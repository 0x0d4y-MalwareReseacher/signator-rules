rule win_ice_ix_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.ice_ix."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ice_ix"
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
        $sequence_0 = { eb0f b302 eb0a b301 eb06 b303 }
            // n = 6, score = 200
            //   eb0f                 | jmp                 0x11
            //   b302                 | mov                 bl, 2
            //   eb0a                 | jmp                 0xc
            //   b301                 | mov                 bl, 1
            //   eb06                 | jmp                 8
            //   b303                 | mov                 bl, 3

        $sequence_1 = { 1bc0 f7d8 68cc000000 83c034 e8???????? }
            // n = 5, score = 200
            //   1bc0                 | sbb                 eax, eax
            //   f7d8                 | neg                 eax
            //   68cc000000           | push                0xcc
            //   83c034               | add                 eax, 0x34
            //   e8????????           |                     

        $sequence_2 = { 83c8ff e8???????? 8bf8 6a42 8d7580 }
            // n = 5, score = 200
            //   83c8ff               | or                  eax, 0xffffffff
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   6a42                 | push                0x42
            //   8d7580               | lea                 esi, dword ptr [ebp - 0x80]

        $sequence_3 = { 833d????????04 8b7c2414 1bc0 f7d8 68cc000000 83c034 e8???????? }
            // n = 7, score = 200
            //   833d????????04       |                     
            //   8b7c2414             | mov                 edi, dword ptr [esp + 0x14]
            //   1bc0                 | sbb                 eax, eax
            //   f7d8                 | neg                 eax
            //   68cc000000           | push                0xcc
            //   83c034               | add                 eax, 0x34
            //   e8????????           |                     

        $sequence_4 = { 6a42 8db550ffffff 58 e8???????? 8b75f4 8b55f0 3bf7 }
            // n = 7, score = 200
            //   6a42                 | push                0x42
            //   8db550ffffff         | lea                 esi, dword ptr [ebp - 0xb0]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   8b75f4               | mov                 esi, dword ptr [ebp - 0xc]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   3bf7                 | cmp                 esi, edi

        $sequence_5 = { 6a3b 8d75e0 58 897dec }
            // n = 4, score = 200
            //   6a3b                 | push                0x3b
            //   8d75e0               | lea                 esi, dword ptr [ebp - 0x20]
            //   58                   | pop                 eax
            //   897dec               | mov                 dword ptr [ebp - 0x14], edi

        $sequence_6 = { 6824483268 e8???????? 8d442430 50 53 6a02 ff15???????? }
            // n = 7, score = 200
            //   6824483268           | push                0x68324824
            //   e8????????           |                     
            //   8d442430             | lea                 eax, dword ptr [esp + 0x30]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   6a02                 | push                2
            //   ff15????????         |                     

        $sequence_7 = { 7561 6a03 8d742424 58 e8???????? ff7704 83caff }
            // n = 7, score = 200
            //   7561                 | jne                 0x63
            //   6a03                 | push                3
            //   8d742424             | lea                 esi, dword ptr [esp + 0x24]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   ff7704               | push                dword ptr [edi + 4]
            //   83caff               | or                  edx, 0xffffffff

        $sequence_8 = { 56 6a51 8d75e0 58 e8???????? 6a52 8d75cc }
            // n = 7, score = 200
            //   56                   | push                esi
            //   6a51                 | push                0x51
            //   8d75e0               | lea                 esi, dword ptr [ebp - 0x20]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   6a52                 | push                0x52
            //   8d75cc               | lea                 esi, dword ptr [ebp - 0x34]

        $sequence_9 = { e8???????? 6a5f 8d75e4 58 e8???????? 6a60 8d75ac }
            // n = 7, score = 200
            //   e8????????           |                     
            //   6a5f                 | push                0x5f
            //   8d75e4               | lea                 esi, dword ptr [ebp - 0x1c]
            //   58                   | pop                 eax
            //   e8????????           |                     
            //   6a60                 | push                0x60
            //   8d75ac               | lea                 esi, dword ptr [ebp - 0x54]

    condition:
        7 of them and filesize < 327680
}