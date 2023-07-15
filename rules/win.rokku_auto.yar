rule win_rokku_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2023-07-11"
        version = "1"
        description = "Detects win.rokku."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rokku"
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
        $sequence_0 = { 13c7 894c2468 8b4c2424 33ff 89442418 8bd9 8944246c }
            // n = 7, score = 200
            //   13c7                 | adc                 eax, edi
            //   894c2468             | mov                 dword ptr [esp + 0x68], ecx
            //   8b4c2424             | mov                 ecx, dword ptr [esp + 0x24]
            //   33ff                 | xor                 edi, edi
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   8bd9                 | mov                 ebx, ecx
            //   8944246c             | mov                 dword ptr [esp + 0x6c], eax

        $sequence_1 = { e8???????? 8d95a8feffff 8d8d20ffffff e8???????? 8d9520ffffff 8d8da8feffff }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8d95a8feffff         | lea                 edx, [ebp - 0x158]
            //   8d8d20ffffff         | lea                 ecx, [ebp - 0xe0]
            //   e8????????           |                     
            //   8d9520ffffff         | lea                 edx, [ebp - 0xe0]
            //   8d8da8feffff         | lea                 ecx, [ebp - 0x158]

        $sequence_2 = { 50 e8???????? 83c404 84c0 7522 8bc1 8d8d54ffffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   84c0                 | test                al, al
            //   7522                 | jne                 0x24
            //   8bc1                 | mov                 eax, ecx
            //   8d8d54ffffff         | lea                 ecx, [ebp - 0xac]

        $sequence_3 = { 8bf9 e8???????? 8bcd 8bd8 e8???????? 8d7002 03f3 }
            // n = 7, score = 200
            //   8bf9                 | mov                 edi, ecx
            //   e8????????           |                     
            //   8bcd                 | mov                 ecx, ebp
            //   8bd8                 | mov                 ebx, eax
            //   e8????????           |                     
            //   8d7002               | lea                 esi, [eax + 2]
            //   03f3                 | add                 esi, ebx

        $sequence_4 = { 0facc812 c1e60e c1e912 0bf1 0bd0 8b442440 33fe }
            // n = 7, score = 200
            //   0facc812             | shrd                eax, ecx, 0x12
            //   c1e60e               | shl                 esi, 0xe
            //   c1e912               | shr                 ecx, 0x12
            //   0bf1                 | or                  esi, ecx
            //   0bd0                 | or                  edx, eax
            //   8b442440             | mov                 eax, dword ptr [esp + 0x40]
            //   33fe                 | xor                 edi, esi

        $sequence_5 = { 8b442420 13c2 8b542424 0fa4d001 03d2 03d6 89542424 }
            // n = 7, score = 200
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   13c2                 | adc                 eax, edx
            //   8b542424             | mov                 edx, dword ptr [esp + 0x24]
            //   0fa4d001             | shld                eax, edx, 1
            //   03d2                 | add                 edx, edx
            //   03d6                 | add                 edx, esi
            //   89542424             | mov                 dword ptr [esp + 0x24], edx

        $sequence_6 = { 72f5 8b0d???????? 8d54240c e8???????? 885c240c 33c0 c744240d34021330 }
            // n = 7, score = 200
            //   72f5                 | jb                  0xfffffff7
            //   8b0d????????         |                     
            //   8d54240c             | lea                 edx, [esp + 0xc]
            //   e8????????           |                     
            //   885c240c             | mov                 byte ptr [esp + 0xc], bl
            //   33c0                 | xor                 eax, eax
            //   c744240d34021330     | mov                 dword ptr [esp + 0xd], 0x30130234

        $sequence_7 = { 51 50 e8???????? 59 59 eb16 8d442414 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   eb16                 | jmp                 0x18
            //   8d442414             | lea                 eax, [esp + 0x14]

        $sequence_8 = { 33f6 894c2404 8b400c 8b500c 397218 7459 }
            // n = 6, score = 200
            //   33f6                 | xor                 esi, esi
            //   894c2404             | mov                 dword ptr [esp + 4], ecx
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   397218               | cmp                 dword ptr [edx + 0x18], esi
            //   7459                 | je                  0x5b

        $sequence_9 = { c1ee1d 8b03 8bd8 0facc813 c1e30d }
            // n = 5, score = 200
            //   c1ee1d               | shr                 esi, 0x1d
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   8bd8                 | mov                 ebx, eax
            //   0facc813             | shrd                eax, ecx, 0x13
            //   c1e30d               | shl                 ebx, 0xd

    condition:
        7 of them and filesize < 548864
}