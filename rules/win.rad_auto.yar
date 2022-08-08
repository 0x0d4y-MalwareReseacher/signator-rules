rule win_rad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-08-05"
        version = "1"
        description = "Detects win.rad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rad"
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
        $sequence_0 = { 51 ffd6 83c404 8b8c2430060000 64890d00000000 59 }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   83c404               | add                 esp, 4
            //   8b8c2430060000       | mov                 ecx, dword ptr [esp + 0x630]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx

        $sequence_1 = { 57 8db7a4010000 e8???????? 57 e8???????? 8bcf }
            // n = 6, score = 100
            //   57                   | push                edi
            //   8db7a4010000         | lea                 esi, [edi + 0x1a4]
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bcf                 | mov                 ecx, edi

        $sequence_2 = { 8b742420 c7818c00000000000000 e9???????? b9???????? e8???????? 84c0 }
            // n = 6, score = 100
            //   8b742420             | mov                 esi, dword ptr [esp + 0x20]
            //   c7818c00000000000000     | mov    dword ptr [ecx + 0x8c], 0
            //   e9????????           |                     
            //   b9????????           |                     
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_3 = { 8d75d0 e9???????? 8d75b4 e9???????? 8d8de4fcffff }
            // n = 5, score = 100
            //   8d75d0               | lea                 esi, [ebp - 0x30]
            //   e9????????           |                     
            //   8d75b4               | lea                 esi, [ebp - 0x4c]
            //   e9????????           |                     
            //   8d8de4fcffff         | lea                 ecx, [ebp - 0x31c]

        $sequence_4 = { 744e 8b12 8b703c 3bf2 7302 8bf2 8b4014 }
            // n = 7, score = 100
            //   744e                 | je                  0x50
            //   8b12                 | mov                 edx, dword ptr [edx]
            //   8b703c               | mov                 esi, dword ptr [eax + 0x3c]
            //   3bf2                 | cmp                 esi, edx
            //   7302                 | jae                 4
            //   8bf2                 | mov                 esi, edx
            //   8b4014               | mov                 eax, dword ptr [eax + 0x14]

        $sequence_5 = { c745fc0a000000 e8???????? c745fcffffffff 837de810 720d 8b45d4 50 }
            // n = 7, score = 100
            //   c745fc0a000000       | mov                 dword ptr [ebp - 4], 0xa
            //   e8????????           |                     
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   837de810             | cmp                 dword ptr [ebp - 0x18], 0x10
            //   720d                 | jb                  0xf
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   50                   | push                eax

        $sequence_6 = { ff25???????? 8db514faffff e9???????? 8db530faffff e9???????? 8d8d4cfaffff }
            // n = 6, score = 100
            //   ff25????????         |                     
            //   8db514faffff         | lea                 esi, [ebp - 0x5ec]
            //   e9????????           |                     
            //   8db530faffff         | lea                 esi, [ebp - 0x5d0]
            //   e9????????           |                     
            //   8d8d4cfaffff         | lea                 ecx, [ebp - 0x5b4]

        $sequence_7 = { ff15???????? 8d8c24bc010000 c7842450020000ffffffff ff15???????? 8b8c2448020000 64890d00000000 59 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d8c24bc010000       | lea                 ecx, [esp + 0x1bc]
            //   c7842450020000ffffffff     | mov    dword ptr [esp + 0x250], 0xffffffff
            //   ff15????????         |                     
            //   8b8c2448020000       | mov                 ecx, dword ptr [esp + 0x248]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx

        $sequence_8 = { 83c9ff 33db c60700 e8???????? 8b8df8fcffff 894e7c eb0d }
            // n = 7, score = 100
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33db                 | xor                 ebx, ebx
            //   c60700               | mov                 byte ptr [edi], 0
            //   e8????????           |                     
            //   8b8df8fcffff         | mov                 ecx, dword ptr [ebp - 0x308]
            //   894e7c               | mov                 dword ptr [esi + 0x7c], ecx
            //   eb0d                 | jmp                 0xf

        $sequence_9 = { 889f2c010000 89875c010000 899f58010000 889f48010000 89877c010000 899f78010000 889f68010000 }
            // n = 7, score = 100
            //   889f2c010000         | mov                 byte ptr [edi + 0x12c], bl
            //   89875c010000         | mov                 dword ptr [edi + 0x15c], eax
            //   899f58010000         | mov                 dword ptr [edi + 0x158], ebx
            //   889f48010000         | mov                 byte ptr [edi + 0x148], bl
            //   89877c010000         | mov                 dword ptr [edi + 0x17c], eax
            //   899f78010000         | mov                 dword ptr [edi + 0x178], ebx
            //   889f68010000         | mov                 byte ptr [edi + 0x168], bl

    condition:
        7 of them and filesize < 207872
}