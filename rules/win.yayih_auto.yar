rule win_yayih_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.yayih."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.yayih"
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
        $sequence_0 = { 2b7d0c 75df 6a01 58 5f 5e }
            // n = 6, score = 100
            //   2b7d0c               | sub                 edi, dword ptr [ebp + 0xc]
            //   75df                 | jne                 0xffffffe1
            //   6a01                 | push                1
            //   58                   | pop                 eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_1 = { 61 ff45c8 817dc8c4090000 0f8dbe0c0000 }
            // n = 4, score = 100
            //   61                   | popal               
            //   ff45c8               | inc                 dword ptr [ebp - 0x38]
            //   817dc8c4090000       | cmp                 dword ptr [ebp - 0x38], 0x9c4
            //   0f8dbe0c0000         | jge                 0xcc4

        $sequence_2 = { 6a04 ebb8 ff35???????? ff15???????? }
            // n = 4, score = 100
            //   6a04                 | push                4
            //   ebb8                 | jmp                 0xffffffba
            //   ff35????????         |                     
            //   ff15????????         |                     

        $sequence_3 = { 56 6a04 ebb8 ff35???????? }
            // n = 4, score = 100
            //   56                   | push                esi
            //   6a04                 | push                4
            //   ebb8                 | jmp                 0xffffffba
            //   ff35????????         |                     

        $sequence_4 = { 83c001 41 49 90 }
            // n = 4, score = 100
            //   83c001               | add                 eax, 1
            //   41                   | inc                 ecx
            //   49                   | dec                 ecx
            //   90                   | nop                 

        $sequence_5 = { e8???????? ff750c e8???????? 59 40 50 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   40                   | inc                 eax
            //   50                   | push                eax

        $sequence_6 = { ff15???????? 8d85b8b8ffff 50 56 ff75d4 56 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8d85b8b8ffff         | lea                 eax, [ebp - 0x4748]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   56                   | push                esi

        $sequence_7 = { 8d4580 50 68???????? e8???????? 59 59 50 }
            // n = 7, score = 100
            //   8d4580               | lea                 eax, [ebp - 0x80]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   50                   | push                eax

        $sequence_8 = { 50 e8???????? 83c430 8d459c 50 8d8518ffffff }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c430               | add                 esp, 0x30
            //   8d459c               | lea                 eax, [ebp - 0x64]
            //   50                   | push                eax
            //   8d8518ffffff         | lea                 eax, [ebp - 0xe8]

        $sequence_9 = { ff15???????? ff35???????? ff15???????? 8d85b8b8ffff 68???????? }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   8d85b8b8ffff         | lea                 eax, [ebp - 0x4748]
            //   68????????           |                     

    condition:
        7 of them and filesize < 57344
}