rule win_newposthings_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.newposthings."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.newposthings"
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
        $sequence_0 = { 33c0 eb41 6a0a e8???????? 59 8365fc00 833cfd5865410000 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   eb41                 | jmp                 0x43
            //   6a0a                 | push                0xa
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   833cfd5865410000     | cmp                 dword ptr [edi*8 + 0x416558], 0

        $sequence_1 = { 68c8810110 57 a3???????? ffd6 3305???????? }
            // n = 5, score = 100
            //   68c8810110           | push                0x100181c8
            //   57                   | push                edi
            //   a3????????           |                     
            //   ffd6                 | call                esi
            //   3305????????         |                     

        $sequence_2 = { 8bcc 89642430 e8???????? c744244003000000 83ec18 8bcc }
            // n = 6, score = 100
            //   8bcc                 | mov                 ecx, esp
            //   89642430             | mov                 dword ptr [esp + 0x30], esp
            //   e8????????           |                     
            //   c744244003000000     | mov                 dword ptr [esp + 0x40], 3
            //   83ec18               | sub                 esp, 0x18
            //   8bcc                 | mov                 ecx, esp

        $sequence_3 = { 53 ff15???????? 85c0 750d 68e8030000 ffd7 46 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750d                 | jne                 0xf
            //   68e8030000           | push                0x3e8
            //   ffd7                 | call                edi
            //   46                   | inc                 esi

        $sequence_4 = { 83bdb8feffff10 720e ffb5a4feffff e8???????? 83c404 c685a4feffff00 c785b4feffff00000000 }
            // n = 7, score = 100
            //   83bdb8feffff10       | cmp                 dword ptr [ebp - 0x148], 0x10
            //   720e                 | jb                  0x10
            //   ffb5a4feffff         | push                dword ptr [ebp - 0x15c]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   c685a4feffff00       | mov                 byte ptr [ebp - 0x15c], 0
            //   c785b4feffff00000000     | mov    dword ptr [ebp - 0x14c], 0

        $sequence_5 = { 55 8bec 6aff 6888590110 64a100000000 50 }
            // n = 6, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   6aff                 | push                -1
            //   6888590110           | push                0x10015988
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax

        $sequence_6 = { e8???????? 50 8bcb e8???????? c745fc00000000 c745f001000000 8bc3 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c745f001000000       | mov                 dword ptr [ebp - 0x10], 1
            //   8bc3                 | mov                 eax, ebx

        $sequence_7 = { 6830e00010 64ff3500000000 a1???????? 33c4 89442408 64892500000000 }
            // n = 6, score = 100
            //   6830e00010           | push                0x1000e030
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   64892500000000       | mov                 dword ptr fs:[0], esp

        $sequence_8 = { c78500ffffff0f000000 c785fcfeffff00000000 c685ecfeffff00 c645fc0e 837d9810 720b ff7584 }
            // n = 7, score = 100
            //   c78500ffffff0f000000     | mov    dword ptr [ebp - 0x100], 0xf
            //   c785fcfeffff00000000     | mov    dword ptr [ebp - 0x104], 0
            //   c685ecfeffff00       | mov                 byte ptr [ebp - 0x114], 0
            //   c645fc0e             | mov                 byte ptr [ebp - 4], 0xe
            //   837d9810             | cmp                 dword ptr [ebp - 0x68], 0x10
            //   720b                 | jb                  0xd
            //   ff7584               | push                dword ptr [ebp - 0x7c]

        $sequence_9 = { 53 51 bb000e0210 8b4c240c 894b08 894304 896b0c }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   bb000e0210           | mov                 ebx, 0x10020e00
            //   8b4c240c             | mov                 ecx, dword ptr [esp + 0xc]
            //   894b08               | mov                 dword ptr [ebx + 8], ecx
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   896b0c               | mov                 dword ptr [ebx + 0xc], ebp

    condition:
        7 of them and filesize < 827392
}