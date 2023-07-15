rule win_punkey_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.punkey_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.punkey_pos"
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
        $sequence_0 = { 85c0 7919 8b4d10 8b550c 51 52 }
            // n = 6, score = 200
            //   85c0                 | test                eax, eax
            //   7919                 | jns                 0x1b
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_1 = { c20c00 75e5 56 8b7510 57 }
            // n = 5, score = 200
            //   c20c00               | ret                 0xc
            //   75e5                 | jne                 0xffffffe7
            //   56                   | push                esi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   57                   | push                edi

        $sequence_2 = { c705????????00000000 c3 3b0d???????? 7502 f3c3 }
            // n = 5, score = 200
            //   c705????????00000000     |     
            //   c3                   | ret                 
            //   3b0d????????         |                     
            //   7502                 | jne                 4
            //   f3c3                 | ret                 

        $sequence_3 = { 8b4508 85c0 7919 8b4d10 8b550c 51 }
            // n = 6, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   85c0                 | test                eax, eax
            //   7919                 | jns                 0x1b
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx

        $sequence_4 = { 8bec 837d0c01 56 57 756b }
            // n = 5, score = 200
            //   8bec                 | mov                 ebp, esp
            //   837d0c01             | cmp                 dword ptr [ebp + 0xc], 1
            //   56                   | push                esi
            //   57                   | push                edi
            //   756b                 | jne                 0x6d

        $sequence_5 = { 8b7d0c f7c600000040 741d a1???????? 85c0 740e }
            // n = 6, score = 200
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   f7c600000040         | test                esi, 0x40000000
            //   741d                 | je                  0x1f
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10

        $sequence_6 = { 50 ff15???????? 5d c20c00 75e5 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   75e5                 | jne                 0xffffffe7

        $sequence_7 = { 75e5 56 8b7510 57 8b7d0c }
            // n = 5, score = 200
            //   75e5                 | jne                 0xffffffe7
            //   56                   | push                esi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   57                   | push                edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]

        $sequence_8 = { 8b7d0c f7c600000040 741d a1???????? }
            // n = 4, score = 200
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   f7c600000040         | test                esi, 0x40000000
            //   741d                 | je                  0x1f
            //   a1????????           |                     

        $sequence_9 = { 52 50 a1???????? 50 ff15???????? 5d c20c00 }
            // n = 7, score = 200
            //   52                   | push                edx
            //   50                   | push                eax
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc

    condition:
        7 of them and filesize < 499712
}