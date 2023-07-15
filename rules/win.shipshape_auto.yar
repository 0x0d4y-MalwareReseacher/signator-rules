rule win_shipshape_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.shipshape."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shipshape"
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
        $sequence_0 = { 8b6c2420 83c408 e9???????? 55 e8???????? }
            // n = 5, score = 100
            //   8b6c2420             | mov                 ebp, dword ptr [esp + 0x20]
            //   83c408               | add                 esp, 8
            //   e9????????           |                     
            //   55                   | push                ebp
            //   e8????????           |                     

        $sequence_1 = { 75f4 8d0c49 5e 8d0c8de0b64000 }
            // n = 4, score = 100
            //   75f4                 | jne                 0xfffffff6
            //   8d0c49               | lea                 ecx, [ecx + ecx*2]
            //   5e                   | pop                 esi
            //   8d0c8de0b64000       | lea                 ecx, [ecx*4 + 0x40b6e0]

        $sequence_2 = { 8d84244c040000 68???????? 50 e8???????? }
            // n = 4, score = 100
            //   8d84244c040000       | lea                 eax, [esp + 0x44c]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { 8d44240c 50 ff15???????? 0c06 8d4c240c 50 }
            // n = 6, score = 100
            //   8d44240c             | lea                 eax, [esp + 0xc]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   0c06                 | or                  al, 6
            //   8d4c240c             | lea                 ecx, [esp + 0xc]
            //   50                   | push                eax

        $sequence_4 = { 8d542410 6a00 52 6a00 56 893cbd1cbc4000 ff15???????? }
            // n = 7, score = 100
            //   8d542410             | lea                 edx, [esp + 0x10]
            //   6a00                 | push                0
            //   52                   | push                edx
            //   6a00                 | push                0
            //   56                   | push                esi
            //   893cbd1cbc4000       | mov                 dword ptr [edi*4 + 0x40bc1c], edi
            //   ff15????????         |                     

        $sequence_5 = { f3a4 8d4c2438 51 ff15???????? }
            // n = 4, score = 100
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8d4c2438             | lea                 ecx, [esp + 0x38]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_6 = { 8b0d???????? 3915???????? 56 b8???????? 7415 8d3449 8d34b5e0b64000 }
            // n = 7, score = 100
            //   8b0d????????         |                     
            //   3915????????         |                     
            //   56                   | push                esi
            //   b8????????           |                     
            //   7415                 | je                  0x17
            //   8d3449               | lea                 esi, [ecx + ecx*2]
            //   8d34b5e0b64000       | lea                 esi, [esi*4 + 0x40b6e0]

        $sequence_7 = { 5b 81c440060000 c3 56 57 }
            // n = 5, score = 100
            //   5b                   | pop                 ebx
            //   81c440060000         | add                 esp, 0x640
            //   c3                   | ret                 
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_8 = { 8d9424f8020000 52 ff15???????? 0c06 50 }
            // n = 5, score = 100
            //   8d9424f8020000       | lea                 edx, [esp + 0x2f8]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   0c06                 | or                  al, 6
            //   50                   | push                eax

        $sequence_9 = { f3a4 bf???????? e9???????? 8d8c24e4000000 6a2e 51 e8???????? }
            // n = 7, score = 100
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   bf????????           |                     
            //   e9????????           |                     
            //   8d8c24e4000000       | lea                 ecx, [esp + 0xe4]
            //   6a2e                 | push                0x2e
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 338386
}