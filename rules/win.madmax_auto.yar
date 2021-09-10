rule win_madmax_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.madmax."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.madmax"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { d98317df7d35 781e f1 44 55 f8 03e5 }
            // n = 7, score = 100
            //   d98317df7d35         | fld                 dword ptr [ebx + 0x357ddf17]
            //   781e                 | js                  0x20
            //   f1                   | int1                
            //   44                   | inc                 esp
            //   55                   | push                ebp
            //   f8                   | clc                 
            //   03e5                 | add                 esp, ebp

        $sequence_1 = { ff15???????? 8bf8 85ff 7577 c74308070000e0 9c f605????????f6 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   7577                 | jne                 0x79
            //   c74308070000e0       | mov                 dword ptr [ebx + 8], 0xe0000007
            //   9c                   | pushfd              
            //   f605????????f6       |                     

        $sequence_2 = { cd6d 51 9d 894708 8b858cfeffff 894710 33c0 }
            // n = 7, score = 100
            //   cd6d                 | int                 0x6d
            //   51                   | push                ecx
            //   9d                   | popfd               
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   8b858cfeffff         | mov                 eax, dword ptr [ebp - 0x174]
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { a4 d4d8 f33543ae5908 091e 5e 8922 78c9 }
            // n = 7, score = 100
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   d4d8                 | aam                 0xd8
            //   f33543ae5908         | xor                 eax, 0x859ae43
            //   091e                 | or                  dword ptr [esi], ebx
            //   5e                   | pop                 esi
            //   8922                 | mov                 dword ptr [edx], esp
            //   78c9                 | js                  0xffffffcb

        $sequence_4 = { b198 9d 8b450c 56 8b7508 c60000 8b06 }
            // n = 7, score = 100
            //   b198                 | mov                 cl, 0x98
            //   9d                   | popfd               
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   c60000               | mov                 byte ptr [eax], 0
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_5 = { a8ba 36f2e5ea 51 96 109dd6c1c80a f3b166 22ff }
            // n = 7, score = 100
            //   a8ba                 | test                al, 0xba
            //   36f2e5ea             | in                  eax, 0xea
            //   51                   | push                ecx
            //   96                   | xchg                eax, esi
            //   109dd6c1c80a         | adc                 byte ptr [ebp + 0xac8c1d6], bl
            //   f3b166               | mov                 cl, 0x66
            //   22ff                 | and                 bh, bh

        $sequence_6 = { 9e 46 4d 6a47 13ba25e1e6e0 e558 09dc }
            // n = 7, score = 100
            //   9e                   | sahf                
            //   46                   | inc                 esi
            //   4d                   | dec                 ebp
            //   6a47                 | push                0x47
            //   13ba25e1e6e0         | adc                 edi, dword ptr [edx - 0x1f191edb]
            //   e558                 | in                  eax, 0x58
            //   09dc                 | or                  esp, ebx

        $sequence_7 = { f605????????e4 0f85ba000000 085be0 58 29d0 a5 a5 }
            // n = 7, score = 100
            //   f605????????e4       |                     
            //   0f85ba000000         | jne                 0xc0
            //   085be0               | or                  byte ptr [ebx - 0x20], bl
            //   58                   | pop                 eax
            //   29d0                 | sub                 eax, edx
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_8 = { 9f 2dd53b5230 e641 73cc 6ba83c8c426915 49 91 }
            // n = 7, score = 100
            //   9f                   | lahf                
            //   2dd53b5230           | sub                 eax, 0x30523bd5
            //   e641                 | out                 0x41, al
            //   73cc                 | jae                 0xffffffce
            //   6ba83c8c426915       | imul                ebp, dword ptr [eax + 0x69428c3c], 0x15
            //   49                   | dec                 ecx
            //   91                   | xchg                eax, ecx

        $sequence_9 = { cda5 ae 0464 5b 9d ff7508 e8???????? }
            // n = 7, score = 100
            //   cda5                 | int                 0xa5
            //   ae                   | scasb               al, byte ptr es:[edi]
            //   0464                 | add                 al, 0x64
            //   5b                   | pop                 ebx
            //   9d                   | popfd               
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 3227648
}