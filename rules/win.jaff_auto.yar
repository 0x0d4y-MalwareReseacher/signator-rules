rule win_jaff_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects win.jaff."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jaff"
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
        $sequence_0 = { 895df4 0fbff0 2b45f4 0fbff9 }
            // n = 4, score = 600
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   0fbff0               | movsx               esi, ax
            //   2b45f4               | sub                 eax, dword ptr [ebp - 0xc]
            //   0fbff9               | movsx               edi, cx

        $sequence_1 = { 8b5508 8a420c 84c0 750c 8b4d10 38410c }
            // n = 6, score = 600
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8a420c               | mov                 al, byte ptr [edx + 0xc]
            //   84c0                 | test                al, al
            //   750c                 | jne                 0xe
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   38410c               | cmp                 byte ptr [ecx + 0xc], al

        $sequence_2 = { 668b1442 8b1e 66891419 ff4604 83c102 }
            // n = 5, score = 600
            //   668b1442             | mov                 dx, word ptr [edx + eax*2]
            //   8b1e                 | mov                 ebx, dword ptr [esi]
            //   66891419             | mov                 word ptr [ecx + ebx], dx
            //   ff4604               | inc                 dword ptr [esi + 4]
            //   83c102               | add                 ecx, 2

        $sequence_3 = { 66833c4200 7508 3bce 7506 }
            // n = 4, score = 600
            //   66833c4200           | cmp                 word ptr [edx + eax*2], 0
            //   7508                 | jne                 0xa
            //   3bce                 | cmp                 ecx, esi
            //   7506                 | jne                 8

        $sequence_4 = { 50 ffd6 8b5580 52 6a00 ffd3 50 }
            // n = 7, score = 600
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b5580               | mov                 edx, dword ptr [ebp - 0x80]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   ffd3                 | call                ebx
            //   50                   | push                eax

        $sequence_5 = { 50 56 ffd7 6a02 6a00 6a00 }
            // n = 6, score = 600
            //   50                   | push                eax
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_6 = { ffd3 6a14 6a08 8906 c745f000000000 c745f40a000000 c645f801 }
            // n = 7, score = 600
            //   ffd3                 | call                ebx
            //   6a14                 | push                0x14
            //   6a08                 | push                8
            //   8906                 | mov                 dword ptr [esi], eax
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   c745f40a000000       | mov                 dword ptr [ebp - 0xc], 0xa
            //   c645f801             | mov                 byte ptr [ebp - 8], 1

        $sequence_7 = { eb06 41 894df0 8bc1 }
            // n = 4, score = 600
            //   eb06                 | jmp                 8
            //   41                   | inc                 ecx
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   8bc1                 | mov                 eax, ecx

        $sequence_8 = { 85f6 7419 33c0 0fb7d0 8bc2 c1e210 0bc2 }
            // n = 7, score = 600
            //   85f6                 | test                esi, esi
            //   7419                 | je                  0x1b
            //   33c0                 | xor                 eax, eax
            //   0fb7d0               | movzx               edx, ax
            //   8bc2                 | mov                 eax, edx
            //   c1e210               | shl                 edx, 0x10
            //   0bc2                 | or                  eax, edx

        $sequence_9 = { 8b4508 8b7804 8d043f 50 6a08 c745c800000000 }
            // n = 6, score = 600
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b7804               | mov                 edi, dword ptr [eax + 4]
            //   8d043f               | lea                 eax, dword ptr [edi + edi]
            //   50                   | push                eax
            //   6a08                 | push                8
            //   c745c800000000       | mov                 dword ptr [ebp - 0x38], 0

    condition:
        7 of them and filesize < 106496
}