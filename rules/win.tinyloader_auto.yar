rule win_tinyloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.tinyloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tinyloader"
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
        $sequence_0 = { f7d2 f7d1 5b 89d0 c1c010 6689c8 90 }
            // n = 7, score = 200
            //   f7d2                 | not                 edx
            //   f7d1                 | not                 ecx
            //   5b                   | pop                 ebx
            //   89d0                 | mov                 eax, edx
            //   c1c010               | rol                 eax, 0x10
            //   6689c8               | mov                 ax, cx
            //   90                   | nop                 

        $sequence_1 = { 8b1d???????? 90 8998f8070000 90 }
            // n = 4, score = 200
            //   8b1d????????         |                     
            //   90                   | nop                 
            //   8998f8070000         | mov                 dword ptr [eax + 0x7f8], ebx
            //   90                   | nop                 

        $sequence_2 = { 48 83ec20 48 8d0dea0e0000 }
            // n = 4, score = 100
            //   48                   | dec                 eax
            //   83ec20               | sub                 esp, 0x20
            //   48                   | dec                 eax
            //   8d0dea0e0000         | lea                 ecx, [0xeea]

        $sequence_3 = { 83c008 c70000000000 c7855808000000000000 8b5d00 039d58080000 6a00 }
            // n = 6, score = 100
            //   83c008               | add                 eax, 8
            //   c70000000000         | mov                 dword ptr [eax], 0
            //   c7855808000000000000     | mov    dword ptr [ebp + 0x858], 0
            //   8b5d00               | mov                 ebx, dword ptr [ebp]
            //   039d58080000         | add                 ebx, dword ptr [ebp + 0x858]
            //   6a00                 | push                0

        $sequence_4 = { 31c9 ffc9 89ca 31c0 31db }
            // n = 5, score = 100
            //   31c9                 | xor                 ecx, ecx
            //   ffc9                 | dec                 ecx
            //   89ca                 | mov                 edx, ecx
            //   31c0                 | xor                 eax, eax
            //   31db                 | xor                 ebx, ebx

        $sequence_5 = { ff15???????? 83f8ff 7405 83f800 7505 e9???????? 018558080000 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   7405                 | je                  7
            //   83f800               | cmp                 eax, 0
            //   7505                 | jne                 7
            //   e9????????           |                     
            //   018558080000         | add                 dword ptr [ebp + 0x858], eax

        $sequence_6 = { 894304 8b5d00 83bb0004000000 750a c783000400000c000000 8b8540050000 }
            // n = 6, score = 100
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   8b5d00               | mov                 ebx, dword ptr [ebp]
            //   83bb0004000000       | cmp                 dword ptr [ebx + 0x400], 0
            //   750a                 | jne                 0xc
            //   c783000400000c000000     | mov    dword ptr [ebx + 0x400], 0xc
            //   8b8540050000         | mov                 eax, dword ptr [ebp + 0x540]

        $sequence_7 = { 50 ff95b0020000 83bd4005000001 7502 eb0c c7854005000000000084 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff95b0020000         | call                dword ptr [ebp + 0x2b0]
            //   83bd4005000001       | cmp                 dword ptr [ebp + 0x540], 1
            //   7502                 | jne                 4
            //   eb0c                 | jmp                 0xe
            //   c7854005000000000084     | mov    dword ptr [ebp + 0x540], 0x84000000

        $sequence_8 = { 8b1d???????? 90 895830 90 }
            // n = 4, score = 100
            //   8b1d????????         |                     
            //   90                   | nop                 
            //   895830               | mov                 dword ptr [eax + 0x30], ebx
            //   90                   | nop                 

        $sequence_9 = { fb 6804000073 0d904883c0 0490 }
            // n = 4, score = 100
            //   fb                   | sti                 
            //   6804000073           | push                0x73000004
            //   0d904883c0           | or                  eax, 0xc0834890
            //   0490                 | add                 al, 0x90

        $sequence_10 = { 895830 90 8b1d???????? 90 895838 90 }
            // n = 6, score = 100
            //   895830               | mov                 dword ptr [eax + 0x30], ebx
            //   90                   | nop                 
            //   8b1d????????         |                     
            //   90                   | nop                 
            //   895838               | mov                 dword ptr [eax + 0x38], ebx
            //   90                   | nop                 

        $sequence_11 = { 68???????? ff15???????? 8d3500304000 89c7 53 }
            // n = 5, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   8d3500304000         | lea                 esi, [0x403000]
            //   89c7                 | mov                 edi, eax
            //   53                   | push                ebx

        $sequence_12 = { 31c1 31da ffcf 75d4 f7d2 }
            // n = 5, score = 100
            //   31c1                 | xor                 ecx, eax
            //   31da                 | xor                 edx, ebx
            //   ffcf                 | dec                 edi
            //   75d4                 | jne                 0xffffffd6
            //   f7d2                 | not                 edx

        $sequence_13 = { eb0c c7854005000000000084 eb0a c78540050000000000ba 6a40 6800300000 6800400100 }
            // n = 7, score = 100
            //   eb0c                 | jmp                 0xe
            //   c7854005000000000084     | mov    dword ptr [ebp + 0x540], 0x84000000
            //   eb0a                 | jmp                 0xc
            //   c78540050000000000ba     | mov    dword ptr [ebp + 0x540], 0xba000000
            //   6a40                 | push                0x40
            //   6800300000           | push                0x3000
            //   6800400100           | push                0x14000

        $sequence_14 = { 48 895838 90 48 89c6 90 }
            // n = 6, score = 100
            //   48                   | dec                 eax
            //   895838               | mov                 dword ptr [eax + 0x38], ebx
            //   90                   | nop                 
            //   48                   | dec                 eax
            //   89c6                 | mov                 esi, eax
            //   90                   | nop                 

        $sequence_15 = { ff33 ff7500 ffb5b8050000 ff15???????? 83f8ff }
            // n = 5, score = 100
            //   ff33                 | push                dword ptr [ebx]
            //   ff7500               | push                dword ptr [ebp]
            //   ffb5b8050000         | push                dword ptr [ebp + 0x5b8]
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1

        $sequence_16 = { 6a01 6a02 ff15???????? 8985b8050000 6832a00000 }
            // n = 5, score = 100
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   8985b8050000         | mov                 dword ptr [ebp + 0x5b8], eax
            //   6832a00000           | push                0xa032

        $sequence_17 = { 8d0dca110000 48 8d15c3110000 49 c7c000010000 }
            // n = 5, score = 100
            //   8d0dca110000         | lea                 ecx, [0x11ca]
            //   48                   | dec                 eax
            //   8d15c3110000         | lea                 edx, [0x11c3]
            //   49                   | dec                 ecx
            //   c7c000010000         | mov                 eax, 0x100

        $sequence_18 = { 6800010000 68???????? 6a00 ff15???????? 6800010000 68???????? 68???????? }
            // n = 7, score = 100
            //   6800010000           | push                0x100
            //   68????????           |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6800010000           | push                0x100
            //   68????????           |                     
            //   68????????           |                     

        $sequence_19 = { 8b5d00 894308 8b85f8070000 8b5d00 894304 }
            // n = 5, score = 100
            //   8b5d00               | mov                 ebx, dword ptr [ebp]
            //   894308               | mov                 dword ptr [ebx + 8], eax
            //   8b85f8070000         | mov                 eax, dword ptr [ebp + 0x7f8]
            //   8b5d00               | mov                 ebx, dword ptr [ebp]
            //   894304               | mov                 dword ptr [ebx + 4], eax

        $sequence_20 = { 90 81fb04030000 730d 90 }
            // n = 4, score = 100
            //   90                   | nop                 
            //   81fb04030000         | cmp                 ebx, 0x304
            //   730d                 | jae                 0xf
            //   90                   | nop                 

        $sequence_21 = { 90 8bbb97114000 90 8938 90 }
            // n = 5, score = 100
            //   90                   | nop                 
            //   8bbb97114000         | mov                 edi, dword ptr [ebx + 0x401197]
            //   90                   | nop                 
            //   8938                 | mov                 dword ptr [eax], edi
            //   90                   | nop                 

    condition:
        7 of them and filesize < 40960
}