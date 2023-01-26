rule win_infy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.infy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.infy"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { 5d c20800 55 8bec 8b4508 8b4008 5d }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4008               | mov                 eax, dword ptr [eax + 8]
            //   5d                   | pop                 ebp

        $sequence_1 = { 8bd0 83ea0a 66833a02 740b 8d45fc }
            // n = 5, score = 200
            //   8bd0                 | mov                 edx, eax
            //   83ea0a               | sub                 edx, 0xa
            //   66833a02             | cmp                 word ptr [edx], 2
            //   740b                 | je                  0xd
            //   8d45fc               | lea                 eax, [ebp - 4]

        $sequence_2 = { e8???????? 84c0 7455 6a05 8d55cc 33c0 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7455                 | je                  0x57
            //   6a05                 | push                5
            //   8d55cc               | lea                 edx, [ebp - 0x34]
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 59 833b00 75f3 bb01000000 68???????? }
            // n = 5, score = 200
            //   59                   | pop                 ecx
            //   833b00               | cmp                 dword ptr [ebx], 0
            //   75f3                 | jne                 0xfffffff5
            //   bb01000000           | mov                 ebx, 1
            //   68????????           |                     

        $sequence_4 = { 837dec00 740b 8b45f0 8b55f8 }
            // n = 4, score = 200
            //   837dec00             | cmp                 dword ptr [ebp - 0x14], 0
            //   740b                 | je                  0xd
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_5 = { 7202 89cf 29fe 293d???????? 8935???????? eb21 0fb7431a }
            // n = 7, score = 200
            //   7202                 | jb                  4
            //   89cf                 | mov                 edi, ecx
            //   29fe                 | sub                 esi, edi
            //   293d????????         |                     
            //   8935????????         |                     
            //   eb21                 | jmp                 0x23
            //   0fb7431a             | movzx               eax, word ptr [ebx + 0x1a]

        $sequence_6 = { 7226 8b35???????? 0fb74b1a 8d91300b0000 39d7 }
            // n = 5, score = 200
            //   7226                 | jb                  0x28
            //   8b35????????         |                     
            //   0fb74b1a             | movzx               ecx, word ptr [ebx + 0x1a]
            //   8d91300b0000         | lea                 edx, [ecx + 0xb30]
            //   39d7                 | cmp                 edi, edx

        $sequence_7 = { 85f6 7d04 33ff eb0a 8bf8 2bfb }
            // n = 6, score = 200
            //   85f6                 | test                esi, esi
            //   7d04                 | jge                 6
            //   33ff                 | xor                 edi, edi
            //   eb0a                 | jmp                 0xc
            //   8bf8                 | mov                 edi, eax
            //   2bfb                 | sub                 edi, ebx

        $sequence_8 = { 7409 8b13 8bc3 e8???????? 85c0 7405 }
            // n = 6, score = 200
            //   7409                 | je                  0xb
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7

        $sequence_9 = { 01c2 89c8 83c830 8807 89d0 83f901 }
            // n = 6, score = 200
            //   01c2                 | add                 edx, eax
            //   89c8                 | mov                 eax, ecx
            //   83c830               | or                  eax, 0x30
            //   8807                 | mov                 byte ptr [edi], al
            //   89d0                 | mov                 eax, edx
            //   83f901               | cmp                 ecx, 1

    condition:
        7 of them and filesize < 147456
}