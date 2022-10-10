rule win_cotx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.cotx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cotx"
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
        $sequence_0 = { c705????????69e053a4 c705????????120d934e c705????????b0b65443 c705????????4df9e511 c705????????0e9a3f4b }
            // n = 5, score = 500
            //   c705????????69e053a4     |     
            //   c705????????120d934e     |     
            //   c705????????b0b65443     |     
            //   c705????????4df9e511     |     
            //   c705????????0e9a3f4b     |     

        $sequence_1 = { 50 0f2805???????? 8d85bcfbffff 0f1145d0 }
            // n = 4, score = 500
            //   50                   | push                eax
            //   0f2805????????       |                     
            //   8d85bcfbffff         | lea                 eax, [ebp - 0x444]
            //   0f1145d0             | movups              xmmword ptr [ebp - 0x30], xmm0

        $sequence_2 = { 75f9 8dbd98faffff 2bd6 4f 8a4701 }
            // n = 5, score = 500
            //   75f9                 | jne                 0xfffffffb
            //   8dbd98faffff         | lea                 edi, [ebp - 0x568]
            //   2bd6                 | sub                 edx, esi
            //   4f                   | dec                 edi
            //   8a4701               | mov                 al, byte ptr [edi + 1]

        $sequence_3 = { c705????????890e9944 c705????????dbd99823 c705????????d468bcb5 c705????????a1a14538 c705????????2086e659 }
            // n = 5, score = 500
            //   c705????????890e9944     |     
            //   c705????????dbd99823     |     
            //   c705????????d468bcb5     |     
            //   c705????????a1a14538     |     
            //   c705????????2086e659     |     

        $sequence_4 = { 740e 3d10b6afa6 7407 3d36ce164d }
            // n = 4, score = 500
            //   740e                 | je                  0x10
            //   3d10b6afa6           | cmp                 eax, 0xa6afb610
            //   7407                 | je                  9
            //   3d36ce164d           | cmp                 eax, 0x4d16ce36

        $sequence_5 = { c705????????e6cd2b66 c705????????79e66d38 c705????????ba66ea37 c705????????1671e665 c705????????6d8ddc0b }
            // n = 5, score = 500
            //   c705????????e6cd2b66     |     
            //   c705????????79e66d38     |     
            //   c705????????ba66ea37     |     
            //   c705????????1671e665     |     
            //   c705????????6d8ddc0b     |     

        $sequence_6 = { c705????????d468bcb5 c705????????a1a14538 c705????????2086e659 c705????????eec45abf }
            // n = 4, score = 500
            //   c705????????d468bcb5     |     
            //   c705????????a1a14538     |     
            //   c705????????2086e659     |     
            //   c705????????eec45abf     |     

        $sequence_7 = { 83e103 0f118598faffff 6a00 0f2805???????? f3a4 }
            // n = 5, score = 500
            //   83e103               | and                 ecx, 3
            //   0f118598faffff       | movups              xmmword ptr [ebp - 0x568], xmm0
            //   6a00                 | push                0
            //   0f2805????????       |                     
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]

        $sequence_8 = { 0f1185a8faffff c785b8faffff74726f6c 66c785bcfaffff6c65 c685befaffff72 }
            // n = 4, score = 500
            //   0f1185a8faffff       | movups              xmmword ptr [ebp - 0x558], xmm0
            //   c785b8faffff74726f6c     | mov    dword ptr [ebp - 0x548], 0x6c6f7274
            //   66c785bcfaffff6c65     | mov    word ptr [ebp - 0x544], 0x656c
            //   c685befaffff72       | mov                 byte ptr [ebp - 0x542], 0x72

        $sequence_9 = { f3a4 8d8d98f6ffff e8???????? 53 ff15???????? }
            // n = 5, score = 500
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d8d98f6ffff         | lea                 ecx, [ebp - 0x968]
            //   e8????????           |                     
            //   53                   | push                ebx
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 1171456
}