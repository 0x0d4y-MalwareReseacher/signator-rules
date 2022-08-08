rule win_volgmer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.volgmer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.volgmer"
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
        $sequence_0 = { 48897c2418 55 488d6c24b0 4881ec50010000 488b05???????? 4833c4 48894540 }
            // n = 7, score = 300
            //   48897c2418           | dec                 eax
            //   55                   | lea                 eax, [esp + 0x48]
            //   488d6c24b0           | dec                 eax
            //   4881ec50010000       | mov                 dword ptr [esp + 0x30], ebx
            //   488b05????????       |                     
            //   4833c4               | dec                 esp
            //   48894540             | lea                 eax, [esp + 0x58]

        $sequence_1 = { 488b4d40 4833cc e8???????? 4c8d9c2450010000 498b5b18 498b7b20 498be3 }
            // n = 7, score = 300
            //   488b4d40             | dec                 esp
            //   4833cc               | lea                 eax, [esp + 0x58]
            //   e8????????           |                     
            //   4c8d9c2450010000     | inc                 esp
            //   498b5b18             | mov                 ecx, dword ptr [esp + 0x40]
            //   498b7b20             | dec                 eax
            //   498be3               | mov                 dword ptr [esp + 0x38], ebx

        $sequence_2 = { e8???????? 8905???????? 85c0 7543 488b7c2440 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8905????????         |                     
            //   85c0                 | add                 esp, 0x528
            //   7543                 | inc                 ecx
            //   488b7c2440           | pop                 esi

        $sequence_3 = { e8???????? 4881c428050000 415e 415d }
            // n = 4, score = 200
            //   e8????????           |                     
            //   4881c428050000       | dec                 eax
            //   415e                 | add                 esp, 0x528
            //   415d                 | inc                 ecx

        $sequence_4 = { e8???????? e8???????? e8???????? e8???????? c705????????04000000 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   e8????????           |                     
            //   c705????????04000000     |     

        $sequence_5 = { 488d8d10020000 e8???????? 8bd7 c6843d1002000000 488d8d10020000 e8???????? 488d9510020000 }
            // n = 7, score = 200
            //   488d8d10020000       | dec                 eax
            //   e8????????           |                     
            //   8bd7                 | sub                 esp, 0x150
            //   c6843d1002000000     | dec                 esp
            //   488d8d10020000       | lea                 ebx, [esp + 0x150]
            //   e8????????           |                     
            //   488d9510020000       | dec                 ecx

        $sequence_6 = { e9???????? 488d4c2430 488bd3 e8???????? }
            // n = 4, score = 200
            //   e9????????           |                     
            //   488d4c2430           | inc                 ecx
            //   488bd3               | cmp                 ebp, 1
            //   e8????????           |                     

        $sequence_7 = { ff542450 488bd8 4885c0 7507 33c0 e9???????? 4c8b6c2440 }
            // n = 7, score = 200
            //   ff542450             | xor                 eax, esp
            //   488bd8               | dec                 eax
            //   4885c0               | mov                 dword ptr [ebp + 0x40], eax
            //   7507                 | mov                 byte ptr [ebp + 0x2c5], al
            //   33c0                 | mov                 eax, edx
            //   e9????????           |                     
            //   4c8b6c2440           | sar                 eax, 8

        $sequence_8 = { e8???????? 0f1005???????? 23d8 488d8dc7020000 8b05???????? 33d2 8985c0020000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   0f1005????????       |                     
            //   23d8                 | mov                 esp, ebx
            //   488d8dc7020000       | dec                 esp
            //   8b05????????         |                     
            //   33d2                 | lea                 ebx, [esp + 0x150]
            //   8985c0020000         | dec                 ecx

        $sequence_9 = { e8???????? 85c0 0f8414010000 488b0d???????? e8???????? 85c0 0f8400010000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   85c0                 | lea                 ebp, [esp - 0x50]
            //   0f8414010000         | dec                 eax
            //   488b0d????????       |                     
            //   e8????????           |                     
            //   85c0                 | sub                 esp, 0x150
            //   0f8400010000         | dec                 eax

        $sequence_10 = { e9???????? 4183fd01 750d 498bd6 }
            // n = 4, score = 200
            //   e9????????           |                     
            //   4183fd01             | inc                 ecx
            //   750d                 | pop                 ebp
            //   498bd6               | pop                 ebx

        $sequence_11 = { 4c8b35???????? 89442444 8b05???????? 89442440 8b05???????? 89442448 4c894c2438 }
            // n = 7, score = 200
            //   4c8b35????????       |                     
            //   89442444             | mov                 ebx, dword ptr [ebx + 0x18]
            //   8b05????????         |                     
            //   89442440             | dec                 ecx
            //   8b05????????         |                     
            //   89442448             | mov                 edi, dword ptr [ebx + 0x20]
            //   4c894c2438           | dec                 ecx

        $sequence_12 = { ff15???????? 448b4c2440 48895c2438 488d442448 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   448b4c2440           | inc                 ecx
            //   48895c2438           | cmp                 ebp, 1
            //   488d442448           | jne                 0xf

        $sequence_13 = { d1c6 c1c105 03c6 89742404 03c3 }
            // n = 5, score = 200
            //   d1c6                 | dec                 eax
            //   c1c105               | mov                 dword ptr [esp + 0x30], ebx
            //   03c6                 | inc                 esp
            //   89742404             | mov                 ecx, dword ptr [esp + 0x40]
            //   03c3                 | dec                 eax

        $sequence_14 = { 488b4b18 33d2 ffd0 85c0 0f8419010000 41b902000000 488d542448 }
            // n = 7, score = 200
            //   488b4b18             | mov                 ebx, dword ptr [ebx + 0x18]
            //   33d2                 | dec                 ecx
            //   ffd0                 | mov                 edi, dword ptr [ebx + 0x20]
            //   85c0                 | dec                 ecx
            //   0f8419010000         | mov                 esp, ebx
            //   41b902000000         | push                ebp
            //   488d542448           | dec                 eax

        $sequence_15 = { 8b55d4 8a07 8b0c9580f17300 8844192e }
            // n = 4, score = 100
            //   8b55d4               | lea                 ebp, [esp - 0x50]
            //   8a07                 | dec                 eax
            //   8b0c9580f17300       | sub                 esp, 0x150
            //   8844192e             | dec                 eax

        $sequence_16 = { 7420 6bc618 57 8db870ef6e00 57 ff15???????? }
            // n = 6, score = 100
            //   7420                 | dec                 ecx
            //   6bc618               | mov                 ebx, dword ptr [ebx + 0x18]
            //   57                   | dec                 ecx
            //   8db870ef6e00         | mov                 edi, dword ptr [ebx + 0x20]
            //   57                   | dec                 ecx
            //   ff15????????         |                     

        $sequence_17 = { e8???????? 8bf0 83c408 85f6 7518 397310 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8bf0                 | dec                 eax
            //   83c408               | lea                 ebp, [esp - 0x50]
            //   85f6                 | dec                 eax
            //   7518                 | sub                 esp, 0x150
            //   397310               | dec                 eax

        $sequence_18 = { 8b048580f17300 f644082801 7406 8b440818 5d c3 e8???????? }
            // n = 7, score = 100
            //   8b048580f17300       | mov                 ebx, dword ptr [ebx + 0x18]
            //   f644082801           | dec                 ecx
            //   7406                 | mov                 edi, dword ptr [ebx + 0x20]
            //   8b440818             | dec                 ecx
            //   5d                   | mov                 esp, ebx
            //   c3                   | dec                 eax
            //   e8????????           |                     

        $sequence_19 = { 6a00 50 e8???????? 83c40c c785e0f3ffff00040000 }
            // n = 5, score = 100
            //   6a00                 | push                ebp
            //   50                   | dec                 eax
            //   e8????????           |                     
            //   83c40c               | lea                 ebp, [esp - 0x50]
            //   c785e0f3ffff00040000     | dec    eax

        $sequence_20 = { ff15???????? 837b0c00 8bf0 7459 8d8b18030000 51 8d85f4fbffff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   837b0c00             | mov                 dword ptr [esp + 0x10], ebx
            //   8bf0                 | dec                 eax
            //   7459                 | mov                 dword ptr [esp + 0x18], edi
            //   8d8b18030000         | push                ebp
            //   51                   | dec                 eax
            //   8d85f4fbffff         | lea                 ebp, [esp - 0x50]

        $sequence_21 = { 50 8b85a4f8ffff 0fb7048534976e00 8d0485308e6e00 50 }
            // n = 5, score = 100
            //   50                   | dec                 eax
            //   8b85a4f8ffff         | lea                 ebp, [esp - 0x50]
            //   0fb7048534976e00     | dec                 eax
            //   8d0485308e6e00       | sub                 esp, 0x150
            //   50                   | dec                 eax

        $sequence_22 = { 6a06 8d90c4e16e00 5f 668b02 8d5202 }
            // n = 5, score = 100
            //   6a06                 | xor                 ecx, esp
            //   8d90c4e16e00         | dec                 esp
            //   5f                   | lea                 ebx, [esp + 0x150]
            //   668b02               | dec                 ecx
            //   8d5202               | mov                 ebx, dword ptr [ebx + 0x18]

        $sequence_23 = { 8b04c520986e00 5d c3 33c0 }
            // n = 4, score = 100
            //   8b04c520986e00       | dec                 eax
            //   5d                   | xor                 eax, esp
            //   c3                   | dec                 esp
            //   33c0                 | lea                 ebx, [esp + 0x150]

        $sequence_24 = { 83f808 74ba 83f807 77c5 ff2485d1a86d00 8bce e8???????? }
            // n = 7, score = 100
            //   83f808               | mov                 esp, ebx
            //   74ba                 | dec                 eax
            //   83f807               | mov                 dword ptr [esp + 0x18], edi
            //   77c5                 | push                ebp
            //   ff2485d1a86d00       | dec                 eax
            //   8bce                 | lea                 ebp, [esp - 0x50]
            //   e8????????           |                     

        $sequence_25 = { 8b44243c 83c404 6a78 50 ff15???????? }
            // n = 5, score = 100
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   83c404               | add                 esp, 4
            //   6a78                 | push                0x78
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_26 = { 56 8944240c e8???????? 83c404 83f802 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   83f802               | cmp                 eax, 2

        $sequence_27 = { e8???????? 83c404 6864400000 6a40 ff15???????? 85c0 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   6864400000           | push                0x4064
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_28 = { 33ff 8bcf 8bc7 894de4 3998c0e16e00 0f84ea000000 }
            // n = 6, score = 100
            //   33ff                 | mov                 dword ptr [esp + 0x18], edi
            //   8bcf                 | push                ebp
            //   8bc7                 | dec                 eax
            //   894de4               | lea                 ebp, [esp - 0x50]
            //   3998c0e16e00         | dec                 eax
            //   0f84ea000000         | sub                 esp, 0x150

        $sequence_29 = { 84c0 75f3 8d85d0f9ffff 68???????? }
            // n = 4, score = 100
            //   84c0                 | dec                 eax
            //   75f3                 | sub                 esp, 0x150
            //   8d85d0f9ffff         | dec                 eax
            //   68????????           |                     

        $sequence_30 = { 8d5101 8a01 41 84c0 75f9 56 53 }
            // n = 7, score = 100
            //   8d5101               | xor                 eax, esp
            //   8a01                 | dec                 eax
            //   41                   | mov                 dword ptr [ebp + 0x40], eax
            //   84c0                 | dec                 eax
            //   75f9                 | mov                 dword ptr [esp + 0x10], ebx
            //   56                   | dec                 eax
            //   53                   | mov                 dword ptr [esp + 0x18], edi

        $sequence_31 = { 8bec 8b550c 83ec20 33c9 8bc1 3914c5d8c36e00 7408 }
            // n = 7, score = 100
            //   8bec                 | dec                 ecx
            //   8b550c               | mov                 edi, dword ptr [ebx + 0x20]
            //   83ec20               | dec                 ecx
            //   33c9                 | mov                 esp, ebx
            //   8bc1                 | dec                 eax
            //   3914c5d8c36e00       | mov                 dword ptr [esp + 0x18], edi
            //   7408                 | push                ebp

        $sequence_32 = { 8bbc2470020000 8d44241c 33db 50 57 895c2420 }
            // n = 6, score = 100
            //   8bbc2470020000       | mov                 edi, dword ptr [esp + 0x270]
            //   8d44241c             | lea                 eax, [esp + 0x1c]
            //   33db                 | xor                 ebx, ebx
            //   50                   | push                eax
            //   57                   | push                edi
            //   895c2420             | mov                 dword ptr [esp + 0x20], ebx

        $sequence_33 = { 83e802 6a5c 57 66c7000000 e8???????? 83c408 }
            // n = 6, score = 100
            //   83e802               | sub                 eax, 2
            //   6a5c                 | push                0x5c
            //   57                   | push                edi
            //   66c7000000           | mov                 word ptr [eax], 0
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_34 = { 68???????? 50 ff15???????? 837e0c00 8bf8 0f84a2000000 }
            // n = 6, score = 100
            //   68????????           |                     
            //   50                   | xor                 eax, esp
            //   ff15????????         |                     
            //   837e0c00             | dec                 eax
            //   8bf8                 | mov                 dword ptr [esp + 0x18], edi
            //   0f84a2000000         | push                ebp

        $sequence_35 = { c1e002 50 8b85b4f8ffff 0fb7048534976e00 8d0485308e6e00 50 8d8590faffff }
            // n = 7, score = 100
            //   c1e002               | mov                 dword ptr [esp + 0x18], edi
            //   50                   | push                ebp
            //   8b85b4f8ffff         | dec                 eax
            //   0fb7048534976e00     | lea                 ebp, [esp - 0x50]
            //   8d0485308e6e00       | dec                 eax
            //   50                   | sub                 esp, 0x150
            //   8d8590faffff         | dec                 eax

        $sequence_36 = { c644240f20 c644241014 c6442411bd c64424120a c6442413ce c644241441 }
            // n = 6, score = 100
            //   c644240f20           | mov                 byte ptr [esp + 0xf], 0x20
            //   c644241014           | mov                 byte ptr [esp + 0x10], 0x14
            //   c6442411bd           | mov                 byte ptr [esp + 0x11], 0xbd
            //   c64424120a           | mov                 byte ptr [esp + 0x12], 0xa
            //   c6442413ce           | mov                 byte ptr [esp + 0x13], 0xce
            //   c644241441           | mov                 byte ptr [esp + 0x14], 0x41

    condition:
        7 of them and filesize < 393216
}