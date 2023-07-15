rule win_cookiebag_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.cookiebag."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cookiebag"
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
        $sequence_0 = { e8???????? 84c0 742b 8b54241c }
            // n = 4, score = 100
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   742b                 | je                  0x2d
            //   8b54241c             | mov                 edx, dword ptr [esp + 0x1c]

        $sequence_1 = { 8b5560 8bb424d4000000 8a442420 42 895560 6a00 }
            // n = 6, score = 100
            //   8b5560               | mov                 edx, dword ptr [ebp + 0x60]
            //   8bb424d4000000       | mov                 esi, dword ptr [esp + 0xd4]
            //   8a442420             | mov                 al, byte ptr [esp + 0x20]
            //   42                   | inc                 edx
            //   895560               | mov                 dword ptr [ebp + 0x60], edx
            //   6a00                 | push                0

        $sequence_2 = { 51 6a00 50 8d4d30 }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   50                   | push                eax
            //   8d4d30               | lea                 ecx, [ebp + 0x30]

        $sequence_3 = { 3bcf 897c2434 897c2438 741e 8a41ff 84c0 }
            // n = 6, score = 100
            //   3bcf                 | cmp                 ecx, edi
            //   897c2434             | mov                 dword ptr [esp + 0x34], edi
            //   897c2438             | mov                 dword ptr [esp + 0x38], edi
            //   741e                 | je                  0x20
            //   8a41ff               | mov                 al, byte ptr [ecx - 1]
            //   84c0                 | test                al, al

        $sequence_4 = { e8???????? 68???????? e8???????? 83c404 8d4c246c 50 68???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8d4c246c             | lea                 ecx, [esp + 0x6c]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_5 = { 894308 8b44241c 85c0 7618 8b5c2420 e9???????? }
            // n = 6, score = 100
            //   894308               | mov                 dword ptr [ebx + 8], eax
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   85c0                 | test                eax, eax
            //   7618                 | jbe                 0x1a
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   e9????????           |                     

        $sequence_6 = { 6a00 8806 8bce e8???????? 8b0d???????? 51 6a00 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   8806                 | mov                 byte ptr [esi], al
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   6a00                 | push                0

        $sequence_7 = { 8d9ed01c4200 803b00 8bcb 742c 8a5101 84d2 7425 }
            // n = 7, score = 100
            //   8d9ed01c4200         | lea                 ebx, [esi + 0x421cd0]
            //   803b00               | cmp                 byte ptr [ebx], 0
            //   8bcb                 | mov                 ecx, ebx
            //   742c                 | je                  0x2e
            //   8a5101               | mov                 dl, byte ptr [ecx + 1]
            //   84d2                 | test                dl, dl
            //   7425                 | je                  0x27

        $sequence_8 = { e8???????? 57 8d4c2454 c68424d000000001 e8???????? }
            // n = 5, score = 100
            //   e8????????           |                     
            //   57                   | push                edi
            //   8d4c2454             | lea                 ecx, [esp + 0x54]
            //   c68424d000000001     | mov                 byte ptr [esp + 0xd0], 1
            //   e8????????           |                     

        $sequence_9 = { 83ec10 8d442450 8bcc 89642438 50 c68424f000000010 e8???????? }
            // n = 7, score = 100
            //   83ec10               | sub                 esp, 0x10
            //   8d442450             | lea                 eax, [esp + 0x50]
            //   8bcc                 | mov                 ecx, esp
            //   89642438             | mov                 dword ptr [esp + 0x38], esp
            //   50                   | push                eax
            //   c68424f000000010     | mov                 byte ptr [esp + 0xf0], 0x10
            //   e8????????           |                     

    condition:
        7 of them and filesize < 311296
}