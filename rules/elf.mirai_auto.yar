rule elf_mirai_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-06-10"
        version = "1"
        description = "Detects elf.mirai."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/elf.mirai"
        malpedia_rule_date = "20210604"
        malpedia_hash = "be09d5d71e77373c0f538068be31a2ad4c69cfbd"
        malpedia_version = "20210616"
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
        $sequence_0 = { 8b1408 895310 8b54080c 66895314 }
            // n = 4, score = 300
            //   8b1408               | mov                 dl, al
            //   895310               | sub                 esp, 0x54
            //   8b54080c             | xor                 eax, eax
            //   66895314             | mov                 ebx, dword ptr [esp + 0x74]

        $sequence_1 = { e9???????? e8???????? 66894314 e9???????? }
            // n = 4, score = 300
            //   e9????????           |                     
            //   e8????????           |                     
            //   66894314             | dec                 eax
            //   e9????????           |                     

        $sequence_2 = { 89d0 c1e005 01d0 89ca 29c2 }
            // n = 5, score = 300
            //   89d0                 | add                 esp, 0x10
            //   c1e005               | inc                 eax
            //   01d0                 | je                  0x91d
            //   89ca                 | sub                 esp, 0xc
            //   29c2                 | push                0xc

        $sequence_3 = { 8d429f 3c19 7705 8d42e0 }
            // n = 4, score = 300
            //   8d429f               | push                0
            //   3c19                 | push                0xb
            //   7705                 | push                edi
            //   8d42e0               | mov                 dword ptr [esp + 0x2c], eax

        $sequence_4 = { 66894304 7406 66c743064000 c643092f }
            // n = 4, score = 300
            //   66894304             | mov                 eax, dword ptr [esp + 0x30]
            //   7406                 | dec                 eax
            //   66c743064000         | mov                 dword ptr [ebx + 0x30], eax
            //   c643092f             | dec                 ecx

        $sequence_5 = { 894330 c6433801 c6433903 c6433a03 }
            // n = 4, score = 300
            //   894330               | xor                 eax, eax
            //   c6433801             | dec                 eax
            //   c6433903             | mov                 ecx, dword ptr [esp + 0x10]
            //   c6433a03             | jle                 0x223

        $sequence_6 = { c7433400000000 894330 c6433801 c6433903 }
            // n = 4, score = 300
            //   c7433400000000       | lea                 edx, dword ptr [edx + edx*4]
            //   894330               | add                 edx, edx
            //   c6433801             | mov                 edx, dword ptr [esp + 0x18]
            //   c6433903             | mov                 dword ptr [esp + 0x54], 0

        $sequence_7 = { c1e005 01d0 89ca 29c2 }
            // n = 4, score = 300
            //   c1e005               | mov                 edi, esp
            //   01d0                 | mov                 dword ptr [esp + 0x14], eax
            //   89ca                 | dec                 esp
            //   29c2                 | mov                 esi, dword ptr [ebp - 0x10]

        $sequence_8 = { e8???????? c7433400000000 894330 c6433801 c6433903 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   c7433400000000       | mov                 ebx, dword ptr [esp + 0x68]
            //   894330               | mov                 ecx, 4
            //   c6433801             | mov                 ecx, 4
            //   c6433903             | mov                 ecx, 5

        $sequence_9 = { 807c242b00 66894304 7406 66c743064000 }
            // n = 4, score = 300
            //   807c242b00           | inc                 cx
            //   66894304             | mov                 dword ptr [esp + 4], eax
            //   7406                 | jle                 0x13b
            //   66c743064000         | mov                 esi, 8

    condition:
        7 of them and filesize < 131728
}