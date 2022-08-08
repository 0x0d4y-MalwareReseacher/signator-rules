rule win_vmzeus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.vmzeus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vmzeus"
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
        $sequence_0 = { 58 e9???????? 32c0 6a4c 8d7c242c }
            // n = 5, score = 4900
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]

        $sequence_1 = { e9???????? 32c0 6a4c 8d7c242c 59 f3aa }
            // n = 6, score = 4900
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_2 = { 6a04 58 e9???????? 32c0 }
            // n = 4, score = 4900
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al

        $sequence_3 = { 7508 6a04 58 e9???????? 32c0 6a4c }
            // n = 6, score = 4900
            //   7508                 | jne                 0xa
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c

        $sequence_4 = { f3a4 b001 eb02 32c0 5f 5e }
            // n = 6, score = 4900
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   b001                 | mov                 al, 1
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { e9???????? 32c0 6a4c 8d7c242c }
            // n = 4, score = 4900
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]

        $sequence_6 = { 6a04 58 e9???????? 32c0 6a4c 8d7c242c }
            // n = 6, score = 4900
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]

        $sequence_7 = { 58 e9???????? 32c0 6a4c 8d7c242c 59 f3aa }
            // n = 7, score = 4900
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_8 = { 6a10 32c0 59 8bfb }
            // n = 4, score = 4900
            //   6a10                 | push                0x10
            //   32c0                 | xor                 al, al
            //   59                   | pop                 ecx
            //   8bfb                 | mov                 edi, ebx

        $sequence_9 = { 32c0 6a4c 8d7c242c 59 }
            // n = 4, score = 4900
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 475136
}