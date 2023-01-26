rule win_faketc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.faketc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.faketc"
        malpedia_rule_date = "20230124"
        malpedia_hash = "2ee0eebba83dce3d019a90519f2f972c0fcf9686"
        malpedia_version = "20230125"
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
        $sequence_0 = { c745fccccccccc 8b4508 8b482c 894dfc 837d1000 7504 33c0 }
            // n = 7, score = 100
            //   c745fccccccccc       | mov                 dword ptr [ebp - 4], 0xcccccccc
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b482c               | mov                 ecx, dword ptr [eax + 0x2c]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { c745fccccccccc 8b450c 8945fc 8b4dfc 81e901001000 894dfc 837dfc28 }
            // n = 7, score = 100
            //   c745fccccccccc       | mov                 dword ptr [ebp - 4], 0xcccccccc
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   81e901001000         | sub                 ecx, 0x100001
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   837dfc28             | cmp                 dword ptr [ebp - 4], 0x28

        $sequence_2 = { e8???????? 83c408 b807000000 e9???????? c78564fdffff0a000000 8d8594fdffff 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   b807000000           | mov                 eax, 7
            //   e9????????           |                     
            //   c78564fdffff0a000000     | mov    dword ptr [ebp - 0x29c], 0xa
            //   8d8594fdffff         | lea                 eax, [ebp - 0x26c]
            //   50                   | push                eax

        $sequence_3 = { 8b5514 8955d4 eb07 c745d400400000 8b45d4 8945ec 8b4d08 }
            // n = 7, score = 100
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   8955d4               | mov                 dword ptr [ebp - 0x2c], edx
            //   eb07                 | jmp                 9
            //   c745d400400000       | mov                 dword ptr [ebp - 0x2c], 0x4000
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_4 = { e8???????? c745dc00000000 33d2 75d9 8b45fc 52 8bcd }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c745dc00000000       | mov                 dword ptr [ebp - 0x24], 0
            //   33d2                 | xor                 edx, edx
            //   75d9                 | jne                 0xffffffdb
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   52                   | push                edx
            //   8bcd                 | mov                 ecx, ebp

        $sequence_5 = { be???????? e8???????? e9???????? c644241700 eb04 885c2417 8b542418 }
            // n = 7, score = 100
            //   be????????           |                     
            //   e8????????           |                     
            //   e9????????           |                     
            //   c644241700           | mov                 byte ptr [esp + 0x17], 0
            //   eb04                 | jmp                 6
            //   885c2417             | mov                 byte ptr [esp + 0x17], bl
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]

        $sequence_6 = { e8???????? 83c40c 85c0 0f8ec4000000 8b442410 e9???????? 8b442424 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f8ec4000000         | jle                 0xca
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   e9????????           |                     
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]

        $sequence_7 = { b81b000000 e9???????? 68???????? 8b45ec 50 e8???????? 83c408 }
            // n = 7, score = 100
            //   b81b000000           | mov                 eax, 0x1b
            //   e9????????           |                     
            //   68????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_8 = { c1e808 25ff000000 8b048510dc5e00 33049d10d85e00 8bda c1eb18 33049d10d45e00 }
            // n = 7, score = 100
            //   c1e808               | shr                 eax, 8
            //   25ff000000           | and                 eax, 0xff
            //   8b048510dc5e00       | mov                 eax, dword ptr [eax*4 + 0x5edc10]
            //   33049d10d85e00       | xor                 eax, dword ptr [ebx*4 + 0x5ed810]
            //   8bda                 | mov                 ebx, edx
            //   c1eb18               | shr                 ebx, 0x18
            //   33049d10d45e00       | xor                 eax, dword ptr [ebx*4 + 0x5ed410]

        $sequence_9 = { 8d8c24dc000000 c78424f40000000f000000 899c24f0000000 889c24e0000000 e8???????? 83bc24ec00000010 8b9424d8000000 }
            // n = 7, score = 100
            //   8d8c24dc000000       | lea                 ecx, [esp + 0xdc]
            //   c78424f40000000f000000     | mov    dword ptr [esp + 0xf4], 0xf
            //   899c24f0000000       | mov                 dword ptr [esp + 0xf0], ebx
            //   889c24e0000000       | mov                 byte ptr [esp + 0xe0], bl
            //   e8????????           |                     
            //   83bc24ec00000010     | cmp                 dword ptr [esp + 0xec], 0x10
            //   8b9424d8000000       | mov                 edx, dword ptr [esp + 0xd8]

    condition:
        7 of them and filesize < 6864896
}