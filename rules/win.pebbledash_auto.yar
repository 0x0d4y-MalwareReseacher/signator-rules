rule win_pebbledash_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.pebbledash."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pebbledash"
        malpedia_rule_date = "20221007"
        malpedia_hash = "597f9539014e3d0f350c069cd804aa71679486ae"
        malpedia_version = ""
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
        $sequence_0 = { a1???????? 8be5 5d c3 55 8bec 83ec18 }
            // n = 7, score = 100
            //   a1????????           |                     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec18               | sub                 esp, 0x18

        $sequence_1 = { e9???????? 8b55fc 52 e8???????? 83c404 33c0 5f }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi

        $sequence_2 = { c745f8ffffffff 8b45e4 3b8568ffffff 750c 837de800 7506 837dfc00 }
            // n = 7, score = 100
            //   c745f8ffffffff       | mov                 dword ptr [ebp - 8], 0xffffffff
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   3b8568ffffff         | cmp                 eax, dword ptr [ebp - 0x98]
            //   750c                 | jne                 0xe
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   7506                 | jne                 8
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0

        $sequence_3 = { c705????????00000800 b800000800 e9???????? 8b55f8 8b4204 8945fc 837d1802 }
            // n = 7, score = 100
            //   c705????????00000800     |     
            //   b800000800           | mov                 eax, 0x80000
            //   e9????????           |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837d1802             | cmp                 dword ptr [ebp + 0x18], 2

        $sequence_4 = { 83f806 750b 8b4de0 034de4 894df0 eb02 eba4 }
            // n = 7, score = 100
            //   83f806               | cmp                 eax, 6
            //   750b                 | jne                 0xd
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   034de4               | add                 ecx, dword ptr [ebp - 0x1c]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   eb02                 | jmp                 4
            //   eba4                 | jmp                 0xffffffa6

        $sequence_5 = { 817df000000005 0f84cb000000 e9???????? c745f8???????? e9???????? c745f8???????? }
            // n = 6, score = 100
            //   817df000000005       | cmp                 dword ptr [ebp - 0x10], 0x5000000
            //   0f84cb000000         | je                  0xd1
            //   e9????????           |                     
            //   c745f8????????       |                     
            //   e9????????           |                     
            //   c745f8????????       |                     

        $sequence_6 = { 8b4d08 8b55f0 03510c 8b4588 034584 }
            // n = 5, score = 100
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   03510c               | add                 edx, dword ptr [ecx + 0xc]
            //   8b4588               | mov                 eax, dword ptr [ebp - 0x78]
            //   034584               | add                 eax, dword ptr [ebp - 0x7c]

        $sequence_7 = { 8995ecfbffff 6a08 8d85d0f7ffff 50 8b8de8fbffff 038decfbffff }
            // n = 6, score = 100
            //   8995ecfbffff         | mov                 dword ptr [ebp - 0x414], edx
            //   6a08                 | push                8
            //   8d85d0f7ffff         | lea                 eax, [ebp - 0x830]
            //   50                   | push                eax
            //   8b8de8fbffff         | mov                 ecx, dword ptr [ebp - 0x418]
            //   038decfbffff         | add                 ecx, dword ptr [ebp - 0x414]

        $sequence_8 = { c7410c00000000 8b5514 c70200000000 8b45f4 8be5 5d c3 }
            // n = 7, score = 100
            //   c7410c00000000       | mov                 dword ptr [ecx + 0xc], 0
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   c70200000000         | mov                 dword ptr [edx], 0
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_9 = { c6856effffff0e c6856fffffff28 c68570ffffff8e c68571ffffff08 c68572ffffff04 c68573ffffffba c68574ffffff13 }
            // n = 7, score = 100
            //   c6856effffff0e       | mov                 byte ptr [ebp - 0x92], 0xe
            //   c6856fffffff28       | mov                 byte ptr [ebp - 0x91], 0x28
            //   c68570ffffff8e       | mov                 byte ptr [ebp - 0x90], 0x8e
            //   c68571ffffff08       | mov                 byte ptr [ebp - 0x8f], 8
            //   c68572ffffff04       | mov                 byte ptr [ebp - 0x8e], 4
            //   c68573ffffffba       | mov                 byte ptr [ebp - 0x8d], 0xba
            //   c68574ffffff13       | mov                 byte ptr [ebp - 0x8c], 0x13

    condition:
        7 of them and filesize < 360448
}