rule win_xagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.xagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xagent"
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
        $sequence_0 = { c1ea02 6bd20d b801000000 2bc2 }
            // n = 4, score = 3100
            //   c1ea02               | shr                 edx, 2
            //   6bd20d               | imul                edx, edx, 0xd
            //   b801000000           | mov                 eax, 1
            //   2bc2                 | sub                 eax, edx

        $sequence_1 = { ff15???????? 8bd8 e8???????? 03d8 }
            // n = 4, score = 3100
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   03d8                 | add                 ebx, eax

        $sequence_2 = { c20400 8d4de4 e8???????? b8???????? }
            // n = 4, score = 2600
            //   c20400               | ret                 4
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   e8????????           |                     
            //   b8????????           |                     

        $sequence_3 = { 49 894e10 7507 c7460c00000000 5f 5e }
            // n = 6, score = 2600
            //   49                   | dec                 ecx
            //   894e10               | mov                 dword ptr [esi + 0x10], ecx
            //   7507                 | jne                 9
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_4 = { e8???????? 8b4604 85c0 7407 8b4d08 }
            // n = 5, score = 2600
            //   e8????????           |                     
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_5 = { 3b7e0c 7707 c7460c00000000 49 894e10 }
            // n = 5, score = 2600
            //   3b7e0c               | cmp                 edi, dword ptr [esi + 0xc]
            //   7707                 | ja                  9
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   49                   | dec                 ecx
            //   894e10               | mov                 dword ptr [esi + 0x10], ecx

        $sequence_6 = { 8b7a08 c1e802 83e103 3bf8 7702 2bc7 }
            // n = 6, score = 2600
            //   8b7a08               | mov                 edi, dword ptr [edx + 8]
            //   c1e802               | shr                 eax, 2
            //   83e103               | and                 ecx, 3
            //   3bf8                 | cmp                 edi, eax
            //   7702                 | ja                  4
            //   2bc7                 | sub                 eax, edi

        $sequence_7 = { 33d2 eb02 8b11 8b4808 8bc1 57 }
            // n = 6, score = 2600
            //   33d2                 | xor                 edx, edx
            //   eb02                 | jmp                 4
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]
            //   8bc1                 | mov                 eax, ecx
            //   57                   | push                edi

        $sequence_8 = { 7702 2bc7 8b5204 8b0482 8b0488 }
            // n = 5, score = 2600
            //   7702                 | ja                  4
            //   2bc7                 | sub                 eax, edi
            //   8b5204               | mov                 edx, dword ptr [edx + 4]
            //   8b0482               | mov                 eax, dword ptr [edx + eax*4]
            //   8b0488               | mov                 eax, dword ptr [eax + ecx*4]

        $sequence_9 = { 7423 8b7e08 ff460c 03ff 03ff }
            // n = 5, score = 2600
            //   7423                 | je                  0x25
            //   8b7e08               | mov                 edi, dword ptr [esi + 8]
            //   ff460c               | inc                 dword ptr [esi + 0xc]
            //   03ff                 | add                 edi, edi
            //   03ff                 | add                 edi, edi

        $sequence_10 = { e8???????? 488d542458 488bcb e8???????? 90 }
            // n = 5, score = 1500
            //   e8????????           |                     
            //   488d542458           | mov                 ebx, eax
            //   488bcb               | lea                 ecx, [eax + ebx]
            //   e8????????           |                     
            //   90                   | je                  0xe

        $sequence_11 = { 4053 4883ec20 488b5910 4885db 7415 488b0b }
            // n = 6, score = 1500
            //   4053                 | jne                 0xfffffffa
            //   4883ec20             | dec                 eax
            //   488b5910             | sub                 eax, ebx
            //   4885db               | dec                 eax
            //   7415                 | lea                 ecx, [eax + ebx]
            //   488b0b               | dec                 ecx

        $sequence_12 = { e8???????? 488b4328 4c8bcf 4c8bc6 }
            // n = 4, score = 1500
            //   e8????????           |                     
            //   488b4328             | dec                 eax
            //   4c8bcf               | mov                 dword ptr [edi], ecx
            //   4c8bc6               | dec                 eax

        $sequence_13 = { e8???????? 48833b00 740a 488b4308 }
            // n = 4, score = 1500
            //   e8????????           |                     
            //   48833b00             | je                  0xe
            //   740a                 | dec                 eax
            //   488b4308             | mov                 eax, dword ptr [edi]

        $sequence_14 = { e8???????? 90 0fb705???????? 6689442420 }
            // n = 4, score = 1500
            //   e8????????           |                     
            //   90                   | je                  0xe
            //   0fb705????????       |                     
            //   6689442420           | dec                 eax

        $sequence_15 = { 740c 488b07 488b0b 488903 }
            // n = 4, score = 1500
            //   740c                 | dec                 eax
            //   488b07               | mov                 dword ptr [edi], ecx
            //   488b0b               | dec                 eax
            //   488903               | mov                 ebx, dword ptr [esp + 0x30]

        $sequence_16 = { 48896c2410 4889742418 57 4883ec30 4883792800 498bf9 498bf0 }
            // n = 7, score = 1500
            //   48896c2410           | dec                 eax
            //   4889742418           | mov                 ecx, ebx
            //   57                   | test                eax, eax
            //   4883ec30             | shr                 edx, 7
            //   4883792800           | imul                edx, edx, 0x95
            //   498bf9               | sub                 ecx, edx
            //   498bf0               | mov                 edx, ecx

        $sequence_17 = { 84c0 740c 488b07 4c8b13 488903 }
            // n = 5, score = 1500
            //   84c0                 | test                al, al
            //   740c                 | je                  0xe
            //   488b07               | dec                 eax
            //   4c8b13               | mov                 eax, dword ptr [edi]
            //   488903               | dec                 esp

        $sequence_18 = { b803b57ea5 f7e6 c1ea06 6bd263 }
            // n = 4, score = 500
            //   b803b57ea5           | xor                 al, al
            //   f7e6                 | cmp                 al, 1
            //   c1ea06               | jne                 6
            //   6bd263               | mov                 al, 1

        $sequence_19 = { ff15???????? baf4010000 488bcb ff15???????? 85c0 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   baf4010000           | jmp                 6
            //   488bcb               | xor                 al, al
            //   ff15????????         |                     
            //   85c0                 | cmp                 al, 1

        $sequence_20 = { c1ea07 69d295000000 2bca 8bd1 }
            // n = 4, score = 400
            //   c1ea07               | cmp                 al, 1
            //   69d295000000         | mov                 al, 1
            //   2bca                 | jmp                 4
            //   8bd1                 | xor                 al, al

        $sequence_21 = { 75f8 482bc3 488d0c18 e8???????? 4c8bdb 4885db }
            // n = 6, score = 200
            //   75f8                 | mov                 edx, 0x1f4
            //   482bc3               | dec                 eax
            //   488d0c18             | mov                 ecx, ebx
            //   e8????????           |                     
            //   4c8bdb               | test                eax, eax
            //   4885db               | shr                 edx, 7

        $sequence_22 = { 75f8 482bc3 498bd4 488d0c18 }
            // n = 4, score = 200
            //   75f8                 | mov                 edx, ebp
            //   482bc3               | jne                 0xfffffffa
            //   498bd4               | dec                 eax
            //   488d0c18             | sub                 eax, ebx

        $sequence_23 = { 75f8 482bc3 488d0c18 498bd6 e8???????? 498b5520 }
            // n = 6, score = 200
            //   75f8                 | cmp                 al, 1
            //   482bc3               | mov                 al, 1
            //   488d0c18             | jmp                 4
            //   498bd6               | xor                 al, al
            //   e8????????           |                     
            //   498b5520             | cmp                 al, 1

        $sequence_24 = { 75f8 482bc3 488d0c18 498bd5 e8???????? 4d8b1e }
            // n = 6, score = 200
            //   75f8                 | cmp                 al, 1
            //   482bc3               | jne                 6
            //   488d0c18             | mov                 al, 1
            //   498bd5               | jmp                 6
            //   e8????????           |                     
            //   4d8b1e               | xor                 al, al

        $sequence_25 = { 75f8 482bc3 488d0c18 498bd4 e8???????? 4d8bc5 }
            // n = 6, score = 200
            //   75f8                 | cmp                 al, 1
            //   482bc3               | jne                 6
            //   488d0c18             | mov                 al, 1
            //   498bd4               | jmp                 6
            //   e8????????           |                     
            //   4d8bc5               | xor                 al, al

    condition:
        7 of them and filesize < 729088
}