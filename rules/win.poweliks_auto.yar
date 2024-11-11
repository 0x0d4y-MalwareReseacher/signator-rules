rule win_poweliks_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.poweliks."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poweliks"
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
        $sequence_0 = { 7415 8b7d08 8b720c 81c704110000 03f7 8b7a04 03f8 }
            // n = 7, score = 200
            //   7415                 | je                  0x17
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b720c               | mov                 esi, dword ptr [edx + 0xc]
            //   81c704110000         | add                 edi, 0x1104
            //   03f7                 | add                 esi, edi
            //   8b7a04               | mov                 edi, dword ptr [edx + 4]
            //   03f8                 | add                 edi, eax

        $sequence_1 = { 8bce 85c9 7415 8b7d08 8b720c 81c704110000 }
            // n = 6, score = 200
            //   8bce                 | mov                 ecx, esi
            //   85c9                 | test                ecx, ecx
            //   7415                 | je                  0x17
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b720c               | mov                 esi, dword ptr [edx + 0xc]
            //   81c704110000         | add                 edi, 0x1104

        $sequence_2 = { 81c604110000 6a40 6800300000 03de ff7350 6a00 ffd0 }
            // n = 7, score = 200
            //   81c604110000         | add                 esi, 0x1104
            //   6a40                 | push                0x40
            //   6800300000           | push                0x3000
            //   03de                 | add                 ebx, esi
            //   ff7350               | push                dword ptr [ebx + 0x50]
            //   6a00                 | push                0
            //   ffd0                 | call                eax

        $sequence_3 = { 3a441dd0 7509 ff45fc 837dfc0d }
            // n = 4, score = 200
            //   3a441dd0             | cmp                 al, byte ptr [ebp + ebx - 0x30]
            //   7509                 | jne                 0xb
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   837dfc0d             | cmp                 dword ptr [ebp - 4], 0xd

        $sequence_4 = { 7506 40 83f80f 72eb 83f80f 7503 }
            // n = 6, score = 200
            //   7506                 | jne                 8
            //   40                   | inc                 eax
            //   83f80f               | cmp                 eax, 0xf
            //   72eb                 | jb                  0xffffffed
            //   83f80f               | cmp                 eax, 0xf
            //   7503                 | jne                 5

        $sequence_5 = { 0fb74b06 ff45f4 83c228 394df4 72cd }
            // n = 5, score = 200
            //   0fb74b06             | movzx               ecx, word ptr [ebx + 6]
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   83c228               | add                 edx, 0x28
            //   394df4               | cmp                 dword ptr [ebp - 0xc], ecx
            //   72cd                 | jb                  0xffffffcf

        $sequence_6 = { 3bc8 75ce 8b5508 8b423c 8b441078 }
            // n = 5, score = 200
            //   3bc8                 | cmp                 ecx, eax
            //   75ce                 | jne                 0xffffffd0
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b423c               | mov                 eax, dword ptr [edx + 0x3c]
            //   8b441078             | mov                 eax, dword ptr [eax + edx + 0x78]

        $sequence_7 = { 8bcb d2e0 0ad0 88543e01 ff45f8 fe45ff 8b45f8 }
            // n = 7, score = 200
            //   8bcb                 | mov                 ecx, ebx
            //   d2e0                 | shl                 al, cl
            //   0ad0                 | or                  dl, al
            //   88543e01             | mov                 byte ptr [esi + edi + 1], dl
            //   ff45f8               | inc                 dword ptr [ebp - 8]
            //   fe45ff               | inc                 byte ptr [ebp - 1]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_8 = { 8b45fc c9 c3 55 8d6c2488 81ec9c000000 6898000000 }
            // n = 7, score = 200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c9                   | leave               
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8d6c2488             | lea                 ebp, [esp - 0x78]
            //   81ec9c000000         | sub                 esp, 0x9c
            //   6898000000           | push                0x98

        $sequence_9 = { 8b5df4 03d8 8a4405d0 3a441dd0 7509 }
            // n = 5, score = 200
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]
            //   03d8                 | add                 ebx, eax
            //   8a4405d0             | mov                 al, byte ptr [ebp + eax - 0x30]
            //   3a441dd0             | cmp                 al, byte ptr [ebp + ebx - 0x30]
            //   7509                 | jne                 0xb

    condition:
        7 of them and filesize < 115712
}