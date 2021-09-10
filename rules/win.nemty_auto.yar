rule win_nemty_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.nemty."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nemty"
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
        $sequence_0 = { c3 56 68???????? be???????? e8???????? 59 }
            // n = 6, score = 300
            //   c3                   | ret                 
            //   56                   | push                esi
            //   68????????           |                     
            //   be????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { 6a1c 99 5e f7fe 8bd8 3b4f08 7507 }
            // n = 7, score = 300
            //   6a1c                 | push                0x1c
            //   99                   | cdq                 
            //   5e                   | pop                 esi
            //   f7fe                 | idiv                esi
            //   8bd8                 | mov                 ebx, eax
            //   3b4f08               | cmp                 ecx, dword ptr [edi + 8]
            //   7507                 | jne                 9

        $sequence_2 = { 837dd810 8b75c4 8bc6 7305 8d45c4 8bf0 0fbe0418 }
            // n = 7, score = 300
            //   837dd810             | cmp                 dword ptr [ebp - 0x28], 0x10
            //   8b75c4               | mov                 esi, dword ptr [ebp - 0x3c]
            //   8bc6                 | mov                 eax, esi
            //   7305                 | jae                 7
            //   8d45c4               | lea                 eax, dword ptr [ebp - 0x3c]
            //   8bf0                 | mov                 esi, eax
            //   0fbe0418             | movsx               eax, byte ptr [eax + ebx]

        $sequence_3 = { 030d???????? 3bc7 7302 8bd6 51 52 }
            // n = 6, score = 300
            //   030d????????         |                     
            //   3bc7                 | cmp                 eax, edi
            //   7302                 | jae                 4
            //   8bd6                 | mov                 edx, esi
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_4 = { e8???????? 59 6bf61c 8b45e8 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6bf61c               | imul                esi, esi, 0x1c
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_5 = { 33ff e8???????? 83c61c 3b7510 75ef 6a00 }
            // n = 6, score = 300
            //   33ff                 | xor                 edi, edi
            //   e8????????           |                     
            //   83c61c               | add                 esi, 0x1c
            //   3b7510               | cmp                 esi, dword ptr [ebp + 0x10]
            //   75ef                 | jne                 0xfffffff1
            //   6a00                 | push                0

        $sequence_6 = { 83ec1c 8bd8 8bc4 68???????? e8???????? }
            // n = 5, score = 300
            //   83ec1c               | sub                 esp, 0x1c
            //   8bd8                 | mov                 ebx, eax
            //   8bc4                 | mov                 eax, esp
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_7 = { ff75a4 56 ff15???????? 56 ff15???????? }
            // n = 5, score = 300
            //   ff75a4               | push                dword ptr [ebp - 0x5c]
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_8 = { 8b4810 57 7202 8b00 8b3d???????? 33db 53 }
            // n = 7, score = 300
            //   8b4810               | mov                 ecx, dword ptr [eax + 0x10]
            //   57                   | push                edi
            //   7202                 | jb                  4
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b3d????????         |                     
            //   33db                 | xor                 ebx, ebx
            //   53                   | push                ebx

        $sequence_9 = { 6a01 8d7524 e8???????? 5f 5e 8bc3 5b }
            // n = 7, score = 300
            //   6a01                 | push                1
            //   8d7524               | lea                 esi, dword ptr [ebp + 0x24]
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8bc3                 | mov                 eax, ebx
            //   5b                   | pop                 ebx

    condition:
        7 of them and filesize < 204800
}