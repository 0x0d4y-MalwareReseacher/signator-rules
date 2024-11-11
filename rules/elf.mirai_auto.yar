rule elf_mirai_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2024-10-31"
        version = "1"
        description = "Detects elf.mirai."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/elf.mirai"
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
        $sequence_0 = { e9???????? e8???????? 66894314 e9???????? }
            // n = 4, score = 300
            //   e9????????           |                     
            //   e8????????           |                     
            //   66894314             | mov                 byte ptr [esp + 0x617], 0
            //   e9????????           |                     

        $sequence_1 = { 89d0 c1e005 01d0 89ca }
            // n = 4, score = 300
            //   89d0                 | mov                 edx, dword ptr [esp + 0x5c]
            //   c1e005               | test                eax, eax
            //   01d0                 | mov                 dword ptr [esp + 4], 0
            //   89ca                 | je                  0x15c0

        $sequence_2 = { c1ea03 89d0 c1e005 01d0 89ca 29c2 }
            // n = 6, score = 300
            //   c1ea03               | push                eax
            //   89d0                 | mov                 ecx, esi
            //   c1e005               | mov                 dword ptr [esp + 0x1c], eax
            //   01d0                 | and                 ecx, 0xff
            //   89ca                 | mov                 eax, dword ptr [esp + 0x20]
            //   29c2                 | test                eax, eax

        $sequence_3 = { 89d0 c1e005 01d0 89ca 29c2 }
            // n = 5, score = 300
            //   89d0                 | dec                 eax
            //   c1e005               | inc                 edi
            //   01d0                 | test                esi, esi
            //   89ca                 | jg                  0x1a05
            //   29c2                 | mov                 byte ptr [edi], dl

        $sequence_4 = { c1ea02 8d1492 29d0 83f804 }
            // n = 4, score = 300
            //   c1ea02               | cmp                 eax, edx
            //   8d1492               | jle                 0xee6
            //   29d0                 | mov                 edx, dword ptr [esp + 0x5c4]
            //   83f804               | add                 eax, edx

        $sequence_5 = { c7433400000000 894330 c6433801 c6433903 }
            // n = 4, score = 300
            //   c7433400000000       | pop                 edx
            //   894330               | lea                 ecx, [esp + 0x2890]
            //   c6433801             | push                ecx
            //   c6433903             | pop                 ebx

        $sequence_6 = { 894330 c6433801 c6433903 c6433a03 c6433b06 }
            // n = 5, score = 300
            //   894330               | cmp                 eax, 0x7f
            //   c6433801             | sub                 esp, 0xc
            //   c6433903             | push                esi
            //   c6433a03             | mov                 ebx, dword ptr [esp + 0x51b4]
            //   c6433b06             | add                 esp, 0x10

        $sequence_7 = { e8???????? c7433400000000 894330 c6433801 }
            // n = 4, score = 300
            //   e8????????           |                     
            //   c7433400000000       | ret                 
            //   894330               | dec                 esp
            //   c6433801             | mov                 edi, edi

        $sequence_8 = { e9???????? e8???????? 66894304 e9???????? }
            // n = 4, score = 300
            //   e9????????           |                     
            //   e8????????           |                     
            //   66894304             | mov                 byte ptr [esp + 0x616], 0x64
            //   e9????????           |                     

        $sequence_9 = { 66c1e808 d0e8 8d04c0 28c2 }
            // n = 4, score = 300
            //   66c1e808             | push                esi
            //   d0e8                 | push                ebx
            //   8d04c0               | mov                 byte ptr [esp + 0x5b], al
            //   28c2                 | push                esi

    condition:
        7 of them and filesize < 2228224
}