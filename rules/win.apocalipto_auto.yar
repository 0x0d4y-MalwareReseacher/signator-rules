rule win_apocalipto_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.apocalipto."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.apocalipto"
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
        $sequence_0 = { 89d6 8d7c0308 8d3c39 034604 8d1418 8d1411 }
            // n = 6, score = 100
            //   89d6                 | mov                 esi, edx
            //   8d7c0308             | lea                 edi, [ebx + eax + 8]
            //   8d3c39               | lea                 edi, [ecx + edi]
            //   034604               | add                 eax, dword ptr [esi + 4]
            //   8d1418               | lea                 edx, [eax + ebx]
            //   8d1411               | lea                 edx, [ecx + edx]

        $sequence_1 = { c7442404???????? 891c24 ff15???????? 83ec08 a3???????? 85c0 0f84ad070000 }
            // n = 7, score = 100
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84ad070000         | je                  0x7b3

        $sequence_2 = { a3???????? 85c0 0f84b5090000 c7442404???????? }
            // n = 4, score = 100
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84b5090000         | je                  0x9bb
            //   c7442404????????     |                     

        $sequence_3 = { 85c0 0f84140b0000 c7442404???????? 891c24 ff15???????? 83ec08 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   0f84140b0000         | je                  0xb1a
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8

        $sequence_4 = { 43 89d1 85d2 75d7 89d8 8b4d08 85c9 }
            // n = 7, score = 100
            //   43                   | inc                 ebx
            //   89d1                 | mov                 ecx, edx
            //   85d2                 | test                edx, edx
            //   75d7                 | jne                 0xffffffd9
            //   89d8                 | mov                 eax, ebx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   85c9                 | test                ecx, ecx

        $sequence_5 = { ff15???????? 83ec08 a3???????? 85c0 0f843f010000 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f843f010000         | je                  0x145

        $sequence_6 = { 8b4214 01d8 89442404 8b420c 01f0 890424 8955dc }
            // n = 7, score = 100
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   01d8                 | add                 eax, ebx
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   8b420c               | mov                 eax, dword ptr [edx + 0xc]
            //   01f0                 | add                 eax, esi
            //   890424               | mov                 dword ptr [esp], eax
            //   8955dc               | mov                 dword ptr [ebp - 0x24], edx

        $sequence_7 = { 31c9 ebc7 31d2 ebaf }
            // n = 4, score = 100
            //   31c9                 | xor                 ecx, ecx
            //   ebc7                 | jmp                 0xffffffc9
            //   31d2                 | xor                 edx, edx
            //   ebaf                 | jmp                 0xffffffb1

        $sequence_8 = { 43 8a0b 84c9 75f6 c60200 5b }
            // n = 6, score = 100
            //   43                   | inc                 ebx
            //   8a0b                 | mov                 cl, byte ptr [ebx]
            //   84c9                 | test                cl, cl
            //   75f6                 | jne                 0xfffffff8
            //   c60200               | mov                 byte ptr [edx], 0
            //   5b                   | pop                 ebx

        $sequence_9 = { 890424 ff15???????? 83ec1c 85c0 0f84d8000000 }
            // n = 5, score = 100
            //   890424               | mov                 dword ptr [esp], eax
            //   ff15????????         |                     
            //   83ec1c               | sub                 esp, 0x1c
            //   85c0                 | test                eax, eax
            //   0f84d8000000         | je                  0xde

    condition:
        7 of them and filesize < 212992
}