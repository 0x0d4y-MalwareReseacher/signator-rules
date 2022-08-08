rule win_aytoke_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.aytoke."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.aytoke"
        malpedia_rule_date = "20220805"
        malpedia_hash = "6ec06c64bcfdbeda64eff021c766b4ce34542b71"
        malpedia_version = "20220808"
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
        $sequence_0 = { 56 57 898de4fcffff b906000000 }
            // n = 4, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   898de4fcffff         | mov                 dword ptr [ebp - 0x31c], ecx
            //   b906000000           | mov                 ecx, 6

        $sequence_1 = { 8bb02c884100 89450c 8d872b010000 99 8d5fff bf90010000 f7ff }
            // n = 7, score = 200
            //   8bb02c884100         | mov                 esi, dword ptr [eax + 0x41882c]
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   8d872b010000         | lea                 eax, [edi + 0x12b]
            //   99                   | cdq                 
            //   8d5fff               | lea                 ebx, [edi - 1]
            //   bf90010000           | mov                 edi, 0x190
            //   f7ff                 | idiv                edi

        $sequence_2 = { 8bf0 c1fe05 c1e106 030cb500c44100 }
            // n = 4, score = 200
            //   8bf0                 | mov                 esi, eax
            //   c1fe05               | sar                 esi, 5
            //   c1e106               | shl                 ecx, 6
            //   030cb500c44100       | add                 ecx, dword ptr [esi*4 + 0x41c400]

        $sequence_3 = { 0fb7889c374100 66898c05fcfdffff 83c002 6685c9 75e9 e9???????? }
            // n = 6, score = 200
            //   0fb7889c374100       | movzx               ecx, word ptr [eax + 0x41379c]
            //   66898c05fcfdffff     | mov                 word ptr [ebp + eax - 0x204], cx
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx
            //   75e9                 | jne                 0xffffffeb
            //   e9????????           |                     

        $sequence_4 = { 0f84b9000000 8975e0 8b04bd00c44100 0500080000 3bf0 0f8396000000 }
            // n = 6, score = 200
            //   0f84b9000000         | je                  0xbf
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   8b04bd00c44100       | mov                 eax, dword ptr [edi*4 + 0x41c400]
            //   0500080000           | add                 eax, 0x800
            //   3bf0                 | cmp                 esi, eax
            //   0f8396000000         | jae                 0x9c

        $sequence_5 = { c1fb05 c1e106 030c9d00c44100 eb02 }
            // n = 4, score = 200
            //   c1fb05               | sar                 ebx, 5
            //   c1e106               | shl                 ecx, 6
            //   030c9d00c44100       | add                 ecx, dword ptr [ebx*4 + 0x41c400]
            //   eb02                 | jmp                 4

        $sequence_6 = { 0fb7888c364100 66898c05fcfdffff 83c002 6685c9 }
            // n = 4, score = 200
            //   0fb7888c364100       | movzx               ecx, word ptr [eax + 0x41368c]
            //   66898c05fcfdffff     | mov                 word ptr [ebp + eax - 0x204], cx
            //   83c002               | add                 eax, 2
            //   6685c9               | test                cx, cx

        $sequence_7 = { 68???????? ff15???????? 8d95ecfbffff 52 e8???????? 68???????? 68???????? }
            // n = 7, score = 200
            //   68????????           |                     
            //   ff15????????         |                     
            //   8d95ecfbffff         | lea                 edx, [ebp - 0x414]
            //   52                   | push                edx
            //   e8????????           |                     
            //   68????????           |                     
            //   68????????           |                     

        $sequence_8 = { 68???????? e8???????? 8b15???????? be01000000 83c204 83c408 3bd6 }
            // n = 7, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   8b15????????         |                     
            //   be01000000           | mov                 esi, 1
            //   83c204               | add                 edx, 4
            //   83c408               | add                 esp, 8
            //   3bd6                 | cmp                 edx, esi

        $sequence_9 = { 8bc6 c1f805 8b048500c44100 83e61f c1e606 8d443004 }
            // n = 6, score = 200
            //   8bc6                 | mov                 eax, esi
            //   c1f805               | sar                 eax, 5
            //   8b048500c44100       | mov                 eax, dword ptr [eax*4 + 0x41c400]
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   8d443004             | lea                 eax, [eax + esi + 4]

    condition:
        7 of them and filesize < 425984
}