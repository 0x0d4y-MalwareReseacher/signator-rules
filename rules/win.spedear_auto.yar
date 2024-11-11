rule win_spedear_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.spedear."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spedear"
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
        $sequence_0 = { 99 83e207 03c2 c1f803 83c40c }
            // n = 5, score = 600
            //   99                   | cdq                 
            //   83e207               | and                 edx, 7
            //   03c2                 | add                 eax, edx
            //   c1f803               | sar                 eax, 3
            //   83c40c               | add                 esp, 0xc

        $sequence_1 = { 8a5f06 50 894608 e8???????? }
            // n = 4, score = 500
            //   8a5f06               | mov                 bl, byte ptr [edi + 6]
            //   50                   | push                eax
            //   894608               | mov                 dword ptr [esi + 8], eax
            //   e8????????           |                     

        $sequence_2 = { 53 50 e8???????? 8b7e0c 895e10 }
            // n = 5, score = 500
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b7e0c               | mov                 edi, dword ptr [esi + 0xc]
            //   895e10               | mov                 dword ptr [esi + 0x10], ebx

        $sequence_3 = { 894618 ffd7 89461c 5f }
            // n = 4, score = 400
            //   894618               | mov                 dword ptr [esi + 0x18], eax
            //   ffd7                 | call                edi
            //   89461c               | mov                 dword ptr [esi + 0x1c], eax
            //   5f                   | pop                 edi

        $sequence_4 = { 5d 5b 5e 32c0 5f 8b4c2428 }
            // n = 6, score = 400
            //   5d                   | mov                 dword ptr [esi + 8], eax
            //   5b                   | mov                 eax, dword ptr [edi + 0x18]
            //   5e                   | mov                 bl, byte ptr [edi + 6]
            //   32c0                 | push                eax
            //   5f                   | mov                 dword ptr [esi + 8], eax
            //   8b4c2428             | push                eax

        $sequence_5 = { 6a00 68???????? e8???????? 83c40c 68d0070000 }
            // n = 5, score = 400
            //   6a00                 | push                0
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68d0070000           | push                0x7d0

        $sequence_6 = { 33c0 396f1c 0f8687000000 8b4e04 }
            // n = 4, score = 400
            //   33c0                 | add                 eax, edx
            //   396f1c               | sar                 eax, 3
            //   0f8687000000         | add                 esp, 0xc
            //   8b4e04               | test                eax, eax

        $sequence_7 = { 8b0c39 33ca 890f 83c704 836c241801 }
            // n = 5, score = 400
            //   8b0c39               | mov                 edi, dword ptr [esi + 0xc]
            //   33ca                 | mov                 dword ptr [esi + 0x10], ebx
            //   890f                 | mov                 eax, dword ptr [edi + 0x18]
            //   83c704               | mov                 bl, byte ptr [edi + 6]
            //   836c241801           | push                eax

        $sequence_8 = { 33ce 836c241001 8b742414 75af 8b4204 33c1 8b0a }
            // n = 7, score = 400
            //   33ce                 | test                eax, eax
            //   836c241001           | and                 edx, 7
            //   8b742414             | add                 eax, edx
            //   75af                 | sar                 eax, 3
            //   8b4204               | add                 esp, 0xc
            //   33c1                 | cdq                 
            //   8b0a                 | and                 edx, 7

        $sequence_9 = { 7314 57 e8???????? 83c404 5f 896e10 5d }
            // n = 7, score = 400
            //   7314                 | and                 edx, 7
            //   57                   | add                 eax, edx
            //   e8????????           |                     
            //   83c404               | sar                 eax, 3
            //   5f                   | add                 esp, 0xc
            //   896e10               | push                ebx
            //   5d                   | push                eax

        $sequence_10 = { 833e00 741a 6a00 6a00 ff7608 }
            // n = 5, score = 300
            //   833e00               | cmp                 dword ptr [esi], 0
            //   741a                 | je                  0x1c
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff7608               | push                dword ptr [esi + 8]

        $sequence_11 = { ff7608 ff5604 6800800000 6a00 ff7608 ff15???????? }
            // n = 6, score = 300
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff5604               | call                dword ptr [esi + 4]
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff15????????         |                     

        $sequence_12 = { 394878 7456 39487c 7451 }
            // n = 4, score = 300
            //   394878               | cmp                 dword ptr [eax + 0x78], ecx
            //   7456                 | je                  0x58
            //   39487c               | cmp                 dword ptr [eax + 0x7c], ecx
            //   7451                 | je                  0x53

        $sequence_13 = { 8bc7 5e 5f 5b 5d c3 6a08 }
            // n = 7, score = 300
            //   8bc7                 | mov                 eax, edi
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a08                 | push                8

        $sequence_14 = { 50 c685ecfeffff00 e8???????? 83c40c 8d8dccfeffff e8???????? }
            // n = 6, score = 200
            //   50                   | push                eax
            //   c685ecfeffff00       | mov                 byte ptr [ebp - 0x114], 0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d8dccfeffff         | lea                 ecx, [ebp - 0x134]
            //   e8????????           |                     

        $sequence_15 = { 4d63c0 498bd1 488bcb e8???????? }
            // n = 4, score = 100
            //   4d63c0               | test                eax, eax
            //   498bd1               | je                  0x11
            //   488bcb               | mov                 dword ptr [esp + 0x30], 0x104
            //   e8????????           |                     

        $sequence_16 = { 4154 4883ec20 4c8d2508910000 33f6 33ff 498bdc 837b0801 }
            // n = 7, score = 100
            //   4154                 | dec                 eax
            //   4883ec20             | mov                 edi, ecx
            //   4c8d2508910000       | dec                 eax
            //   33f6                 | mov                 dword ptr [ecx], eax
            //   33ff                 | inc                 ecx
            //   498bdc               | push                esp
            //   837b0801             | dec                 eax

        $sequence_17 = { 4883ec20 488d05cf8b0000 8bda 488bf9 488901 }
            // n = 5, score = 100
            //   4883ec20             | dec                 eax
            //   488d05cf8b0000       | sub                 esp, 0x20
            //   8bda                 | dec                 eax
            //   488bf9               | lea                 eax, [0x8bcf]
            //   488901               | mov                 ebx, edx

        $sequence_18 = { 40 5d c3 e8???????? e8???????? 6a00 ff15???????? }
            // n = 7, score = 100
            //   40                   | je                  0x1c
            //   5d                   | push                0
            //   c3                   | push                0
            //   e8????????           |                     
            //   e8????????           |                     
            //   6a00                 | push                dword ptr [esi + 8]
            //   ff15????????         |                     

        $sequence_19 = { 759f 418b4344 458b5340 4883c302 }
            // n = 4, score = 100
            //   759f                 | sub                 esp, 0x20
            //   418b4344             | dec                 esp
            //   458b5340             | lea                 esp, [0x9108]
            //   4883c302             | xor                 esi, esi

        $sequence_20 = { 68???????? 6a02 6a65 ff15???????? 50 8bcb e8???????? }
            // n = 7, score = 100
            //   68????????           |                     
            //   6a02                 | call                dword ptr [esi + 4]
            //   6a65                 | push                0x8000
            //   ff15????????         |                     
            //   50                   | push                0
            //   8bcb                 | push                dword ptr [esi + 8]
            //   e8????????           |                     

        $sequence_21 = { c744243004010000 e8???????? 488b4c2438 4c8d5c2430 488d842450010000 488d15f0bd0000 4c895c2428 }
            // n = 7, score = 100
            //   c744243004010000     | jne                 0xffffffa1
            //   e8????????           |                     
            //   488b4c2438           | inc                 ecx
            //   4c8d5c2430           | mov                 eax, dword ptr [ebx + 0x44]
            //   488d842450010000     | inc                 ebp
            //   488d15f0bd0000       | mov                 edx, dword ptr [ebx + 0x40]
            //   4c895c2428           | dec                 eax

        $sequence_22 = { ffd7 8bf0 3bf3 7f14 8b75dc 68???????? e8???????? }
            // n = 7, score = 100
            //   ffd7                 | call                dword ptr [esi + 4]
            //   8bf0                 | push                0x8000
            //   3bf3                 | cmp                 dword ptr [esi], 0
            //   7f14                 | je                  0x1c
            //   8b75dc               | push                0
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_23 = { 488d05cd980000 c3 4053 4883ec20 }
            // n = 4, score = 100
            //   488d05cd980000       | dec                 eax
            //   c3                   | mov                 ecx, dword ptr [esp + 0x38]
            //   4053                 | dec                 esp
            //   4883ec20             | lea                 ebx, [esp + 0x30]

        $sequence_24 = { 8bb5c4fbffff 6bc009 0fb6843030e92300 6a08 }
            // n = 4, score = 100
            //   8bb5c4fbffff         | push                0x8000
            //   6bc009               | push                0
            //   0fb6843030e92300     | push                dword ptr [esi + 8]
            //   6a08                 | cmp                 dword ptr [esi], 0

        $sequence_25 = { 7416 488d0d2d120100 e8???????? 85c0 7406 }
            // n = 5, score = 100
            //   7416                 | xor                 edi, edi
            //   488d0d2d120100       | dec                 ecx
            //   e8????????           |                     
            //   85c0                 | mov                 ebx, esp
            //   7406                 | cmp                 dword ptr [ebx + 8], 1

        $sequence_26 = { e8???????? 488be8 4885c0 740d 488d0541be0000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   488be8               | add                 ebx, 2
            //   4885c0               | je                  0x18
            //   740d                 | dec                 eax
            //   488d0541be0000       | lea                 ecx, [0x1122d]

    condition:
        7 of them and filesize < 188416
}