rule win_ahtapot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.ahtapot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ahtapot"
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
        $sequence_0 = { ffd6 6a44 8d8d44f5ffff 53 51 e8???????? }
            // n = 6, score = 100
            //   ffd6                 | call                esi
            //   6a44                 | push                0x44
            //   8d8d44f5ffff         | lea                 ecx, [ebp - 0xabc]
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_1 = { 51 68???????? e8???????? 83c404 50 68???????? 8d95c8f3ffff }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   50                   | push                eax
            //   68????????           |                     
            //   8d95c8f3ffff         | lea                 edx, [ebp - 0xc38]

        $sequence_2 = { 6a00 6a00 8d85e0f2ffff 50 6a00 ff15???????? 8b8dcceeffff }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d85e0f2ffff         | lea                 eax, [ebp - 0xd20]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8b8dcceeffff         | mov                 ecx, dword ptr [ebp - 0x1134]

        $sequence_3 = { 741e 6683f80d 74d8 668907 83c702 33c9 66890f }
            // n = 7, score = 100
            //   741e                 | je                  0x20
            //   6683f80d             | cmp                 ax, 0xd
            //   74d8                 | je                  0xffffffda
            //   668907               | mov                 word ptr [edi], ax
            //   83c702               | add                 edi, 2
            //   33c9                 | xor                 ecx, ecx
            //   66890f               | mov                 word ptr [edi], cx

        $sequence_4 = { 33c9 83f823 741a 8d93fc100000 8d4900 46 668902 }
            // n = 7, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   83f823               | cmp                 eax, 0x23
            //   741a                 | je                  0x1c
            //   8d93fc100000         | lea                 edx, [ebx + 0x10fc]
            //   8d4900               | lea                 ecx, [ecx]
            //   46                   | inc                 esi
            //   668902               | mov                 word ptr [edx], ax

        $sequence_5 = { 8985f0ebffff 52 8d85f0ebffff 50 898df4ebffff }
            // n = 5, score = 100
            //   8985f0ebffff         | mov                 dword ptr [ebp - 0x1410], eax
            //   52                   | push                edx
            //   8d85f0ebffff         | lea                 eax, [ebp - 0x1410]
            //   50                   | push                eax
            //   898df4ebffff         | mov                 dword ptr [ebp - 0x140c], ecx

        $sequence_6 = { 83c414 8d95c0edffff 52 ffd7 6a00 6a00 }
            // n = 6, score = 100
            //   83c414               | add                 esp, 0x14
            //   8d95c0edffff         | lea                 edx, [ebp - 0x1240]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { 8d8528ecffff 8bff 668b10 663b11 751e 6685d2 7415 }
            // n = 7, score = 100
            //   8d8528ecffff         | lea                 eax, [ebp - 0x13d8]
            //   8bff                 | mov                 edi, edi
            //   668b10               | mov                 dx, word ptr [eax]
            //   663b11               | cmp                 dx, word ptr [ecx]
            //   751e                 | jne                 0x20
            //   6685d2               | test                dx, dx
            //   7415                 | je                  0x17

        $sequence_8 = { 399db0cbffff 7526 8b8584cbffff 83c804 83e017 }
            // n = 5, score = 100
            //   399db0cbffff         | cmp                 dword ptr [ebp - 0x3450], ebx
            //   7526                 | jne                 0x28
            //   8b8584cbffff         | mov                 eax, dword ptr [ebp - 0x347c]
            //   83c804               | or                  eax, 4
            //   83e017               | and                 eax, 0x17

        $sequence_9 = { 8bec 6aff 68???????? 64a100000000 50 81ecb00a0000 a1???????? }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   6aff                 | push                -1
            //   68????????           |                     
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax
            //   81ecb00a0000         | sub                 esp, 0xab0
            //   a1????????           |                     

    condition:
        7 of them and filesize < 430080
}