rule win_sysget_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.sysget."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sysget"
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
        $sequence_0 = { 3acb 75ee 8d9506feffff 2bd0 8a08 }
            // n = 5, score = 400
            //   3acb                 | cmp                 cl, bl
            //   75ee                 | jne                 0xfffffff0
            //   8d9506feffff         | lea                 edx, [ebp - 0x1fa]
            //   2bd0                 | sub                 edx, eax
            //   8a08                 | mov                 cl, byte ptr [eax]

        $sequence_1 = { 50 66a5 e8???????? 83c428 6800800000 53 ffb5c4f9ffff }
            // n = 7, score = 400
            //   50                   | push                eax
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28
            //   6800800000           | push                0x8000
            //   53                   | push                ebx
            //   ffb5c4f9ffff         | push                dword ptr [ebp - 0x63c]

        $sequence_2 = { f3a5 8bc8 33c0 6806020000 50 }
            // n = 5, score = 400
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   33c0                 | xor                 eax, eax
            //   6806020000           | push                0x206
            //   50                   | push                eax

        $sequence_3 = { ff15???????? a3???????? 57 6a11 }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   a3????????           |                     
            //   57                   | push                edi
            //   6a11                 | push                0x11

        $sequence_4 = { 8a11 88140f 41 84d2 75f6 8d7801 56 }
            // n = 7, score = 400
            //   8a11                 | mov                 dl, byte ptr [ecx]
            //   88140f               | mov                 byte ptr [edi + ecx], dl
            //   41                   | inc                 ecx
            //   84d2                 | test                dl, dl
            //   75f6                 | jne                 0xfffffff8
            //   8d7801               | lea                 edi, [eax + 1]
            //   56                   | push                esi

        $sequence_5 = { ff750c 53 53 53 53 50 ff15???????? }
            // n = 7, score = 400
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_6 = { 6aff 57 53 53 ffd6 682b010000 8d85d5fdffff }
            // n = 7, score = 400
            //   6aff                 | push                -1
            //   57                   | push                edi
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   682b010000           | push                0x12b
            //   8d85d5fdffff         | lea                 eax, [ebp - 0x22b]

        $sequence_7 = { 33c0 668907 83c706 56 57 e8???????? 33c9 }
            // n = 7, score = 400
            //   33c0                 | xor                 eax, eax
            //   668907               | mov                 word ptr [edi], ax
            //   83c706               | add                 edi, 6
            //   56                   | push                esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx

        $sequence_8 = { 8d45e4 50 895de4 895ddc 895de0 }
            // n = 5, score = 400
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   50                   | push                eax
            //   895de4               | mov                 dword ptr [ebp - 0x1c], ebx
            //   895ddc               | mov                 dword ptr [ebp - 0x24], ebx
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx

        $sequence_9 = { e8???????? 59 59 3bc7 0f84ae000000 be???????? 56 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   3bc7                 | cmp                 eax, edi
            //   0f84ae000000         | je                  0xb4
            //   be????????           |                     
            //   56                   | push                esi

    condition:
        7 of them and filesize < 352256
}