rule win_rarstar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-10-07"
        version = "1"
        description = "Describes win.rarstar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rarstar"
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
        $sequence_0 = { f2ae f7d1 49 8d7c240c 8bd1 83c9ff }
            // n = 6, score = 100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   8d7c240c             | lea                 edi, [esp + 0xc]
            //   8bd1                 | mov                 edx, ecx
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_1 = { 33d2 b903000000 f7f1 83c408 8bc6 }
            // n = 5, score = 100
            //   33d2                 | xor                 edx, edx
            //   b903000000           | mov                 ecx, 3
            //   f7f1                 | div                 ecx
            //   83c408               | add                 esp, 8
            //   8bc6                 | mov                 eax, esi

        $sequence_2 = { 7cf4 33f6 8dbc2420020000 83c9ff 33c0 33d2 f2ae }
            // n = 7, score = 100
            //   7cf4                 | jl                  0xfffffff6
            //   33f6                 | xor                 esi, esi
            //   8dbc2420020000       | lea                 edi, [esp + 0x220]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   33d2                 | xor                 edx, edx
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_3 = { 50 8b442424 8d942484000000 52 50 ff15???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   8d942484000000       | lea                 edx, [esp + 0x84]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_4 = { 6804010000 51 50 ff15???????? 8d542404 }
            // n = 5, score = 100
            //   6804010000           | push                0x104
            //   51                   | push                ecx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d542404             | lea                 edx, [esp + 4]

        $sequence_5 = { ebe3 80a0a0d7400000 40 41 41 3bc6 72bf }
            // n = 7, score = 100
            //   ebe3                 | jmp                 0xffffffe5
            //   80a0a0d7400000       | and                 byte ptr [eax + 0x40d7a0], 0
            //   40                   | inc                 eax
            //   41                   | inc                 ecx
            //   41                   | inc                 ecx
            //   3bc6                 | cmp                 eax, esi
            //   72bf                 | jb                  0xffffffc1

        $sequence_6 = { 8d14c500000000 b8abaaaaaa f7e2 c1ea02 85c9 }
            // n = 5, score = 100
            //   8d14c500000000       | lea                 edx, [eax*8]
            //   b8abaaaaaa           | mov                 eax, 0xaaaaaaab
            //   f7e2                 | mul                 edx
            //   c1ea02               | shr                 edx, 2
            //   85c9                 | test                ecx, ecx

        $sequence_7 = { 899c242c030000 899c2428030000 899c2424030000 899c2420030000 bf???????? 83c9ff }
            // n = 6, score = 100
            //   899c242c030000       | mov                 dword ptr [esp + 0x32c], ebx
            //   899c2428030000       | mov                 dword ptr [esp + 0x328], ebx
            //   899c2424030000       | mov                 dword ptr [esp + 0x324], ebx
            //   899c2420030000       | mov                 dword ptr [esp + 0x320], ebx
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_8 = { 7405 be01000000 8b442418 57 }
            // n = 4, score = 100
            //   7405                 | je                  7
            //   be01000000           | mov                 esi, 1
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   57                   | push                edi

        $sequence_9 = { 0f8412010000 85f6 779a 8b5c241c 6a00 }
            // n = 5, score = 100
            //   0f8412010000         | je                  0x118
            //   85f6                 | test                esi, esi
            //   779a                 | ja                  0xffffff9c
            //   8b5c241c             | mov                 ebx, dword ptr [esp + 0x1c]
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 122880
}