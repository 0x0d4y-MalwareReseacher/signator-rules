rule win_cerber_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.cerber."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cerber"
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
        $sequence_0 = { 725d 8b4d14 8b750c 8b5d08 8bd0 c1ea05 85c9 }
            // n = 7, score = 1200
            //   725d                 | jb                  0x5f
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8bd0                 | mov                 edx, eax
            //   c1ea05               | shr                 edx, 5
            //   85c9                 | test                ecx, ecx

        $sequence_1 = { 33db 8d48ff 3bf9 0f94c3 }
            // n = 4, score = 1200
            //   33db                 | xor                 ebx, ebx
            //   8d48ff               | lea                 ecx, [eax - 1]
            //   3bf9                 | cmp                 edi, ecx
            //   0f94c3               | sete                bl

        $sequence_2 = { 51 51 33c0 53 3bf0 7508 6a03 }
            // n = 7, score = 1200
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   33c0                 | xor                 eax, eax
            //   53                   | push                ebx
            //   3bf0                 | cmp                 esi, eax
            //   7508                 | jne                 0xa
            //   6a03                 | push                3

        $sequence_3 = { 03cb 8bf0 c1e609 8dbc0e78010000 }
            // n = 4, score = 1200
            //   03cb                 | add                 ecx, ebx
            //   8bf0                 | mov                 esi, eax
            //   c1e609               | shl                 esi, 9
            //   8dbc0e78010000       | lea                 edi, [esi + ecx + 0x178]

        $sequence_4 = { 725c 8bc1 33d2 c1e805 395514 7628 8b750c }
            // n = 7, score = 1200
            //   725c                 | jb                  0x5e
            //   8bc1                 | mov                 eax, ecx
            //   33d2                 | xor                 edx, edx
            //   c1e805               | shr                 eax, 5
            //   395514               | cmp                 dword ptr [ebp + 0x14], edx
            //   7628                 | jbe                 0x2a
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]

        $sequence_5 = { 72d2 85d2 780a 8b4510 c6040200 }
            // n = 5, score = 1200
            //   72d2                 | jb                  0xffffffd4
            //   85d2                 | test                edx, edx
            //   780a                 | js                  0xc
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   c6040200             | mov                 byte ptr [edx + eax], 0

        $sequence_6 = { 51 833d????????01 53 55 }
            // n = 4, score = 1200
            //   51                   | push                ecx
            //   833d????????01       |                     
            //   53                   | push                ebx
            //   55                   | push                ebp

        $sequence_7 = { 72c6 5b 8b45f4 8b4df0 8907 e8???????? 5e }
            // n = 7, score = 1200
            //   72c6                 | jb                  0xffffffc8
            //   5b                   | pop                 ebx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   8907                 | mov                 dword ptr [edi], eax
            //   e8????????           |                     
            //   5e                   | pop                 esi

    condition:
        7 of them and filesize < 573440
}