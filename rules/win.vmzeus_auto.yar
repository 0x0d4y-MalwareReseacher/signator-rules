rule win_vmzeus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.vmzeus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vmzeus"
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
        $sequence_0 = { 58 e9???????? 32c0 6a4c 8d7c242c }
            // n = 5, score = 4900
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]

        $sequence_1 = { 58 e9???????? 32c0 6a4c 8d7c242c 59 }
            // n = 6, score = 4900
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx

        $sequence_2 = { 8901 b001 c3 55 8bec 81ec08010000 53 }
            // n = 7, score = 4900
            //   8901                 | mov                 dword ptr [ecx], eax
            //   b001                 | mov                 al, 1
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec08010000         | sub                 esp, 0x108
            //   53                   | push                ebx

        $sequence_3 = { 7508 6a04 58 e9???????? 32c0 6a4c }
            // n = 6, score = 4900
            //   7508                 | jne                 0xa
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c

        $sequence_4 = { 58 e9???????? 32c0 6a4c 8d7c242c 59 f3aa }
            // n = 7, score = 4900
            //   58                   | pop                 eax
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_5 = { f3a4 b001 eb02 32c0 5f 5e }
            // n = 6, score = 4900
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   b001                 | mov                 al, 1
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_6 = { e9???????? 32c0 6a4c 8d7c242c }
            // n = 4, score = 4900
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]

        $sequence_7 = { 6a4c 8d7c242c 59 f3aa }
            // n = 4, score = 4900
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_8 = { 32c0 6a4c 8d7c242c 59 f3aa }
            // n = 5, score = 4900
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_9 = { 32c0 6a4c 8d7c242c 59 }
            // n = 4, score = 4900
            //   32c0                 | xor                 al, al
            //   6a4c                 | push                0x4c
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 475136
}