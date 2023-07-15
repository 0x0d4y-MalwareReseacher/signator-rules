rule win_unidentified_042_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.unidentified_042."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_042"
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
        $sequence_0 = { d1c6 8975a8 8b75fc 33f3 3375f0 8b5df0 0375a8 }
            // n = 7, score = 100
            //   d1c6                 | rol                 esi, 1
            //   8975a8               | mov                 dword ptr [ebp - 0x58], esi
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   33f3                 | xor                 esi, ebx
            //   3375f0               | xor                 esi, dword ptr [ebp - 0x10]
            //   8b5df0               | mov                 ebx, dword ptr [ebp - 0x10]
            //   0375a8               | add                 esi, dword ptr [ebp - 0x58]

        $sequence_1 = { 0f8d85000000 8d55c4 52 8bc2 50 e8???????? }
            // n = 6, score = 100
            //   0f8d85000000         | jge                 0x8b
            //   8d55c4               | lea                 edx, [ebp - 0x3c]
            //   52                   | push                edx
            //   8bc2                 | mov                 eax, edx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { 6a02 8d5e1c 50 8b8774020000 8bf3 e8???????? }
            // n = 6, score = 100
            //   6a02                 | push                2
            //   8d5e1c               | lea                 ebx, [esi + 0x1c]
            //   50                   | push                eax
            //   8b8774020000         | mov                 eax, dword ptr [edi + 0x274]
            //   8bf3                 | mov                 esi, ebx
            //   e8????????           |                     

        $sequence_3 = { 8bc1 52 0fb655ff c1e80a 83e001 50 0fb7837e010000 }
            // n = 7, score = 100
            //   8bc1                 | mov                 eax, ecx
            //   52                   | push                edx
            //   0fb655ff             | movzx               edx, byte ptr [ebp - 1]
            //   c1e80a               | shr                 eax, 0xa
            //   83e001               | and                 eax, 1
            //   50                   | push                eax
            //   0fb7837e010000       | movzx               eax, word ptr [ebx + 0x17e]

        $sequence_4 = { c78524ffffff3fd27290 c78528ffffffae4e840c c7852cffffff79ca6988 c78530ffffff90060984 c78534fffffffa024380 c78538ffffff893ec3fc c7853cffffff05ba3078 }
            // n = 7, score = 100
            //   c78524ffffff3fd27290     | mov    dword ptr [ebp - 0xdc], 0x9072d23f
            //   c78528ffffffae4e840c     | mov    dword ptr [ebp - 0xd8], 0xc844eae
            //   c7852cffffff79ca6988     | mov    dword ptr [ebp - 0xd4], 0x8869ca79
            //   c78530ffffff90060984     | mov    dword ptr [ebp - 0xd0], 0x84090690
            //   c78534fffffffa024380     | mov    dword ptr [ebp - 0xcc], 0x804302fa
            //   c78538ffffff893ec3fc     | mov    dword ptr [ebp - 0xc8], 0xfcc33e89
            //   c7853cffffff05ba3078     | mov    dword ptr [ebp - 0xc4], 0x7830ba05

        $sequence_5 = { 03f7 898d7cefffff ff15???????? 8bbd64efffff 33c0 83c40c 898568efffff }
            // n = 7, score = 100
            //   03f7                 | add                 esi, edi
            //   898d7cefffff         | mov                 dword ptr [ebp - 0x1084], ecx
            //   ff15????????         |                     
            //   8bbd64efffff         | mov                 edi, dword ptr [ebp - 0x109c]
            //   33c0                 | xor                 eax, eax
            //   83c40c               | add                 esp, 0xc
            //   898568efffff         | mov                 dword ptr [ebp - 0x1098], eax

        $sequence_6 = { 8bce e8???????? 8b45f8 83c410 85c0 0f8506010000 }
            // n = 6, score = 100
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   0f8506010000         | jne                 0x10c

        $sequence_7 = { eb0f 8b8e38020000 8d7901 89be38020000 8bd9 c1eb18 885804 }
            // n = 7, score = 100
            //   eb0f                 | jmp                 0x11
            //   8b8e38020000         | mov                 ecx, dword ptr [esi + 0x238]
            //   8d7901               | lea                 edi, [ecx + 1]
            //   89be38020000         | mov                 dword ptr [esi + 0x238], edi
            //   8bd9                 | mov                 ebx, ecx
            //   c1eb18               | shr                 ebx, 0x18
            //   885804               | mov                 byte ptr [eax + 4], bl

        $sequence_8 = { 5d c3 8bb59cfeffff 8d95a0feffff 52 56 e8???????? }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8bb59cfeffff         | mov                 esi, dword ptr [ebp - 0x164]
            //   8d95a0feffff         | lea                 edx, [ebp - 0x160]
            //   52                   | push                edx
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_9 = { 8bd6 e8???????? 83c40c 8945fc 5f 8be5 5d }
            // n = 7, score = 100
            //   8bd6                 | mov                 edx, esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   5f                   | pop                 edi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

    condition:
        7 of them and filesize < 516096
}