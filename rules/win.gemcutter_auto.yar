rule win_gemcutter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.gemcutter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gemcutter"
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
        $sequence_0 = { ffd7 8d85f0f8ffff 6800040000 50 53 }
            // n = 5, score = 100
            //   ffd7                 | call                edi
            //   8d85f0f8ffff         | lea                 eax, [ebp - 0x710]
            //   6800040000           | push                0x400
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_1 = { 8d85f0fdffff 53 50 8d45f0 50 ff15???????? 8d45f0 }
            // n = 7, score = 100
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_2 = { e8???????? 8b35???????? 83c410 8d85f0fdffff 53 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8b35????????         |                     
            //   83c410               | add                 esp, 0x10
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   53                   | push                ebx

        $sequence_3 = { 83c424 8b3d???????? 56 33f6 56 56 56 }
            // n = 7, score = 100
            //   83c424               | add                 esp, 0x24
            //   8b3d????????         |                     
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   56                   | push                esi
            //   56                   | push                esi
            //   56                   | push                esi

        $sequence_4 = { 50 ffd6 8d85f0fdffff 50 e8???????? 59 6a01 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8d85f0fdffff         | lea                 eax, [ebp - 0x210]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6a01                 | push                1

        $sequence_5 = { ff7508 56 ff15???????? 5e c9 c3 }
            // n = 6, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   56                   | push                esi
            //   ff15????????         |                     
            //   5e                   | pop                 esi
            //   c9                   | leave               
            //   c3                   | ret                 

        $sequence_6 = { ff7508 6a01 56 ff7508 ff75fc ff15???????? eb09 }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   eb09                 | jmp                 0xb

        $sequence_7 = { 53 50 ffd6 0fbe85f0f8ffff 50 8d45f0 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   0fbe85f0f8ffff       | movsx               eax, byte ptr [ebp - 0x710]
            //   50                   | push                eax
            //   8d45f0               | lea                 eax, [ebp - 0x10]

        $sequence_8 = { 7527 8a8578ffffff 3ac3 7412 fec8 8886a0314000 }
            // n = 6, score = 100
            //   7527                 | jne                 0x29
            //   8a8578ffffff         | mov                 al, byte ptr [ebp - 0x88]
            //   3ac3                 | cmp                 al, bl
            //   7412                 | je                  0x14
            //   fec8                 | dec                 al
            //   8886a0314000         | mov                 byte ptr [esi + 0x4031a0], al

        $sequence_9 = { 68???????? 50 ffd7 85c0 7404 33c0 eb17 }
            // n = 7, score = 100
            //   68????????           |                     
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   33c0                 | xor                 eax, eax
            //   eb17                 | jmp                 0x19

    condition:
        7 of them and filesize < 40960
}