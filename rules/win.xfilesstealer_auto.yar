rule win_xfilesstealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.xfilesstealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xfilesstealer"
        malpedia_rule_date = "20230705"
        malpedia_hash = "42d0574f4405bd7d2b154d321d345acb18834a41"
        malpedia_version = "20230715"
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
        $sequence_0 = { bf01000000 4885c0 743b 488d4c2430 8bd7 48894c2420 448d4f0b }
            // n = 7, score = 100
            //   bf01000000           | test                ebx, ebx
            //   4885c0               | and                 dword ptr [ebp - 0x40], 0
            //   743b                 | dec                 esp
            //   488d4c2430           | lea                 ecx, [ebp - 0x40]
            //   8bd7                 | inc                 ecx
            //   48894c2420           | mov                 eax, 0x2b11
            //   448d4f0b             | dec                 eax

        $sequence_1 = { eba7 488b0f e8???????? 85c0 7510 488d1548191400 8d4804 }
            // n = 7, score = 100
            //   eba7                 | mov                 ebx, dword ptr [esp + 0x160]
            //   488b0f               | mov                 eax, ebp
            //   e8????????           |                     
            //   85c0                 | dec                 eax
            //   7510                 | add                 esp, 0x128
            //   488d1548191400       | mov                 ebp, edi
            //   8d4804               | cmp                 eax, 1

        $sequence_2 = { 8bd8 488d4d6f e8???????? 85db 0f887b010000 488bcf e8???????? }
            // n = 7, score = 100
            //   8bd8                 | mov                 ecx, ebx
            //   488d4d6f             | je                  0x270
            //   e8????????           |                     
            //   85db                 | cmp                 ecx, 1
            //   0f887b010000         | jne                 0x312
            //   488bcf               | lea                 ebp, [ecx + 0xf]
            //   e8????????           |                     

        $sequence_3 = { e8???????? 8bd8 85c0 7806 ffc6 3bf5 72a2 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bd8                 | dec                 eax
            //   85c0                 | or                  edi, 1
            //   7806                 | dec                 eax
            //   ffc6                 | mov                 dword ptr [ebp - 0x21], edi
            //   3bf5                 | inc                 esp
            //   72a2                 | movzx               ecx, word ptr [ebp + 0x67]

        $sequence_4 = { e8???????? 48833800 0f8559d70000 488bcf e8???????? 85c0 0f8522d70000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   48833800             | dec                 esp
            //   0f8559d70000         | mov                 edi, dword ptr [esp + 0x40]
            //   488bcf               | dec                 ecx
            //   e8????????           |                     
            //   85c0                 | mov                 eax, dword ptr [esi]
            //   0f8522d70000         | dec                 eax

        $sequence_5 = { e8???????? 90 f644245002 0f8531a72a00 85db 0f84066e2200 488d8f380b0000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   90                   | mov                 esi, dword ptr [esp + 0x60]
            //   f644245002           | mov                 dword ptr [ebx + 0x10], edi
            //   0f8531a72a00         | dec                 eax
            //   85db                 | mov                 edi, dword ptr [esp + 0x68]
            //   0f84066e2200         | mov                 dword ptr [ebx + 0x18], ecx
            //   488d8f380b0000       | dec                 eax

        $sequence_6 = { e8???????? 85c0 0f88e5593300 ffc3 3b5d20 76d5 488b5c2460 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | mov                 dword ptr [eax + 0xc], ecx
            //   0f88e5593300         | xor                 eax, eax
            //   ffc3                 | dec                 eax
            //   3b5d20               | mov                 ebx, dword ptr [esp + 0x50]
            //   76d5                 | mov                 dword ptr [eax + 4], ecx
            //   488b5c2460           | mov                 dword ptr [eax + 8], 0x10

        $sequence_7 = { b8ff030000 6623d8 85c9 0f8512c03500 663b5f0c 7202 33f6 }
            // n = 7, score = 100
            //   b8ff030000           | mov                 eax, dword ptr [ebp - 0x10]
            //   6623d8               | inc                 esp
            //   85c9                 | mov                 dword ptr [eax], edi
            //   0f8512c03500         | and                 dword ptr [eax + 4], 0
            //   663b5f0c             | jmp                 0x395
            //   7202                 | inc                 ebp
            //   33f6                 | xor                 eax, eax

        $sequence_8 = { eb21 83f901 7515 e8???????? 84c0 740c 33d2 }
            // n = 7, score = 100
            //   eb21                 | xor                 eax, eax
            //   83f901               | dec                 eax
            //   7515                 | lea                 edx, [ebp + 0x3b0]
            //   e8????????           |                     
            //   84c0                 | dec                 eax
            //   740c                 | lea                 ecx, [ebp + 0x1a0]
            //   33d2                 | mov                 ebx, eax

        $sequence_9 = { e8???????? 448be7 4138b704020000 7452 4138b705020000 7449 498b8730020000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   448be7               | dec                 eax
            //   4138b704020000       | mov                 edx, esi
            //   7452                 | dec                 eax
            //   4138b705020000       | lea                 ecx, [ebp + 0x180]
            //   7449                 | test                eax, eax
            //   498b8730020000       | js                  0x1a01

    condition:
        7 of them and filesize < 20821780
}