rule win_shareip_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.shareip."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shareip"
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
        $sequence_0 = { 399c24c8000000 747a 399c24bc000000 7412 8b9424ac000000 8b02 }
            // n = 6, score = 100
            //   399c24c8000000       | cmp                 dword ptr [esp + 0xc8], ebx
            //   747a                 | je                  0x7c
            //   399c24bc000000       | cmp                 dword ptr [esp + 0xbc], ebx
            //   7412                 | je                  0x14
            //   8b9424ac000000       | mov                 edx, dword ptr [esp + 0xac]
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_1 = { 89742444 895c2440 885c2430 396c2460 720d 8b44244c 50 }
            // n = 7, score = 100
            //   89742444             | mov                 dword ptr [esp + 0x44], esi
            //   895c2440             | mov                 dword ptr [esp + 0x40], ebx
            //   885c2430             | mov                 byte ptr [esp + 0x30], bl
            //   396c2460             | cmp                 dword ptr [esp + 0x60], ebp
            //   720d                 | jb                  0xf
            //   8b44244c             | mov                 eax, dword ptr [esp + 0x4c]
            //   50                   | push                eax

        $sequence_2 = { 83f8ff 7566 be10000000 39742444 720d 8b542430 52 }
            // n = 7, score = 100
            //   83f8ff               | cmp                 eax, -1
            //   7566                 | jne                 0x68
            //   be10000000           | mov                 esi, 0x10
            //   39742444             | cmp                 dword ptr [esp + 0x44], esi
            //   720d                 | jb                  0xf
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   52                   | push                edx

        $sequence_3 = { 5b 83c450 c21000 6aff 68???????? 64a100000000 50 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   83c450               | add                 esp, 0x50
            //   c21000               | ret                 0x10
            //   6aff                 | push                -1
            //   68????????           |                     
            //   64a100000000         | mov                 eax, dword ptr fs:[0]
            //   50                   | push                eax

        $sequence_4 = { 8d442440 50 e8???????? 8b4c241c 51 8d94242c020000 52 }
            // n = 7, score = 100
            //   8d442440             | lea                 eax, [esp + 0x40]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   51                   | push                ecx
            //   8d94242c020000       | lea                 edx, [esp + 0x22c]
            //   52                   | push                edx

        $sequence_5 = { 80f92e 750f 807a0100 8d6a01 0f8480000000 eb06 84c9 }
            // n = 7, score = 100
            //   80f92e               | cmp                 cl, 0x2e
            //   750f                 | jne                 0x11
            //   807a0100             | cmp                 byte ptr [edx + 1], 0
            //   8d6a01               | lea                 ebp, [edx + 1]
            //   0f8480000000         | je                  0x86
            //   eb06                 | jmp                 8
            //   84c9                 | test                cl, cl

        $sequence_6 = { 7463 8d842454010000 e8???????? 83bc24c000000008 7210 8b9424ac000000 52 }
            // n = 7, score = 100
            //   7463                 | je                  0x65
            //   8d842454010000       | lea                 eax, [esp + 0x154]
            //   e8????????           |                     
            //   83bc24c000000008     | cmp                 dword ptr [esp + 0xc0], 8
            //   7210                 | jb                  0x12
            //   8b9424ac000000       | mov                 edx, dword ptr [esp + 0xac]
            //   52                   | push                edx

        $sequence_7 = { 8bd1 c1fa05 c1e006 030495a0b74500 eb05 b8???????? f6400420 }
            // n = 7, score = 100
            //   8bd1                 | mov                 edx, ecx
            //   c1fa05               | sar                 edx, 5
            //   c1e006               | shl                 eax, 6
            //   030495a0b74500       | add                 eax, dword ptr [edx*4 + 0x45b7a0]
            //   eb05                 | jmp                 7
            //   b8????????           |                     
            //   f6400420             | test                byte ptr [eax + 4], 0x20

        $sequence_8 = { 8d78ff 8d742414 e8???????? 50 bf01000000 e8???????? 8bd0 }
            // n = 7, score = 100
            //   8d78ff               | lea                 edi, [eax - 1]
            //   8d742414             | lea                 esi, [esp + 0x14]
            //   e8????????           |                     
            //   50                   | push                eax
            //   bf01000000           | mov                 edi, 1
            //   e8????????           |                     
            //   8bd0                 | mov                 edx, eax

        $sequence_9 = { 51 53 56 8bcd e8???????? 8bce 53 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bcd                 | mov                 ecx, ebp
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 811008
}