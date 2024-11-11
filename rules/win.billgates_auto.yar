rule win_billgates_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.billgates."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.billgates"
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
        $sequence_0 = { 3c78 7404 3c58 7507 b802000000 eb02 }
            // n = 6, score = 200
            //   3c78                 | dec                 eax
            //   7404                 | mov                 dword ptr [esp + 0x30], ebp
            //   3c58                 | dec                 eax
            //   7507                 | lea                 ecx, [esp + 0x60]
            //   b802000000           | nop                 
            //   eb02                 | dec                 eax

        $sequence_1 = { 740c 3c11 7408 3c22 }
            // n = 4, score = 200
            //   740c                 | push                eax
            //   3c11                 | add                 esp, 8
            //   7408                 | mov                 byte ptr [esp + 0x78], 2
            //   3c22                 | push                eax

        $sequence_2 = { 3c10 740c 3c11 7408 }
            // n = 4, score = 200
            //   3c10                 | jg                  0x277
            //   740c                 | push                eax
            //   3c11                 | push                edi
            //   7408                 | cmp                 eax, dword ptr [edi + 0xc]

        $sequence_3 = { 3c58 7507 b802000000 eb02 }
            // n = 4, score = 200
            //   3c58                 | cmp                 eax, ebx
            //   7507                 | je                  0x35d
            //   b802000000           | mov                 edi, eax
            //   eb02                 | cmp                 eax, ebx

        $sequence_4 = { 8d8809f9ffff b8c94216b2 f7e9 03d1 }
            // n = 4, score = 200
            //   8d8809f9ffff         | push                edx
            //   b8c94216b2           | mov                 esi, dword ptr [edi + 0x34]
            //   f7e9                 | mov                 ebx, dword ptr [ebx]
            //   03d1                 | xor                 eax, eax

        $sequence_5 = { 3c10 740c 3c11 7408 3c22 7404 3c30 }
            // n = 7, score = 200
            //   3c10                 | xor                 eax, eax
            //   740c                 | dec                 ecx
            //   3c11                 | mov                 edx, edx
            //   7408                 | dec                 eax
            //   3c22                 | lea                 ecx, [0x36381]
            //   7404                 | dec                 esp
            //   3c30                 | mov                 edx, dword ptr [esp + 0x68]

        $sequence_6 = { 3c11 7408 3c22 7404 }
            // n = 4, score = 200
            //   3c11                 | jle                 0x144
            //   7408                 | mov                 edx, dword ptr [edi + 0x44]
            //   3c22                 | cmp                 edx, -1
            //   7404                 | cmp                 ecx, dword ptr [esp + 0x2c]

        $sequence_7 = { 3c21 7408 3c23 7404 3c24 }
            // n = 5, score = 200
            //   3c21                 | dec                 eax
            //   7408                 | imul                edi
            //   3c23                 | dec                 eax
            //   7404                 | sar                 edx, 4
            //   3c24                 | nop                 dword ptr [eax + eax]

        $sequence_8 = { 7404 3c58 7507 b802000000 eb02 }
            // n = 5, score = 200
            //   7404                 | dec                 esp
            //   3c58                 | mov                 dword ptr [esp + 0x2a8], esp
            //   7507                 | dec                 esp
            //   b802000000           | mov                 dword ptr [esp + 0x90], esi
            //   eb02                 | dec                 esp

        $sequence_9 = { 7408 3c23 7404 3c24 }
            // n = 4, score = 200
            //   7408                 | lea                 esi, [esp + 0x1c]
            //   3c23                 | mov                 dword ptr [esp + 0x7c], ebp
            //   7404                 | push                eax
            //   3c24                 | lea                 esi, [esp + 0x4c]

    condition:
        7 of them and filesize < 801792
}