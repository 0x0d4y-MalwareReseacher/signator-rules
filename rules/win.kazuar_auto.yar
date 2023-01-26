rule win_kazuar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-01-25"
        version = "1"
        description = "Detects win.kazuar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kazuar"
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
        $sequence_0 = { 4c89442438 6689442430 4c8d442430 83c002 6689442432 48c744242800000000 41ffd2 }
            // n = 7, score = 300
            //   4c89442438           | jns                 0xf44
            //   6689442430           | mov                 dword ptr [ebx], eax
            //   4c8d442430           | mov                 dword ptr [ebx + 4], 0x184
            //   83c002               | mov                 dword ptr [ebx + 4], 0x184
            //   6689442432           | jmp                 0xfca
            //   48c744242800000000     | dec    edi
            //   41ffd2               | je                  0xf6b

        $sequence_1 = { 39f8 751c 8b4624 4801db 4c01db 0fb71403 }
            // n = 6, score = 300
            //   39f8                 | dec                 eax
            //   751c                 | mov                 ecx, eax
            //   8b4624               | xor                 edx, edx
            //   4801db               | dec                 eax
            //   4c01db               | test                eax, eax
            //   0fb71403             | mov                 edx, 0xde94459a

        $sequence_2 = { 4c8d442430 83c002 6689442432 48c744242800000000 }
            // n = 4, score = 300
            //   4c8d442430           | test                ebx, ebx
            //   83c002               | je                  0x3b
            //   6689442432           | dec                 ecx
            //   48c744242800000000     | mov    ebx, ebx

        $sequence_3 = { 83c002 c744240400000000 668945f2 8d45ec c7042400000000 8944240c }
            // n = 6, score = 300
            //   83c002               | mov                 dword ptr [esp], eax
            //   c744240400000000     | call                dword ptr [edx + 0xc]
            //   668945f2             | test                eax, eax
            //   8d45ec               | dec                 eax
            //   c7042400000000       | sub                 esp, 0x130
            //   8944240c             | xor                 ecx, ecx

        $sequence_4 = { 31c0 4885c9 740d 89c2 66833c5100 7404 }
            // n = 6, score = 300
            //   31c0                 | mov                 esi, dword ptr [esi + 0x1c]
            //   4885c9               | xor                 eax, eax
            //   740d                 | test                esi, esi
            //   89c2                 | mov                 esi, dword ptr [esi + 0x30]
            //   66833c5100           | mov                 esi, dword ptr [esi + 0xc]
            //   7404                 | mov                 esi, dword ptr [esi + 0x1c]

        $sequence_5 = { 48ffc3 ebc8 31c0 4883c420 5b 5e }
            // n = 6, score = 300
            //   48ffc3               | mov                 dword ptr [ebx], 0
            //   ebc8                 | mov                 dword ptr [ebx + 4], 0
            //   31c0                 | lea                 esp, [ebp - 0xc]
            //   4883c420             | pop                 ebx
            //   5b                   | jmp                 0x18f
            //   5e                   | mov                 dword ptr [ebx], 0

        $sequence_6 = { 4139dc 7633 8b4c9d00 4c01d9 7425 }
            // n = 5, score = 300
            //   4139dc               | ret                 
            //   7633                 | xor                 edx, edx
            //   8b4c9d00             | test                eax, eax
            //   4c01d9               | je                  0x2fe
            //   7425                 | xor                 edx, edx

        $sequence_7 = { 5b 5e 5f 5d 415c c3 4883ec48 }
            // n = 7, score = 300
            //   5b                   | jns                 0x4d6
            //   5e                   | mov                 dword ptr [ebx], eax
            //   5f                   | mov                 dword ptr [ebx + 4], 0x19b
            //   5d                   | mov                 ecx, eax
            //   415c                 | mov                 eax, 0x402514
            //   c3                   | mov                 dword ptr [ebp - 0x24], 0
            //   4883ec48             | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_8 = { 4885c0 7461 ba9a4594de 4889c1 }
            // n = 4, score = 300
            //   4885c0               | test                cx, cx
            //   7461                 | inc                 ebp
            //   ba9a4594de           | xor                 ecx, ecx
            //   4889c1               | inc                 esp

        $sequence_9 = { 41ffc1 4131c0 4569c097010001 ebdd }
            // n = 4, score = 300
            //   41ffc1               | cmp                 eax, dword ptr [ebp - 0x18]
            //   4131c0               | jne                 0x48
            //   4569c097010001       | lea                 edx, [esi + esi]
            //   ebdd                 | add                 edx, ebx

    condition:
        7 of them and filesize < 81920
}