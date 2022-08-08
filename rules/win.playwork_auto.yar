rule win_playwork_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.playwork."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.playwork"
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
        $sequence_0 = { 5b 8bc7 5f c3 55 8bec 81ec60040000 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec60040000         | sub                 esp, 0x460

        $sequence_1 = { 53 50 ffd6 85c0 7512 6888130000 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   6888130000           | push                0x1388

        $sequence_2 = { 57 8d85e4f9ffff 56 50 e8???????? 8d85ecfbffff 50 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8d85e4f9ffff         | lea                 eax, [ebp - 0x61c]
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d85ecfbffff         | lea                 eax, [ebp - 0x414]
            //   50                   | push                eax

        $sequence_3 = { 8bec b81c130000 e8???????? 53 56 57 33db }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   b81c130000           | mov                 eax, 0x131c
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33db                 | xor                 ebx, ebx

        $sequence_4 = { 57 0f84e5010000 8d4de4 e8???????? 6a5b be???????? }
            // n = 6, score = 100
            //   57                   | push                edi
            //   0f84e5010000         | je                  0x1eb
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   e8????????           |                     
            //   6a5b                 | push                0x5b
            //   be????????           |                     

        $sequence_5 = { 85c0 0f842d030000 6a09 33c0 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   0f842d030000         | je                  0x333
            //   6a09                 | push                9
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { 0fb6ca 331c8d344b3f00 335808 c1ea18 }
            // n = 4, score = 100
            //   0fb6ca               | movzx               ecx, dl
            //   331c8d344b3f00       | xor                 ebx, dword ptr [ecx*4 + 0x3f4b34]
            //   335808               | xor                 ebx, dword ptr [eax + 8]
            //   c1ea18               | shr                 edx, 0x18

        $sequence_7 = { 880439 41 3b4df0 72f2 }
            // n = 4, score = 100
            //   880439               | mov                 byte ptr [ecx + edi], al
            //   41                   | inc                 ecx
            //   3b4df0               | cmp                 ecx, dword ptr [ebp - 0x10]
            //   72f2                 | jb                  0xfffffff4

        $sequence_8 = { bf???????? 50 8d856cf6ffff 57 }
            // n = 4, score = 100
            //   bf????????           |                     
            //   50                   | push                eax
            //   8d856cf6ffff         | lea                 eax, [ebp - 0x994]
            //   57                   | push                edi

        $sequence_9 = { 57 eb05 68???????? 53 ffd6 }
            // n = 5, score = 100
            //   57                   | push                edi
            //   eb05                 | jmp                 7
            //   68????????           |                     
            //   53                   | push                ebx
            //   ffd6                 | call                esi

    condition:
        7 of them and filesize < 360448
}