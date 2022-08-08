rule win_buer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.buer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buer"
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
        $sequence_0 = { 56 57 60 64a130000000 8b400c }
            // n = 5, score = 1100
            //   56                   | push                esi
            //   57                   | push                edi
            //   60                   | pushal              
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]

        $sequence_1 = { 3bc7 7d0f 8a0c46 880c18 }
            // n = 4, score = 1100
            //   3bc7                 | cmp                 eax, edi
            //   7d0f                 | jge                 0x11
            //   8a0c46               | mov                 cl, byte ptr [esi + eax*2]
            //   880c18               | mov                 byte ptr [eax + ebx], cl

        $sequence_2 = { 85f6 7507 e8???????? eb05 e8???????? 46 }
            // n = 6, score = 1100
            //   85f6                 | test                esi, esi
            //   7507                 | jne                 9
            //   e8????????           |                     
            //   eb05                 | jmp                 7
            //   e8????????           |                     
            //   46                   | inc                 esi

        $sequence_3 = { 3bc2 7cf1 eb02 33c0 }
            // n = 4, score = 1100
            //   3bc2                 | cmp                 eax, edx
            //   7cf1                 | jl                  0xfffffff3
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { 8b45f4 03c1 8bcb 894144 8b45f0 }
            // n = 5, score = 1100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   03c1                 | add                 eax, ecx
            //   8bcb                 | mov                 ecx, ebx
            //   894144               | mov                 dword ptr [ecx + 0x44], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_5 = { 8b734c 8b7b50 8b4340 0345f8 8b5b54 }
            // n = 5, score = 1100
            //   8b734c               | mov                 esi, dword ptr [ebx + 0x4c]
            //   8b7b50               | mov                 edi, dword ptr [ebx + 0x50]
            //   8b4340               | mov                 eax, dword ptr [ebx + 0x40]
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   8b5b54               | mov                 ebx, dword ptr [ebx + 0x54]

        $sequence_6 = { 8945f8 ff15???????? 59 59 85c0 }
            // n = 5, score = 1100
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   ff15????????         |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax

        $sequence_7 = { 894148 8b45dc 03c6 89414c }
            // n = 4, score = 1100
            //   894148               | mov                 dword ptr [ecx + 0x48], eax
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   03c6                 | add                 eax, esi
            //   89414c               | mov                 dword ptr [ecx + 0x4c], eax

        $sequence_8 = { c1e808 8944243c c1e808 8d04e8 }
            // n = 4, score = 300
            //   c1e808               | shr                 eax, 8
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax
            //   c1e808               | shr                 eax, 8
            //   8d04e8               | lea                 eax, [eax + ebp*8]

        $sequence_9 = { c1e808 8944244c c1e808 89442450 }
            // n = 4, score = 300
            //   c1e808               | shr                 eax, 8
            //   8944244c             | mov                 dword ptr [esp + 0x4c], eax
            //   c1e808               | shr                 eax, 8
            //   89442450             | mov                 dword ptr [esp + 0x50], eax

        $sequence_10 = { c68424bc03000031 83fa01 741c 8d4aff }
            // n = 4, score = 300
            //   c68424bc03000031     | mov                 byte ptr [esp + 0x3bc], 0x31
            //   83fa01               | cmp                 edx, 1
            //   741c                 | je                  0x1e
            //   8d4aff               | lea                 ecx, [edx - 1]

        $sequence_11 = { c1e808 89442448 c1e808 81e1ffffff01 c1e105 81e6ffffff01 }
            // n = 6, score = 300
            //   c1e808               | shr                 eax, 8
            //   89442448             | mov                 dword ptr [esp + 0x48], eax
            //   c1e808               | shr                 eax, 8
            //   81e1ffffff01         | and                 ecx, 0x1ffffff
            //   c1e105               | shl                 ecx, 5
            //   81e6ffffff01         | and                 esi, 0x1ffffff

        $sequence_12 = { c1e808 89442444 c1e808 89442448 }
            // n = 4, score = 300
            //   c1e808               | shr                 eax, 8
            //   89442444             | mov                 dword ptr [esp + 0x44], eax
            //   c1e808               | shr                 eax, 8
            //   89442448             | mov                 dword ptr [esp + 0x48], eax

        $sequence_13 = { c1e808 89442450 c1e808 c1e106 03c8 8bc1 }
            // n = 6, score = 300
            //   c1e808               | shr                 eax, 8
            //   89442450             | mov                 dword ptr [esp + 0x50], eax
            //   c1e808               | shr                 eax, 8
            //   c1e106               | shl                 ecx, 6
            //   03c8                 | add                 ecx, eax
            //   8bc1                 | mov                 eax, ecx

        $sequence_14 = { c1fa15 8bce 2bcd 8bc2 8bac248c000000 }
            // n = 5, score = 300
            //   c1fa15               | sar                 edx, 0x15
            //   8bce                 | mov                 ecx, esi
            //   2bcd                 | sub                 ecx, ebp
            //   8bc2                 | mov                 eax, edx
            //   8bac248c000000       | mov                 ebp, dword ptr [esp + 0x8c]

        $sequence_15 = { c1fa15 8bce c1e715 8bc2 2bcf 8b7c246c }
            // n = 6, score = 300
            //   c1fa15               | sar                 edx, 0x15
            //   8bce                 | mov                 ecx, esi
            //   c1e715               | shl                 edi, 0x15
            //   8bc2                 | mov                 eax, edx
            //   2bcf                 | sub                 ecx, edi
            //   8b7c246c             | mov                 edi, dword ptr [esp + 0x6c]

    condition:
        7 of them and filesize < 3031040
}