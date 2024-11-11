rule win_kelihos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects win.kelihos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kelihos"
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
        $sequence_0 = { ff7508 e8???????? 59 c3 6a10 68c8b20310 e8???????? }
            // n = 7, score = 300
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   6a10                 | push                0x10
            //   68c8b20310           | push                0x1003b2c8
            //   e8????????           |                     

        $sequence_1 = { e8???????? 8ac3 e9???????? b301 e9???????? 56 8db710010000 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   8ac3                 | mov                 al, bl
            //   e9????????           |                     
            //   b301                 | mov                 bl, 1
            //   e9????????           |                     
            //   56                   | push                esi
            //   8db710010000         | lea                 esi, [edi + 0x110]

        $sequence_2 = { c645fc01 8db780000000 6a01 8975f0 e8???????? 59 59 }
            // n = 7, score = 300
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8db780000000         | lea                 esi, [edi + 0x80]
            //   6a01                 | push                1
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_3 = { e8???????? 83c40c ff7510 c645fc01 50 8d45bc 50 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   50                   | push                eax
            //   8d45bc               | lea                 eax, [ebp - 0x44]
            //   50                   | push                eax

        $sequence_4 = { e8???????? c645fc03 53 8d4d9c c7851cffffff3c000000 89b530ffffff e8???????? }
            // n = 7, score = 300
            //   e8????????           |                     
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   53                   | push                ebx
            //   8d4d9c               | lea                 ecx, [ebp - 0x64]
            //   c7851cffffff3c000000     | mov    dword ptr [ebp - 0xe4], 0x3c
            //   89b530ffffff         | mov                 dword ptr [ebp - 0xd0], esi
            //   e8????????           |                     

        $sequence_5 = { c645fc06 e8???????? 59 59 56 53 50 }
            // n = 7, score = 300
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   56                   | push                esi
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_6 = { e8???????? eb48 8d7598 e8???????? ffb564ffffff 8dbd58ffffff 8d75a0 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   eb48                 | jmp                 0x4a
            //   8d7598               | lea                 esi, [ebp - 0x68]
            //   e8????????           |                     
            //   ffb564ffffff         | push                dword ptr [ebp - 0x9c]
            //   8dbd58ffffff         | lea                 edi, [ebp - 0xa8]
            //   8d75a0               | lea                 esi, [ebp - 0x60]

        $sequence_7 = { e8???????? 8bf0 53 8d442428 50 8bce e8???????? }
            // n = 7, score = 300
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   53                   | push                ebx
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_8 = { e8???????? 8b4508 6a03 e8???????? ff7618 8b4d08 e8???????? }
            // n = 7, score = 300
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   6a03                 | push                3
            //   e8????????           |                     
            //   ff7618               | push                dword ptr [esi + 0x18]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_9 = { e8???????? ff770c 8d75ec e8???????? ff75f8 8d45ec ff75f4 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   ff770c               | push                dword ptr [edi + 0xc]
            //   8d75ec               | lea                 esi, [ebp - 0x14]
            //   e8????????           |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   8d45ec               | lea                 eax, [ebp - 0x14]
            //   ff75f4               | push                dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 4702208
}