rule win_udpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.udpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.udpos"
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
        $sequence_0 = { 50 ff15???????? 68???????? ff15???????? 8b35???????? 85c0 7e2e }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   85c0                 | test                eax, eax
            //   7e2e                 | jle                 0x30

        $sequence_1 = { 83c404 684c040000 ff15???????? 83bd9cfefffff5 }
            // n = 4, score = 100
            //   83c404               | add                 esp, 4
            //   684c040000           | push                0x44c
            //   ff15????????         |                     
            //   83bd9cfefffff5       | cmp                 dword ptr [ebp - 0x164], -0xb

        $sequence_2 = { ffd6 8d8d50f7ffff 51 8d95e0f8ffff 52 ffd6 }
            // n = 6, score = 100
            //   ffd6                 | call                esi
            //   8d8d50f7ffff         | lea                 ecx, [ebp - 0x8b0]
            //   51                   | push                ecx
            //   8d95e0f8ffff         | lea                 edx, [ebp - 0x720]
            //   52                   | push                edx
            //   ffd6                 | call                esi

        $sequence_3 = { 85c0 7525 68???????? ffd3 83f8ff }
            // n = 5, score = 100
            //   85c0                 | test                eax, eax
            //   7525                 | jne                 0x27
            //   68????????           |                     
            //   ffd3                 | call                ebx
            //   83f8ff               | cmp                 eax, -1

        $sequence_4 = { 0fb65c1de8 885802 83e60f 0fb65c35e8 }
            // n = 4, score = 100
            //   0fb65c1de8           | movzx               ebx, byte ptr [ebp + ebx - 0x18]
            //   885802               | mov                 byte ptr [eax + 2], bl
            //   83e60f               | and                 esi, 0xf
            //   0fb65c35e8           | movzx               ebx, byte ptr [ebp + esi - 0x18]

        $sequence_5 = { a1???????? 50 ff15???????? e8???????? ebbb 8db5c8fbffff e8???????? }
            // n = 7, score = 100
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   e8????????           |                     
            //   ebbb                 | jmp                 0xffffffbd
            //   8db5c8fbffff         | lea                 esi, [ebp - 0x438]
            //   e8????????           |                     

        $sequence_6 = { e8???????? 8b15???????? 83c418 52 8d85e0f8ffff 50 ffd6 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b15????????         |                     
            //   83c418               | add                 esp, 0x18
            //   52                   | push                edx
            //   8d85e0f8ffff         | lea                 eax, [ebp - 0x720]
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_7 = { 8b3d???????? 57 895df4 ffd6 8d440002 50 e8???????? }
            // n = 7, score = 100
            //   8b3d????????         |                     
            //   57                   | push                edi
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   ffd6                 | call                esi
            //   8d440002             | lea                 eax, [eax + eax + 2]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_8 = { 3bfb 742c 6824000100 56 57 ff15???????? 33d2 }
            // n = 7, score = 100
            //   3bfb                 | cmp                 edi, ebx
            //   742c                 | je                  0x2e
            //   6824000100           | push                0x10024
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff15????????         |                     
            //   33d2                 | xor                 edx, edx

        $sequence_9 = { 8b95c8fbffff 8d85b0fbffff 8bce 50 }
            // n = 4, score = 100
            //   8b95c8fbffff         | mov                 edx, dword ptr [ebp - 0x438]
            //   8d85b0fbffff         | lea                 eax, [ebp - 0x450]
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax

    condition:
        7 of them and filesize < 163840
}