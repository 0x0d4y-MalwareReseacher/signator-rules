rule win_carbanak_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.carbanak."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.carbanak"
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
        $sequence_0 = { 8bec a1???????? 81ec1c010000 a801 0f84ac000000 6aff 6a00 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   a1????????           |                     
            //   81ec1c010000         | sub                 esp, 0x11c
            //   a801                 | test                al, 1
            //   0f84ac000000         | je                  0xb2
            //   6aff                 | push                -1
            //   6a00                 | push                0

        $sequence_1 = { 6a2c 8d45a0 50 8bc6 6bc02c 03450c 50 }
            // n = 7, score = 200
            //   6a2c                 | push                0x2c
            //   8d45a0               | lea                 eax, [ebp - 0x60]
            //   50                   | push                eax
            //   8bc6                 | mov                 eax, esi
            //   6bc02c               | imul                eax, eax, 0x2c
            //   03450c               | add                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax

        $sequence_2 = { 53 e8???????? 59 59 ffd0 8945e8 85c0 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ffd0                 | call                eax
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   85c0                 | test                eax, eax

        $sequence_3 = { 8bec 53 56 8b7508 6a3a 56 8bd9 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   6a3a                 | push                0x3a
            //   56                   | push                esi
            //   8bd9                 | mov                 ebx, ecx

        $sequence_4 = { 8d85a0feffff 8bfb 50 8d8d90feffff 897df0 e8???????? 6aff }
            // n = 7, score = 200
            //   8d85a0feffff         | lea                 eax, [ebp - 0x160]
            //   8bfb                 | mov                 edi, ebx
            //   50                   | push                eax
            //   8d8d90feffff         | lea                 ecx, [ebp - 0x170]
            //   897df0               | mov                 dword ptr [ebp - 0x10], edi
            //   e8????????           |                     
            //   6aff                 | push                -1

        $sequence_5 = { e8???????? 8bd8 83c428 85db 0f84f9000000 56 6a05 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   83c428               | add                 esp, 0x28
            //   85db                 | test                ebx, ebx
            //   0f84f9000000         | je                  0xff
            //   56                   | push                esi
            //   6a05                 | push                5

        $sequence_6 = { 5d c3 6a00 6891ec3b0a 6a00 e8???????? 59 }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   6a00                 | push                0
            //   6891ec3b0a           | push                0xa3bec91
            //   6a00                 | push                0
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_7 = { 50 56 e8???????? 59 837df003 59 885dfc }
            // n = 7, score = 200
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   837df003             | cmp                 dword ptr [ebp - 0x10], 3
            //   59                   | pop                 ecx
            //   885dfc               | mov                 byte ptr [ebp - 4], bl

        $sequence_8 = { 80c230 88143e 46 85db 75da 5f 8bc6 }
            // n = 7, score = 200
            //   80c230               | add                 dl, 0x30
            //   88143e               | mov                 byte ptr [esi + edi], dl
            //   46                   | inc                 esi
            //   85db                 | test                ebx, ebx
            //   75da                 | jne                 0xffffffdc
            //   5f                   | pop                 edi
            //   8bc6                 | mov                 eax, esi

        $sequence_9 = { 8bec 83ec50 53 56 57 8b7d10 }
            // n = 6, score = 200
            //   8bec                 | mov                 ebp, esp
            //   83ec50               | sub                 esp, 0x50
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]

    condition:
        7 of them and filesize < 425984
}